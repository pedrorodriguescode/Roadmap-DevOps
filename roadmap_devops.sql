-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Out-2025 às 02:03
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `roadmap.devops`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categories`
--

CREATE TABLE `categories` (
  `id` int(50) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_number` int(11) NOT NULL,
  `progress` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `order_number`, `progress`) VALUES
(1, 'Software World', 'Software World covers software development and operations, combining frontend (HTML, CSS, JavaScript) and backend (data processing and APIs). It includes code versioning (GitHub), agile methodologies (Scrum, Kanban), management tools (Trello, Jira), and CI/CD for delivery automation, combining creativity, logic, and collaboration to create functional and scalable applications.', 1, 0.00),
(2, 'Programming Logic', 'Programming logic is the process of using clear, step-by-step instructions and reasoning to solve problems and create efficient programs.', 2, 0.00);

-- --------------------------------------------------------

--
-- Estrutura da tabela `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` enum('To Do','Done') NOT NULL DEFAULT 'To Do'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `topics`
--

INSERT INTO `topics` (`id`, `category_id`, `name`, `description`, `status`) VALUES
(1, 1, 'HTML', 'The standard language for creating and structuring web pages.', 'To Do'),
(2, 1, 'CSS', 'Stylesheet language used to design and layout web pages.', 'To Do'),
(3, 1, 'JavaScript', 'Programming language for adding interactivity to websites.', 'To Do'),
(4, 1, 'GitHub', 'Platform for version control and collaborative code management.', 'To Do'),
(5, 1, 'API', 'Interface that allows different software applications to communicate.', 'To Do'),
(6, 1, 'REST', 'Architectural style for building scalable web services.', 'To Do'),
(7, 1, 'JSON', 'Lightweight data format for exchanging information between systems.', 'To Do'),
(8, 1, 'Agile ', 'Approaches for iterative and adaptive project management.', 'To Do'),
(9, 1, 'Scrum', 'Agile framework focused on time-boxed sprints and team collaboration.', 'To Do'),
(10, 1, 'Kanban', 'Agile method visualizing tasks to improve workflow efficiency.', 'To Do'),
(11, 1, 'Trello', 'Visual tool for managing tasks and project boards.', 'To Do'),
(12, 1, 'Jira', 'Platform for tracking issues, bugs, and agile project management.', 'To Do'),
(13, 1, 'Frontend', 'Part of a website or app that users interact with directly.', 'To Do'),
(14, 1, 'Backend', 'Server-side logic, databases, and application functionality.', 'To Do'),
(15, 1, 'CI', 'Practice of frequently merging code changes to detect issues early.', 'To Do'),
(16, 1, 'CD', 'Automating release of code updates to production.', 'To Do'),
(17, 1, 'API', 'Interface that allows different software applications to communicate.', 'To Do'),
(18, 2, 'Python', 'A high-level programming language known for simplicity and readability.', 'To Do'),
(19, 2, 'Variables', 'Storage containers for data values used in programs.', 'To Do'),
(20, 2, 'Conditions', 'Statements that execute code based on True/False tests.', 'To Do'),
(21, 2, 'Loops', 'Structures that repeat a set of instructions multiple times.', 'To Do'),
(22, 2, 'Functions', 'Reusable blocks of code that perform specific tasks.', 'To Do'),
(23, 2, 'Simple IDEs', 'Basic environments for writing, testing, and running code.', 'To Do'),
(24, 2, 'Exercises', 'Hands-on coding tasks for practice and learning.', 'To Do'),
(25, 2, 'Scripts', 'Files containing sequences of code to be executed.', 'To Do'),
(26, 2, 'Best practices', 'Recommended coding standards for clean and efficient code.', 'To Do'),
(27, 2, 'Debugging', 'Finding and fixing simple errors in code.', 'To Do'),
(28, 2, 'Input/output', 'Methods for receiving data from users and displaying results.', 'To Do');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
