-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2024 at 07:36 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_library`
--

-- --------------------------------------------------------

--
-- Table structure for table `borrowed_books`
--

CREATE TABLE `borrowed_books` (
  `id` int(11) NOT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `borrow_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrowed_books`
--

INSERT INTO `borrowed_books` (`id`, `borrower_id`, `book_id`, `borrow_date`, `return_date`) VALUES
(1, 1, 1, '2024-11-01', '2024-11-15'),
(2, 2, 2, '2024-10-15', '2024-11-05'),
(3, 3, 3, '2024-09-10', '2024-09-25'),
(4, 4, 4, '2024-11-10', '2024-11-20'),
(5, 5, 5, '2024-10-20', '2024-11-03'),
(6, 6, 6, '2024-10-05', '2024-10-20'),
(7, 7, 7, '2024-09-25', '2024-10-10'),
(8, 8, 8, '2024-08-30', '2024-09-15'),
(9, 9, 9, '2024-10-18', '2024-11-01'),
(10, 10, 10, '2024-10-22', '2024-11-10'),
(11, 11, 11, '2024-11-05', '2024-11-20'),
(12, 12, 12, '2024-10-10', '2024-10-30'),
(13, 13, 13, '2024-09-15', '2024-10-01'),
(14, 14, 14, '2024-11-01', '2024-11-18'),
(15, 15, 15, '2024-10-01', '2024-10-18'),
(16, 16, 16, '2024-09-25', '2024-10-10'),
(17, 17, 17, '2024-11-12', '2024-11-26'),
(18, 18, 18, '2024-11-07', '2024-11-22'),
(19, 19, 19, '2024-11-20', '2024-12-05'),
(20, 20, 20, '2024-11-11', '2024-11-28');

-- --------------------------------------------------------

--
-- Table structure for table `borrowers`
--

CREATE TABLE `borrowers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrowers`
--

INSERT INTO `borrowers` (`id`, `name`, `email`) VALUES
(1, 'Alice Smith', 'alice@example.com'),
(2, 'Bob Johnson', 'bob@example.com'),
(3, 'Charlie Brown', 'charlie@example.com'),
(4, 'David Williams', 'david@example.com'),
(5, 'Emma Davis', 'emma@example.com'),
(6, 'Frank Miller', 'frank@example.com'),
(7, 'Grace Wilson', 'grace@example.com'),
(8, 'Hannah Moore', 'hannah@example.com'),
(9, 'Ivy Taylor', 'ivy@example.com'),
(10, 'James Anderson', 'james@example.com'),
(11, 'Katherine Lee', 'katherine@example.com'),
(12, 'Liam White', 'liam@example.com'),
(13, 'Megan Harris', 'megan@example.com'),
(14, 'Noah Clark', 'noah@example.com'),
(15, 'Olivia Walker', 'olivia@example.com'),
(16, 'Paul Lewis', 'paul@example.com'),
(17, 'Quinn Hall', 'quinn@example.com'),
(18, 'Rachel Allen', 'rachel@example.com'),
(19, 'Samuel Young', 'samuel@example.com'),
(20, 'Tina King', 'tina@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Fiction'),
(2, 'Science Fiction'),
(3, 'Non-Fiction'),
(4, 'History'),
(5, 'Mystery'),
(6, 'Fantasy'),
(7, 'Biography'),
(8, 'Children'),
(9, 'Thriller'),
(10, 'Romance');

-- --------------------------------------------------------

--
-- Table structure for table `library`
--

CREATE TABLE `library` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `year` varchar(4) NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `library`
--

INSERT INTO `library` (`id`, `title`, `author`, `year`, `category_id`) VALUES
(1, 'The Catcher in the Rye', 'J.D. Salinger', '1951', 1),
(2, 'Dune', 'Frank Herbert', '1965', 2),
(3, 'Educated', 'Tara Westover', '2018', 3),
(4, 'Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', '2011', 4),
(5, 'The Girl with the Dragon Tattoo', 'Stieg Larsson', '2005', 5),
(6, 'Harry Potter and the Sorcerer\'s Stone', 'J.K. Rowling', '1997', 6),
(7, 'Steve Jobs', 'Walter Isaacson', '2011', 7),
(8, 'The Very Hungry Caterpillar', 'Eric Carle', '1969', 8),
(9, 'Gone Girl', 'Gillian Flynn', '2012', 9),
(10, 'Pride and Prejudice', 'Jane Austen', '1813', 10),
(11, '1984', 'George Orwell', '1949', 1),
(12, 'The Left Hand of Darkness', 'Ursula K. Le Guin', '1969', 2),
(13, 'Becoming', 'Michelle Obama', '2018', 7),
(14, 'The Hobbit', 'J.R.R. Tolkien', '1937', 6),
(15, 'The Diary of a Young Girl', 'Anne Frank', '1947', 7),
(16, 'The Martian', 'Andy Weir', '2011', 2),
(17, 'To Kill a Mockingbird', 'Harper Lee', '1960', 1),
(18, 'The Shining', 'Stephen King', '1977', 5),
(19, 'The Hunger Games', 'Suzanne Collins', '2008', 2),
(20, 'The Great Gatsby', 'F. Scott Fitzgerald', '1925', 1),
(21, 'Frankenstein', 'Mary Shelley', '1818', 5),
(22, 'The Road', 'Cormac McCarthy', '2006', 4),
(23, 'Little Women', 'Louisa May Alcott', '1868', 1),
(24, 'The Catcher in the Rye', 'J.D. Salinger', '1951', 1),
(25, 'The Secret Garden', 'Frances Hodgson Burnett', '1911', 8),
(26, 'The Picture of Dorian Gray', 'Oscar Wilde', '1890', 1),
(27, 'The Catcher in the Rye', 'J.D. Salinger', '1951', 1),
(28, 'Dune', 'Frank Herbert', '1965', 2),
(29, 'Educated', 'Tara Westover', '2018', 3),
(30, 'Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', '2011', 4),
(31, 'The Girl with the Dragon Tattoo', 'Stieg Larsson', '2005', 5),
(32, 'Harry Potter and the Sorcerer\'s Stone', 'J.K. Rowling', '1997', 6),
(33, 'Steve Jobs', 'Walter Isaacson', '2011', 7),
(34, 'The Very Hungry Caterpillar', 'Eric Carle', '1969', 8),
(35, 'Gone Girl', 'Gillian Flynn', '2012', 9),
(36, 'Pride and Prejudice', 'Jane Austen', '1813', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `borrowed_books`
--
ALTER TABLE `borrowed_books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `borrower_id` (`borrower_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `borrowers`
--
ALTER TABLE `borrowers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `library`
--
ALTER TABLE `library`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `borrowed_books`
--
ALTER TABLE `borrowed_books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `borrowers`
--
ALTER TABLE `borrowers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `library`
--
ALTER TABLE `library`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrowed_books`
--
ALTER TABLE `borrowed_books`
  ADD CONSTRAINT `borrowed_books_ibfk_1` FOREIGN KEY (`borrower_id`) REFERENCES `borrowers` (`id`),
  ADD CONSTRAINT `borrowed_books_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `library` (`id`);

--
-- Constraints for table `library`
--
ALTER TABLE `library`
  ADD CONSTRAINT `library_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
