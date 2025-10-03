-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/10/2025 às 02:24
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

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
-- Estrutura para tabela `categories`
--

CREATE TABLE `categories` (
  `id` int(50) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_number` int(11) NOT NULL,
  `progress` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `order_number`, `progress`) VALUES
(1, 'Software World', 'Software World covers software development and operations, combining frontend (HTML, CSS, JavaScript) and backend (data processing and APIs). It includes code versioning (GitHub), agile methodologies (Scrum, Kanban), management tools (Trello, Jira), and CI/CD for delivery automation, combining creativity, logic, and collaboration to create functional and scalable applications.', 1, 0.00),
(2, 'Programming Logic', 'Programming logic is the process of using clear, step-by-step instructions and reasoning to solve problems and create efficient programs.', 2, 0.00),
(3, 'Computing And Networks', 'Computing and Networks refers to the study and use of computer systems and the communication between devices through networks to share data and resources efficiently.', 3, 0.00),
(4, 'Linux', 'Linux is an open-source operating system based on Unix, widely used for servers, desktops, and embedded systems. It is known for its stability, security, and flexibility.', 4, 0.00),
(5, 'GIT', 'Git is a distributed version control system used to track changes in source code during software development. It allows multiple developers to collaborate efficiently by managing code history and branches.', 5, 0.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` enum('To Do','Done') NOT NULL DEFAULT 'To Do'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `topics`
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
(28, 2, 'Input/output', 'Methods for receiving data from users and displaying results.', 'To Do'),
(29, 3, 'OS', 'Main software that manages hardware and allows other programs to run.', 'To Do'),
(30, 3, 'Terminal', 'Text-based interface used to execute commands directly in the system.', 'To Do'),
(31, 3, 'Files/Directories', 'Files store data; directories organize them in a hierarchical structure.', 'To Do'),
(32, 3, 'Servers', 'Computers or programs that provide services or resources to other devices on a network.', 'To Do'),
(33, 3, 'Network', 'A group of connected devices that exchange data.', 'To Do'),
(34, 3, 'IP', 'A unique identifier for each device on a network.', 'To Do'),
(35, 3, 'Router', 'Device that directs data between networks and connects devices to the internet.', 'To Do'),
(36, 3, 'Internet', 'A global network that connects millions of devices for communication and data exchange.', 'To Do'),
(37, 3, 'DNS', 'Translates website names into IP addresses.', 'To Do'),
(38, 3, 'Client vs Server', 'The client makes requests; the server responds with data or services.', 'To Do'),
(39, 3, 'Processes', 'Programs that are currently running on the system.', 'To Do'),
(40, 3, 'Memory', 'Temporary space (RAM) used to store data and instructions for running processes.', 'To Do'),
(41, 4, 'Ubuntu/Debian', 'Linux-based operating systems known for stability, open-source support, and package management via APT.', 'To Do'),
(42, 4, 'Shell', 'A command-line interface used to interact with the system, run programs, and execute scripts.', 'To Do'),
(43, 4, 'Commands', 'Commands like ls, cd, and pwd are used to navigate and manage files and directories.', 'To Do'),
(44, 4, 'Text Editors', 'Tools for editing text files directly from the terminal without a graphical interface.', 'To Do'),
(45, 4, 'Nano', 'A simple and user-friendly text editor for quick edits in the terminal.', 'To Do'),
(46, 4, 'Vim', 'A powerful, keyboard-based text editor for advanced users in the terminal.', 'To Do'),
(47, 4, 'Package', 'APT (apt) is used to install, update, and remove software packages on Debian-based systems.', 'To Do'),
(48, 4, 'Processes', 'Programs or tasks currently running on the system, each with its own process ID (PID).', 'To Do'),
(49, 4, 'Services', 'Background processes that run continuously to provide system functions, often managed by system managers like .systemd.', 'To Do'),
(50, 4, 'File System', 'Directories like /home, /etc, and /var organize user data, configurations, and logs.', 'To Do'),
(51, 4, 'VirtualBox', 'A virtualization tool that runs operating systems in a virtual machine on your computer.', 'To Do'),
(52, 4, 'ISO', 'An ISO is a disk image file used to install an operating system like Ubuntu.', 'To Do'),
(53, 4, 'Remote Access', 'ssh connects to remote systems securely; scp copies files over a secure connection.', 'To Do'),
(54, 5, 'GitHub', 'A popular web-based platform for hosting Git repositories and collaborating on projects.', 'To Do'),
(55, 5, 'GitLab/Bitbucket', 'Alternative web platforms for Git repository hosting with additional CI/CD and project management features.', 'To Do'),
(56, 5, 'Commands', 'Basic Git commands include git init, git clone, git add, git commit, and git push for version control.', 'To Do'),
(57, 5, 'Gitignore', 'A file specifying which files or directories Git should ignore and not track.', 'To Do'),
(58, 5, 'Desktop/Kraken', 'Git clients with graphical interfaces that simplify repository management and version control.', 'To Do'),
(59, 5, 'README.md', 'A markdown file providing an overview, instructions, or documentation for a project repository.', 'To Do'),
(60, 5, 'Commit', 'A snapshot of changes in the repository, often accompanied by a descriptive message explaining the update.', 'To Do');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
