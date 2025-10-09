-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09/10/2025 às 22:36
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
(5, 'GIT', 'Git is a distributed version control system used to track changes in source code during software development. It allows multiple developers to collaborate efficiently by managing code history and branches.', 5, 0.00),
(6, 'Network And Security', 'Network and Security refers to the practice of designing, managing, and protecting computer networks to ensure secure, reliable data communication. It involves tools, protocols, and policies to prevent unauthorized access, attacks, and data breaches.', 6, 0.00),
(7, 'Docker', 'A platform that uses containerization to package applications and their dependencies into isolated environments for consistent deployment.', 7, 0.00),
(8, 'Kubernetes', 'An open-source container orchestration platform that automates deployment, scaling, and management of containerized applications.', 8, 0.00),
(9, 'Cloud Computing (AWS)', 'A cloud platform by Amazon that provides scalable, on-demand services like computing, storage, databases, and networking over the internet.', 9, 0.00),
(10, 'Terraform', 'An open-source Infrastructure as Code (IaC) tool by HashiCorp used to provision and manage cloud infrastructure using declarative configuration files.', 10, 0.00),
(11, 'CI/CD And Automation', 'The practice of automating code integration, testing, and deployment to improve software delivery speed, quality, and reliability.', 11, 0.00),
(12, 'Jenkins', 'Jenkins is an open-source automation server used to build, test, and deploy software continuously. It helps automate parts of the software development process through customizable pipelines.', 12, 0.00),
(13, 'Argo CD', 'Argo CD is a declarative, GitOps continuous delivery tool for Kubernetes that automates application deployments and lifecycle management by syncing cluster state with Git repositories.', 13, 0.00),
(14, 'Prometheus And Grafana', 'Prometheus: Open-source monitoring and alerting toolkit designed for reliability and scalability, using a time-series database and powerful query language (PromQL).  Grafana: Visualization and analytics platform used to create interactive dashboards and graphs from various data sources, including Prometheus.', 14, 0.00),
(15, 'Logging (ELK Stack)', 'A powerful open-source stack (Elasticsearch, Logstash, Kibana) for collecting, processing, storing, and visualizing log data.', 15, 0.00),
(16, 'Security (DevSecOps)', 'Integration of security practices into the DevOps process, ensuring continuous security throughout the software development lifecycle.', 16, 0.00);

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
(1, 1, 'HTML', 'The standard language for creating and structuring web pages.', 'Done'),
(2, 1, 'CSS', 'Stylesheet language used to design and layout web pages.', 'To Do'),
(3, 1, 'JavaScript', 'Programming language for adding interactivity to websites.', 'To Do'),
(5, 1, 'API', 'Interface that allows different software applications to communicate.', 'Done'),
(6, 1, 'REST', 'Architectural style for building scalable web services.', 'To Do'),
(7, 1, 'JSON', 'Lightweight data format for exchanging information between systems.', 'To Do'),
(8, 1, 'Agile ', 'Approaches for iterative and adaptive project management.', 'Done'),
(9, 1, 'Scrum', 'Agile framework focused on time-boxed sprints and team collaboration.', 'To Do'),
(10, 1, 'Kanban', 'Agile method visualizing tasks to improve workflow efficiency.', 'To Do'),
(11, 1, 'Trello', 'Visual tool for managing tasks and project boards.', 'To Do'),
(12, 1, 'Jira', 'Platform for tracking issues, bugs, and agile project management.', 'To Do'),
(13, 1, 'Frontend', 'Part of a website or app that users interact with directly.', 'To Do'),
(14, 1, 'Backend', 'Server-side logic, databases, and application functionality.', 'To Do'),
(15, 1, 'CI', 'Practice of frequently merging code changes to detect issues early.', 'To Do'),
(16, 1, 'CD', 'Automating release of code updates to production.', 'To Do'),
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
(55, 5, 'GLab/Bitbucket', 'Alternative web platforms for Git repository hosting with additional CI/CD and project management features.', 'To Do'),
(56, 5, 'Commands', 'Basic Git commands include git init, git clone, git add, git commit, and git push for version control.', 'To Do'),
(57, 5, 'Gitignore', 'A file specifying which files or directories Git should ignore and not track.', 'To Do'),
(58, 5, 'Desktop/Kraken', 'Git clients with graphical interfaces that simplify repository management and version control.', 'To Do'),
(59, 5, 'README.md', 'A markdown file providing an overview, instructions, or documentation for a project repository.', 'To Do'),
(60, 5, 'Commit', 'A snapshot of changes in the repository, often accompanied by a descriptive message explaining the update.', 'To Do'),
(61, 6, 'IPv4', 'Internet Protocol version 4 using 32-bit addresses. Limited to about 4.3 billion unique IPs.', 'To Do'),
(62, 6, 'IPv6', 'Internet Protocol version 6 with 128-bit addresses. Designed to replace IPv4 with a vast address space.', 'To Do'),
(63, 6, 'HTTP', 'Protocol for transferring web pages over the internet without encryption.', 'To Do'),
(64, 6, 'HTTPS', 'Secure version of HTTP using SSL/TLS for encrypted communication.', 'To Do'),
(65, 6, 'SSH', 'Secure Shell protocol for remote command-line access with encryption.', 'To Do'),
(66, 6, 'Ports', 'Logical endpoints used to identify specific services on a device (e.g., port 80 for HTTP).', 'To Do'),
(67, 6, 'Protocols', 'Rules that define how data is transmitted across networks (e.g., TCP, UDP, ICMP).', 'To Do'),
(68, 6, 'Firewall', 'A system that monitors and controls incoming/outgoing network traffic based on rules.', 'To Do'),
(69, 6, 'Ufw', '\"Uncomplicated Firewall\" – a simple Linux tool to manage firewall rules easily.', 'To Do'),
(70, 6, 'SSL', 'Outdated encryption protocol used to secure data transmission over the web.', 'To Do'),
(71, 6, 'TLS', 'Modern and secure replacement for SSL, used in HTTPS and other encrypted protocols.', 'To Do'),
(72, 6, 'Ping', 'Network tool that checks if a host is reachable and measures latency.', 'To Do'),
(73, 6, 'Traceroute', 'Displays the path packets take from your machine to a target host.', 'To Do'),
(74, 6, 'Nslookup', 'Command-line tool to query DNS and obtain domain name or IP address info.', 'To Do'),
(75, 6, 'Dig', 'Advanced DNS lookup tool providing detailed query results for domains.', 'To Do'),
(76, 6, 'Load Balancers', 'Distribute network traffic across multiple servers to optimize performance.', 'To Do'),
(77, 6, 'Nginx', 'A high-performance web server and load balancer commonly used in web hosting.', 'To Do'),
(78, 6, 'HAProxy', 'Reliable, high-availability load balancer and proxy server for TCP/HTTP traffic.', 'To Do'),
(79, 6, 'OSI Model', 'A 7-layer model that standardizes how network communication occurs across systems.', 'To Do'),
(80, 7, 'Engine', 'The core component of Docker that runs and manages containers.', 'To Do'),
(81, 7, 'CLI', 'Command-Line Interface used to interact with Docker using terminal commands.', 'To Do'),
(82, 7, 'Images', 'Read-only templates used to create Docker containers.', 'To Do'),
(83, 7, 'Dockerfile', 'A script with instructions to build a Docker image.', 'To Do'),
(84, 7, 'Containers', 'Isolated environments created from Docker images to run applications.', 'To Do'),
(85, 7, 'Compose', 'Tool for defining and running multi-container Docker applications using YAML files.', 'To Do'),
(86, 7, 'Registry', 'A storage and distribution system for Docker images (e.g., Docker Hub).', 'To Do'),
(87, 7, 'Volumes', 'Persistent storage used by Docker containers to save data.', 'To Do'),
(88, 7, 'Networking', 'Docker’s way of allowing containers to communicate internally or externally.', 'To Do'),
(89, 7, 'Logs', 'Output and activity data generated by running containers.', 'To Do'),
(90, 7, 'Monitoring', 'Tools and practices for tracking container performance and health.', 'To Do'),
(91, 7, 'Swarm', 'Docker’s native orchestration tool for managing clusters of Docker nodes.', 'To Do'),
(92, 8, 'Kubectl', 'Command-line tool to interact with Kubernetes clusters and manage resources.', 'To Do'),
(93, 8, 'Cluster', 'A set of nodes (machines) that run containerized applications in Kubernetes.', 'To Do'),
(94, 8, 'Pods', 'The smallest deployable unit in Kubernetes, typically wrapping one or more containers.', 'To Do'),
(95, 8, 'Deployments', 'Manage the lifecycle of Pods, including updates, rollbacks, and scaling.', 'To Do'),
(96, 8, 'Services', 'Abstract way to expose a group of Pods as a stable network endpoint.', 'To Do'),
(97, 8, 'Namespaces', 'Virtual clusters within a Kubernetes cluster, used to isolate resources.', 'To Do'),
(98, 8, 'ConfigMaps', 'Store configuration data separately from container images in key-value format.', 'To Do'),
(99, 8, 'Secrets', 'Store sensitive data like passwords or API keys in an encrypted form.', 'To Do'),
(100, 8, 'Volumes', 'Storage used by containers, enabling data persistence during Pod restarts.', 'To Do'),
(101, 8, 'PV', 'PersistentVolumes are cluster-wide storage resource managed separately from Pods.', 'To Do'),
(102, 8, 'HPA', 'Automatically scales the number of Pods based on CPU/memory usage.', 'To Do'),
(103, 8, 'Ingress', 'Manages external access to services, usually via HTTP/HTTPS routing rules.', 'To Do'),
(104, 8, 'StatefulSets', 'Manage stateful applications, ensuring stable IDs and persistent storage.', 'To Do'),
(105, 8, 'DaemonSets', 'Ensure a Pod runs on all (or selected) nodes in a cluster.', 'To Do'),
(106, 8, 'Helm', 'A package manager for Kubernetes, used to define, install, and upgrade applications.', 'To Do'),
(107, 8, 'Minikube', 'Tool that runs a local Kubernetes cluster, ideal for testing and development.', 'To Do'),
(108, 8, 'Kind', '“Kubernetes IN Docker” – runs Kubernetes clusters inside Docker containers for testing.', 'To Do'),
(109, 9, 'AWS IAM', 'Identity and Access Management service to securely control access to AWS resources.', 'To Do'),
(110, 9, 'Amazon EC2', 'Virtual servers in the cloud to run applications on-demand.', 'To Do'),
(111, 9, 'Amazon S3', 'Scalable object storage service for storing and retrieving data.', 'To Do'),
(112, 9, 'Amazon VPC', 'Virtual Private Cloud to isolate and control AWS network infrastructure.', 'To Do'),
(113, 9, 'Subnets', 'Segments within a VPC to group and organize resources logically.', 'To Do'),
(114, 9, 'Security Groups', 'Virtual firewalls that control inbound and outbound traffic for AWS resources.', 'To Do'),
(115, 9, 'ELB', 'Elastic Load Balancing automatically distributes incoming traffic across multiple targets.', 'To Do'),
(116, 9, 'AWS CLI', 'Command Line Interface to manage AWS services via terminal commands.', 'To Do'),
(117, 9, 'AWS Console', 'Web-based interface to manage and configure AWS services.', 'To Do'),
(118, 9, 'Route 53', 'Scalable DNS and domain name registration service.', 'To Do'),
(119, 9, 'CloudWatch', 'Monitoring and observability service for AWS resources and applications.', 'To Do'),
(120, 9, 'CloudTrail', 'Logs and records AWS API calls for auditing and security analysis.', 'To Do'),
(121, 10, 'Terraform CLI', 'Command-line interface used to initialize, plan, apply, and manage Terraform configurations.', 'To Do'),
(122, 10, 'Providers', 'Plugins that allow Terraform to interact with cloud platforms and APIs (e.g., AWS, Azure, GCP).', 'To Do'),
(123, 10, 'Resources', 'The infrastructure components defined in Terraform (e.g., servers, buckets, networks).', 'To Do'),
(124, 10, 'State files', 'Files that store the current state of infrastructure managed by Terraform.', 'To Do'),
(125, 10, 'Modules', 'Reusable groups of Terraform resources organized as separate configurations.', 'To Do'),
(126, 10, 'Variables', 'Inputs that allow customization of configurations without changing code.', 'To Do'),
(127, 10, 'Outputs', 'Values returned after Terraform applies, useful for referencing or sharing resource data.', 'To Do'),
(128, 10, 'Workspaces', 'Isolated environments for managing multiple states within the same configuration.', 'To Do'),
(129, 10, 'CI/CD Pipelines', 'Using Terraform within automated pipelines to deploy infrastructure.', 'To Do'),
(130, 10, 'Git Versioning', 'Storing Terraform code in Git repositories for collaboration, history, and rollback.', 'To Do'),
(131, 11, 'CI/CD Pipeline', 'A series of automated steps to build, test, and deploy applications continuously.', 'To Do'),
(132, 11, 'Build', 'The process of compiling source code into executable software packages.', 'To Do'),
(133, 11, 'Versioning', 'Managing changes in code using version control systems like Git.', 'To Do'),
(134, 11, 'Auto Tests', 'Automatically running tests to validate code changes and prevent regressions.', 'To Do'),
(135, 11, 'Deployment', 'Pushing applications to environments without manual intervention.', 'To Do'),
(136, 11, 'Staging', 'Pre-production setups used to validate features before going live.', 'To Do'),
(137, 11, 'Production', 'Live systems where the application is accessed by end users.', 'To Do'),
(138, 11, 'Monitoring', 'Tracking system performance and availability in real time.', 'To Do'),
(139, 11, 'Alerts', 'Notifications triggered by system anomalies, failures, or threshold breaches.', 'To Do'),
(140, 12, 'Jenkins Master', 'The central node that manages build schedules, job configurations, and coordinates with agents.', 'To Do'),
(141, 12, 'Jenkins Agent', 'A worker machine that executes build tasks as instructed by the Jenkins master/controller.', 'To Do'),
(142, 12, 'Jenkinsfile', 'A text file that defines a CI/CD pipeline as code using a declarative or scripted syntax.', 'To Do'),
(143, 12, 'Git Plugin', 'Integrates Jenkins with Git repositories, allowing it to clone code for builds and pipelines.', 'To Do'),
(144, 12, 'SCM', 'Refers to systems like Git or SVN that track and manage changes to source code. Jenkins connects to SCMs to retrieve code.', 'To Do'),
(145, 12, 'Webhooks', 'Automated triggers (e.g., from GitHub) that notify Jenkins to start a job when code changes occur.', 'To Do'),
(146, 12, 'Docker Plugin', 'Allows Jenkins to use Docker containers for isolated, consistent, and reproducible build environments.', 'To Do'),
(147, 12, 'Credentials', 'Securely stores sensitive data like tokens, SSH keys, and passwords for use in jobs and plugins.', 'To Do'),
(148, 12, 'Build Watch', 'Provides logs, status indicators, and metrics to track and analyze build executions in real time.', 'To Do'),
(149, 13, 'Argo CD Server', 'The API server that serves UI and CLI requests, managing user interactions with Argo CD.', 'To Do'),
(150, 13, 'Controller', 'Continuously monitors Git repositories and Kubernetes clusters to ensure application state is in sync.', 'To Do'),
(151, 13, 'Kubectl', 'The Kubernetes CLI tool used to interact with Kubernetes clusters, often alongside Argo CD.', 'To Do'),
(152, 13, 'Argocd CLI', 'Command-line tool for managing Argo CD applications, repositories, and sync operations.', 'To Do'),
(153, 13, 'K8s Manifests', 'Files that declare the desired state of Kubernetes resources (Pods, Services, Deployments, etc.).', 'To Do'),
(154, 13, 'YAML', 'A human-readable data serialization format commonly used to write configuration files, including Kubernetes manifests.', 'To Do'),
(155, 13, 'Git Repositories', 'Source of truth where application manifests are stored for Argo CD to track and deploy.', 'To Do'),
(156, 13, 'Sync Policy', 'Defines how and when Argo CD syncs application state between Git and Kubernetes clusters.', 'To Do'),
(157, 13, 'Health Checks', 'Automated checks that verify the status and readiness of deployed Kubernetes resources.', 'To Do'),
(158, 13, 'RBAC', 'Controls user permissions and access levels within Argo CD for security and governance.', 'To Do'),
(159, 13, 'UI', 'Web-based dashboard for visualizing, managing, and monitoring Argo CD applications and clusters.', 'To Do'),
(160, 14, 'Alertmanager', 'Handles and routes alerts from Prometheus to notification services like email or Slack.', 'To Do'),
(161, 14, 'Exporters', 'Collect and expose metrics in a Prometheus-compatible format from systems or applications.', 'To Do'),
(162, 14, 'Node Exporter', 'Prometheus exporter that exposes hardware and OS-level metrics from Linux nodes.', 'To Do'),
(163, 14, 'CAdvisor', 'Collects and exposes resource usage and performance metrics of running containers.', 'To Do'),
(164, 14, 'Dashboards', 'User-defined Grafana dashboards tailored to specific monitoring needs.', 'To Do'),
(165, 14, 'Grafana Labs', 'The company behind Grafana, offering official support, plugins, and cloud services.', 'To Do'),
(166, 14, 'Templates', 'Pre-built Grafana dashboards shared by the open-source community.', 'To Do'),
(167, 14, 'PromQL', 'Prometheus Query Language used to filter and analyze time-series data.', 'To Do'),
(168, 14, 'K8s Integration', 'Enables Prometheus and Grafana to monitor Kubernetes via service discovery and exporters.', 'To Do'),
(169, 14, 'Operator', 'Kubernetes Operator automates the deployment and management of Prometheus and Grafana.', 'To Do'),
(170, 14, 'Alerts', 'Defined rules in Prometheus that trigger notifications when specific conditions are met.', 'To Do'),
(171, 15, 'Elasticsearch', 'Distributed search and analytics engine for storing and indexing log data.', 'To Do'),
(172, 15, 'Logstash', 'Data pipeline that collects, transforms, and sends logs to Elasticsearch.', 'To Do'),
(173, 15, 'Filebeat', 'Lightweight shipper that forwards log files to Logstash or Elasticsearch.', 'To Do'),
(174, 15, 'Kibana', 'Visualization tool for exploring and analyzing data stored in Elasticsearch.', 'To Do'),
(175, 15, 'Dashboards', 'Customizable Kibana dashboards for visualizing log data and metrics.', 'To Do'),
(176, 15, 'Visualizations', 'Graphs and charts in Kibana that represent log data trends and insights.', 'To Do'),
(177, 15, 'Filters', 'Mechanisms to refine and narrow down log data views in Kibana.', 'To Do'),
(178, 15, 'Queries', 'Search expressions to retrieve specific log data from Elasticsearch.', 'To Do'),
(179, 15, 'App Integration', 'Connecting ELK Stack components to various applications for centralized logging.', 'To Do'),
(180, 15, 'Alerts', 'Notifications triggered based on log patterns or threshold breaches via Elastic Alerting.', 'To Do'),
(181, 15, 'Elastic Plugins', 'Pre-built connectors that simplify integrating Elastic Stack with external data sources and services.', 'To Do'),
(182, 16, 'App Risks', 'Weaknesses in software that can be exploited to compromise security.', 'To Do'),
(183, 16, 'Code Scanning', 'Automated analysis of source code to detect security flaws and bugs early.', 'To Do'),
(184, 16, 'Secure Secrets', 'Secure handling of passwords, certificates, and API keys to prevent unauthorized access.', 'To Do'),
(185, 16, 'Passwords', 'Confidential strings used for authentication to protect access to systems and data.', 'To Do'),
(186, 16, 'Certificates', 'Digital documents that verify identities and enable secure, encrypted communications.', 'To Do'),
(187, 16, 'Container Sec', 'Practices and tools to protect containerized applications from threats and breaches.', 'To Do'),
(188, 16, 'Snyk', 'Security platform that scans code and dependencies for vulnerabilities and helps fix them.', 'To Do'),
(189, 16, 'SonarQube', 'Tool for continuous inspection of code quality and detection of security issues.', 'To Do'),
(190, 16, 'HashiCorp Vault', 'Tool for managing secrets, encryption keys, and access to sensitive data securely.', 'To Do'),
(191, 16, 'Falco', 'Runtime security tool that detects anomalous behavior in containers and hosts.', 'To Do'),
(192, 16, 'Runtime ', 'Protection mechanisms that monitor and defend applications during execution.', 'To Do');

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
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
