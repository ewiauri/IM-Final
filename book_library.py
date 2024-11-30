import mysql.connector
from datetime import datetime
from prettytable import PrettyTable 

# connecting
mysql_conn = mysql.connector.connect(
    host="localhost",
    user="root",  
    password="",  
    database="book_library"
)
mysql_cursor = mysql_conn.cursor()

print("Database connected successfully!")

# menu
def show_menu():
    print("\nBook Library Menu:")
    print("1. Add a Book")
    print("2. View All Books")
    print("3. Update a Book")
    print("4. Delete a Book")
    print("5. Add a Category")
    print("6. View All Categories")
    print("7. Update a Category")
    print("8. Delete a Category")
    print("9. Add a Borrower")
    print("10. View All Borrowers")
    print("11. Update a Borrower")
    print("12. Delete a Borrower")
    print("13. Record a Borrowed Book")
    print("14. View Borrowed Books")
    print("15. Exit")

# create a book
def add_book():
    title = input("Enter book title: ")
    author = input("Enter author name: ")
    year = input("Enter publication year: ")
    category_id = input("Enter category ID (or leave blank): ")
    category_id = None if category_id == "" else int(category_id)

    query = "INSERT INTO library (title, author, year, category_id) VALUES (%s, %s, %s, %s)"
    mysql_cursor.execute(query, (title, author, year, category_id if category_id else None))
    mysql_conn.commit()
    print(f"Book '{title}' by {author} added successfully!")

# retrieve / read
def view_books():
    query = """
    SELECT l.id, l.title, l.author, l.year, c.name AS category
    FROM library l
    LEFT JOIN categories c ON l.category_id = c.id
    """
    mysql_cursor.execute(query)
    books = mysql_cursor.fetchall()
    # for prettytable
    table = PrettyTable()
    table.field_names = ["ID", "Title", "Author", "Year", "Category"]
    for book in books:
        table.add_row(book)
    print("\nLibrary Collection:")
    print(table)

# edit / update 
def update_book():
    book_id = input("Enter the book ID you want to update: ")
    title = input("Enter new book title: ")
    author = input("Enter new author name: ")
    year = input("Enter new publication year: ")
    category_id = input("Enter new category ID (or leave blank): ")
    category_id = None if category_id == "" else int(category_id)

    query = """
    UPDATE library
    SET title = %s, author = %s, year = %s, category_id = %s
    WHERE id = %s
    """
    mysql_cursor.execute(query, (title, author, year, category_id if category_id else None, book_id))
    mysql_conn.commit()
    print(f"Book with ID {book_id} updated successfully!")

# delete
def delete_book():
    book_id = input("Enter the book ID you want to delete: ")
    query = "DELETE FROM library WHERE id = %s"
    try:
        mysql_cursor.execute(query, (book_id,))
        mysql_conn.commit()
        print(f"Book with ID {book_id} deleted successfully!")
    except mysql.connector.IntegrityError:
        print("Error: This book cannot be deleted because it is associated with a borrowed book.")

# create a category
def add_category():
    name = input("Enter category name: ")
    query = "INSERT INTO categories (name) VALUES (%s)"
    mysql_cursor.execute(query, (name,))
    mysql_conn.commit()
    print(f"Category '{name}' added successfully!")

# retrieve all categories
def view_categories():
    mysql_cursor.execute("SELECT * FROM categories")
    categories = mysql_cursor.fetchall()
    # for prettytable
    table = PrettyTable()
    table.field_names = ["ID", "Name"]
    for category in categories:
        table.add_row(category)
    print("\nBook Categories:")
    print(table)

# edit a category
def update_category():
    category_id = input("Enter the category ID you want to update: ")
    new_name = input("Enter new category name: ")
    query = "UPDATE categories SET name = %s WHERE id = %s"
    mysql_cursor.execute(query, (new_name, category_id))
    mysql_conn.commit()
    print(f"Category with ID {category_id} updated successfully!")

# Ddelete a category
def delete_category():
    category_id = input("Enter the category ID you want to delete: ")
    query = "DELETE FROM categories WHERE id = %s"
    try:
        mysql_cursor.execute(query, (category_id,))
        mysql_conn.commit()
        print(f"Category with ID {category_id} deleted successfully!")
    except mysql.connector.IntegrityError:
        print("Error: This category cannot be deleted because it is associated with books.")

# create / add a borrower
def add_borrower():
    name = input("Enter borrower name: ")
    email = input("Enter borrower email: ")
    query = "INSERT INTO borrowers (name, email) VALUES (%s, %s)"
    mysql_cursor.execute(query, (name, email))
    mysql_conn.commit()
    print(f"Borrower '{name}' added successfully!")

# retrieve all borrower
def view_borrowers():
    mysql_cursor.execute("SELECT * FROM borrowers")
    borrowers = mysql_cursor.fetchall()
    # prettytable
    table = PrettyTable()
    table.field_names = ["ID", "Name", "Email"]
    for borrower in borrowers:
        table.add_row(borrower)
    print("\nBorrowers:")
    print(table)

# edit / update
def update_borrower():
    borrower_id = input("Enter the borrower ID you want to update: ")
    new_name = input("Enter new borrower name: ")
    new_email = input("Enter new borrower email: ")
    query = "UPDATE borrowers SET name = %s, email = %s WHERE id = %s"
    mysql_cursor.execute(query, (new_name, new_email, borrower_id))
    mysql_conn.commit()
    print(f"Borrower with ID {borrower_id} updated successfully!")

# delete a borrower
def delete_borrower():
    borrower_id = input("Enter the borrower ID you want to delete: ")
    query = "DELETE FROM borrowers WHERE id = %s"
    try:
        mysql_cursor.execute(query, (borrower_id,))
        mysql_conn.commit()
        print(f"Borrower with ID {borrower_id} deleted successfully!")
    except mysql.connector.IntegrityError:
        print("Error: This borrower cannot be deleted because they have borrowed books.")

# record a borrowed book
def record_borrowed_book():
    borrower_id = input("Enter borrower ID: ")
    book_id = input("Enter book ID: ")
    borrow_date = input("Enter borrow date (YYYY-MM-DD): ")
    return_date = input("Enter return date (YYYY-MM-DD): ")
    # search book_id if existing
    query_check_book = "SELECT id FROM library WHERE id = %s"
    mysql_cursor.execute(query_check_book, (book_id,))
    book_exists = mysql_cursor.fetchone()

    if book_exists:
        # condition if it is existing
        query = """
        INSERT INTO borrowed_books (borrower_id, book_id, borrow_date, return_date)
        VALUES (%s, %s, %s, %s)
        """
        mysql_cursor.execute(query, (borrower_id, book_id, borrow_date, return_date))
        mysql_conn.commit()
        print("Borrowed book record added successfully!")
    else:
        # condition if it doesnt exist
        print(f"Error: No book found with ID {book_id}. Please make sure the book ID is correct.")

# retrieve all borrorwed books
def view_borrowed_books():
    query = """
    SELECT b.id, br.name AS borrower, l.title AS book, b.borrow_date, b.return_date
    FROM borrowed_books b
    JOIN borrowers br ON b.borrower_id = br.id
    JOIN library l ON b.book_id = l.id
    """
    mysql_cursor.execute(query)
    borrowed_books = mysql_cursor.fetchall()
    # prettytable
    table = PrettyTable()
    table.field_names = ["ID", "Borrower", "Book", "Borrow Date", "Return Date"]
    for record in borrowed_books:
        table.add_row(record)
    print("\nBorrowed Books:")
    print(table)

        # menu
def main():
    while True:
        show_menu()
        choice = input("Enter your choice: ")

        if choice == '1':
            add_book()
        elif choice == '2':
            view_books()
        elif choice == '3':
            update_book()
        elif choice == '4':
            delete_book()
        elif choice == '5':
            add_category()
        elif choice == '6':
            view_categories()
        elif choice == '7':
            update_category()
        elif choice == '8':
            delete_category()
        elif choice == '9':
            add_borrower()
        elif choice == '10':
            view_borrowers()
        elif choice == '11':
            update_borrower()
        elif choice == '12':
            delete_borrower()
        elif choice == '13':
            record_borrowed_book()
        elif choice == '14':
            view_borrowed_books()
        elif choice == '15':
            print("Exiting the application. Goodbye!")
            break
        else:
            print("Invalid choice. Please try again.")

# Run
if __name__ == "__main__":
    try:
        main()
    finally:
        mysql_cursor.close()
        mysql_conn.close()
