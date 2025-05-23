-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 22, 2025 at 02:07 PM
-- Server version: 10.6.20-MariaDB
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `keralate_ktreach`
--

-- --------------------------------------------------------

--
-- Table structure for table `approved`
--

CREATE TABLE `approved` (
  `approved_id` int(200) NOT NULL,
  `deg` varchar(200) NOT NULL,
  `sem` varchar(200) NOT NULL,
  `subj` varchar(200) NOT NULL,
  `qtext` varchar(200) NOT NULL,
  `qyear` int(200) NOT NULL,
  `q_id` int(200) NOT NULL,
  `university` int(100) NOT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `approved`
--

INSERT INTO `approved` (`approved_id`, `deg`, `sem`, `subj`, `qtext`, `qyear`, `q_id`, `university`, `updated_date`) VALUES
(12, 'B.Com', '1', 'management concepts and thougts', 'qtext/BCom s1 2018.pdf', 2023, 18, 1, '2025-03-21 17:22:39'),
(14, 'B.Com', '1', 'EVS', 'qtext/N - 4129Environmental studies.pdf', 2020, 0, 1, '2025-03-21 17:22:39'),
(15, 'B.Sc Chemistry', '1', 'Inorganic chemisty', 'qtext/organic chemistry I.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(16, 'BCA', '6', 'IOT', 'qtext/IOT.pdf', 2023, 31, 1, '2025-03-21 17:22:39'),
(17, 'BCA', '2', 'Python Programming', 'qtext/Python programming.pdf', 2023, 32, 1, '2025-03-21 17:22:39'),
(18, 'BCA', '1', 'Computer  Fundamentals', 'qtext/S1 BCA CFO August 2021 QP.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(19, 'BCA', '1', 'English', 'qtext/S1 BCA English August 2021 QP.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(20, 'BCA', '1', 'Digital Electronics', 'qtext/S1 BCA DE August 2021 QP.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(21, 'BCA', '1', 'Maths', 'qtext/S1 BCA Maths August 2021 QP.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(22, 'BCA', '1', 'Introduction to programming', 'qtext/S1 BCA IP August 2021 QP.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(23, 'BCA', '2', 'Data Structures in C', 'qtext/S2 BCA Data structures in c question paper 2023.pdf', 2023, 0, 1, '2025-03-21 17:22:39'),
(24, 'BCA', '2', 'Web', 'qtext/s2-web.pdf', 2020, 0, 1, '2025-03-21 17:22:39'),
(25, 'BCA', '2', 'OOPS', 'qtext/S2 BCA OOP December 2021 QP.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(26, 'BCA', '2', 'EVS', 'qtext/S2 BCA EVS December 2021 QP.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(27, 'BCA', '2', 'Maths', 'qtext/S2 BCA Maths December 2021 QP.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(28, 'BCA', '2', 'Data Structures ', 'qtext/S2 BCA DS December 2021 QP.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(29, 'BCA', '3', 'CN and security', 'qtext/S3 BCA CN & Security March 2022 QP.pdf', 2022, 0, 1, '2025-03-21 17:22:39'),
(30, 'BCA', '3', 'Dbms', 'qtext/S3 BCA DBMS March 2022 QP.pdf', 2022, 0, 1, '2025-03-21 17:22:39'),
(31, 'BCA', '3', 'Java', 'qtext/S3 BCA Java March 2022 QP (2).pdf', 2022, 0, 1, '2025-03-21 17:22:39'),
(32, 'BCA', '3', 'OS', 'qtext/S3 BCA OS March 2022 QP.pdf', 2022, 0, 1, '2025-03-21 17:22:39'),
(33, 'BCA', '3', 'Value Education', 'qtext/S3 BCA Value Education March 2022 QP.pdf', 0, 0, 1, '2025-03-21 17:22:39'),
(34, 'BCA', '4', 'Data Mining', 'qtext/4th_Sem_Data_Mining_and_Warehousing_May_2021,_L_2890_VISHNU_VIJAY.pdf', 2022, 0, 1, '2025-03-21 17:22:39'),
(35, 'BCA', '4', 'Data Mining', 'qtext/2020 data mining.pdf', 2020, 0, 1, '2025-03-21 17:22:39'),
(36, 'BCA', '4', 'Php and MYSql', 'qtext/fourth sem PHP AND MYSQL BCA 2021.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(37, 'BCA', '4', 'PHP', 'qtext/Php 2020.pdf', 2020, 0, 1, '2025-03-21 17:22:39'),
(38, 'BCA', '4', 'Web programming and python', 'qtext/S4 BCA Web Programming and Python  August 2022 QP.pdf', 2022, 0, 1, '2025-03-21 17:22:39'),
(39, 'BCA', '5', 'Software Testing', 'qtext/s5. QP software testing.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(40, 'BCA', '5', 'Info and Knowledge  Management', 'qtext/S5 Informatio System and Knowledge Management.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(41, 'BCA', '5', 'Visual Programming', 'qtext/S5 BCA VISUAL PROGRAMMING.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(42, 'BCA', '5', 'Py', 'qtext/CS S5 Python programming qn ppr 2023.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(43, 'BCA', '5', 'Graphics', 'qtext/S5_Comp_Sci_Computer_Graphics_qn_ppr_2023_2018_admsn_onwrds.pdf', 2023, 0, 1, '2025-03-21 17:22:39'),
(44, 'BCA', '6', 'Data Mining and warehousing', 'qtext/datamining & Warehousing qn paper 2021.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(45, 'B.Sc CS', '6', 'IOT', 'qtext/IOT.pdf', 2023, 31, 1, '2025-03-21 17:22:39'),
(46, 'B.Sc CS', '2', 'Python Programming', 'qtext/Python programming.pdf', 2023, 32, 1, '2025-03-21 17:22:39'),
(47, 'B.Sc CS', '1', 'Computer  Fundamentals', 'qtext/S1 BCA CFO August 2021 QP.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(48, 'B.Sc CS', '1', 'English', 'qtext/S1 BCA English August 2021 QP.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(49, 'B.Sc CS', '1', 'Digital Electronics', 'qtext/S1 BCA DE August 2021 QP.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(50, 'B.Sc CS', '1', 'Maths', 'qtext/S1 BCA Maths August 2021 QP.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(51, 'B.Sc CS', '1', 'Introduction to programming', 'qtext/S1 BCA IP August 2021 QP.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(52, 'B.Sc CS', '2', 'Data Structures in C', 'qtext/S2 BCA Data structures in c question paper 2023.pdf', 2023, 0, 1, '2025-03-21 17:22:39'),
(53, 'B.Sc CS', '2', 'Web', 'qtext/s2-web.pdf', 2020, 0, 1, '2025-03-21 17:22:39'),
(54, 'B.Sc CS', '2', 'OOPS', 'qtext/S2 BCA OOP December 2021 QP.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(55, 'B.Sc CS', '2', 'EVS', 'qtext/S2 BCA EVS December 2021 QP.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(56, 'B.Sc CS', '2', 'Maths', 'qtext/S2 BCA Maths December 2021 QP.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(57, 'B.Sc CS', '2', 'Data Structures ', 'qtext/S2 BCA DS December 2021 QP.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(58, 'B.Sc CS', '3', 'CN and security', 'qtext/S3 BCA CN & Security March 2022 QP.pdf', 2022, 0, 1, '2025-03-21 17:22:39'),
(59, 'B.Sc CS', '3', 'Dbms', 'qtext/S3 BCA DBMS March 2022 QP.pdf', 2022, 0, 1, '2025-03-21 17:22:39'),
(60, 'B.Sc CS', '3', 'Java', 'qtext/S3 BCA Java March 2022 QP (2).pdf', 2022, 0, 1, '2025-03-21 17:22:39'),
(61, 'B.Sc CS', '3', 'OS', 'qtext/S3 BCA OS March 2022 QP.pdf', 2022, 0, 1, '2025-03-21 17:22:39'),
(62, 'B.Sc CS', '3', 'Value Education', 'qtext/S3 BCA Value Education March 2022 QP.pdf', 0, 0, 1, '2025-03-21 17:22:39'),
(63, 'B.Sc CS', '4', 'Data Mining', 'qtext/4th_Sem_Data_Mining_and_Warehousing_May_2021,_L_2890_VISHNU_VIJAY.pdf', 2022, 0, 1, '2025-03-21 17:22:39'),
(64, 'B.Sc CS', '4', 'Data Mining', 'qtext/2020 data mining.pdf', 2020, 0, 1, '2025-03-21 17:22:39'),
(65, 'B.Sc CS', '4', 'Php and MYSql', 'qtext/fourth sem PHP AND MYSQL BCA 2021.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(66, 'B.Sc CS', '4', 'PHP', 'qtext/Php 2020.pdf', 2020, 0, 1, '2025-03-21 17:22:39'),
(67, 'B.Sc CS', '4', 'Web programming and python', 'qtext/S4 BCA Web Programming and Python  August 2022 QP.pdf', 2022, 0, 1, '2025-03-21 17:22:39'),
(68, 'B.Sc CS', '5', 'Software Testing', 'qtext/s5. QP software testing.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(69, 'B.Sc CS', '5', 'Info and Knowledge  Management', 'qtext/S5 Informatio System and Knowledge Management.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(70, 'B.Sc CS', '5', 'Visual Programming', 'qtext/S5 BCA VISUAL PROGRAMMING.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(71, 'B.Sc CS', '5', 'Py', 'qtext/CS S5 Python programming qn ppr 2023.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(72, 'B.Sc CS', '5', 'Graphics', 'qtext/S5_Comp_Sci_Computer_Graphics_qn_ppr_2023_2018_admsn_onwrds.pdf', 2023, 0, 1, '2025-03-21 17:22:39'),
(73, 'B.Sc CS', '6', 'Data Mining and warehousing', 'qtext/datamining & Warehousing qn paper 2021.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(76, 'B.Com', '1', 'English', 'qtext/S1 BCA English August 2021 QP.pdf', 2021, 0, 1, '2025-03-21 17:22:39'),
(77, 'B.Sc Mathematics', '1', 'Statistical Methods', 'qtext/S1Stat_2018, 19.pdf', 2020, 0, 1, '2025-03-21 17:22:39'),
(78, 'B.Sc Mathematics', '1', 'Mechanics and properties of matter', 'qtext/S1 phy qn paper 2018.pdf', 2020, 0, 1, '2025-03-21 17:22:39'),
(79, 'B.Sc Mathematics', '2', 'Thermal Physics and Statistical Mechanics', 'qtext/S2 Physics PYQ Series (1).pdf', 2022, 0, 1, '2025-04-09 07:54:08'),
(80, 'B.Sc Mathematics', '6', 'Real Analysis 2', 'qtext/S6 REAL ANALYSIS_PYQ (2021-24) (1)_compressed.pdf', 2022, 0, 1, '2025-04-09 13:12:52'),
(81, 'B.Com', '2', 'Business mathematics', 'qtext/BUSINESS MATHEMATICS (2020 Admission).pdf', 2022, 0, 1, '2025-04-11 20:03:48'),
(82, 'B.Com', '2', 'Business Regulatory Framework', 'qtext/BUSINESS REGULATORY FRAMEWORK .pdf', 2022, 0, 1, '2025-04-11 20:04:31'),
(83, 'B.Com', '2', 'Finacial Accounting', 'qtext/FINANCIAL ACCOUNTING .pdf', 2022, 0, 1, '2025-04-11 20:05:02'),
(84, 'B.Com', '2', 'Informatics and cyber laws', 'qtext/DocScanner 19 Jan 2023 2-21 pm.pdf', 2022, 0, 1, '2025-04-11 20:05:48'),
(85, 'B.Com', '3', 'Advanced Financial Accounting', 'qtext/ADVANCED FINANCIAL ACCOUNTING .pdf', 2023, 0, 1, '2025-04-11 20:06:54'),
(86, 'B.Com', '3', 'Company Administration', 'qtext/COMPANY ADMINISTRATION .pdf', 2023, 0, 1, '2025-04-11 20:25:10'),
(87, 'B.Com', '3', 'Computer Application for publications', 'qtext/COMPUTER APPLICATION FOR PUBLICATIONS (2019 Admission Onwards).pdf', 2023, 0, 1, '2025-04-11 20:25:42'),
(88, 'B.Com', '3', 'E Business', 'qtext/E -BUSINESS .pdf', 2023, 0, 1, '2025-04-11 20:26:11'),
(89, 'B.Com', '3', 'Business English', 'qtext/EN 1311.2   BUSINESS ENGLISH (2019 ).pdf', 2023, 0, 1, '2025-04-11 20:26:41'),
(90, 'B.Com', '3', 'Financial Management', 'qtext/FINANCIAL MANAGEMENT .pdf', 2023, 0, 1, '2025-04-11 20:27:13'),
(91, 'B.Com', '4', 'Banking and Insurance', 'qtext/banking and insurance.pdf', 2022, 0, 1, '2025-04-11 20:29:16'),
(92, 'B.Com', '4', 'banking theory and practice', 'qtext/banking theory and practice.pdf', 2022, 0, 1, '2025-04-11 20:30:01'),
(93, 'B.Com', '4', 'Business Statistics', 'qtext/business statistics.pdf', 2022, 0, 1, '2025-04-11 20:30:37'),
(94, 'B.Com', '4', 'Corporate Accounting', 'qtext/corporate accounting.pdf', 2022, 0, 1, '2025-04-11 21:05:45'),
(95, 'B.Com', '4', 'Financial Services in India', 'qtext/FINANCIAL SERVICES IN INDIA.pdf', 2022, 0, 1, '2025-04-11 21:13:46'),
(96, 'B.Com', '5', 'Fundamentals of Income Tax', 'qtext/Fundamentals of income tax.pdf', 2022, 0, 1, '2025-04-11 21:14:19'),
(97, 'B.Com', '5', 'Web Designing and production', 'qtext/WEB DESIGNING AND PRODUCTION FOR BUSINESS.pdf', 2022, 0, 1, '2025-04-11 21:14:48'),
(98, 'B.Com', '5', 'Cost Accounting', 'qtext/cost accounting(1).pdf', 2021, 0, 1, '2025-04-11 21:16:10'),
(99, 'B.Com', '5', 'Financial Markets and services', 'qtext/financial markets and services.pdf', 2021, 0, 1, '2025-04-11 21:17:33'),
(100, 'B.Com', '5', 'Financial Services in India', 'qtext/financial services in india.pdf', 0, 0, 1, '2025-04-11 21:17:54'),
(101, 'B.Com', '5', 'Marketing Management', 'qtext/marketing management imp.pdf', 2021, 0, 1, '2025-04-11 21:18:19'),
(102, 'B.Com', '5', 'Web Designing and production', 'qtext/web designing and production.pdf', 2021, 0, 1, '2025-04-11 21:18:40'),
(103, 'B.Com', '6', 'Applied Costing', 'qtext/BCom APPLIED COSTING 2014-17 admission .pdf', 2023, 0, 1, '2025-04-11 21:19:45'),
(104, 'B.Com', '6', 'Auditing', 'qtext/S6 BCom AUDITING 2018 admission .pdf', 2023, 0, 1, '2025-04-11 21:20:37'),
(105, 'B.Com', '6', 'management of foreign trade', 'qtext/S6 BCom MANAGEMENT OF FOREIGN TRADE .pdf', 2023, 0, 1, '2025-04-11 21:21:23'),
(106, 'B.Com', '6', 'Computerised Accounting', 'qtext/BCom S6 2023 April .pdf', 2023, 0, 1, '2025-04-11 21:22:29'),
(107, 'B.Com', '6', 'Management Accounting', 'qtext/Bcom S6 2013-2017 Admission .pdf', 2023, 0, 1, '2025-04-11 21:23:13'),
(108, 'B.Com', '6', 'Management Accounting', 'qtext/BCom s1 2018 Admission .pdf', 2023, 0, 1, '2025-04-11 21:24:13'),
(109, 'B.Com', '1', 'Managerial Economics', 'qtext/managerial economics supple.pdf', 2020, 0, 1, '2025-04-11 21:27:08'),
(110, 'B.Com', '1', 'EVS', 'qtext/N - 4130 environmental studies.pdf', 2020, 0, 1, '2025-04-11 21:27:30'),
(111, 'B.Com', '1', 'management concepts ', 'qtext/management concepts.pdf', 2020, 0, 1, '2025-04-11 21:28:20'),
(112, 'B.Com', '1', 'Language Skills', 'qtext/language skills.pdf', 2020, 0, 1, '2025-04-11 21:28:57'),
(113, 'B.Com', '1', 'Functional Applications of Management', 'qtext/functional applications of management.pdf', 2020, 0, 1, '2025-04-11 21:29:37'),
(114, 'B.Com', '1', 'Advanced Financial Accounting', 'qtext/advanced financial accounting(1)_compressed.pdf', 2020, 0, 1, '2025-04-11 21:31:03'),
(115, 'BCA', '6', 'Artificial intelligence', 'qtext/Artificial Intelligence.pdf', 2022, 37, 1, '2025-04-14 16:00:22'),
(116, 'B.Sc Physics', '1', 'Theoretical Chemistry', 'qtext/Theoretical Chemistry CH 1131.1 S-2685.pdf', 2024, 0, 1, '2025-04-14 18:54:49'),
(117, 'B.Sc Physics', '1', 'Basic Mechanics and Properties of Matter', 'qtext/Basic Mechanics and Properties of Matter PY 1141 S-2682.pdf', 2024, 0, 1, '2025-04-14 18:55:39'),
(118, 'B.Sc Physics', '1', 'Mathematics 1', 'qtext/Mathematics I Calculus and Sequence and Series MM 1131.1 S-2690.pdf', 2024, 0, 1, '2025-04-14 18:56:16'),
(119, 'B.Sc Physics', '1', 'Theoretical and Analytical Chemistry ', 'qtext/Theoretical and Analytical Chemistry CH 1131.1 S-2686.pdf', 2024, 0, 1, '2025-04-14 18:56:57'),
(120, 'B.Sc Physics', '2', 'Thermal Physics', 'qtext/Thermal Physics PY 1231.2 T-3218.pdf', 2024, 0, 1, '2025-04-14 19:00:21'),
(121, 'B.Sc Physics', '2', 'Thermal Physics(2022 batch))', 'qtext/Thermal Physics PY 1231.2 T-3217.pdf', 2024, 0, 1, '2025-04-14 19:01:01'),
(122, 'B.Sc Physics', '2', 'Calculus with application in Physics', 'qtext/Calculus with Applications in Physics II MM 1231.1 T-3197.pdf', 2024, 0, 1, '2025-04-14 19:01:38'),
(123, 'B.Sc Physics', '2', 'Heat and Thermodynamics', 'qtext/Heat and Thermodynamics PY 1241 T-3017.pdf', 2024, 0, 1, '2025-04-14 19:02:10'),
(124, 'B.Sc Physics', '2', 'Mathematics 2', 'qtext/Mathematics-II Applications of Calculus and Vector Differentiation MM 1231.1 T-3198.pdf', 2024, 0, 1, '2025-04-14 19:02:43'),
(125, 'B.Sc Physics', '2', 'Physical and Industrial Chemisty', 'qtext/Physical and Industrial Chemistry CH 1231.1 T-3201.pdf', 2024, 0, 1, '2025-04-14 19:07:43'),
(126, 'B.Sc Physics', '2', 'Physical Chemistry', 'qtext/Physical Chemistry CH 1231.1 T-3200.pdf', 2024, 0, 1, '2025-04-14 19:08:17'),
(127, 'B.Sc Physics', '3', 'Physcial Chemistry II', 'qtext/Physical Chemistry II CH 1331.1 S-3423.pdf', 2024, 0, 1, '2025-04-14 19:17:52'),
(128, 'B.Sc Physics', '3', 'Physcial Chemistry ', 'qtext/Physical Chemistry CH 1331.1 S-3424.pdf', 2024, 0, 1, '2025-04-14 19:18:52'),
(129, 'B.Sc Physics', '3', 'Electrodynamics', 'qtext/Electrodynamics PY 1341 S-3431.pdf', 2024, 0, 1, '2025-04-14 19:20:03'),
(130, 'B.Sc Physics', '3', 'Mathematics Calculus and Linear Algebra', 'qtext/Mathematics III Calculus and Linear Algebra MM 1331.1 S-3420.pdf', 2024, 0, 1, '2025-04-14 19:21:40'),
(131, 'B.Sc Physics', '3', 'Mathematics Linear Algebra ,Special functions and Calculus', 'qtext/Mathematics III Linear Algebra, Special Functions and Calculus MM 1331.1 S-3421.pdf', 2024, 0, 1, '2025-04-14 19:22:44'),
(132, 'B.Sc Physics', '4', 'Mathematics 4- complex analysis, special functions and probability theory', 'qtext/Mathematics IV Complex Analysis, Special Functions and Probability Theory MM 1431.1 T-2532.pdf', 2024, 0, 1, '2025-04-14 19:25:18'),
(133, 'B.Sc Physics', '4', 'Classical Relativistic Mechanics', 'qtext/Classical and Relativistic Mechanics PY 1441 T-2529.pdf', 2024, 0, 1, '2025-04-14 19:26:15'),
(134, 'B.Sc Physics', '4', 'Fourier Series,Complex Analysis and probablity theory', 'qtext/Mathematics IV - Fourier Series, Complex Analysis and Probability Theory MM 1431.1 T-2533.pdf', 2024, 0, 1, '2025-04-14 19:27:17'),
(135, 'B.Sc Physics', '5', 'Atomic and Molecular Physics', 'qtext/Atomic and Molecular Physics PY 1544 S-1651.pdf', 2024, 0, 1, '2025-04-14 20:40:24'),
(136, 'B.Sc Physics', '5', 'Statistical Mechanics,Research Methodology and disaster Management', 'qtext/Statistical Mechanics, Research Methodology and Disaster Management PY 1542 S-1649.pdf', 2024, 0, 1, '2025-04-14 20:41:31'),
(137, 'B.Sc Physics', '5', 'Quantum Mechanics', 'qtext/Quantum Mechanics PY 1541 S-1648.pdf', 2024, 0, 1, '2025-04-14 20:42:09'),
(138, 'B.Sc Physics', '5', 'Electronics', 'qtext/Electronics PY 1543 S-1650.pdf', 2024, 0, 1, '2025-04-14 20:42:37'),
(139, 'B.Sc Physics', '6', 'Classical And modern Optics', 'qtext/Classical and Modern Optics PY 1643 T-1629.pdf', 2024, 0, 1, '2025-04-14 20:44:31'),
(140, 'B.Sc Physics', '6', 'Computer Hardware and Networking', 'qtext/Computer Hardware and Networking PY 1661.5 T-1635.pdf', 2024, 0, 1, '2025-04-14 20:45:07'),
(141, 'B.Sc Physics', '6', 'Digital Electronics and Computer Science', 'qtext/Digital Electronics and Computer Science PY 1644 T-1630.pdf', 2024, 0, 1, '2025-04-14 20:45:59'),
(142, 'B.Sc Physics', '6', 'Nuclear and Particle Physics', 'qtext/Nuclear and Particle Physics PY 1642 T-1628.pdf', 2024, 0, 1, '2025-04-14 20:46:42'),
(143, 'B.Sc Physics', '6', 'Solid State Physics', 'qtext/Solid State Physics PY 1641 T-1627.pdf', 2024, 0, 1, '2025-04-14 20:47:37'),
(144, 'BA Economics', '1', 'History of Modern India', 'qtext/History of Modern India (1857-1900) HY 1131.1 S-2534.pdf', 2024, 0, 1, '2025-04-14 20:50:49'),
(145, 'BA Economics', '1', 'Introduction To MicroEconomics', 'qtext/Introductory Micro Economics EC 1141 S-2541.pdf', 2024, 0, 1, '2025-04-14 20:51:27'),
(146, 'BA Economics', '1', 'Introduction to political science', 'qtext/Introduction to Political Science PS 1131.1 S-2550.pdf', 2024, 0, 1, '2025-04-14 20:52:03'),
(147, 'BA Economics', '1', 'National Movement part1', 'qtext/History of National Movement in India Part I HY 1131.1 S-2535.pdf', 2024, 0, 1, '2025-04-14 20:52:35'),
(148, 'BA Economics', '2', 'Micro economics', 'qtext/Microeconomics I EC 1241 T-3050.pdf', 2024, 0, 1, '2025-04-14 20:54:55'),
(149, 'BA Economics', '2', 'Intermediate MicroEconomics', 'qtext/Intermediate Microeconomics EC 1241 T-3052.pdf', 2024, 0, 1, '2025-04-14 20:55:23'),
(150, 'BA Economics', '2', 'Indian Government and policies', 'qtext/Indian Government and Politics PS 1231 T-3057.pdf', 2024, 0, 1, '2025-04-14 20:56:08'),
(151, 'BA Economics', '2', 'Indian Government and policies 2', 'qtext/Indian Government and Politics PS 1231.3 T-3059.pdf', 2024, 0, 1, '2025-04-14 20:56:29'),
(152, 'BA Economics', '2', 'National Movement part2', 'qtext/History of National Movement in india Part II HY 1231.3 T-3046.pdf', 2024, 0, 1, '2025-04-14 20:57:01'),
(153, 'BA Economics', '2', 'History of Modern India', 'qtext/History of Modern India HY 1231.1 T-3043.pdf', 2024, 0, 1, '2025-04-14 20:57:30'),
(154, 'BA Economics', '2', 'National Movement part2', 'qtext/History of National Movement in india Part II HY 1231.3 T-3046.pdf', 2024, 0, 1, '2025-04-14 21:05:27'),
(155, 'BA Economics', '3', 'Dynamics of Indian politics', 'qtext/Dynamics of Indian Politics PS 1331.5 S-3268.pdf', 2024, 0, 1, '2025-04-14 21:06:29'),
(156, 'BA Economics', '3', 'Introduction To MacroEconomics', 'qtext/Introductory Macroeconomics EC 1341 S-3256-1.pdf', 2024, 0, 1, '2025-04-14 21:07:01'),
(157, 'BA Economics', '3', 'Informatics for applied Econometrics', 'qtext/Informatics for Applied Econometrics EC 1321 S-3253.pdf', 2024, 0, 1, '2025-04-14 21:07:47'),
(158, 'BA Economics', '3', 'History of Modern India', 'qtext/History of Modern India HY 1331.1 S-3247.pdf', 2024, 0, 1, '2025-04-14 21:10:46'),
(159, 'BA Economics', '4', 'Contemporary India', 'qtext/Contemporary India HY 1431.7 T-2355.pdf', 2024, 0, 1, '2025-04-14 21:13:25'),
(160, 'BA Economics', '4', 'Mathematical methods for economics', 'qtext/Mathematical Methods for Economics EC 1441 T-2363.pdf', 2024, 0, 1, '2025-04-14 21:14:18'),
(161, 'BA Economics', '4', 'International Politics', 'qtext/International Politics PS 1431 T-2371.pdf', 2022, 0, 1, '2025-04-14 21:15:01'),
(162, 'BA Economics', '4', 'International Politics 2', 'qtext/International Politics PS 1431.7 T-2374.pdf', 2024, 0, 1, '2025-04-14 21:15:26'),
(163, 'BA Economics', '4', 'Intermediate MacroEconomics', 'qtext/Intermediate Macro Economics EC 1442 T-2364.pdf', 2024, 0, 1, '2025-04-14 21:15:52'),
(164, 'BA Economics', '4', 'History of Contemporary India', 'qtext/History of Contemporary India HY 1431.1 T-2351.pdf', 2024, 0, 1, '2025-04-14 21:16:32'),
(165, 'BA Economics', '5', 'Economic Growth and Development', 'qtext/Economic Growth and Development EC 1544 S-1447.pdf', 2023, 0, 1, '2025-04-14 21:19:23'),
(166, 'BA Economics', '5', 'Economic Growth and Development2', 'qtext/Economics of Growth and Development Ec 1543 S-1440.pdf', 2023, 0, 1, '2025-04-14 21:20:02'),
(167, 'BA Economics', '5', 'Human Resource Management', 'qtext/Human Resource Management EC 1551.2 S-1450.pdf', 2023, 0, 1, '2025-04-14 21:20:31'),
(168, 'BA Economics', '5', 'Indian Economy', 'qtext/Indian Economy EC 1544 S-1441.pdf', 2023, 0, 1, '2025-04-14 21:21:08'),
(169, 'BA Economics', '5', 'International Economics', 'qtext/International Economics EC 1545 S-1448.pdf', 2023, 0, 1, '2025-04-14 21:21:39'),
(170, 'BA Economics', '5', 'Macro Economics 2', 'qtext/Macro Economics II EC 1542 S-1439.pdf', 2023, 0, 1, '2025-04-14 21:22:13'),
(171, 'BA Economics', '5', 'Methodology and Perspective of Social Science', 'qtext/Methodology and Perspectives of Social Science Ec 1541 S-1444.pdf', 2023, 0, 1, '2025-04-14 21:23:00'),
(172, 'BA Economics', '5', 'Readings in political Economy', 'qtext/Readings in Political Economy EC 1543 S-1446.pdf', 2023, 0, 1, '2025-04-14 21:23:39'),
(173, 'BA Economics', '5', 'Statistical Methods for Economics', 'qtext/Statistical Methods for economics EC 1542 S-1445.pdf', 2023, 0, 1, '2025-04-14 21:24:23'),
(174, 'BA Economics', '6', 'Banking and Finance', 'qtext/Banking and Finance EC 1642 T-1437.pdf', 2024, 0, 1, '2025-04-14 21:28:46'),
(175, 'BA Economics', '6', 'Environmental Economics and disaster management', 'qtext/Environmental Economics and Disaster Management EC 1644 T-1439.pdf', 2024, 0, 1, '2025-04-14 21:29:23'),
(176, 'BA Economics', '6', 'Indian Economy', 'qtext/Indian Economy EC 1641 T-1436.pdf', 2024, 0, 1, '2025-04-14 21:29:52'),
(177, 'BA Economics', '6', 'Public Economics', 'qtext/Public Economics EC 1643 T-1438.pdf', 2024, 0, 1, '2025-04-14 21:31:02'),
(178, 'BA Economics', '6', 'Kerala Economics', 'qtext/Kerala Economy EC 1661.1 T-1440.pdf', 2024, 0, 1, '2025-04-14 21:31:30'),
(179, 'BA history', '6', 'history', 'qtext/paper_67fd3d00cd004_20250414.pdf', 2023, 39, 1, '2025-04-15 12:54:41'),
(180, 'B.Sc Mathematics', '6', 'Complex Analysis', 'qtext/Complex Analysis.pdf', 2024, 38, 1, '2025-04-15 12:56:34'),
(181, 'BA English', '1', 'History of English Literature', 'qtext/1744704340_History of English Literature I EN 1131 S-2509.pdf', 2024, 0, 1, '2025-04-15 13:35:42'),
(182, 'BA English', '1', 'History of Modern World HY', 'qtext/1744705225_History of Modern World HY 1131.2 S-2537.pdf', 2024, 0, 1, '2025-04-15 13:50:27'),
(183, 'BA English', '1', 'History of Modern World part 1', 'qtext/1744705281_History of Modern World Part I HY 1131.2 S-2538.pdf', 2024, 0, 1, '2025-04-15 13:51:22'),
(184, 'BA English', '1', 'Introduction to literary Studies', 'qtext/1744705282_Introduction to Literary Studies I EN 1141 S-2508.pdf', 2024, 0, 1, '2025-04-15 13:51:24'),
(185, 'BA English', '1', 'Introduction to political science', 'qtext/1744705364_Introduction to Political Science PS 1131 S-2549.pdf', 2024, 0, 1, '2025-04-15 13:52:45'),
(186, 'BA English', '1', 'Language Skills', 'qtext/1744705365_Language Skills EN 1111.1 S-2472.pdf', 2024, 0, 1, '2025-04-15 13:52:47'),
(187, 'BA English', '1', 'Popular Literature and culture', 'qtext/1744705367_Popular Literature and Culture EN 1131 S-2510.pdf', 2024, 0, 1, '2025-04-15 13:52:49'),
(188, 'BA English', '1', 'Writings on Contemporary Issues', 'qtext/1744705369_Writings on Contemporary Issues EN 1121 S-2506.pdf', 2024, 0, 1, '2025-04-15 13:52:50'),
(189, 'BA English', '2', 'Art and Literacy Aesthetics', 'qtext/1744706465_Art and Literary Aesthetics EN 1231 T-3019.pdf', 2024, 0, 1, '2025-04-15 14:11:06'),
(190, 'BA English', '2', 'Drishyakalasahithyam', 'qtext/1744706466_Drishyakalasahithyam ML 1211.3 T-3350.pdf', 2024, 0, 1, '2025-04-15 14:11:06'),
(191, 'BA English', '2', 'English for career', 'qtext/1744706466_English for Career EN 1211.4 T-3487.pdf', 2024, 0, 1, '2025-04-15 14:11:09'),
(192, 'BA English', '2', 'Environmental Studies and Disaster Management', 'qtext/1744706469_Environmental Studies and Disaster Management En 1211.1 T-2983.pdf', 2024, 0, 1, '2025-04-15 14:11:10'),
(193, 'BA English', '2', 'Gadhya Sahithyam', 'qtext/1744706600_Gadhya Sahithyam ML 1211.1 T-2989.pdf', 2024, 0, 1, '2025-04-15 14:13:21'),
(194, 'BA English', '2', 'Hindi Nibandh Aur Anya Gadya Vidayem', 'qtext/1744706601_Hindi Nibandh Aur Anya Gadya Vidhayem HN 1211.1 T-2992.pdf', 2024, 0, 1, '2025-04-15 14:13:22'),
(195, 'BA English', '2', 'History of English Literature 2', 'qtext/1744706602_History of English Literature II EN 1231 T-3018.pdf', 2024, 0, 1, '2025-04-15 14:13:22'),
(196, 'BA English', '2', 'History of Modern World Hy 2', 'qtext/1744706602_History of Modern World HY 1231.2 T-3044.pdf', 2024, 0, 1, '2025-04-15 14:13:23'),
(197, 'BA English', '2', 'History of Modern World part 2', 'qtext/1744706603_History of Modern World Part II HY 1231.4 T-3047.pdf', 2024, 0, 1, '2025-04-15 14:13:23'),
(198, 'BA English', '2', 'Introduction to literary Studies 2', 'qtext/1744706603_Introduction to Literary Studies II EN 1241 T-3017.pdf', 2024, 0, 1, '2025-04-15 14:13:24'),
(199, 'BA English', '3', 'British Literature', 'qtext/1744707040_British Literature I EN 1341 S-3214.pdf', 2022, 0, 1, '2025-04-15 14:20:42'),
(200, 'BA English', '3', 'English for career', 'qtext/1744707141_English for Career EN 1311.1 S-3180.pdf', 2024, 0, 1, '2025-04-15 14:22:26'),
(201, 'BA English', '3', 'Evolution of English Language', 'qtext/1744707461_Evolution of the English Language EN 1321 S-3217.pdf', 2024, 0, 1, '2025-04-15 14:27:42'),
(202, 'BA English', '3', 'Hindi Natak, Vyakaran thatha Anuvad', 'qtext/1744707561_Hindi Natak, Vyakaran Thatha Anuvad HN 1311.1 S-3187.pdf', 2024, 0, 1, '2025-04-15 14:29:23'),
(203, 'BA English', '3', 'History of Modern World part 3', 'qtext/1744707563_History of Modern World Part III HY 1331.6 S-3250.pdf', 2024, 0, 1, '2025-04-15 14:29:24'),
(204, 'BA English', '3', 'History of Modern world', 'qtext/1744707564_History of Modern World S-3249.pdf', 2024, 0, 1, '2025-04-15 14:29:26'),
(205, 'BA English', '3', 'Narratives of Resistance', 'qtext/1744707650_Narratives of Resistance EN 1331 S-3211.pdf', 2024, 0, 1, '2025-04-15 14:30:51'),
(206, 'BA English', '3', 'Public Administration', 'qtext/1744707651_Public Administration PS 1331 S-3267.pdf', 2024, 0, 1, '2025-04-15 14:30:53'),
(207, 'BA English', '3', 'Reading Fictions', 'qtext/1744707653_Reading Fiction EN 1341 S-3213.pdf', 2024, 0, 1, '2025-04-15 14:30:54'),
(208, 'BA English', '4', 'Aashaya Vinimayam', 'qtext/1744707982_Aashaya Vinimayam Sargatmaka Rachana Bhashavabodham ML 1411.1 T-2291.pdf', 2024, 0, 1, '2025-04-15 14:36:25'),
(209, 'BA English', '4', 'British Literature 2', 'qtext/1744708065_British Literature II EN 1441 T-2318.pdf', 2024, 0, 1, '2025-04-15 14:37:46'),
(210, 'BA English', '4', ' Contemporary World hy', 'qtext/1744708066_Contemporary World HY 1431.8 T-2356.pdf', 2024, 0, 1, '2025-04-15 14:37:48'),
(211, 'BA English', '4', 'Drishyakalasahithyam', 'qtext/1744708068_Drishya Kala Sahithyam ML 1411.1 T-2292.pdf', 2024, 0, 1, '2025-04-15 14:37:50'),
(212, 'BA English', '4', 'History of Modern World HY', 'qtext/1744708180_History of Modern World HY 1431.2 T-2352.pdf', 2024, 0, 1, '2025-04-15 14:39:42'),
(213, 'BA English', '4', 'Literature of 20th Century', 'qtext/1744708182_Literature of the 20th Century EN 1442 T-2320.pdf', 2024, 0, 1, '2025-04-15 14:39:43'),
(214, 'BA English', '4', 'Philosophy of Literature', 'qtext/1744708183_Philosophy for Literature EN 1431 T-2322.pdf', 2024, 0, 1, '2025-04-15 14:39:44'),
(215, 'BA English', '4', 'Readings in Literature', 'qtext/1744708184_Readings in Literature EN 1411.1 T-2288.pdf', 2024, 0, 1, '2025-04-15 14:39:46'),
(216, 'BA English', '5', '20th Century Malayalam', 'qtext/1744708359_20th Century Malayalam Literature in Translation EN 1543 S-1367.pdf', 2023, 0, 1, '2025-04-15 14:42:40'),
(217, 'BA English', '5', 'Criticism and theory', 'qtext/1744708360_Criticism and Theory EN 1545 S-1371.pdf', 2023, 0, 1, '2025-04-15 14:42:42'),
(218, 'BA English', '5', 'Film Studies', 'qtext/1744708362_Film Studies EN 1543 S-1366.pdf', 2023, 0, 1, '2025-04-15 14:42:43'),
(219, 'BA English', '5', 'Linguistics and phonetics', 'qtext/1744709396_Linguistics and Phonetics EN 1544 S-1368.pdf', 2024, 0, 1, '2025-04-15 14:59:57'),
(220, 'BA English', '5', 'Linguistics and Structure of English Language', 'qtext/1744709397_Linguistics and Structure of the English Language EN 1544 S-1369.pdf', 2024, 0, 1, '2025-04-15 14:59:59'),
(221, 'BA English', '5', 'Literary Critisism', 'qtext/1744709399_Literary Criticism EN 1541 S-1362.pdf', 2024, 0, 1, '2025-04-15 15:00:00'),
(222, 'BA English', '5', 'Literature of 20th and 21st century', 'qtext/1744709400_Literature of the Late 20th Century and 21st Century EN 1541 S-1363.pdf', 2024, 0, 1, '2025-04-15 15:00:02'),
(223, 'BA English', '5', 'Post Colonial Literatures', 'qtext/1744709402_Postcolonial Literatures EN 1542 S-1365.pdf', 2024, 0, 1, '2025-04-15 15:00:04'),
(224, 'BA English', '5', 'Linguistics and phonetics', 'qtext/1744709598_Linguistics and Phonetics EN 1544 S-1368.pdf', 2024, 0, 1, '2025-04-15 15:03:19'),
(225, 'BA English', '5', 'Linguistics and Structure of English Language', 'qtext/1744709599_Linguistics and Structure of the English Language EN 1544 S-1369.pdf', 2024, 0, 1, '2025-04-15 15:03:21'),
(226, 'BA English', '5', 'Literary Critisism', 'qtext/1744709601_Literary Criticism EN 1541 S-1362.pdf', 2024, 0, 1, '2025-04-15 15:03:22'),
(227, 'BA English', '5', 'Literature of 20th and 21st century', 'qtext/1744709602_Literature of the Late 20th Century and 21st Century EN 1541 S-1363.pdf', 2024, 0, 1, '2025-04-15 15:03:24'),
(228, 'BA English', '5', 'Post Colonial Literatures', 'qtext/1744709604_Postcolonial Literatures EN 1542 S-1365.pdf', 2024, 0, 1, '2025-04-15 15:03:25'),
(229, 'BA English', '5', 'Linguistics and phonetics', 'qtext/1744709616_Linguistics and Phonetics EN 1544 S-1368.pdf', 2024, 0, 1, '2025-04-15 15:03:38'),
(230, 'BA English', '5', 'Linguistics and Structure of English Language', 'qtext/1744709618_Linguistics and Structure of the English Language EN 1544 S-1369.pdf', 2024, 0, 1, '2025-04-15 15:03:39'),
(231, 'BA English', '5', 'Literary Critisism', 'qtext/1744709619_Literary Criticism EN 1541 S-1362.pdf', 2024, 0, 1, '2025-04-15 15:03:40'),
(232, 'BA English', '5', 'Literature of 20th and 21st century', 'qtext/1744709620_Literature of the Late 20th Century and 21st Century EN 1541 S-1363.pdf', 2024, 0, 1, '2025-04-15 15:03:42'),
(233, 'BA English', '5', 'Post Colonial Literatures', 'qtext/1744709622_Postcolonial Literatures EN 1542 S-1365.pdf', 2024, 0, 1, '2025-04-15 15:03:44'),
(234, 'BA English', '6', 'Creative Writing', 'qtext/1744709641_Creative Writing EN 1661.3 T-1368.pdf', 2024, 0, 1, '2025-04-15 15:04:03'),
(235, 'BA English', '6', 'Film Studies', 'qtext/1744709700_Film Studies En 1643 T-1364.pdf', 2024, 0, 1, '2025-04-15 15:05:01'),
(236, 'BA English', '6', 'Gender Studies', 'qtext/1744709701_Gender Studies EN 1641 T-1362.pdf', 2024, 0, 1, '2025-04-15 15:05:03'),
(237, 'BA English', '6', 'Indian writing', 'qtext/1744709703_Indian Writing in English EN 1642 T-1363.pdf', 2024, 0, 1, '2025-04-15 15:05:04'),
(238, 'BA English', '6', 'World Classics', 'qtext/1744709704_World Classics EN 1644 T-1365.pdf', 2024, 0, 1, '2025-04-15 15:05:06'),
(239, 'B.Sc Botany', '1', 'MIcrobiology', 'qtext/1744719242_BSc Botany and biotechnology s1 Microbiology.pdf', 2023, 0, 1, '2025-04-15 17:44:02'),
(240, 'B.Sc Botany', '1', 'Introduction to biochemistry', 'qtext/1744719242_BSc botany and biotechnology S1 2014-19 Biochemisty.pdf', 2023, 0, 1, '2025-04-15 17:44:03'),
(241, 'B.Sc Botany', '1', 'physical aspects of biochemistry', 'qtext/1744719243_BSc botany and biotechnology s1 2020 physical aspects of biochemistry.pdf', 2023, 0, 1, '2025-04-15 17:44:03'),
(242, 'B.Sc Botany', '1', 'Microtechniques, angiosperm and reproduction', 'qtext/1744719243_BSc botany S1 2014-18 microtechnics, angiosperm.pdf', 2023, 0, 1, '2025-04-15 17:44:04'),
(243, 'B.Sc Botany', '1', 'Microtechniques, angiosperm and reproduction 2019', 'qtext/1744719244_BSc botany S1 2019-21 microtechnics, angiosperm2.pdf', 2023, 0, 1, '2025-04-15 17:44:04'),
(244, 'B.Sc Botany', '1', 'Microtechniques, angiosperm and reproduction 2022', 'qtext/1744719558_BSc botany S1 2022  microtechnics, angiosperm3.pdf', 2023, 0, 1, '2025-04-15 17:49:18'),
(245, 'B.Sc Botany', '1', 'Basic Mechanical Properties of  Matter', 'qtext/1744719558_S1 BSc BASIC MECHANICS AND PROPERTIES OF MATTER 2018 Admission .pdf', 2023, 0, 1, '2025-04-15 17:49:19'),
(246, 'B.Sc Botany', '1', ' Angiosperm anatomy, reproductive botany', 'qtext/1744719559_S1 Bsc Botany 22 Admission  Angiosperm anatomy, reproductive botany.pdf', 2023, 0, 1, '2025-04-15 17:49:19'),
(247, 'B.Sc Botany', '1', 'Biotechnology Angiosperm', 'qtext/1744719559_S1 BSc BOTANY AND BIOTECHNOLOGY  Angiosperm.pdf', 2023, 0, 1, '2025-04-15 17:49:20'),
(248, 'B.Sc Chemistry', '1', ' Theoretical Chemistry', 'qtext/1744719793_BSc chemistry s1 2017 -19 Theoretical Chemistry.pdf', 2023, 0, 1, '2025-04-15 17:53:14'),
(249, 'B.Sc Chemistry', '1', ' Analytical and Environmental Chemistry', 'qtext/1744719794_BSc chemistry s1 2020 (1) Analytical and Environmental Chemistry.pdf', 2023, 0, 1, '2025-04-15 17:53:14'),
(250, 'B.Sc Chemistry', '1', 'Theoretical and analytical chemistry', 'qtext/1744719794_BSc chemistry S1 2020 (2) Theoretical and analytical chemistry.pdf', 2023, 0, 1, '2025-04-15 17:53:15'),
(251, 'B.Sc Mathematics', '1', 'Calculus sequence and series', 'qtext/1744720086_BSc mathematics s1 2021 admission  (1) Calculus sequence and series.pdf', 2023, 0, 1, '2025-04-15 17:58:06'),
(252, 'B.Sc Mathematics', '1', '  Differential Calculus series', 'qtext/1744720086_BSc mathematics s1 2021 Admission  Differential Calculus series.pdf', 2023, 0, 1, '2025-04-15 17:58:07'),
(253, 'B.Sc Mathematics', '1', 'Descriptive Statistics', 'qtext/1744720087_BSc s1 2018-21 Descriptive Statistics.pdf', 2023, 0, 1, '2025-04-15 17:58:08'),
(254, 'B.Sc Mathematics', '1', 'Descriptive statistics and bivirate analysis', 'qtext/1744720088_BSc s1 2022 admission  Descriptive statistics and bivirate analysis.pdf', 2023, 0, 1, '2025-04-15 17:58:09'),
(255, 'B.Sc Zoology', '1', 'Theoretical Chemistry', 'qtext/1744720220_BSc Zoology s1 2020 Theoretical chemistry.pdf', 2023, 0, 1, '2025-04-15 18:00:21'),
(256, 'B.Sc Zoology', '1', 'Animal Diversity', 'qtext/1744720221_S1 Bsc ZOOLOGY I 2015-18 Admission  Animal Diversity.pdf', 2023, 0, 1, '2025-04-15 18:00:22'),
(257, 'B.Sc Mathematics', '2', 'Application of calculus and vector differentiation', 'qtext/1744722172_APPLICATIONS OF CALCULUS AND VECTOR DIFFERENTIATION .pdf', 2024, 0, 1, '2025-04-15 18:32:53'),
(258, 'B.Sc Mathematics', '2', 'Calculus with application in CHemistry', 'qtext/1744722173_CALCULUS WITH APPLICATIONS IN CHEMISTRY .pdf', 2024, 0, 1, '2025-04-15 18:32:54'),
(259, 'B.Sc Mathematics', '2', 'Foundation Of mathematics 2', 'qtext/1744722174_Foundation Of mathematics 2.pdf', 2024, 0, 1, '2025-04-15 18:32:55'),
(260, 'B.Sc Mathematics', '2', 'Foundation Of mathematics 2 2022', 'qtext/1744722175_Foundation Of mathematics 2 2022.pdf', 2024, 0, 1, '2025-04-15 18:32:57'),
(261, 'B.Sc Mathematics', '2', 'INTEGRAL CALCULUS AND VECTOR DIFFERENTIATION (2021 Admission)', 'qtext/1744722177_INTEGRAL CALCULUS AND VECTOR DIFFERENTIATION (2021 Admission).pdf', 2024, 0, 1, '2025-04-15 18:32:58'),
(262, 'B.Sc Mathematics', '2', 'INTEGRATION DIFFERENTIAL EQUATIONS AND ANALYTIC GEOMETRY (2014-17 Admission)', 'qtext/1744722178_INTEGRATION DIFFERENTIAL EQUATIONS AND ANALYTIC GEOMETRY (2014-17 Admission).pdf', 2024, 0, 1, '2025-04-15 18:32:59'),
(263, 'B.Sc Mathematics', '2', 'MATHEMATICS II-CALCULUS WITH APPLICATIONS IN PHYSICS II', 'qtext/1744722179_MATHEMATICS II-CALCULUS WITH APPLICATIONS IN PHYSICS II.pdf', 2024, 0, 1, '2025-04-15 18:33:00'),
(264, 'B.Sc Mathematics', '2', 'MATHEMATICS -II-INTEGRATION AND VECTORS ', 'qtext/1744722207_MATHEMATICS -II-INTEGRATION AND VECTORS .pdf', 2022, 0, 1, '2025-04-15 18:33:29'),
(265, 'B.Sc Physics', '2', 'Heat and ThermoDynamics 2020', 'qtext/1744722475_Heat and ThermoDynamics 2020.pdf', 2022, 0, 1, '2025-04-15 18:37:56'),
(266, 'B.Sc Physics', '2', 'Heat and ThermoDynamics 2019', 'qtext/1744722476_Heat and ThermoDynamics 2019.pdf', 2022, 0, 1, '2025-04-15 18:37:58'),
(267, 'B.Sc Physics', '2', 'THERMAL PHYSICS AND STATISTICAL MECHANICS (18-19 Admission)', 'qtext/1744722478_THERMAL PHYSICS AND STATISTICAL MECHANICS (18-19 Admission).pdf', 2022, 0, 1, '2025-04-15 18:37:58'),
(268, 'B.Sc Physics', '2', 'THERMAL PHYSICS AND STATISTICAL MECHANICS (2020 Admission)', 'qtext/1744722478_THERMAL PHYSICS AND STATISTICAL MECHANICS (2020 Admission).pdf', 2022, 0, 1, '2025-04-15 18:37:59'),
(269, 'B.Sc Zoology', '2', 'Animal Diversity 2', 'qtext/1744722542_ANIMAL DIVERSITY II.pdf', 2022, 0, 1, '2025-04-15 18:39:02'),
(270, 'B.Sc Botany', '2', 'BIOMOLECULES ', 'qtext/1744722767_BIOMOLECULES .pdf', 2022, 0, 1, '2025-04-15 18:42:48'),
(271, 'B.Sc Botany', '2', 'BioPhysics and Instrumentation', 'qtext/1744722768_BioPhysics and Instrumentation.pdf', 2022, 0, 1, '2025-04-15 18:42:49'),
(272, 'B.Sc Botany', '2', 'BioPhysics and Instrumentation 2019', 'qtext/1744722769_BioPhysics and Instrumentation 2019.pdf', 2022, 0, 1, '2025-04-15 18:42:50'),
(273, 'B.Sc Botany', '2', 'ENVIRONMENTAL STUDIES 2020', 'qtext/1744722770_ENVIRONMENTAL STUDIES 2020.pdf', 2022, 0, 1, '2025-04-15 18:42:50'),
(274, 'B.Sc Botany', '2', 'ENVIRONMENTAL STUDIES S2', 'qtext/1744722770_ENVIRONMENTAL STUDIES S2.pdf', 2022, 0, 1, '2025-04-15 18:42:51'),
(275, 'B.Sc Botany', '2', 'GENERAL BIOCHEMISTRY ', 'qtext/1744722771_GENERAL BIOCHEMISTRY .pdf', 2022, 0, 1, '2025-04-15 18:42:51'),
(276, 'B.Com', '2', 'BUSINESS MATHEMATICS (2020 Admission)', 'qtext/1744725155_BUSINESS MATHEMATICS (2020 Admission).pdf', 2022, 0, 1, '2025-04-15 19:22:36'),
(277, 'B.Com', '2', 'BUSINESS REGULATORY FRAMEWORK ', 'qtext/1744725156_BUSINESS REGULATORY FRAMEWORK .pdf', 2022, 0, 1, '2025-04-15 19:22:37'),
(278, 'B.Com', '2', 'informatics and cyber laws', 'qtext/1744725157_informatics and cyber laws.pdf', 2022, 0, 1, '2025-04-15 19:22:38'),
(279, 'B.Com', '2', 'FINANCIAL ACCOUNTING ', 'qtext/1744725158_FINANCIAL ACCOUNTING .pdf', 2022, 0, 1, '2025-04-15 19:22:40'),
(280, 'B.Sc Botany', '3', 'ANIMAL PHYSIOLOGY AND ANATOMY (2013 - 2018 Admission)', 'qtext/1744725818_ANIMAL PHYSIOLOGY AND ANATOMY (2013 - 2018 Admission).pdf', 2023, 0, 1, '2025-04-15 19:33:38'),
(281, 'B.Sc Botany', '3', 'ANIMAL PHYSIOLOGY AND ANATOMY ', 'qtext/1744725818_ANIMAL PHYSIOLOGY AND ANATOMY .pdf', 2023, 0, 1, '2025-04-15 19:33:39'),
(282, 'B.Sc Botany', '3', 'BB 1331   PHYSIOLOGICAL ASPECTS IN BIOCHEMISTRY (2014-2018 Admission)', 'qtext/1744725819_BB 1331   PHYSIOLOGICAL ASPECTS IN BIOCHEMISTRY (2014-2018 Admission).pdf', 2023, 0, 1, '2025-04-15 19:33:39'),
(283, 'B.Sc Botany', '3', 'BB1331   PHYSIOLOGICAL ASPECTS IN BIOCHEMISTRY (2019 Admission)', 'qtext/1744725819_BB1331   PHYSIOLOGICAL ASPECTS IN BIOCHEMISTRY (2019 Admission).pdf', 2023, 0, 1, '2025-04-15 19:33:40'),
(284, 'B.Sc Botany', '3', 'BB1331-PHYSIOLOGY AND NUTRITION (2020 Admission onwards)', 'qtext/1744726321_BB1331-PHYSIOLOGY AND NUTRITION (2020 Admission onwards).pdf', 2023, 0, 1, '2025-04-15 19:42:01'),
(285, 'B.Sc Botany', '3', 'BO 1341 - MICROBIOLOGY, PHYCOLOGY, MYCOLOGY, LICHENOLOGY AND PLANT PATHOLOGY (2019 Admission onwards)', 'qtext/1744726321_BO 1341 - MICROBIOLOGY, PHYCOLOGY, MYCOLOGY, LICHENOLOGY AND PLANT PATHOLOGY (2019 Admission onwards).pdf', 2023, 0, 1, '2025-04-15 19:42:02'),
(286, 'B.Sc Botany', '3', 'BRYOLOGY, PTERIDOLOGY, GYMNOSPERMS AND PALEOBOTANY (2015-2018 Admission)', 'qtext/1744726322_BRYOLOGY, PTERIDOLOGY, GYMNOSPERMS AND PALEOBOTANY (2015-2018 Admission).pdf', 2023, 0, 1, '2025-04-15 19:42:02'),
(287, 'B.Sc Chemistry', '3', 'CH 1331.3   PHYSICAL CHEMISTRY (2017 - 2018 Admission)', 'qtext/1744726429_CH 1331.3   PHYSICAL CHEMISTRY (2017 - 2018 Admission).pdf', 2023, 0, 1, '2025-04-15 19:43:49'),
(288, 'B.Sc Chemistry', '3', 'CH 1331.3 - PHYSICAL CHEMISTRY (2019 Admission)', 'qtext/1744726429_CH 1331.3 - PHYSICAL CHEMISTRY (2019 Admission).pdf', 2023, 0, 1, '2025-04-15 19:43:50'),
(289, 'B.Sc Chemistry', '3', 'CH 1331.4   ORGANIC CHEMISTRY (2017 - 2018 Admission)', 'qtext/1744726430_CH 1331.4   ORGANIC CHEMISTRY (2017 - 2018 Admission).pdf', 2023, 0, 1, '2025-04-15 19:43:50'),
(290, 'B.Sc Chemistry', '3', 'CH 1331.4   ORGANIC CHEMISTRY (2020 Admission onwards)', 'qtext/1744726430_CH 1331.4   ORGANIC CHEMISTRY (2020 Admission onwards).pdf', 2023, 0, 1, '2025-04-15 19:43:51'),
(291, 'B.Sc Physics', '3', 'ELECTRODYNAMICS ', 'qtext/1744726470_ELECTRODYNAMICS .pdf', 2023, 0, 1, '2025-04-15 19:44:31'),
(292, 'B.Sc Mathematics', '3', 'ELEMENTARY NUMBER THEORY AND CALCULUS - I (2019 Admission Onwards)', 'qtext/1744726511_ELEMENTARY NUMBER THEORY AND CALCULUS - I (2019 Admission Onwards).pdf', 2023, 0, 1, '2025-04-15 19:45:12'),
(293, 'B.Sc Zoology', '3', 'EXPERIMENTAL ZOOLOGY, INSTRUMENTATION BIOSTATISTICS AND BIOINFORMATICS', 'qtext/1744726578_EXPERIMENTAL ZOOLOGY, INSTRUMENTATION BIOSTATISTICS AND BIOINFORMATICS.pdf', 2023, 0, 1, '2025-04-15 19:46:18'),
(294, 'B.Sc Zoology', '3', 'FUNCTIONAL ZOOLOGY (2019 Admission onwards)', 'qtext/1744726578_FUNCTIONAL ZOOLOGY (2019 Admission onwards).pdf', 2023, 0, 1, '2025-04-15 19:46:19'),
(295, 'B.Sc Botany', '3', 'HORTICULTURE, MUSHROOM CULTIVATION AND MARKETING (2019 Admission onwards)', 'qtext/1744727553_HORTICULTURE, MUSHROOM CULTIVATION AND MARKETING (2019 Admission onwards).pdf', 2023, 0, 1, '2025-04-15 20:02:33'),
(296, 'B.Sc Chemistry', '3', 'INORGANIC CHEMISTRY II ', 'qtext/1744727576_INORGANIC CHEMISTRY II .pdf', 2023, 0, 1, '2025-04-15 20:02:56'),
(297, 'B.Sc Mathematics', '3', 'MATHEMATICS III - CALCULUS AND LINEAR ALGEBRA (2018 Admission)', 'qtext/1744727694_MATHEMATICS III - CALCULUS AND LINEAR ALGEBRA (2018 Admission).pdf', 2023, 0, 1, '2025-04-15 20:04:55'),
(298, 'B.Sc Mathematics', '3', 'MATHEMATICS III - CALCULUS AND LINEAR ALGEBRA (2019 - 2020 Admission)', 'qtext/1744727695_MATHEMATICS III - CALCULUS AND LINEAR ALGEBRA (2019 - 2020 Admission).pdf', 2023, 0, 1, '2025-04-15 20:04:55'),
(299, 'B.Sc Mathematics', '3', 'MATHEMATICS III - LINEAR ALGEBRA, PROBABILITY THEORY AND NUMERICAL SOLUTIONS (2021 Admission)', 'qtext/1744727695_MATHEMATICS III - LINEAR ALGEBRA, PROBABILITY THEORY AND NUMERICAL SOLUTIONS (2021 Admission).pdf', 2023, 0, 1, '2025-04-15 20:04:56'),
(300, 'B.Sc Mathematics', '3', 'MATHEMATICS III - LINEAR ALGEBRA, SPECIAL FUNCTIONS AND CALCULUS (2021 Admission)', 'qtext/1744727696_MATHEMATICS III - LINEAR ALGEBRA, SPECIAL FUNCTIONS AND CALCULUS (2021 Admission).pdf', 2023, 0, 1, '2025-04-15 20:04:57'),
(301, 'B.Sc Zoology', '3', 'METHODOLOGY AND PERSPECTIVES OF ZOOLOGY (2015-2018 Admission)', 'qtext/1744727740_METHODOLOGY AND PERSPECTIVES OF ZOOLOGY (2015-2018 Admission).pdf', 2023, 0, 1, '2025-04-15 20:05:40'),
(302, 'B.Sc Mathematics', '3', 'MM 1331.2 - Mathematics III   LINEAR ALGEBRA, PROBABILITY THEORY AND NUMERICAL METHODS (2019 - 2020 Admission)', 'qtext/1744727834_MM 1331.2 - Mathematics III   LINEAR ALGEBRA, PROBABILITY THEORY AND NUMERICAL METHODS (2019 - 2020 Admission).pdf', 2023, 0, 1, '2025-04-15 20:07:14'),
(303, 'B.Sc Mathematics', '3', 'MM 1341   ELEMENTARY NUMBER THEORY AND CALCULUS - I (2018 Admission)', 'qtext/1744727834_MM 1341   ELEMENTARY NUMBER THEORY AND CALCULUS - I (2018 Admission).pdf', 2023, 0, 1, '2025-04-15 20:07:15'),
(304, 'B.Sc Mathematics', '3', 'MM 1341 - ALGEBRA AND CALCULUS - I (2014 - 2017 Admission)', 'qtext/1744727835_MM 1341 - ALGEBRA AND CALCULUS - I (2014 - 2017 Admission).pdf', 2023, 0, 1, '2025-04-15 20:07:16'),
(305, 'B.Sc Physics', '3', 'OPTICS, MAGNETISM AND ELECTRICITY (2018 Admission)', 'qtext/1744727959_OPTICS, MAGNETISM AND ELECTRICITY (2018 Admission).pdf', 2023, 0, 1, '2025-04-15 20:09:19'),
(306, 'B.Sc Physics', '3', 'OPTICS, MAGNETISM AND ELECTRICITY (2019 Admission Onwards)', 'qtext/1744727959_OPTICS, MAGNETISM AND ELECTRICITY (2019 Admission Onwards).pdf', 2023, 0, 1, '2025-04-15 20:09:20'),
(307, 'B.Sc Physics', '3', 'PHYSICAL CHEMISTRY (2020 Admission Onwards) ', 'qtext/1744727960_PHYSICAL CHEMISTRY (2020 Admission Onwards) (1).pdf', 2023, 0, 1, '2025-04-15 20:09:21'),
(308, 'B.Sc Physics', '3', 'PHYSICAL CHEMISTRY II (2017 & 2018 Admission)', 'qtext/1744727961_PHYSICAL CHEMISTRY II (2019 Admission).pdf', 2023, 0, 1, '2025-04-15 20:09:21'),
(309, 'B.Sc Mathematics', '3', 'PROBABILITY DISTRIBUTIONS AND THEORY OF ESTIMATION (2014-2017 Admission)', 'qtext/1744728092_PROBABILITY DISTRIBUTIONS AND THEORY OF ESTIMATION (2014-2017 Admission).pdf', 2023, 0, 1, '2025-04-15 20:11:33'),
(310, 'B.Sc Mathematics', '3', 'STATISTICAL DISTRIBUTIONS (2019 Admission onwards)', 'qtext/1744728093_STATISTICAL DISTRIBUTIONS (2019 Admission onwards).pdf', 2023, 0, 1, '2025-04-15 20:11:34'),
(311, 'B.Sc Mathematics', '3', 'STATISTICAL DISTRIBUTIONS', 'qtext/1744728094_STATISTICAL DISTRIBUTIONS.pdf', 2023, 0, 1, '2025-04-15 20:11:34'),
(312, 'B.Sc Botany', '3', 'PROTISTA & ANIMAL DIVERSITY 2019 Admission ', 'qtext/1744728166_PROTISTA & ANIMAL DIVERSITY 2019 Admission .pdf', 2023, 0, 1, '2025-04-15 20:12:47'),
(313, 'B.Sc Botany', '3', 'SYSTEMATIC BOTANY, ECONOMIC BOTANY, ETHNOBOTANY, PLANT BREEDING (2014-2018 Admission)', 'qtext/1744728167_SYSTEMATIC BOTANY, ECONOMIC BOTANY, ETHNOBOTANY, PLANT BREEDING (2014-2018 Admission).pdf', 2023, 0, 1, '2025-04-15 20:12:47'),
(314, 'B.Sc Botany', '3', 'SYSTEMATIC BOTANY,ECONOMIC BOTANY,ETHNOBOTANY,PLANT BREEDING ', 'qtext/1744728167_SYSTEMATIC BOTANY,ECONOMIC BOTANY,ETHNOBOTANY,PLANT BREEDING .pdf', 2023, 0, 1, '2025-04-15 20:12:48'),
(315, 'B.Sc Botany', '4', 'Bryology,pteridolgy,gynosperms and paleobotany 2022', 'qtext/1744728662_Bryology,pteridolgy,gynosperms and paleobotany 2022.pdf', 2022, 0, 1, '2025-04-15 20:21:03'),
(316, 'B.Sc Botany', '4', 'Bryology,pteridolgy,gynosperms and paleobotany', 'qtext/1744728663_Bryology,pteridolgy,gynosperms and paleobotany.pdf', 2022, 0, 1, '2025-04-15 20:21:04'),
(317, 'B.Sc Botany', '4', 'organic chemistry', 'qtext/1744728664_organic chemistry.pdf', 2022, 0, 1, '2025-04-15 20:21:05'),
(318, 'B.Sc Botany', '4', 'plant physiology complementary', 'qtext/1744728665_plant physiology complementary.pdf', 2022, 0, 1, '2025-04-15 20:21:06'),
(319, 'B.Sc Botany', '4', 'Plant Physiology, plant ecology, horticulture and plant biotechnology', 'qtext/1744728666_Plant Physiology, plant ecology, horticulture and plant biotechnology.pdf', 2022, 0, 1, '2025-04-15 20:21:07'),
(320, 'B.Sc Botany', '4', 'horticulture mushroom', 'qtext/1744728747_horticulture mushroom.pdf', 2022, 0, 1, '2025-04-15 20:22:28'),
(321, 'B.Sc Botany', '4', 'immunology', 'qtext/1744728748_immunology.pdf', 2022, 0, 1, '2025-04-15 20:22:29'),
(322, 'B.Sc Botany', '4', 'immunology 2018', 'qtext/1744728749_immunology(1).pdf', 2022, 0, 1, '2025-04-15 20:22:30'),
(323, 'B.Sc Chemistry', '4', 'Oragnic chemistry 2016', 'qtext/1744728962_Oragnic chemistry 2016.pdf', 2022, 0, 1, '2025-04-15 20:26:03'),
(324, 'B.Sc Chemistry', '4', 'Oragnic chemistry 2018', 'qtext/1744728963_Oragnic chemistry 2018.pdf', 2022, 0, 1, '2025-04-15 20:26:04'),
(325, 'B.Sc Chemistry', '4', 'Oragnic chemistry 2019', 'qtext/1744728964_Oragnic chemistry 2019.pdf', 2022, 0, 1, '2025-04-15 20:26:05'),
(326, 'B.Sc Chemistry', '4', 'organic chemistry 2020', 'qtext/1744728965_organic chemistry 2020.pdf', 2022, 0, 1, '2025-04-15 20:26:06'),
(327, 'B.Sc Chemistry', '4', 'physics', 'qtext/1744728966_physics.pdf', 2022, 0, 1, '2025-04-15 20:26:07'),
(328, 'B.Sc Mathematics', '4', 'Elementary Number theory and calculus 2', 'qtext/1744729019_Elementary Number theory and calculus 2.pdf', 2022, 0, 1, '2025-04-15 20:27:00'),
(329, 'B.Sc Physics', '4', 'Classical and relativistic Mechanics', 'qtext/1744729068_Classical and relativistic Mechanics.pdf', 2022, 0, 1, '2025-04-15 20:27:50'),
(330, 'B.Sc Zoology', '4', 'Physicalchemistry', 'qtext/1744729229_Physicalchemistry.pdf', 2022, 0, 1, '2025-04-15 20:30:30'),
(331, 'B.Sc Zoology', '4', 'Cell Biology', 'qtext/1744729230_Cell Biology.pdf', 2022, 0, 1, '2025-04-15 20:30:31'),
(332, 'B.Sc Zoology', '4', 'physical chem 2019adm', 'qtext/1744729231_physical chem 2019adm.pdf', 2022, 0, 1, '2025-04-15 20:30:33'),
(333, 'B.Sc Zoology', '4', 'physical chemistry 2020 adm', 'qtext/1744729233_physical chemistry 2020 adm.pdf', 2022, 0, 1, '2025-04-15 20:30:34'),
(334, 'B.Sc Botany', '5', 'Angiosperm Morphology ', 'qtext/1744729423_Angiosperm Morphology .pdf', 2022, 0, 1, '2025-04-15 20:33:44'),
(335, 'B.Sc Botany', '5', 'Angiosperm morphology 2019adm', 'qtext/1744729424_Angiosperm morphology  2019adm.pdf', 2022, 0, 1, '2025-04-15 20:33:44'),
(336, 'B.Sc Botany', '5', 'Angiosperm morphology 2018adm', 'qtext/1744729424_Angiosperm morphology 2018adm.pdf', 2022, 0, 1, '2025-04-15 20:33:45'),
(337, 'B.Sc Botany', '5', 'Animal Biotechnology ', 'qtext/1744729425_Animal Biotechnology .pdf', 2022, 0, 1, '2025-04-15 20:33:47'),
(338, 'B.Sc Botany', '5', 'PLANT BIOTECHNOLOGY', 'qtext/1744729427_PLANT BIOTECHNOLOGY.pdf', 2022, 0, 1, '2025-04-15 20:33:48'),
(339, 'B.Sc Chemistry', '5', 'Physical Chemistry 1 2019', 'qtext/1744729509_Physical Chemistry 1 2019.pdf', 2022, 0, 1, '2025-04-15 20:35:10'),
(340, 'B.Sc Chemistry', '5', 'Physical Chem’s_ 2020', 'qtext/1744729510_Physical Chem’s_ 2020.pdf', 2022, 0, 1, '2025-04-15 20:35:11'),
(341, 'B.Sc Mathematics', '5', 'DIFFERENTIAL EQUATIONS', 'qtext/1744729583_DIFFERENTIAL EQUATIONS.pdf', 2022, 0, 1, '2025-04-15 20:36:23'),
(342, 'B.Sc Mathematics', '5', 'Real analysis 1', 'qtext/1744729583_Real analysis 1.pdf', 2022, 0, 1, '2025-04-15 20:36:25'),
(343, 'B.Sc Mathematics', '5', 'Real Analysis', 'qtext/1744729585_Real Analysis.pdf', 2022, 0, 1, '2025-04-15 20:36:25'),
(344, 'B.Sc Mathematics', '5', 'VECTOR ANALYSIS', 'qtext/1744729585_VECTOR ANALYSIS.pdf', 2022, 0, 1, '2025-04-15 20:36:26'),
(345, 'B.Sc Physics', '5', 'ATOMIC AND MOLECULAR PHYSICS', 'qtext/1744729619_ATOMIC AND MOLECULAR PHYSICS.pdf', 2022, 0, 1, '2025-04-15 20:37:00'),
(346, 'B.Sc Physics', '5', 'Quantum Mechanics ', 'qtext/1744729620_Quantum Mechanics .pdf', 2022, 0, 1, '2025-04-15 20:37:01'),
(347, 'B.Sc Zoology', '5', 'Cell and molecular biology', 'qtext/1744729659_Cell and molecular biology.pdf', 2022, 0, 1, '2025-04-15 20:37:40'),
(348, 'B.Sc Zoology', '5', 'Genetics and biotechnology', 'qtext/1744729660_Genetics and biotechnology.pdf', 2022, 0, 1, '2025-04-15 20:37:41');
INSERT INTO `approved` (`approved_id`, `deg`, `sem`, `subj`, `qtext`, `qyear`, `q_id`, `university`, `updated_date`) VALUES
(349, 'B.Sc Botany', '6', 'N - 1356 horticulture', 'qtext/1744729726_N - 1356 horticulture.pdf', 2022, 0, 1, '2025-04-15 20:38:47'),
(350, 'B.Sc Chemistry', '6', 'physical chem III 2019', 'qtext/1744729890_physical chem III 2019.pdf', 2022, 0, 1, '2025-04-15 20:41:31'),
(351, 'B.Sc Chemistry', '6', 'physical chem III 2017', 'qtext/1744729891_physical chemistry III(1) 2017.pdf', 2022, 0, 1, '2025-04-15 20:41:32'),
(352, 'B.Sc Mathematics', '6', 'complex analysis II', 'qtext/1744729929_complex analysis II.pdf', 2022, 0, 1, '2025-04-15 20:42:10'),
(353, 'B.Sc Physics', '6', 'nanoscience', 'qtext/1744729976_nanoscience.pdf', 2022, 0, 1, '2025-04-15 20:42:57'),
(354, 'B.Sc Physics', '6', 'optics', 'qtext/1744729977_optics.pdf', 2022, 0, 1, '2025-04-15 20:42:58'),
(355, 'B.Sc Zoology', '6', 'Ecology, Ethology', 'qtext/1744730008_Ecology, Ethology.pdf', 2022, 0, 1, '2025-04-15 20:43:28'),
(356, 'BA English', '6', 'American Literature', 'qtext/American Literature.pdf', 2024, 40, 1, '2025-04-16 09:44:14'),
(357, 'BA English', '6', 'American Literature', 'qtext/American Literature 2020.pdf', 2024, 41, 1, '2025-04-16 10:16:48'),
(358, 'BA English', '3', 'world literature', 'qtext/World literature.pdf', 2024, 44, 1, '2025-04-16 19:50:08'),
(359, 'B.Sc Physics', '6', 'Classical and Modern Optics 2019 adm', 'qtext/Classical and Modern Optics 2019 adm.pdf', 2023, 49, 1, '2025-04-18 18:44:48'),
(360, 'B.Com', '3', 'Income Tax', 'qtext/S3 Income tax qp.pdf', 2022, 0, 1, '2025-04-18 20:00:28'),
(361, 'MCom', '1', 'Research Methodology 2017 adm1st Sem', 'qtext/1744987012_Research Methodology 2017 adm1st Sem.pdf', 2020, 0, 1, '2025-04-18 20:06:56'),
(362, 'MCom', '1', 'Bussiness Ethics and Corporate gov 1st sem 2021', 'qtext/1744987016_Bussiness Ethics and Corporate gov 1st sem 2021.pdf', 2020, 0, 1, '2025-04-18 20:06:59'),
(363, 'MCom', '1', 'Legal frameworks', 'qtext/1744987322_Legal Frameworks Sem1.pdf', 2020, 0, 1, '2025-04-18 20:12:03'),
(364, 'MCom', '1', 'Planning and Development administration', 'qtext/1744987323_Planning and Development administration.pdf', 2020, 0, 1, '2025-04-18 20:12:04'),
(365, 'MCom', '1', 'Advanced Corporate Accounting and reporting', 'qtext/1744987324_Advanced Corporate Accounting and reporting2.pdf', 2020, 0, 1, '2025-04-18 20:12:06'),
(366, 'MCom', '4', 'Accounting Standard 2020', 'qtext/1744987670_Accounting Standard 2020.pdf', 2022, 0, 1, '2025-04-18 20:17:50'),
(367, 'MCom', '4', 'Accounting Standard 2020', 'qtext/1744987670_Accounting Standard 2021 (1).pdf', 2022, 0, 1, '2025-04-18 20:17:50'),
(368, 'MCom', '4', 'Management Optimization 2020 Mcom 4th Sem QP', 'qtext/1744987670_Management Optimization 2020 Mcom 4th Sem QP.pdf', 2022, 0, 1, '2025-04-18 20:17:52'),
(369, 'MCom', '3', 'Security Analysis and portfolio Management', 'qtext/1744987770_Security Analysis and portfolio Management 2021 Mcom 3rd Sem QP.pdf', 2021, 0, 1, '2025-04-18 20:19:33'),
(370, 'MCom', '4', 'Risk management and derivatives', 'qtext/1744987892_Risk management and derivatives 4 th sem.pdf', 2022, 0, 1, '2025-04-18 20:21:32'),
(371, 'MCom', '4', 'GST AND CUSTOM DUTY ', 'qtext/1744988282_GST AND CUSTOM DUTY 2021 Mcom 4th Sem QP.pdf', 2021, 0, 1, '2025-04-18 20:28:03'),
(372, 'MCom', '4', 'Accounting Standard 2020', 'qtext/1744988431_Accounting Standard 2022.pdf', 2022, 0, 1, '2025-04-18 20:30:31'),
(373, 'MCom', '2', 'Quantitative Techniques', 'qtext/1744988927_Quantitative Techniques Special.pdf', 2022, 0, 1, '2025-04-18 20:38:47'),
(374, 'MCom', '2', 'Investment Management 2022', 'qtext/1744988927_Investment Management 2022.pdf', 2022, 0, 1, '2025-04-18 20:38:51'),
(375, 'MCom', '1', 'legal framework  2021', 'qtext/1744989030_legal framework  2021.pdf', 2021, 0, 1, '2025-04-18 20:40:32'),
(376, 'MCom', '1', 'S1 All 2021', 'qtext/1744989136_S1 All 2021.pdf', 2021, 0, 1, '2025-04-18 20:42:19'),
(377, 'MCom', '1', 'S1 All 2021', 'qtext/1744989143_S1 All 2021.pdf', 2021, 0, 1, '2025-04-18 20:42:26'),
(378, 'MCom', '3', 'Income tax planning and management ', 'qtext/1744989549_Income tax planning and management s3 itpm 2023.pdf', 2023, 0, 1, '2025-04-18 20:49:09'),
(379, 'MCom', '3', 'Income tax planning and management ', 'qtext/1745072305_Income tax planning and management s3 itpm 2023.pdf', 2023, 0, 1, '2025-04-19 19:48:25'),
(380, 'B.Sc Physics', '6', 'optics 2023', 'qtext/OPTICS 2023.pdf', 2023, 50, 1, '2025-04-21 13:39:05'),
(381, 'MCom', '4', 'accounting standards 2024', 'qtext/1745226588_accounting standards 2024.pdf', 2024, 0, 1, '2025-04-21 14:39:48'),
(382, 'MCom', '4', 'management Optimization 2024', 'qtext/1745226588_management Optimization 2024.pdf', 2024, 0, 1, '2025-04-21 14:39:48'),
(383, 'MCom', '2', ' S2 Strategic Management  2019', 'qtext/1745226728_S2 Strategic Management  2019.pdf', 2020, 0, 1, '2025-04-21 14:42:08'),
(384, 'MCom', '4', 'risk management 2024', 'qtext/1745226754_risk management 2024.pdf', 2024, 0, 1, '2025-04-21 14:42:34'),
(385, 'MCom', '4', 'Management and Optimization Techniques all', 'qtext/1745226904_Management and Optimization Techniques all.pdf', 2022, 0, 1, '2025-04-21 14:45:05'),
(386, 'MCom', '3', 'Income tax planning and management', 'qtext/1745227143_Income tax planning and management.pdf', 2022, 0, 1, '2025-04-21 14:49:03'),
(387, 'MCom', '1', 'Research Methodology 2022', 'qtext/1745227221_Research Methodology 2022.pdf', 2022, 0, 1, '2025-04-21 14:50:24'),
(388, 'MCom', '2', 's2 all', 'qtext/1745227313_S2 all.pdf', 2022, 0, 1, '2025-04-21 14:51:57'),
(389, 'BA English', '6', 'Gender Studies 2025', 'qtext/Gender Studies 2025.pdf', 2025, 55, 1, '2025-04-22 19:31:11'),
(390, 'BA English', '6', 'film studies', 'qtext/Film Studies 2025.pdf', 2025, 56, 1, '2025-04-22 19:32:38'),
(391, 'BA English', '6', 'indian writings in English 2025', 'qtext/indian writings in English 2025.pdf', 2025, 57, 1, '2025-04-22 19:33:47'),
(392, 'BA Hindi', '6', 'anuvad thatha prayog', 'qtext/Anuvad 2024.pdf', 2024, 54, 1, '2025-04-22 19:35:52'),
(393, 'BA Hindi', '6', 'anuvad thatha prayog', 'qtext/anuvad 2023.pdf', 2023, 53, 1, '2025-04-22 19:36:48'),
(395, 'BA Malayalam', '1', 'Gadhyasahithyam', 'qtext/1745398171_Gadhyasahithyam ML 1111.3 H-2165.pdf', 2019, 0, 1, '2025-04-23 14:19:33'),
(396, 'BA Malayalam', '1', 'Introduction to Mass Communication', 'qtext/1745398282_Introduction to Mass Communication MX 1171 H-2191.pdf', 2020, 0, 1, '2025-04-23 14:21:23'),
(397, 'BA Malayalam', '1', 'Kerala Samskaram Bhagam ', 'qtext/1745398283_Kerala Samskaram Bhagam I MX 1141 H-2189.pdf', 2020, 0, 1, '2025-04-23 14:21:25'),
(398, 'BA Malayalam', '1', 'Language Skills', 'qtext/1745398285_Language Skills EN 1111.1 H-2027.pdf', 2020, 0, 1, '2025-04-23 14:21:26'),
(399, 'BA Malayalam', '1', 'Novalum Cherukathayum ', 'qtext/1745400955_Novalum Cherukathayum MX 1142 H-2210.pdf', 2020, 0, 1, '2025-04-23 15:05:56'),
(400, 'BA Malayalam', '1', 'Sargathmaka Rachana', 'qtext/1745400956_Sargathmaka Rachana MX 1121 H-2208.pdf', 2020, 0, 1, '2025-04-23 15:05:58'),
(401, 'BA Malayalam', '1', 'Vivarthanam- Aamughavum Charithravum ', 'qtext/1745400958_Vivarthanam- Aamughavum Charithravum MX 1131 H-2192.pdf', 2020, 0, 1, '2025-04-23 15:06:00'),
(402, 'BA Malayalam', '2', 'Malayalam and Mass Communication', 'qtext/1745401758_Malayalam and Mass Communication MX 1241 T-3399.pdf', 2020, 0, 1, '2025-04-23 15:19:19'),
(403, 'BA Malayalam', '2', 'Vivarthana Padanavum Samskaravum  03', 'qtext/1745401759_Vivarthana Padanavum Samskaravum MX 1231 T-3403.pdf', 2020, 0, 1, '2025-04-23 15:19:20'),
(404, 'BA Malayalam', '2', 'Vivarthana Padanavum Samskaravum  02', 'qtext/1745401760_Vivarthana Padanavum Samskaravum MX 1231 T-3402.pdf', 2020, 0, 1, '2025-04-23 15:19:20'),
(405, 'BA Malayalam', '2', 'Paristhithi Sidhanthavum Avishkaravum ', 'qtext/1745401760_Paristhithi Sidhanthavum Avishkaravum MX 1241 T-3398.pdf', 2020, 0, 1, '2025-04-23 15:19:21'),
(406, 'BA Malayalam', '2', 'Malayalam Journalism MX 1271 T-3406', 'qtext/1745401761_Malayalam Journalism MX 1271 T-3406.pdf', 2020, 0, 1, '2025-04-23 15:19:21'),
(407, 'BA Malayalam', '2', 'Malayalam Journalism MX 1271 T-3405', 'qtext/1745401761_Malayalam Journalism MX 1271 T-3405.pdf', 2020, 0, 1, '2025-04-23 15:19:22'),
(408, 'BA Malayalam', '3', 'Malayala Kavitha Poorvakhatam', 'qtext/1745402372_Malayala Kavitha Poorvakhatam MX1341 S-3576.pdf', 2020, 0, 1, '2025-04-23 15:29:34'),
(409, 'BA Malayalam', '3', 'Editing', 'qtext/1745402374_Editing MX 1372 S-3591.pdf', 2020, 0, 1, '2025-04-23 15:29:36'),
(410, 'BA Malayalam', '3', 'Adhunika Kavitha', 'qtext/1745402376_Adhunika Kavitha MX 1341 S-3577.pdf', 2020, 0, 1, '2025-04-23 15:29:38'),
(411, 'BA Malayalam', '3', 'Vivarasankethika Vidhyayum Malayala Bhasha Padanavum', 'qtext/1745402474_Vivarasankethika Vidhyayum Malayala Bhasha Padanavum MX 1321 S-3572.pdf', 2020, 0, 1, '2025-04-23 15:31:15'),
(412, 'BA Malayalam', '3', 'Reporting MX 1371 S-3587', 'qtext/1745402475_Reporting MX 1371 S-3587.pdf', 2020, 0, 1, '2025-04-23 15:31:16'),
(413, 'BA Malayalam', '3', 'Reporting MX 1371 S-3588', 'qtext/1745402476_Reporting MX 1371 S-3588.pdf', 2020, 0, 1, '2025-04-23 15:31:17'),
(414, 'BA Malayalam', '4', 'Corporate Communication and Media Management ', 'qtext/1745402747_Corporate Communication and Media Management MX 1472 T-2684.pdf', 2020, 0, 1, '2025-04-23 15:35:49'),
(415, 'BA Malayalam', '4', 'Advertising', 'qtext/1745402749_Advertising MX 1471 T-2689.pdf', 2020, 0, 1, '2025-04-23 15:35:50'),
(416, 'BA Malayalam', '4', 'Madhyamannahara Vivarthanam 87', 'qtext/1745402750_Madhyamannahara Vivarthanam MX 1431 T-2687.pdf', 2020, 0, 1, '2025-04-23 15:35:52'),
(417, 'BA Malayalam', '4', 'Madhyamannahara Vivarthanam 90', 'qtext/1745402752_Madhyamanandhara Vivarthanam MX 1431 T-2690.pdf', 2020, 0, 1, '2025-04-23 15:35:53'),
(418, 'BA Malayalam', '4', 'Malayalasahithya Niroopanam', 'qtext/1745402806_Malayalasahithya Niroopanam MX 1441 T-2686.pdf', 2024, 0, 1, '2025-04-23 15:36:48'),
(419, 'BA Malayalam', '4', 'Niroopana Sahithyam', 'qtext/1745402808_Niroopana Sahithyam MX 1441 T-2688.pdf', 2024, 0, 1, '2025-04-23 15:36:50'),
(420, 'BA Malayalam', '5', 'Bhasha Shasthram Bhasha Charithram ', 'qtext/1745403032_Bhasha Shasthram Bhasha Charithram MX 1543 S-1903.pdf', 2020, 0, 1, '2025-04-23 15:40:34'),
(421, 'BA Malayalam', '5', 'Bhasha Shasthram ', 'qtext/1745403034_Bhasha Shasthram MX 1543 S-1906.pdf', 2020, 0, 1, '2025-04-23 15:40:35'),
(422, 'BA Malayalam', '5', 'Introduction to Television Production 98', 'qtext/1745403035_Introduction to Television Production MX 1572 S-1898.pdf', 2020, 0, 1, '2025-04-23 15:40:37'),
(423, 'BA Malayalam', '5', 'Introduction to Television Production 08', 'qtext/1745403037_Introduction to Television Production MX 1572 S-1908.pdf', 2020, 0, 1, '2025-04-23 15:40:38'),
(424, 'BA Malayalam', '5', 'Kerala Padanam II', 'qtext/1745403038_Kerala Padanam II MX 1542 S-1905.pdf', 2020, 0, 1, '2025-04-23 15:40:40'),
(425, 'BA Malayalam', '5', 'Kerala Samskaram Bhagam 2', 'qtext/1745403120_Kerala Samskaram Bhagam 2 MX 1542 S-1902.pdf', 2020, 0, 1, '2025-04-23 15:42:02'),
(426, 'BA Malayalam', '5', 'Nadodivijnaneeyam', 'qtext/1745403122_Nadodivijnaneeyam MX 1541 S-1901.pdf', 2020, 0, 1, '2025-04-23 15:42:03'),
(427, 'BA Malayalam', '5', 'Nattarivu Padanam ', 'qtext/1745403123_Nattarivu Padanam MX 1541 S-1904.pdf', 2020, 0, 1, '2025-04-23 15:42:05'),
(428, 'BA Malayalam', '5', 'Radio Programme Production ', 'qtext/1745403125_Radio Programme Production MX 1571 S-1907.pdf', 2020, 0, 1, '2025-04-23 15:42:06'),
(429, 'BA Malayalam', '6', 'Adhunika Poorva Kavitha ', 'qtext/1745403372_Adhunika Poorva Kavitha MX 1641 T-1846.pdf', 2020, 0, 1, '2025-04-23 15:46:14'),
(430, 'BA Malayalam', '6', 'Chalachithra Padanam', 'qtext/1745403374_Chalachithra Padanam MX 1661.2 T-1844.pdf', 2020, 0, 1, '2025-04-23 15:46:16'),
(431, 'BA Malayalam', '6', 'Malayala Kavitha Utharakhattam ', 'qtext/1745403376_Malayala Kavitha Utharakhattam MX 1641 T-1838.pdf', 2020, 0, 1, '2025-04-23 15:46:18'),
(433, 'B.Sc Physics', '6', 'Space science ', 'qtext/Space science 2023.pdf', 2023, 60, 1, '2025-04-24 09:18:43'),
(434, 'BA English', '6', 'world classics', 'qtext/World Classics 2025.pdf', 2025, 62, 1, '2025-04-28 14:23:23'),
(435, 'BA English', '6', 'American Literature', 'qtext/American Literature 2025.pdf', 2025, 63, 1, '2025-04-28 14:23:58'),
(436, 'BTech Mechanical', '1', ' Engineering Chemistry', 'qtext/1745983132_cyt100-b.tech-s1-engineering-chemistry-2019-scheme-dec-2019.pdf', 2019, 0, 1, '2025-04-30 08:48:52'),
(437, 'BTech Mechanical', '1', 'Engineering Mechanics', 'qtext/1745983132_s1s2-me-engineering-mechanics-may-2019.pdf', 2019, 0, 1, '2025-04-30 08:48:52'),
(438, 'BTech Mechanical', '1', 'Life skill', 'qtext/1745983132_hun-101-b.tech-s1-life-skills-2019-scheme-dec-2019.pdf', 2019, 0, 1, '2025-04-30 08:48:52'),
(439, 'BTech Mechanical', '1', 'BCE and BME', 'qtext/1745983132_est-120-b.tech-s1-basics-of-civil-mechanical-engineering-2019-scheme-dec-2019.pdf', 2019, 0, 1, '2025-04-30 08:48:52'),
(440, 'BTech Mechanical', '1', 'Maths', 'qtext/1745983132_MAT101 Solved December 2019 Ktunotes.in.pdf', 2019, 0, 1, '2025-04-30 08:48:54'),
(441, 'BTech Mechanical', '1', 'Python', 'qtext/1745983134_EST102-QP AN-July  2021.pdf', 2019, 0, 1, '2025-04-30 08:48:55'),
(442, 'B.Sc Chemistry', '1', 'physics Rotational Dynamics', 'qtext/1746093882_physics Rotational Dynamics.pdf', 2024, 0, 1, '2025-05-01 15:34:43'),
(443, 'B.Sc Chemistry', '1', 'maths calculus', 'qtext/1746093883_maths calculus.pdf', 2024, 0, 1, '2025-05-01 15:34:45'),
(444, 'B.Sc Chemistry', '2', 'maths Integration differentiation', 'qtext/1746094127_maths Integration differentiation.pdf', 2022, 0, 1, '2025-05-01 15:38:48'),
(445, 'B.Sc Chemistry', '2', 'Thermal physics(1)', 'qtext/1746094128_Thermal physics(1).pdf', 2022, 0, 1, '2025-05-01 15:38:49'),
(446, 'B.Sc Chemistry', '5', 'inorganic chemistry III', 'qtext/1746094284_inorganic chemistry III.pdf', 2022, 0, 1, '2025-05-01 15:41:25'),
(447, 'B.Sc Chemistry', '5', 'organic chemistry II', 'qtext/1746094285_organic chemistry II.pdf', 2022, 0, 1, '2025-05-01 15:41:27'),
(448, 'B.Sc Chemistry', '5', 'physical chem II', 'qtext/1746094287_physical chem II.pdf', 2022, 0, 1, '2025-05-01 15:41:28'),
(449, 'B.Sc Chemistry', '6', 'Physical Chemistry 3', 'qtext/1746094690_Physical Chemistry 3 Chem.pdf', 2022, 0, 1, '2025-05-01 15:48:11'),
(450, 'B.Sc Chemistry', '6', 'Polymer Chemistry', 'qtext/1746094691_Polymer Chemistry.pdf', 2022, 0, 1, '2025-05-01 15:48:11'),
(451, 'B.Sc Chemistry', '6', 'physical chemistry III', 'qtext/1746094691_physical chemistry III.pdf', 2022, 0, 1, '2025-05-01 15:48:11'),
(452, 'B.Sc Chemistry', '6', 'physical chemistry II regular', 'qtext/1746094691_physical chemistry II regular.pdf', 2022, 0, 1, '2025-05-01 15:48:13'),
(453, 'B.Sc Chemistry', '6', 'organic chemistry III ', 'qtext/1746094693_physical chemistry II regular.pdf', 2022, 0, 1, '2025-05-01 15:48:15'),
(454, 'B.Sc Chemistry', '6', 'organic chemistry II imp', 'qtext/1746094695_organic chemistry II imp.pdf', 2022, 0, 1, '2025-05-01 15:48:15'),
(455, 'B.Sc Botany', '6', 'economic botany,ethno botany', 'qtext/1746095031_economic botany,ethno botany.pdf', 2022, 0, 1, '2025-05-01 15:53:51'),
(456, 'B.Sc Botany', '6', 'food and dairy biotech', 'qtext/1746095031_food and dairy biotech.pdf', 2022, 0, 1, '2025-05-01 15:53:52'),
(457, 'B.Sc Botany', '6', 'food and industrial biotech', 'qtext/1746095032_food and industrial biotech.pdf', 2022, 0, 1, '2025-05-01 15:53:52'),
(458, 'B.Sc Botany', '6', 'molecular biology ', 'qtext/1746095032_molecular biology regular.pdf', 2022, 0, 1, '2025-05-01 15:53:53'),
(459, 'B.Sc Botany', '6', 'molecular biology, general informatics', 'qtext/1746095033_molecular biology, general informatics.pdf', 2022, 0, 1, '2025-05-01 15:53:53'),
(460, 'B.Sc Botany', '6', 'plant physiology ', 'qtext/1746095033_plant physiology regular.pdf', 2022, 0, 1, '2025-05-01 15:53:54'),
(461, 'B.Sc Botany', '6', 'biotechnology and nano imp', 'qtext/1746095676_biotechnology and nano imp.pdf', 2022, 0, 1, '2025-05-01 16:04:36'),
(462, 'B.Sc Botany', '6', 'environmental biotech', 'qtext/1746095676_environmental biotech.pdf', 2022, 0, 1, '2025-05-01 16:04:37'),
(463, 'B.Sc Botany', '6', 'food and industrial biotech', 'qtext/1746095677_food and industrial biotech.pdf', 2022, 0, 1, '2025-05-01 16:04:37'),
(464, 'B.Sc Botany', '6', 'genetics ', 'qtext/1746095677_Genetics.pdf', 2022, 0, 1, '2025-05-01 16:04:37'),
(465, 'B.Sc Botany', '5', 'recombinant data imp', 'qtext/1746095891_recombinant data imp.pdf', 2023, 0, 1, '2025-05-01 16:08:12'),
(466, 'B.Sc Botany', '5', 'cell biology genetics', 'qtext/1746095892_cell biology genetics.pdf', 2023, 0, 1, '2025-05-01 16:08:13'),
(467, 'B.Sc Botany', '5', 'Cell Biology(1)', 'qtext/1746095893_Cell Biology(1).pdf', 2023, 0, 1, '2025-05-01 16:08:14'),
(468, 'B.Sc Botany', '5', 'environmental studies and phytogeography', 'qtext/1746095894_environmental studies and phytogeography.pdf', 2023, 0, 1, '2025-05-01 16:08:15'),
(469, 'B.Sc Physics', '1', 'Principles of chemistry', 'qtext/1746096247_Principles of chemistry.pdf', 2024, 0, 1, '2025-05-01 16:14:08'),
(470, 'B.Sc Physics', '1', 'electrodynamics', 'qtext/1746096248_electrodynamics.pdf', 2024, 0, 1, '2025-05-01 16:14:10'),
(471, 'B.Sc Physics', '1', 'thermodynamics and statistical physics', 'qtext/1746096250_thermodynamics and statistical physics.pdf', 2024, 0, 1, '2025-05-01 16:14:11'),
(472, 'B.Sc Physics', '4', 'Electrodynamics PY 1441 G-4075', 'qtext/1746096494_Electrodynamics PY 1441 G-4075.pdf', 2024, 0, 1, '2025-05-01 16:18:16'),
(473, 'B.Sc Physics', '4', 'Spectroscopy and material chemistry CH 1431.1 G-4093', 'qtext/1746096496_Spectroscopy and material chemistry CH 1431.1 G-4093.pdf', 2024, 0, 1, '2025-05-01 16:18:18'),
(474, 'B.Sc Physics', '4', 'Complex Analysis Fourier Series and Fourier Transforms MM 1431.1  G-4076', 'qtext/1746096498_Complex Analysis Fourier Series and Fourier Transforms MM 1431.1  G-4076.pdf', 2024, 0, 1, '2025-05-01 16:18:19'),
(475, 'B.Sc Mathematics', '4', 'Testing of Hypothesis theory and variance', 'qtext/1746099571_Testing of Hypothesis theory and variance.pdf', 2023, 0, 1, '2025-05-01 17:09:32'),
(476, 'B.Sc Mathematics', '4', 'Statistics', 'qtext/1746099572_J1220 Statistics.pdf', 2023, 0, 1, '2025-05-01 17:09:33'),
(477, 'B.Sc Mathematics', '4', 'Modern physics and electronics', 'qtext/1746099573_Modern physics and electronics.pdf', 2023, 0, 1, '2025-05-01 17:09:34'),
(478, 'B.Sc Mathematics', '4', 'Algebra and Calculus-II MM 1441  G-4073', 'qtext/1746099745_Algebra and Calculus-II MM 1441  G-4073.pdf', 2022, 0, 1, '2025-05-01 17:12:27'),
(479, 'B.Sc Mathematics', '5', 'abstract algebra imp', 'qtext/1746099847_abstract algebra imp.pdf', 2022, 0, 1, '2025-05-01 17:14:08'),
(480, 'B.Sc Mathematics', '5', 'K3229 Complex Analysis', 'qtext/1746099848_K3229 Complex Analysis.pdf', 2022, 0, 1, '2025-05-01 17:14:09'),
(481, 'B.Sc Mathematics', '5', 'K3231 Vector Analysis', 'qtext/1746099849_K3231 Vector Analysis.pdf', 2022, 0, 1, '2025-05-01 17:14:10'),
(482, 'B.Sc Mathematics', '6', 'abstract algebra 2', 'qtext/1746100024_abstract algebra 2.pdf', 2021, 0, 1, '2025-05-01 17:17:05'),
(483, 'B.Sc Mathematics', '6', 'Abstract algebra ring theory regular', 'qtext/1746100025_Abstract algebra ring theory regular.pdf', 2021, 0, 1, '2025-05-01 17:17:05'),
(484, 'B.Sc Mathematics', '6', 'complex analysis II', 'qtext/1746100025_complex analysis II.pdf', 2021, 0, 1, '2025-05-01 17:17:06'),
(485, 'B.Sc Mathematics', '6', 'graph theory regular', 'qtext/1746100026_graph theory regular.pdf', 2021, 0, 1, '2025-05-01 17:17:07'),
(486, 'B.Sc Mathematics', '6', 'linear algebra', 'qtext/1746100027_linear algebra.pdf', 2021, 0, 1, '2025-05-01 17:17:07'),
(487, 'B.Sc Zoology', '6', 'developmental ', 'qtext/1746100733_developmental .pdf', 2022, 0, 1, '2025-05-01 17:28:54'),
(488, 'B.Sc Zoology', '6', 'developmental biology regular(1)', 'qtext/1746100734_developmental biology regular(1).pdf', 2022, 0, 1, '2025-05-01 17:28:54'),
(489, 'B.Sc Zoology', '6', 'ecology', 'qtext/1746100734_ecology.pdf', 2022, 0, 1, '2025-05-01 17:28:54'),
(490, 'B.Sc Zoology', '6', 'economic zoology', 'qtext/1746100734_economic zoology.pdf', 2022, 0, 1, '2025-05-01 17:28:55'),
(491, 'B.Sc Zoology', '6', 'general informatics, bioinformatics', 'qtext/1746100735_general informatics, bioinformatics.pdf', 2022, 0, 1, '2025-05-01 17:28:55'),
(492, 'B.Sc Zoology', '5', 'genetics and biotech', 'qtext/1746100849_genetics and biotech.pdf', 2021, 0, 1, '2025-05-01 17:30:50'),
(493, 'B.Sc Zoology', '5', 'immunology and microbiology(1)', 'qtext/1746100850_immunology and microbiology(1).pdf', 2021, 0, 1, '2025-05-01 17:30:53'),
(494, 'B.Sc Zoology', '5', 'physiological and biological chemistry imp', 'qtext/1746100853_physiological and biological chemistry imp.pdf', 2021, 0, 1, '2025-05-01 17:30:54'),
(495, 'B.Sc Zoology', '5', 'readings in politicap economy', 'qtext/1746100854_readings in politicap economy.pdf', 2021, 0, 1, '2025-05-01 17:30:55'),
(496, 'B.Sc Zoology', '3', 'methodology and perspectives', 'qtext/1746100994_methodology and perspectives.pdf', 2021, 0, 1, '2025-05-01 17:33:14'),
(497, 'B.Sc Zoology', '3', 'organic chem 2019 adm', 'qtext/1746100994_organic chem 2019 adm.pdf', 2021, 0, 1, '2025-05-01 17:33:15'),
(498, 'B.Sc Zoology', '3', 'organic chem 2020 adm', 'qtext/1746100995_organic chem 2020 adm.pdf', 2021, 0, 1, '2025-05-01 17:33:16'),
(499, 'B.Sc Zoology', '2', 'Inorganic chemistry', 'qtext/1746101152_Inorganic chemistry.pdf', 2021, 0, 1, '2025-05-01 17:35:54'),
(500, 'B.Sc Zoology', '2', 'inorganic chemistry and bio inorganic', 'qtext/1746101154_inorganic chemistry and bio inorganic.pdf', 2021, 0, 1, '2025-05-01 17:35:54'),
(501, 'B.Sc Zoology', '1', 'botany imp', 'qtext/1746101353_botany imp.pdf', 2021, 0, 1, '2025-05-01 17:39:13'),
(502, 'B.Sc Zoology', '1', 'chemistry', 'qtext/1746101353_chemistry(1).pdf', 2021, 0, 1, '2025-05-01 17:39:14'),
(503, 'B.Sc Zoology', '1', 'Animal Diversity 1', 'qtext/1746101354_Animal Diversity 1.pdf', 2021, 0, 1, '2025-05-01 17:39:15'),
(504, 'B.Sc Zoology', '1', 'experimental zoology', 'qtext/1746101355_experimental zoology.pdf', 2021, 0, 1, '2025-05-01 17:39:16'),
(505, 'B.Sc Zoology', '1', 'methodology and perspectives', 'qtext/1746101356_methodology and perspectives.pdf', 2021, 0, 1, '2025-05-01 17:39:17'),
(506, 'BA Economics', '1', 'political science', 'qtext/1746101465_political science.pdf', 2021, 0, 1, '2025-05-01 17:41:06'),
(507, 'BA Economics', '1', 'history of modern India ', 'qtext/1746101466_history of modern India imp.pdf', 2021, 0, 1, '2025-05-01 17:41:06'),
(508, 'BA Economics', '3', 'introductory macro economics', 'qtext/1746101644_introductory macro economics.pdf', 2021, 0, 1, '2025-05-01 17:44:04'),
(509, 'BA Economics', '3', 'micro economics 2', 'qtext/1746101644_micro economics 2.pdf', 2021, 0, 1, '2025-05-01 17:44:05'),
(510, 'BA Economics', '3', 'N - 2357 history of modern india', 'qtext/1746101645_N - 2357 history of modern india.pdf', 2021, 0, 1, '2025-05-01 17:44:06'),
(511, 'BA Economics', '3', 'public administration', 'qtext/1746101646_public administration(1).pdf', 2021, 0, 1, '2025-05-01 17:44:06'),
(512, 'MA Economics', '1', 'Principal of Cognitive Economics', 'qtext/1746249736_Cognitive Economics.pdf', 2021, 0, 1, '2025-05-03 10:52:16'),
(513, 'MA Economics', '1', 'Principal of Cognitive Economics 2022', 'qtext/1746249736_Principal of Cognitive Economics 2022.pdf', 2021, 0, 1, '2025-05-03 10:52:17'),
(514, 'MA Economics', '1', 'Macro Economic theory', 'qtext/1746249737_Macro Economic theory.pdf', 2021, 0, 1, '2025-05-03 10:52:17'),
(515, 'MA Economics', '1', 'Micro Economic theory', 'qtext/1746249737_M5841_micro economics.pdf', 2021, 0, 1, '2025-05-03 10:52:17'),
(516, 'MA Economics', '1', 'MICRO ECONOMIC THEORY 2022', 'qtext/1746249737_MICRO ECONOMIC THEORY 2022.pdf', 2021, 0, 1, '2025-05-03 10:52:18'),
(517, 'MA Economics', '1', ' Quantitative Tools for behavioural eco', 'qtext/1746250220_PG S1 MA Eco Quantitative Tools.pdf', 2021, 0, 1, '2025-05-03 11:00:20'),
(518, 'MA Economics', '1', 'Macro Economics theory', 'qtext/1746250220_PG S1 Macro Economic Theory.pdf', 2021, 0, 1, '2025-05-03 11:00:20'),
(519, 'MA Economics', '1', ' Quantitative Tools for behavioural eco 2022', 'qtext/1746250220_QUANTITATIVE TOOLS FOR BEHAVIOURAL ECONOMICS .pdf', 2021, 0, 1, '2025-05-03 11:00:20'),
(520, 'BA Hindi', '2', 'Foundational in behavioural macro eco ', 'qtext/1746250932_Foundational in behavioural macro eco.pdf', 2021, 0, 1, '2025-05-03 11:12:12'),
(521, 'BA Hindi', '2', 'Foundation in DataScience', 'qtext/1746250932_Foundation in DataScience.pdf', 2021, 0, 1, '2025-05-03 11:12:13'),
(522, 'BA Hindi', '2', 'Foundation in Behavioural Micro eco', 'qtext/1746250933_Foundation in Behavioural Micro eco.pdf', 2021, 0, 1, '2025-05-03 11:12:13'),
(523, 'MA Economics', '2', 'Behavioural Micro Economics 2022', 'qtext/1746251183_Behavioural Micro Economics 2022.pdf', 2022, 0, 1, '2025-05-03 11:16:23'),
(524, 'MA Economics', '2', 'Macroeconomics 2022', 'qtext/1746251183_Macroeconomics 2022.pdf', 2022, 0, 1, '2025-05-03 11:16:23'),
(525, 'MA Economics', '2', 'DataScience 2022', 'qtext/1746251183_Data Science 2022.pdf', 2022, 0, 1, '2025-05-03 11:16:23'),
(526, 'MA Economics', '3', 'Applied behavioral economics', 'qtext/1746251449_Applied behavioral economics.pdf', 2021, 0, 1, '2025-05-03 11:20:49'),
(527, 'MA Economics', '4', 'BASICS OF BEHAVIOURAL FINANCE ', 'qtext/1746251596_BASICS OF BEHAVIOURAL FINANCE .pdf', 2022, 0, 1, '2025-05-03 11:23:17'),
(528, 'MA Economics', '4', 'BEHAVIOURAL ECONOMIC AND PUBLIC HEALTH ', 'qtext/1746251597_BEHAVIOURAL ECONOMIC AND PUBLIC HEALTH .pdf', 2022, 0, 1, '2025-05-03 11:23:17'),
(529, 'MA Economics', '4', 'FOUNDATIONS OF DATA ANALYSTS USING R AND PYTHON ', 'qtext/1746251597_FOUNDATIONS OF DATA ANALYSTS USING R AND PYTHON .pdf', 2022, 0, 1, '2025-05-03 11:23:17'),
(530, 'MA Economics', '4', 'BEHAVIOURAL ECONOMICS AND POLICY DESIGN ', 'qtext/1746251597_BEHAVIOURAL ECONOMICS AND POLICY DESIGN .pdf', 2022, 0, 1, '2025-05-03 11:23:17'),
(531, 'MSc Physics', '1', 'Classical Mechanics', 'qtext/1746251739_Classical Mechanics.pdf', 2022, 0, 1, '2025-05-03 11:25:39'),
(532, 'MSc Physics', '1', 'electronics', 'qtext/1746251739_electronics.pdf', 2022, 0, 1, '2025-05-03 11:25:39'),
(533, 'MSc Physics', '1', 'Mathematical Physics 18', 'qtext/1746251739_Mathematical Physics 18.pdf', 2022, 0, 1, '2025-05-03 11:25:39'),
(534, 'MSc Physics', '1', 'Mathematical Physics 2020', 'qtext/1746251739_Mathematical Physics 2020.pdf', 2022, 0, 1, '2025-05-03 11:25:39'),
(535, 'MSc Physics', '2', 'COMPUTER SCIENCE AND NUMERICAL TECHNIQUES ', 'qtext/1746251929_COMPUTER SCIENCE AND NUMERICAL TECHNIQUES .pdf', 2022, 0, 1, '2025-05-03 11:28:49'),
(536, 'MSc Physics', '2', 'MODERN OPTICS AND ELECTROMAGNETIC THEORY ', 'qtext/1746251930_MODERN OPTICS AND ELECTROMAGNETIC THEORY .pdf', 2022, 0, 1, '2025-05-03 11:28:50'),
(537, 'MSc Physics', '2', 'PHYSICAL CHEMISTRY II', 'qtext/1746251930_PHYSICAL CHEMISTRY II.pdf', 2022, 0, 1, '2025-05-03 11:28:50'),
(538, 'MSc Physics', '2', 'THERMODYNAMICS STATISTICAL PHYSICS AND BASIC QUANTUM MECHANICS', 'qtext/1746251930_THERMODYNAMICS STATISTICAL PHYSICS AND BASIC QUANTUM MECHANICS.pdf', 2022, 0, 1, '2025-05-03 11:28:51'),
(539, 'MSc Physics', '2', 'Computer science 2022', 'qtext/1746258707_Computer science 2022.pdf', 2022, 0, 1, '2025-05-03 13:21:48'),
(540, 'MSc Physics', '3', 'ATOMIC AND MOLECULAR SPECTROSCOPY', 'qtext/1746259012_ATOMIC AND MOLECULAR SPECTROSCOPY (2020 Admission Onwards).pdf', 2022, 0, 1, '2025-05-03 13:26:52'),
(541, 'MSc Physics', '3', 'ADVANCED QUANTUM MECHANICS ', 'qtext/1746259012_ADVANCED QUANTUM MECHANICS .pdf', 2022, 0, 1, '2025-05-03 13:26:53'),
(542, 'MSc Physics', '3', 'Atomic and Mol Spectr 2022', 'qtext/1746259013_Atomic and Mol Spectr 2022.pdf', 2022, 0, 1, '2025-05-03 13:26:53'),
(543, 'MSc Physics', '3', 'materials science', 'qtext/1746259013_materials science.pdf', 2022, 0, 1, '2025-05-03 13:26:53'),
(544, 'MSc Physics', '3', 'ADVANCED QUANTUM MECHANICS  2022', 'qtext/1746259013_PG S3 Adv QM Imp.pdf', 2022, 0, 1, '2025-05-03 13:26:53'),
(545, 'MSc Physics', '4', 'Nuclear and Particle physics', 'qtext/1746259302_Nuclear and Particle physics.pdf', 2024, 0, 1, '2025-05-03 13:31:42'),
(546, 'MSc Physics', '4', 'Practical q1', 'qtext/1746259302_Q1.pdf', 2024, 0, 1, '2025-05-03 13:31:43'),
(547, 'MSc Physics', '4', 'Practical q2', 'qtext/1746259303_Q2.pdf', 2024, 0, 1, '2025-05-03 13:31:43'),
(548, 'MSc Physics', '4', 'Practical q3', 'qtext/1746259303_Q3.pdf', 2024, 0, 1, '2025-05-03 13:31:43'),
(549, 'MSc Physics', '4', 'Practical q4', 'qtext/1746259304_Q4.pdf', 2024, 0, 1, '2025-05-03 13:31:44'),
(550, 'MSc Physics', '4', 'Practical q5', 'qtext/1746259304_Q5.pdf', 2024, 0, 1, '2025-05-03 13:31:44'),
(551, 'MSc Physics', '4', 'Practical l3', 'qtext/1746259304_L3.pdf', 2024, 0, 1, '2025-05-03 13:31:45'),
(552, 'MSc Physics', '4', 'Practical l5', 'qtext/1746259305_L5.pdf', 2024, 0, 1, '2025-05-03 13:31:45'),
(553, 'MSc Physics', '4', 'Practical l6', 'qtext/1746259305_L6.pdf', 2024, 0, 1, '2025-05-03 13:31:46'),
(554, 'MSc Botany', '1', 'Briphyta, Pterydophyta', 'qtext/1746259559_Briphyta, Pterydophyta.pdf', 2022, 0, 1, '2025-05-03 13:35:59'),
(555, 'MSc Botany', '1', '`Phycology, Mycology', 'qtext/1746259559_Phycology, Mycology.pdf', 2022, 0, 1, '2025-05-03 13:35:59'),
(556, 'MSc Botany', '1', 'Briophyta 2021', 'qtext/1746259559_Briophyta 2019 Adm onw.pdf', 2022, 0, 1, '2025-05-03 13:35:59'),
(557, 'MSc Botany', '1', 'Hiostology 2021', 'qtext/1746259559_Hiostology.pdf', 2022, 0, 1, '2025-05-03 13:35:59'),
(558, 'MSc Botany', '1', 'Phycology, Mycology 2013-18 Adm', 'qtext/1746259559_Phycology, Mycology 2013-18 Adm.pdf', 2022, 0, 1, '2025-05-03 13:35:59'),
(559, 'MSc Botany', '1', 'Phycology, Mycology 2021', 'qtext/1746259559_Phycology, Mycology 2021.pdf', 2022, 0, 1, '2025-05-03 13:35:59'),
(560, 'MSc Botany', '2', 'All', 'qtext/1746260411_Botany all Papers QP 2009_2019_compressed.pdf', 2022, 0, 1, '2025-05-03 13:50:16'),
(561, 'MSc Botany', '2', 'CELL BIOLOGY GENETICS AND EVOLUTION ', 'qtext/1746260416_CELL BIOLOGY GENETICS AND EVOLUTION .pdf', 2022, 0, 1, '2025-05-03 13:50:16'),
(562, 'MSc Botany', '2', 'ENVIRONMENTAL BIOLOGY FOREST BOTANY PHYTOGEOGRAPHY ', 'qtext/1746260416_ENVIRONMENTAL BIOLOGY FOREST BOTANY PHYTOGEOGRAPHY .pdf', 2022, 0, 1, '2025-05-03 13:50:17'),
(563, 'MSc Botany', '2', 'Taxonomy of angiosperms', 'qtext/1746260417_Taxonomy of angiosperms.pdf', 2022, 0, 1, '2025-05-03 13:50:17'),
(564, 'MSc Botany', '2', 'Cell Biology Genetics 2021', 'qtext/1746260417_Cell Biology Genetics 2021.pdf', 2022, 0, 1, '2025-05-03 13:50:18'),
(565, 'MSc Botany', '2', 'Cell Biology 2021', 'qtext/1746260418_Cell Biology 2021.pdf', 2022, 0, 1, '2025-05-03 13:50:18'),
(566, 'MSc Botany', '2', 'Environmental Biology 2021', 'qtext/1746260418_Environmental Biology 2021.pdf', 2022, 0, 1, '2025-05-03 13:50:18'),
(567, 'MSc Botany', '2', ' Taxonomy 2021', 'qtext/1746260418_Taxonomy 2021.pdf', 2022, 0, 1, '2025-05-03 13:50:18'),
(568, 'MSc Botany', '3', 'BIOCHEMISTRY, PLANT PHYSIOLOGY AND RESEARCH METHODOLOGY 2023', 'qtext/1746260650_BIOCHEMISTRY, PLANT PHYSIOLOGY AND RESEARCH METHODOLOGY (2019 Admission Onwards).pdf', 2022, 0, 1, '2025-05-03 13:54:10'),
(569, 'MSc Botany', '3', 'BIOPHYSICS, BIOCHEMISTRY AND PLANT PHYSIOLOGY 2023', 'qtext/1746260650_BIOPHYSICS, BIOCHEMISTRY AND PLANT PHYSIOLOGY (2013-2018 Admission).pdf', 2022, 0, 1, '2025-05-03 13:54:11'),
(570, 'MSc Botany', '3', 'PLANT BREEDING,HORTICULTURAL AND BIOSTATISTICS ', 'qtext/1746260651_PLANT BREEDING,HORTICULTURAL AND BIOSTATISTICS .pdf', 2022, 0, 1, '2025-05-03 13:54:11'),
(571, 'MSc Botany', '3', 'PLANT BREEDING,HORTICULTURE AND REPRODUCTIVE BIOLOGY ', 'qtext/1746260651_PLANT BREEDING,HORTICULTURE AND REPRODUCTIVE BIOLOGY .pdf', 2022, 0, 1, '2025-05-03 13:54:12'),
(572, 'MSc Botany', '3', 'Biochemistry,Plant Physiology2022', 'qtext/1746260652_Biochemistry,Plant Physiology2022.pdf', 2022, 0, 1, '2025-05-03 13:54:12'),
(573, 'MSc Botany', '3', 'Biophysics, 2022', 'qtext/1746260652_Biophysics, 2022.pdf', 2022, 0, 1, '2025-05-03 13:54:12'),
(574, 'MSc Botany', '3', 'Molecular Biology2022', 'qtext/1746260652_Molecular Biology2022.pdf', 2022, 0, 1, '2025-05-03 13:54:12'),
(575, 'MSc Botany', '3', 'Plant Breeding2022', 'qtext/1746260652_Plant Breeding2022.pdf', 2022, 0, 1, '2025-05-03 13:54:12'),
(576, 'MSc Botany', '4', 'biotechnology', 'qtext/1746260830_biotechnology.pdf', 2022, 0, 1, '2025-05-03 13:57:11'),
(577, 'MSc Botany', '4', 'Bioinformatics and Biophysics', 'qtext/1746260831_Bioinformatics and Biophysics.pdf', 2022, 0, 1, '2025-05-03 13:57:12'),
(578, 'MSc Botany', '4', 'Biotechnology 2021', 'qtext/1746260832_Biotechnology 2021.pdf', 2022, 0, 1, '2025-05-03 13:57:12'),
(579, 'MSc Botany', '4', 'Environmental Biology', 'qtext/1746260832_Environmental Biology.pdf', 2022, 0, 1, '2025-05-03 13:57:12'),
(580, 'MSc Chemistry', '1', 'Inorganic Chemistry 1', 'qtext/1746263061_Inorganic Chemistry 1.pdf', 2022, 0, 1, '2025-05-03 14:34:21'),
(581, 'MSc Chemistry', '1', 'Organic Chem 1', 'qtext/1746263061_Organic Chem 1.pdf', 2022, 0, 1, '2025-05-03 14:34:21'),
(582, 'MSc Chemistry', '1', 'Physical Chemistry 1', 'qtext/1746263061_Physical Chemistry 1.pdf', 2022, 0, 1, '2025-05-03 14:34:21'),
(583, 'MSc Chemistry', '1', 'Organic Chemistry 2021', 'qtext/1746263061_Organic Chemistry 2021.pdf', 2022, 0, 1, '2025-05-03 14:34:21'),
(584, 'MSc Chemistry', '1', 'Organic Chemistry 2020 Adm', 'qtext/1746263061_Organic Chemistry 2020 Adm.pdf', 2022, 0, 1, '2025-05-03 14:34:21'),
(585, 'MSc Chemistry', '2', 'Inorganic chemistry II', 'qtext/1746263647_Inorganic chemistry II.pdf', 2022, 0, 1, '2025-05-03 14:44:07'),
(586, 'MSc Chemistry', '2', 'ORGANIC CHEMISTRY II', 'qtext/1746263647_ORGANIC CHEMISTRY II.pdf', 2022, 0, 1, '2025-05-03 14:44:08'),
(587, 'MSc Chemistry', '2', 'Physical Chemistry-Il 2021', 'qtext/1746263648_Physical Chemistry-II.pdf', 2022, 0, 1, '2025-05-03 14:44:09'),
(588, 'MSc Chemistry', '2', 'Physical Chemistry-Il 2021', 'qtext/1746263649_Physical Chemistry-II 2021.pdf', 2022, 0, 1, '2025-05-03 14:44:09'),
(589, 'MSc Chemistry', '2', 'PG S2 Organic Chem2 2021', 'qtext/1746263649_PG S2 Organic Chem2 2021.pdf', 2022, 0, 1, '2025-05-03 14:44:09'),
(590, 'MSc Chemistry', '2', 'PG S2 Inorganic Chem2 2021', 'qtext/1746263649_PG S2 Inorganic Chem2 2021.pdf', 2022, 0, 1, '2025-05-03 14:44:09'),
(591, 'MSc Chemistry', '3', 'ORGANIC CHEMISTRY - IIl 2023', 'qtext/1746264132_ORGANIC CHEMISTRY - II 2022.pdf', 2022, 0, 1, '2025-05-03 14:52:12'),
(592, 'MSc Chemistry', '3', 'INORGANIC CHEMISTRY III 2023', 'qtext/1746264132_INORGANIC CHEMISTRY III 2023.pdf', 2022, 0, 1, '2025-05-03 14:52:13'),
(593, 'MSc Chemistry', '3', 'INORGANIC CHEMISTRY -III 2023 new', 'qtext/1746264133_INORGANIC CHEMISTRY -III 2023 new.pdf', 2022, 0, 1, '2025-05-03 14:52:13'),
(594, 'MSc Chemistry', '3', 'Organic Chemistry3 2022', 'qtext/1746264133_Organic Chemistry3 2022.pdf', 2022, 0, 1, '2025-05-03 14:52:13'),
(595, 'MSc Chemistry', '3', 'Inorganic Chemistry 3 2022', 'qtext/1746264133_Inorganic Chemistry 3 2022.pdf', 2022, 0, 1, '2025-05-03 14:52:13'),
(596, 'MSc Chemistry', '3', 'Physical Chemistry 3 2022', 'qtext/1746264133_Physical Chemistry 3 2022.pdf', 2022, 0, 1, '2025-05-03 14:52:13'),
(597, 'MSc Chemistry', '4', 'applied analytical chem', 'qtext/1746264432_applied analytical chem.pdf', 2022, 0, 1, '2025-05-03 14:57:13'),
(598, 'MSc Chemistry', '4', 'Applied Analytical Chemistry 2021', 'qtext/1746264433_Applied Analytical Chemistry 2021.pdf', 2022, 0, 1, '2025-05-03 14:57:13'),
(599, 'MSc Chemistry', '4', 'Chemistry of Advanced Materials 2021', 'qtext/1746264433_Chemistry of Advanced Materials 2021.pdf', 2022, 0, 1, '2025-05-03 14:57:14'),
(600, 'MSc Chemistry', '4', 'OrganicChem4_16schm 2020', 'qtext/1746264434_OrganicChem4_16schm 2020.pdf', 2022, 0, 1, '2025-05-03 14:57:14'),
(601, 'MSc Chemistry', '4', 'ChemAdvancedmat16sch 2020', 'qtext/1746264434_ChemAdvancedmat16sch 2020.pdf', 2022, 0, 1, '2025-05-03 14:57:14'),
(602, 'MA English', '1', 'Shakespeare Studie 2022', 'qtext/1746264740_Shakespeare Studie 2022.pdf', 2022, 0, 1, '2025-05-03 15:02:20'),
(603, 'MA English', '1', 'romantics and victorians 2022', 'qtext/1746264740_romantics and victorians 2022.pdf', 2022, 0, 1, '2025-05-03 15:02:21'),
(604, 'MA English', '1', 'Chaucer to the Elizabethan Age 2022', 'qtext/1746264741_Chaucer to the Elizabethan Age 2022.pdf', 2022, 0, 1, '2025-05-03 15:02:21'),
(605, 'MA English', '1', 'augustan age 2022', 'qtext/1746264741_augustan age 2022.pdf', 2022, 0, 1, '2025-05-03 15:02:22'),
(606, 'MA English', '1', 'Augustan Age 2021', 'qtext/1746264742_Augustan Age 2021.pdf', 2022, 0, 1, '2025-05-03 15:02:22'),
(607, 'MA English', '1', 'Chaucer to the Elizabethan Age 2021', 'qtext/1746264742_Chaucer to the Elizabethan Age 2021.pdf', 2022, 0, 1, '2025-05-03 15:02:22'),
(608, 'MA English', '2', 'AMERICAN LITERATURE  2022', 'qtext/1746265053_AMERICAN LITERATURE  2022.pdf', 2022, 0, 1, '2025-05-03 15:07:33'),
(609, 'MA English', '2', 'FROM MODERNISM TO THE PRESENT  2022', 'qtext/1746265053_FROM MODERNISM TO THE PRESENT  2022.pdf', 2022, 0, 1, '2025-05-03 15:07:34'),
(610, 'MA English', '2', 'INDIAN WRITING IN ENGLISH  2022', 'qtext/1746265054_INDIAN WRITING IN ENGLISH  2022.pdf', 2022, 0, 1, '2025-05-03 15:07:34'),
(611, 'MA English', '2', 'American Literature 2021', 'qtext/1746265054_American Literature 2021.pdf', 2022, 0, 1, '2025-05-03 15:07:35'),
(612, 'MA English', '2', 'Critical Studies 2021', 'qtext/1746265055_Critical Studies 2021.pdf', 2022, 0, 1, '2025-05-03 15:07:37'),
(613, 'MA English', '2', 'Romantics and Victorians 2021', 'qtext/1746265057_Romantics and Victorians 2021.pdf', 2022, 0, 1, '2025-05-03 15:07:37'),
(614, 'MA English', '2', 'Indian writing in English 2021', 'qtext/1746265057_Indian writing in English 2021.pdf', 2022, 0, 1, '2025-05-03 15:07:37'),
(615, 'MA English', '2', 'Modernism 2021', 'qtext/1746265057_Modernism 2021.pdf', 2022, 0, 1, '2025-05-03 15:07:37'),
(616, 'MA English', '3', 'CRITICAL STUDIES - II 2023', 'qtext/1746265397_CRITICAL STUDIES - II 2023.pdf', 2023, 0, 1, '2025-05-03 15:13:18'),
(617, 'MA English', '3', 'LINGUISTICS AND STRUCTURE OF THE ENGLISH LANGUAGE  2023', 'qtext/1746265398_LINGUISTICS AND STRUCTURE OF THE ENGLISH LANGUAGE  2023.pdf', 2023, 0, 1, '2025-05-03 15:13:18'),
(618, 'MA English', '3', 'WRITING LIVES,PERFORMING GENDER  2023', 'qtext/1746265398_WRITING LIVES,PERFORMING GENDER  2023.pdf', 2023, 0, 1, '2025-05-03 15:13:18'),
(619, 'MA English', '3', 'Critical Studies 2022', 'qtext/1746265398_Critical Studies 2022.pdf', 2023, 0, 1, '2025-05-03 15:13:18'),
(620, 'MA English', '3', 'Writing Lives Elective 2022', 'qtext/1746265398_Writing Lives Elective 2022.pdf', 2023, 0, 1, '2025-05-03 15:13:18'),
(621, 'MA English', '3', 'Linguistics 2022', 'qtext/1746265398_Linguistics 2022.pdf', 2023, 0, 1, '2025-05-03 15:13:18'),
(622, 'MA English', '3', 'Womens writing 2022', 'qtext/1746265398_Womens writing 2022.pdf', 2023, 0, 1, '2025-05-03 15:13:18'),
(623, 'MA English', '4', 'comprehensive paper 2022', 'qtext/1746265600_comprehensive paper 2022.pdf', 2022, 0, 1, '2025-05-03 15:16:44'),
(624, 'MA English', '4', 'cultural studies 2022', 'qtext/1746265604_cultural studies 2022.pdf', 2022, 0, 1, '2025-05-03 15:16:45'),
(625, 'MA English', '4', 'Comprehensive 2021', 'qtext/1746265605_Comprehensive 2021.pdf', 2022, 0, 1, '2025-05-03 15:16:47'),
(626, 'MA English', '4', 'English Language Teaching 2021', 'qtext/1746265607_English Language Teaching 2021.pdf', 2022, 0, 1, '2025-05-03 15:16:47'),
(627, 'MA English', '4', 'Theorising Sexualities 2021', 'qtext/1746265607_Theorising Sexualities 2021.pdf', 2022, 0, 1, '2025-05-03 15:16:48'),
(628, 'MA English', '4', 'travel writing 2021', 'qtext/1746265608_travel writing 2021.pdf', 2022, 0, 1, '2025-05-03 15:16:48'),
(629, 'MSc Physics', '3', 'advanced quantum mechanics 2023', 'qtext/advanced quantum mechanics 2023.pdf', 2023, 0, 1, '2025-05-07 18:28:27'),
(630, 'MSc Physics', '3', 'advanced quantum mechanics', 'qtext/advanced quantum mechanics 2023.pdf', 2023, 64, 1, '2025-05-07 21:38:17'),
(631, 'B.Sc Physics', '6', 'Nano Science', 'qtext/nanoscience 2024.pdf', 2024, 65, 1, '2025-05-12 22:19:24'),
(632, 'BA Economics', '4', 'Global voices and cultures', 'qtext/1747760974_S4 global voice  and cultures 2021.pdf', 2021, 0, 1, '2025-05-20 22:39:35'),
(633, 'Common', '4', 'Global voices and cultures', 'qtext/1747761397_S4 global voice  and cultures 2021.pdf', 2021, 0, 1, '2025-05-20 22:46:39');

-- --------------------------------------------------------

--
-- Table structure for table `app_versions`
--

CREATE TABLE `app_versions` (
  `id` int(11) NOT NULL,
  `version_code` int(11) NOT NULL,
  `version_name` varchar(50) NOT NULL,
  `update_url` varchar(255) NOT NULL,
  `update_message` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `is_mandatory` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `app_versions`
--

INSERT INTO `app_versions` (`id`, `version_code`, `version_name`, `update_url`, `update_message`, `is_active`, `is_mandatory`, `created_at`) VALUES
(1, 44, '2.0.7', 'https://play.google.com/store/apps/details?id=com.keralatechreach.kstudents&hl=en_IN', 'New Update!\r\nNew feature added Notes.\r\nSupport your batchmates, juniors, and students in need by uploading your notes.', 1, 1, '2025-03-06 05:48:13');

-- --------------------------------------------------------

--
-- Table structure for table `budget_selections`
--

CREATE TABLE `budget_selections` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `budget_limit` int(11) NOT NULL,
  `image_url` varchar(500) NOT NULL,
  `display_order` int(11) DEFAULT 0,
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `budget_selections`
--

INSERT INTO `budget_selections` (`id`, `title`, `category_id`, `budget_limit`, `image_url`, `display_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Mobiles under 10000', 1, 10000, 'https://keralatechreach.in/Affiliated/budget/phone10k.png', 1, 1, '2025-05-09 16:10:14', '2025-05-10 06:21:00'),
(2, 'Mobiles under 20000', 1, 20000, 'https://keralatechreach.in/Affiliated/budget/phone20k.png', 2, 1, '2025-05-09 16:10:14', '2025-05-10 07:45:48'),
(3, 'Affordable earphones', 3, 5000, 'https://keralatechreach.in/Affiliated/budget/earphone5k.png', 3, 1, '2025-05-09 16:10:14', '2025-05-10 07:45:48'),
(4, 'Laptops under 30000', 2, 30000, 'https://keralatechreach.in/Affiliated/budget/laptop30k.png', 4, 1, '2025-05-09 16:10:14', '2025-05-10 06:21:00'),
(5, 'Laptops under 40000', 2, 40000, 'https://keralatechreach.in/Affiliated/budget/laptop40k.png', 5, 1, '2025-05-09 16:10:14', '2025-05-10 07:45:48'),
(6, 'Laptops under 50000', 2, 50000, 'https://keralatechreach.in/Affiliated/budget/laptop50k.png', 6, 1, '2025-05-09 16:10:14', '2025-05-10 06:21:00'),
(8, 'Premium laptops', 2, 80000, 'https://keralatechreach.in/Affiliated/budget/1747033605_7567.png', 7, 1, '2025-05-12 07:06:45', '2025-05-12 07:06:45');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image_url` varchar(500) NOT NULL,
  `display_order` int(11) DEFAULT 0,
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image_url`, `display_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Mobile', 'https://keralatechreach.in/Affiliated/category/Phone.jpg', 1, 1, '2025-05-09 16:10:14', '2025-05-14 11:08:44'),
(2, 'Laptop', 'https://keralatechreach.in/Affiliated/category/Laptop.jpg', 2, 1, '2025-05-09 16:10:14', '2025-05-14 11:08:04'),
(3, 'Earphones', 'https://keralatechreach.in/Affiliated/category/Earphones.jpg', 3, 1, '2025-05-09 16:10:14', '2025-05-14 11:15:02'),
(4, 'Smartwatch', 'https://keralatechreach.in/Affiliated/category/Smartwatch.jpg', 4, 1, '2025-05-09 16:10:14', '2025-05-14 11:15:31'),
(5, 'Camera', 'https://keralatechreach.in/Affiliated/category/Camera.jpg', 5, 1, '2025-05-09 16:10:14', '2025-05-14 11:16:01'),
(10, 'TV', 'https://keralatechreach.in/Affiliated/category/TV.jpg', 6, 1, '2025-05-12 07:14:03', '2025-05-14 11:16:32');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `message_id` int(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `subject` varchar(150) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` varchar(20) DEFAULT 'pending',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`message_id`, `name`, `email`, `phone`, `subject`, `message`, `status`, `created_at`) VALUES
(1002, 'Clowdia', 'Clowdiathadeuse@gmail.com', '9961773119', 'I can\'t get BA english literature questions paper in this app', 'I can\'t get BA english literature questions paper in this app', 'pending', '2025-04-14 19:56:41'),
(1005, 'test', 'a@g.xo', '9034567890', 'test', 'tesint', 'pending', '2025-05-13 20:09:09'),
(1006, 'Sikha', 'thomsonlatha@gmail.com', '', 'Fyugp physics and computer Application', 'Could you please include fyugp student\'s notes and model qn paper also it\'s because we don\'t have a website to access them', 'pending', '2025-05-17 08:35:45'),
(1007, 'Kadali Dinesh', 'lekshmisuresh701@gmail.com', '8848363070', 'request for question papers', 'can you please upload global voices and cultures 2023,2024 question papers', 'pending', '2025-05-19 13:21:03');

-- --------------------------------------------------------

--
-- Table structure for table `degree`
--

CREATE TABLE `degree` (
  `id` int(11) NOT NULL,
  `degree_name` varchar(100) NOT NULL,
  `university_id` int(11) NOT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `degree`
--

INSERT INTO `degree` (`id`, `degree_name`, `university_id`, `updated_date`) VALUES
(1, 'B.Com', 1, '2025-03-21 17:22:39'),
(2, 'BCA', 1, '2025-03-21 17:22:39'),
(3, 'MCA', 1, '2025-03-21 17:22:39'),
(4, 'BA history', 1, '2025-03-21 17:22:39'),
(5, 'BA Malayalam', 1, '2025-03-21 17:22:39'),
(6, 'BA political Science', 1, '2025-03-21 17:22:39'),
(7, 'BA Sanskrit', 1, '2025-03-21 17:22:39'),
(8, 'B.Sc Botany', 1, '2025-03-21 17:22:39'),
(9, 'B.Sc Chemistry', 1, '2025-03-21 17:22:39'),
(10, 'B.Sc Mathematics', 1, '2025-03-21 17:22:39'),
(11, 'B.Sc Physics', 1, '2025-03-21 17:22:39'),
(12, 'B.Sc Zoology', 1, '2025-03-21 17:22:39'),
(14, 'BA Economics', 1, '2025-03-21 17:22:39'),
(19, 'B.Sc CS', 1, '2025-03-21 17:22:39'),
(22, 'BA Hindi', 1, '2025-03-21 17:22:39'),
(23, 'MA Philosophy', 1, '2025-04-11 16:20:42'),
(24, 'MA Sanskrit', 1, '2025-04-11 16:20:57'),
(25, 'MA Malayalam', 1, '2025-04-11 16:21:14'),
(26, 'MA Hindi', 1, '2025-04-11 16:22:08'),
(27, 'MA Mass Comunication ', 1, '2025-04-11 16:22:48'),
(28, 'MA English', 1, '2025-04-11 16:23:09'),
(29, 'MA History', 1, '2025-04-11 16:23:27'),
(30, 'MA Political Science', 1, '2025-04-11 16:23:52'),
(31, 'MA Economics', 1, '2025-04-11 16:24:14'),
(32, 'MA Sociology', 1, '2025-04-11 16:24:41'),
(33, 'MA Psychology', 1, '2025-04-11 16:24:59'),
(34, 'MSc Food and Diary Biotechnology', 1, '2025-04-11 16:26:07'),
(35, 'MSc Medical Chemistry', 1, '2025-04-11 16:26:32'),
(36, 'Msc Counselling Psychology', 1, '2025-04-11 16:26:54'),
(37, 'MSc Geography', 1, '2025-04-11 16:27:09'),
(38, 'MSc Psychology', 1, '2025-04-11 16:27:26'),
(39, 'MSc Microbiology', 1, '2025-04-11 16:28:05'),
(40, 'MSc Geology', 1, '2025-04-11 16:28:20'),
(41, 'MSc Environmental Science', 1, '2025-04-11 16:28:45'),
(42, 'MSc Mathematics', 1, '2025-04-11 16:29:04'),
(43, 'MSc Statistics', 1, '2025-04-11 16:29:23'),
(44, 'MSc Physics', 1, '2025-04-11 16:29:33'),
(45, 'MSc Chemistry', 1, '2025-04-11 16:30:00'),
(46, 'MSc Bio Chemistry', 1, '2025-04-11 16:30:53'),
(47, 'MSc Botany', 1, '2025-04-11 16:31:11'),
(48, 'MSc Zoology', 1, '2025-04-11 16:31:40'),
(49, 'MSc Electronics', 1, '2025-04-11 16:31:59'),
(50, 'MSc Computer Science', 1, '2025-04-11 16:32:18'),
(51, 'MSc Home Science', 1, '2025-04-11 16:32:52'),
(52, 'MSc BioTechnology', 1, '2025-04-11 16:33:04'),
(53, 'MCom', 1, '2025-04-11 16:36:03'),
(54, 'MBA', 1, '2025-04-11 16:36:34'),
(55, 'MSW', 1, '2025-04-11 16:37:12'),
(56, 'LLB', 1, '2025-04-11 16:37:20'),
(57, 'MTech ECE', 1, '2025-04-11 16:37:47'),
(58, 'Mtech CSE', 1, '2025-04-11 16:38:07'),
(59, 'Mtech EEE', 1, '2025-04-11 16:38:20'),
(60, 'MTech CE', 1, '2025-04-11 16:38:55'),
(61, 'MTech ME', 1, '2025-04-11 16:39:46'),
(62, 'MArch', 1, '2025-04-11 16:40:26'),
(63, 'BTech Civil', 1, '2025-04-11 16:40:54'),
(64, 'BTech Mechanical', 1, '2025-04-11 16:41:09'),
(65, 'BTech Chemistry', 1, '2025-04-11 16:41:20'),
(66, 'BTech CS', 1, '2025-04-11 16:42:12'),
(67, 'BTech EEE', 1, '2025-04-11 16:42:29'),
(69, 'BArch', 1, '2025-04-11 16:43:10'),
(70, 'BSc Geology', 1, '2025-04-11 16:51:30'),
(71, 'BSc Electronics', 1, '2025-04-11 16:52:45'),
(72, 'BBA', 1, '2025-04-11 16:53:27'),
(73, 'BSW', 1, '2025-04-11 16:54:32'),
(74, 'BA English', 1, '2025-04-15 12:50:58'),
(75, 'BA Communicative English ', 1, '2025-04-16 09:52:31'),
(77, 'Common', 1, '2025-05-20 21:51:13');

--
-- Triggers `degree`
--
DELIMITER $$
CREATE TRIGGER `update_degree_timestamp` AFTER UPDATE ON `degree` FOR EACH ROW BEGIN
    UPDATE degree SET updated_date = CURRENT_TIMESTAMP WHERE id = NEW.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `district_id` int(11) NOT NULL,
  `district` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`district_id`, `district`, `created_at`) VALUES
(1, 'Alappuzha', '2025-03-27 09:58:45'),
(2, 'Ernakulam', '2025-03-27 09:58:45'),
(3, 'Idukki', '2025-03-27 09:58:45'),
(4, 'Kannur', '2025-03-27 09:58:45'),
(5, 'Kasaragod', '2025-03-27 09:58:45'),
(6, 'Kollam', '2025-03-27 09:58:45'),
(7, 'Kottayam', '2025-03-27 09:58:45'),
(8, 'Kozhikode', '2025-03-27 09:58:45'),
(9, 'Malappuram', '2025-03-27 09:58:45'),
(10, 'Palakkad', '2025-03-27 09:58:45'),
(11, 'Pathanamthitta', '2025-03-27 09:58:45'),
(12, 'Thiruvananthapuram', '2025-03-27 09:58:45'),
(13, 'Thrissur', '2025-03-27 09:58:45'),
(14, 'Wayanad', '2025-03-27 09:58:45'),
(15, 'All India', '2025-04-13 05:50:00'),
(16, 'All Kerala', '2025-04-13 06:07:01');

-- --------------------------------------------------------

--
-- Table structure for table `entrance_notifications`
--

CREATE TABLE `entrance_notifications` (
  `id` int(11) NOT NULL,
  `entrance_name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `deadline_date` date NOT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `entrance_notifications`
--

INSERT INTO `entrance_notifications` (`id`, `entrance_name`, `category`, `deadline_date`, `website_url`, `created_at`) VALUES
(14, 'Kerala University PG Entrance Exam', 'PG', '2025-05-19', 'admissions.keralauniversity.ac.in', '2025-05-05 10:46:00'),
(15, 'KLEE 2025', 'Both', '2025-08-01', 'cee.kerala.gov.in', '2025-05-05 10:46:00'),
(16, 'NEET PG 2025', 'PG', '2025-06-15', 'nbe.edu.in', '2025-05-05 10:46:00');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `category_id` int(10) NOT NULL,
  `event_start` date NOT NULL,
  `event_end` date NOT NULL,
  `name` varchar(255) NOT NULL,
  `place` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `map_link` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `district_id` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_sponsored` int(11) DEFAULT 0,
  `sponsor_name` text DEFAULT NULL,
  `sponsor_logo_url` text DEFAULT NULL,
  `sponsor_level` text DEFAULT NULL,
  `sponsored_until` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `category_id`, `event_start`, `event_end`, `name`, `place`, `link`, `map_link`, `description`, `district_id`, `created_at`, `is_sponsored`, `sponsor_name`, `sponsor_logo_url`, `sponsor_level`, `sponsored_until`) VALUES
(63, 9, '2025-03-28', '2025-03-28', 'Founders Meet 26.0', 'Kochi', 'https://startupmission.kerala.gov.in/events/founders-meet-260-67e4df6301932', 'https://www.google.com/maps/place/ISC+-+Indian+School+of+Commerce/@10.0066179,75.7560738,10z/data=!4m10!1m2!2m1!1sAmhithatres,+ISC,+Kochi+map!3m6!1s0x3b080b62509e9367:0x4e7b0f6a41a2986b!8m2!3d10.0066179!4d76.365815!15sChtBbWhpdGhhdHJlcywgSVNDLCBLb2NoaSBtY', 'Join us for the 26th edition of Founders Meet, an initiative of Startup Founders of Kerala, on 28th March 2025, at Amhithatres, ISC, Kochi! Connect with founders, share experiences, and gain invaluable insights for your startup journey. Be a part of the founders&#39; network and prepare yourself for the challenges that will arise as a startup founder at various stages of growth.\r\n\r\n28, Mar 2025, 17:00 PM\r\n', 2, '2025-04-12 08:28:46', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(64, 5, '2025-04-13', '2025-04-13', 'Reverse shark', 'TKM KOLLAM ', 'https://docs.google.com/forms/d/e/1FAIpQLSeVhFVRdQcjli7IbN4pasmiV1M2RqGaK64S2fU6ZI36eAr5XQ/viewform', 'https://maps.app.goo.gl/FWRckkXk3AGmzJxNA', 'Step into Reverse Shark Tank ?, where you become the investor! Analyse start-up pitches, ask strategic questions, and compete to make the smartest deals ?. Outsmart your rivals, manage your funds wisely, and prove your investment skills in this high-stakes showdown. Register now and take on the ultimate investor challenge, brought to you by IEDC TKMCE!', 6, '2025-04-12 16:12:56', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(65, 6, '2025-04-30', '2025-04-30', 'Investor Cafe', 'Kochi', 'https://www.ksum.in/InvestorCafe', 'https://maps.app.goo.gl/qKa6x3Ra5xZe6i8p7', 'Join us on April 30, 2025, at Kerala Startup Mission, Kochi for Investor Café - a unique platform to connect, raise funds, and grow. Let’s match you with the right investors and take your startup to the next level!\r\n\r\nTime: 10:00 AM onwards\r\n', 2, '2025-04-12 16:45:20', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(66, 3, '2025-04-13', '2025-05-11', 'Summer Internship', 'TKM College of Engineering, Kollam', 'https://phiscape.com/internship/', 'https://maps.app.goo.gl/CcUMhGF7fKZ2B17w8', 'Hola Folks...Grab an amazing opportunity to do an internship organised by PhiScape Robotics pvt ltd in association with Dept. of EEE, TKM College of Engineering, paving a way for you to up-skill yourself in various booming domains of technology.\r\n\r\nDuration of Internships offered:\r\n7 Days - Rs 1999/-\r\n2 Weeks - Rs 2999/-\r\n1 Month - Rs 4999/-\r\n\r\nCourses offered:\r\n1. Embedded Systems and Robotics\r\n2. Data Science and AI\r\n3. Cyber security', 6, '2025-04-12 16:55:31', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(67, 11, '2025-04-13', '2025-05-12', 'AI for Mineral Targeting', 'Online', 'https://indiaai.gov.in/article/ai-for-mineral-targeting-join-the-indiaai-hackathon-on-mineral-discovery', 'https://maps.app.goo.gl/J5PkyREwKPcsqHdu6', 'IndiaAI invites innovators, researchers, and entrepreneurs to be part of the IndiaAI Hackathon on Mineral Targeting under the IndiaAI Application Development Initiative (IADI).', 15, '2025-04-13 06:00:36', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(68, 3, '2025-04-22', '2025-04-22', 'CTLG presents: MediaCon 2025 | Powered by MuLearn UCEK', 'EMS Hall, University of Kerala, Kariavattom Campus  ', 'https://mediacon.ctlg.in', 'https://maps.app.goo.gl/2kQF7xUGfVU4UP4W9', 're you a media student, budding journalist, musician, actor, influencer, or just someone madly passionate about the entertainment industry? \r\n\r\nCTLG presents: MediaCon 2025 | Powered by MuLearn UCEK\r\n\r\nJoin us for Kerala’s first Media & Entertainment Conference IP — an energy-packed event which brings kerala&#39;s top journalists and entertainment pros together!', 16, '2025-04-13 06:11:28', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(69, 2, '2025-04-11', '2025-04-11', 'Webinar on PRIP Scheme for Startups in Pharma and MedTech ', 'Online', 'https://ksum.in/PRIP', 'https://maps.app.goo.gl/zFGLaqE8SncVEURu9', 'Attend a Webinar organised by Department of Pharmaceuticals, Govt. of India on ‘Promotion of Research and Innovation in Pharma MedTech Sector (PRIP). The webinar will cover topics such as understanding the PRIP scheme, submitting Expression of Interest, and learning about Digital Innovation Enabler Platform.\r\n\r\nWebinar Details\r\n\r\nDate: 11th April, 2025\r\nTime: 12:00 PM to 1:00 PM', 16, '2025-04-13 06:42:52', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(70, 12, '2025-04-13', '2025-04-30', 'Perplexity for Startups', 'All', 'https://www.perplexity.ai/startups', 'https://maps.app.goo.gl/cDrPhsCsNZMabaoz6', 'We are introducing a Perplexity for Startups program to help founders and their teams take advantage of Perplexity&#39;s product and API for day-to-day research and building prototypes that require good orchestration of the web and LLMs—e.g., vertical search, agents, customer support, documentation, sales and marketing, background research, legal/medical research, lead generation, etc. \r\n\r\nEligible startups can apply to receive $5000 in Perplexity API credits and 6 months of Perplexity Enterprise Pro for their entire team.\r\n', 15, '2025-04-13 07:15:58', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(71, 7, '2025-04-21', '2025-05-24', 'Ente Keralam 2025 | Volunteer ', 'Every District', 'https://docs.google.com/forms/d/e/1FAIpQLSd57QmyjWsZpG_otp3GTSKnczlq06wN5X6XuQUGWUVMbUGVEQ/viewform', 'https://maps.app.goo.gl/KKxN5cYgvd788wSR9', 'Kerala Startup Mission (KSUM) invites volunteer applications from interested students for the ‘Ente Keralam’ program — a prestigious event marking the fourth anniversary of the Government of Kerala, taking place across all 14 districts of the state.\r\nProgram Details\r\n\r\n    Kasaragod - April 21 to April 27 - Kalikadave Maithanam, Peelikkode\r\n\r\n    Wayanad - April 22 to April 28 - S K M J School, Kalpetta\r\n\r\n    Kottayam - April 25 to May 1 - Nagambadam Maithaanam\r\n\r\n    Idukki - April 29 to May 5 - Vaazhathoppu VHSE\r\n\r\n    Kozhikode - May 3 to May 12 - Kozhikode Beach\r\n\r\n    Palakkad - May 4 to May 10 - Near Indira Gandhi Stadium\r\n\r\n    Alappuzha - May 6 to May 12 - Alappuzha Beach\r\n\r\n    Malappuram - May 7 to May 13 - Kottakkunnu\r\n\r\n    Kannur - May 8 to May 14 - Police Ground\r\n\r\n    Kollam -  May 11 to May 17 - Aashraamam\r\n\r\n    Pathanamthitta - May 16 to May 22 - Sabarimala Idathaavalam\r\n\r\n    Ernakulam - May 17 to May 23 - Marine Drive\r\n\r\n    Thiruvananthapuram - May 17 to May 23 - Kanakakkunnu\r\n\r\n    Thrissur - May 18 to May 24 - Swaraj Round, Vidhyarthi Corner', 16, '2025-04-13 09:20:01', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(72, 3, '2025-04-24', '2025-04-24', ' AWS Startup Day – Trivandrum ', 'Trivandrum – April 24 | KSUM, Thejaswini, Technopark', 'https://www.f9infotech.com/event/aws-startup-day-kerala-startup-mission-thiruvananthapuram-2025', 'https://maps.app.goo.gl/uhCzUGtY1NHjYd1f8', 'An exclusive in-person event by AWS x F9 Infotech x Kerala Startup Mission – designed for startup builders, founders, CXOs & tech leads!.\r\nDive into sessions on GTM strategies, Generative AI, cloud architecture, and more with AWS experts.\r\n\r\nPerks: AWS Activate $5000 credits, 1:1 “Know Your Architecture” zone, free managed services & AWS migration support!\r\n\r\nTime: 10 AM onwards \r\n', 12, '2025-04-18 13:07:20', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(73, 3, '2025-04-25', '2025-04-25', 'AWS Startup Day – Calicut', ' Calicut – April 25 | KSUM, Govt Cyberpark, Kozhikode', 'https://www.f9infotech.com/event/aws-startup-day-kerala-startup-mission-calicut-2025', 'https://maps.app.goo.gl/8MzUtTfYFne1ZhZK6', 'An exclusive in-person event by AWS x F9 Infotech x Kerala Startup Mission – designed for startup builders, founders, CXOs & tech leads!\r\nDive into sessions on GTM strategies, Generative AI, cloud architecture, and more with AWS experts.\r\nPerks: AWS Activate $5000 credits, 1:1 “Know Your Architecture” zone, free managed services & AWS migration support!\r\nTime: 10 AM onwards \r\n', 8, '2025-04-18 13:11:05', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(74, 2, '2025-05-03', '2025-05-03', 'Digital Marketing for Startup ', 'Online', 'https://ksum.in/M.I.N.D_events', 'https://maps.app.goo.gl/sbZSBxxPhWKSRU3r9', 'Startups, are you ready to supercharge your marketing game?\r\n\r\nJoin us for a 3 hour intensive workshop - &#39;The Digital Marketing Blueprint for Startups&#39;, led by Rajnish Narayanan, Head of Digital Marketing & AI, Brand Energy Digital. The workshop is designed to help you harness digital tools and strategies to grow and scale your venture. \r\n\r\nDate : 3 May 2025  \r\nTime : 10:00 AM\r\nVenue: Kerala Startup Mission, Technopark Trivandrum\r\nRegisteration fees: 250Rs\r\n\r\nLast date to apply: 27 April 2025\r\n\r\n Register now: https://ksum.in/M.I.N.D_events', 16, '2025-04-20 17:15:27', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(75, 2, '2025-04-26', '2025-04-26', 'Freelancing with Gemini Pro', 'Gmeet', 'https://forms.gle/4eFs9qv445VNYZ8Q6', 'https://maps.app.goo.gl/4fSGqdGdfMg9PkFz6', 'Ready to turn your tech skills into income in minutes? \r\n\r\nJoin this power-packed FREE webinar and learn how to freelance smarter with Gemini Pro! \r\n\r\nSpeaker : S Mohammed Shafeeq Hammed (Senior Software Engineer @ QBurst | AI Mentor @ TechySpot) \r\nDate: 26th April 2025 \r\nTime: 7.00 PM - 8.00 PM IST \r\nLocation: G-Meet \r\n\r\nJoin from anywhere \r\n\r\nWhy You Should Attend: \r\n- Build apps in minutes using Gemini Pro\r\n-  Discover real-world freelance hacks from a pro \r\n- Get an E-Certificate \r\n- Totally Free \r\n- No hidden charges! ', 16, '2025-04-22 15:33:01', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(76, 7, '2025-04-21', '2025-04-30', 'EXPO’25 (Govt of Kerala)', 'Thiruvananthapuram ', 'https://www.instagram.com/p/DIsfFX2SjAQ/', 'https://g.co/kgs/LuXLtNi', 'Again a happening week coming to Trivandrum, as a part of EXPO’25 (Govt of Kerala). Veedan, Stephen Devassy, Shahabaz Aman, Masala coffee is performing live at Nishagandi, Kanakakunnu “Free Entry&#34;', 12, '2025-04-22 16:13:03', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(77, 7, '2025-07-25', '2025-07-26', ' Kerala Innovation Festival (KIF)', 'Kerala Startup Mission, Kochi Register Now ', 'https://innovationfestival.in/', 'https://maps.app.goo.gl/Aa9SqWhoJRFJbsEm7', 'The Kerala Innovation Festival (KIF) is a celebration of ideas, creativity, and collaboration. It&#39;s where startups, creators, investors, policymakers, and students come together to shape the future through innovation. ', 2, '2025-04-23 10:42:21', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(78, 5, '2025-05-01', '2025-05-30', 'Applications invited for Cohort 7, from agri startups', 'Look website', 'https://rabi.kau.in', 'https://maps.app.goo.gl/Qa7TbnhCzy6H6JhK9', 'Applications invited for Cohort 7, from agri startups for financial assistance (grant up to Rs. 25 Lakhs).\r\n01/05/2025 to 30/05/2025', 16, '2025-04-23 10:50:33', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(79, 7, '2025-04-24', '2025-04-30', 'Ente Keralam 2025 ', 'Nagambadam Maithaanam', 'https://entekeralam.com.au/', 'https://maps.app.goo.gl/ZM89TmjHgzD6rUVq7', 'Ente Keralam is established for the purpose of promoting cultural and linguistic\r\nawareness and interest of Malayalee culture, its people, and its community', 7, '2025-04-26 12:16:20', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(80, 7, '2025-04-22', '2025-04-28', 'Ente Keralam 2025', 'S K M J School, Kalpetta', 'https://entekeralam.com.au/', 'https://maps.app.goo.gl/fJ1Dycrcx9nyVWha8', 'Ente Keralam is established for the purpose of promoting cultural and linguistic\r\nawareness and interest of Malayalee culture, its people, and its community', 14, '2025-04-26 12:18:49', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(81, 7, '2025-04-29', '2025-05-05', 'Ente Keralam 2025', 'Vaazhathoppu VHSE', 'https://entekeralam.com.au/', 'https://maps.app.goo.gl/Up3ZrfCQ2BckXQGp7', 'Ente Keralam is established for the purpose of promoting cultural and linguistic\r\nawareness and interest of Malayalee culture, its people, and its community', 3, '2025-04-26 12:19:59', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(82, 7, '2025-05-03', '2025-05-09', 'Ente Keralam 2025', 'Beach	', 'https://entekeralam.com.au/', 'https://maps.app.goo.gl/Up3ZrfCQ2BckXQGp7', 'Ente Keralam is established for the purpose of promoting cultural and linguistic\r\nawareness and interest of Malayalee culture, its people, and its community', 8, '2025-04-26 12:20:54', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(83, 7, '2025-04-04', '2025-04-10', 'Ente Keralam 2025', 'Near Indira Gandhi Stadium', 'https://entekeralam.com.au/', 'https://maps.app.goo.gl/xzXxfkyiYTXmWCi6A', 'Ente Keralam is established for the purpose of promoting cultural and linguistic\r\nawareness and interest of Malayalee culture, its people, and its community', 10, '2025-04-26 12:21:47', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(84, 7, '2025-05-06', '2025-05-12', 'Ente Keralam 2025', 'Beach', 'https://entekeralam.com.au/', 'https://maps.app.goo.gl/xzXxfkyiYTXmWCi6A', 'Ente Keralam is established for the purpose of promoting cultural and linguistic\r\nawareness and interest of Malayalee culture, its people, and its community', 1, '2025-04-26 12:22:41', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(85, 7, '2025-05-07', '2025-04-13', 'Ente Keralam 2025', 'Kottakkunnu	', 'https://entekeralam.com.au/', 'https://maps.app.goo.gl/D2qet9JyKQSu31NZ8', 'Ente Keralam is established for the purpose of promoting cultural and linguistic\r\nawareness and interest of Malayalee culture, its people, and its community', 9, '2025-04-26 12:23:42', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(86, 7, '2025-05-08', '2025-05-14', 'Ente Keralam 2025', 'Police Ground', 'https://entekeralam.com.au/', 'https://maps.app.goo.gl/waaQVwX364xrSi6d9', 'Ente Keralam is established for the purpose of promoting cultural and linguistic\r\nawareness and interest of Malayalee culture, its people, and its community', 4, '2025-04-26 12:24:39', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(87, 7, '2025-05-11', '2025-05-17', 'Ente Keralam 2025', 'Aashraamam', 'https://entekeralam.com.au/', 'https://maps.app.goo.gl/pNdKrHY8fT4a3cSi6', 'Ente Keralam is established for the purpose of promoting cultural and linguistic\r\nawareness and interest of Malayalee culture, its people, and its community', 6, '2025-04-26 12:25:34', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(88, 7, '2025-05-16', '2025-05-22', 'Ente Keralam 2025', 'Sabarimala Idathaavalam', 'https://entekeralam.com.au/', 'https://maps.app.goo.gl/TSAbeWjZ1LEPvfAm6', 'Ente Keralam is established for the purpose of promoting cultural and linguistic\r\nawareness and interest of Malayalee culture, its people, and its community', 11, '2025-04-26 12:26:40', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(89, 7, '2025-05-17', '2025-05-23', 'Ente Keralam 2025', 'Marine Drive', 'https://entekeralam.com.au/', 'https://maps.app.goo.gl/S66sjEiWDu8SMvF8A', 'Ente Keralam is established for the purpose of promoting cultural and linguistic\r\nawareness and interest of Malayalee culture, its people, and its community', 2, '2025-04-26 12:27:36', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(90, 7, '2025-05-17', '2025-04-23', 'Ente Keralam 2025', 'Kanakakkunnu	', 'https://entekeralam.com.au/', 'https://maps.app.goo.gl/hEZAgrRkhhKz2eh88', 'Ente Keralam is established for the purpose of promoting cultural and linguistic\r\nawareness and interest of Malayalee culture, its people, and its community', 12, '2025-04-26 12:28:36', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(91, 7, '2025-05-18', '2025-05-24', 'Ente Keralam 2025', 'Swaraj Round, Vidhyarthi Corner', 'https://entekeralam.com.au/', 'https://maps.app.goo.gl/zYFSn5Tf2g3Yw2Q26', 'Ente Keralam is established for the purpose of promoting cultural and linguistic\r\nawareness and interest of Malayalee culture, its people, and its community', 13, '2025-04-26 12:29:43', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(92, 4, '2025-05-02', '2025-05-03', '24 Global Connect Education Expo', ' Forum Kochi', 'https://www.twentyfournews.com/2025/04/04/twentyfour-news-with-global-connect-education-expo.html', 'https://maps.app.goo.gl/6CYMbLWUUNh3QWYD9', 'Expo', 2, '2025-05-01 09:45:12', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(93, 2, '2025-05-05', '2025-05-05', 'LinkUp', 'Online', 'https://forms.gle/wy6mW3uLDSBvk9q46', 'https://maps.app.goo.gl/EefgmMYWa8tz9scV7', 'Date: 5th May, 2025\r\nTime: 7:30 PM\r\nNavigate the world of professional networking with confidence — learn how to build an impressive LinkedIn profile, make meaningful connections, and unlock new career opportunities.\r\n\r\nThe NSS Units 174 & 262 of TKM College of Engineering presents LinkUp!, an interactive session on LinkedIn, crafted to help students understand the essentials of building a strong professional presence online.\r\n\r\nEquip yourself with the tools to take your first step into the professional world with clarity and confidence.\r\n', 16, '2025-05-04 05:32:20', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(94, 5, '2025-05-04', '2025-05-08', 'R|Elan™ Circular Design Challenge ', 'India', 'https://www.startupindia.gov.in/content/sih/en/ams-application/challenge.html?applicationId=67b58485e4b06e2290abe4d1', 'https://maps.app.goo.gl/v2QM5boJbppuaqww8', 'This global platform, emerged out of India, supports young fashion designers and entrepreneurs creating innovative circular solutions. \r\n\r\nIt aims to nurture environmental champions and promote sustainable practices in the fashion and textile industry. \r\n\r\nWinner receives ?15 lakh cash prize sponsored by R|Elan™\r\n\r\nRunner-up receives ?5 lakh cash prize sponsored by R|Elan™\r\n\r\nThrough funding, mentorship, market access, and promotion, the program helps shape future leaders who are transforming the industry with circular business models, in line with PM of India’s Mission LiFE.\r\n\r\namanda.cardoz@ril.com\r\ncirculardesignchallenge@gmail.com', 15, '2025-05-04 14:16:16', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(95, 5, '2025-05-01', '2025-05-11', 'Fisheries Startup Grand Challenge 2.0', 'India, Seed Grant for 10 Startups - Total (INR): INR 1,00,00,000/-', 'https://www.startupindia.gov.in/content/sih/en/ams-application/challenge.html?applicationId=67c93cc2e4b0229a79730c0b', 'https://maps.app.goo.gl/uDfmkM8S21XK1qtx8', '\r\n\r\nBuilding on the success of the first edition of their challenge, Department of Fisheries in collaboration with Startup India, DPIIT is launching the second Fisheries Startup Grand Challenge with the aim to further promote innovation and support budding entrepreneurs in fisheries and aquaculture.\r\n\r\n\r\n', 15, '2025-05-04 15:04:34', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(96, 5, '2025-05-01', '2025-05-15', 'Revolutionize Cooling with your Innovation', 'India', 'https://www.startupindia.gov.in/content/sih/en/ams-application/challenge.html?applicationId=67fd9e2de4b0e456e35a9ed7', 'https://maps.app.goo.gl/uDfmkM8S21XK1qtx8', '\r\n\r\nBlue Star Limited in collaboration with Startup India, DPIIT is inviting startups, innovators, and research teams to address critical challenges in the Indian HVAC & Refrigeration industry—focusing on Make in India, cost-effective, and high-performance solutions.\r\nCash prize of ?10,00,000 for the most impactful solution per problem statement', 15, '2025-05-04 15:06:03', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(97, 5, '2025-05-01', '2025-05-12', 'Hyperpure by Zomato Agri Innovation Challenge', 'India', 'https://www.startupindia.gov.in/content/sih/en/ams-application/challenge.html?applicationId=67f751f1e4b0e456e35934b1', 'https://maps.app.goo.gl/uDfmkM8S21XK1qtx8', 'Hyperpure by Zomato is a B2B service company tackling procurement and supply chain challenges in the HoReCa (Hotels, Restaurants, and Cloud Kitchens) and quick commerce industry.\r\n\r\n\r\nGlobally, 1.6 billion tons of food worth about $1.2 trillion is lost or goes to waste — one-third of the total amount of food produced. Boston Consulting Group (BCG) projects that between 2015 and 2030, the volume and dollar value of food loss will increase annually by 1.9% and 1.8%, respectively.\r\n', 15, '2025-05-04 15:08:50', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(98, 5, '2025-05-01', '2025-05-30', 'Flipkart- Tourism Challenge', 'India', 'https://www.startupindia.gov.in/content/sih/en/ams-application/challenge.html?applicationId=67fc9fbae4b0e456e35a5869', 'https://maps.app.goo.gl/uDfmkM8S21XK1qtx8', 'We are looking for solutions that can improve and solve for discoverability, affordability and experiences of travelers with travel destinations.\r\n- Winner gets a cash prize of INR 2.5 Lacs as a recognition to your innovation\r\n\r\n- Runner-up gets a cash prize of INR 1 Lac as our commitment to your innovation\r\n\r\n\r\n', 15, '2025-05-04 15:10:09', 1, 'Test', NULL, NULL, '2025-05-08 15:11:12'),
(99, 5, '2025-05-01', '2025-06-15', 'National Startup Awards 5.0', 'India', 'https://www.startupindia.gov.in/content/sih/en/nsa2025.html', 'https://g.co/kgs/hMJb3zv', 'NSA 5.0 aims to celebrate and empower startups that drive innovation, sustainability, and social impact, contributing to India&#39;s growth journey toward becoming a “Viksit Bharat”.', 15, '2025-05-17 15:34:08', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(100, 3, '2025-05-17', '2025-05-17', 'build AI with a conscience!', 'Tinkerspace kochi', 'https://app.tinkerhub.org/event/4Z8880T1YL', 'https://maps.app.goo.gl/mvVvPNzees32bbCT9', 'Devs, it’s time to build AI with a conscience!\r\nJoin us for Dev’s Guide to Build Responsible AI — a one-day intensive where ethics meets action.\r\n\r\nGet hands-on with real tools, explore AI policy, and learn how to spot the red flags before your models go live. From fairness to governance, it’s all happening here.\r\n\r\n TinkerSpace, Kochi\r\n 17th May 2025\r\n 10 AM – 5 PM\r\n Apply now: https://app.tinkerhub.org/event/4Z8880T1YL ', 15, '2025-05-13 08:25:24', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(101, 3, '2025-05-18', '2025-05-18', ' EdProSkills Upskilling Summit! ', 'Thiruvananthapuram', 'https://forms.gle/XY95AugA6nzKHrfu6', 'https://maps.app.goo.gl/TFrLBsoGWbyLSdxw7', 'Global Shapers Community Thiruvananthapuram Hub in collaboration with Christ (Deemed to be University) Nodal Office presents the? EdProSkills Upskilling Summit! ?\r\n\r\nIt’s time to Find Your Why, Vibe, and Tribe! ? Join us on May 18, 2025, for an electrifying experience where networking meets upskilling and passion meets purpose.\r\n\r\n? Why Pull Up?\r\n- Get the inside scoop on industry trends and career hacks.\r\n- Boost your skill set with hands-on workshops that hit different.\r\n- Connect with high-energy mentors, pros & peers who keep it real.\r\n- Learn how to slay the corporate game and make moves that matter.\r\n', 16, '2025-05-13 08:29:38', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(102, 3, '2025-05-16', '2025-05-31', ' 2-months industrial programs ', 'kerala', 'https://forms.gle/CrFoTZ5qiEYgGpyx6', 'http://www.corizo.in/', 'We are excited to present to you industry-ready 2-months industrial programs to help you explore the next step in the world of technology. The programs being offered include:  ? DATA SCIENCE ? CYBER SECURITY ? AI ? ML USING PYTHON ? WEB DEVELOPMENT ? ANDROID DEVELOPMENT ? CLOUD COMPUTING ? FINANCE ? DIGITAL MARKETING ? UI/UX', 16, '2025-05-16 15:36:22', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(103, 5, '2025-04-28', '2025-06-28', 'Sustainable Manufacturing Challenge', 'India', 'https://www.startupindia.gov.in/content/sih/en/ams-application/challenge.html?applicationId=6808ba00e4b0611108b154b6', 'https://g.co/kgs/hMJb3zv', 'Hungry for a real challenge with real-world impact? We&#39;ve got not one, but seven of them! Join the #BharatStartup Grand Challenge! Collaborate with CampX by Volvo Group and tackle real-world challenges. Apply now!', 15, '2025-05-17 15:35:44', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(104, 3, '2025-05-22', '2025-05-22', 'AI Day for Startups 2025', 'Kochi', 'https://aiday.startupmission.in/', 'https://maps.app.goo.gl/Aa9SqWhoJRFJbsEm7', 'AI Day for Startups is a series of multi-format events, designed by Google for Indian startups and hosted with the startup ecosystem partners across the country, to equip early-stage startups with the knowledge and tools to seamlessly integrate Generative AI solutions into their products. ', 2, '2025-05-17 15:45:45', 0, NULL, NULL, NULL, '0000-00-00 00:00:00'),
(105, 3, '2025-05-31', '2025-05-31', 'founder workshop', 'Thiruvananthapuram KSUM meetup Cafe, Thejaswini', 'https://makemypass.com/event/funding-growth-content-workshop-tvm', 'https://maps.app.goo.gl/K6Gs8D6B1vGyco6p7', ' a full-day founder workshop in Trivandrum on May 31 designed for founders who want to:\r\n\r\n * Raise capital\r\n* Build a scalable GTM\r\n* Strengthen their LinkedIn brand\r\n\r\nSpeakers:\r\n- Pushkar Singh (Tremis Capital)\r\n- Sandeep Balaji (IncX)\r\n', 12, '2025-05-20 15:08:23', 0, NULL, NULL, NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `event_category`
--

CREATE TABLE `event_category` (
  `category_id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `event_category`
--

INSERT INTO `event_category` (`category_id`, `category`, `created_at`) VALUES
(1, 'Tech Fest', '2025-03-27 09:58:45'),
(2, 'Webinar', '2025-03-27 09:58:45'),
(3, 'Workshop', '2025-03-27 09:58:45'),
(4, 'Seminars', '2025-03-27 09:58:45'),
(5, 'Presentations', '2025-03-27 09:58:45'),
(6, 'Conferences', '2025-03-27 09:58:45'),
(7, 'Cultural Events', '2025-03-27 09:58:45'),
(8, 'Sports Events', '2025-03-27 09:58:45'),
(9, 'Social', '2025-03-27 09:58:45'),
(10, 'Placement Drives', '2025-03-27 09:58:45'),
(11, 'Hackathon', '2025-04-13 05:59:08'),
(12, 'Free Credits', '2025-04-13 07:14:04');

-- --------------------------------------------------------

--
-- Table structure for table `event_impressions`
--

CREATE TABLE `event_impressions` (
  `id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `timestamp` text DEFAULT NULL,
  `source` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `event_impressions`
--

INSERT INTO `event_impressions` (`id`, `event_id`, `user_id`, `timestamp`, `source`) VALUES
(5, 66, '30e46386-4861-4c2a-ad47-0f2716251e76', '2025-05-03 19:28:30', 'events_list'),
(6, 67, '30e46386-4861-4c2a-ad47-0f2716251e76', '2025-05-03 19:28:30', 'events_list'),
(7, 71, '30e46386-4861-4c2a-ad47-0f2716251e76', '2025-05-03 19:28:30', 'events_list'),
(8, 81, '30e46386-4861-4c2a-ad47-0f2716251e76', '2025-05-03 19:28:30', 'events_list'),
(9, 78, '30e46386-4861-4c2a-ad47-0f2716251e76', '2025-05-03 19:28:30', 'events_list'),
(10, 92, '30e46386-4861-4c2a-ad47-0f2716251e76', '2025-05-03 19:28:30', 'events_list'),
(11, 74, '30e46386-4861-4c2a-ad47-0f2716251e76', '2025-05-03 19:28:30', 'events_list'),
(12, 82, '30e46386-4861-4c2a-ad47-0f2716251e76', '2025-05-03 19:28:30', 'events_list'),
(13, 84, '30e46386-4861-4c2a-ad47-0f2716251e76', '2025-05-03 19:28:30', 'events_list'),
(14, 86, '30e46386-4861-4c2a-ad47-0f2716251e76', '2025-05-03 19:28:30', 'events_list'),
(15, 66, '62a121d9-fa6f-47e1-9d89-0208590e11f6', '2025-05-03 15:29:21', 'event_detail'),
(16, 67, '62a121d9-fa6f-47e1-9d89-0208590e11f6', '2025-05-03 15:30:16', 'event_detail'),
(17, 66, '62a121d9-fa6f-47e1-9d89-0208590e11f6', '2025-05-03 15:30:21', 'event_detail'),
(18, 67, '62a121d9-fa6f-47e1-9d89-0208590e11f6', '2025-05-03 15:31:35', 'event_detail'),
(19, 71, '62a121d9-fa6f-47e1-9d89-0208590e11f6', '2025-05-03 15:32:02', 'event_detail'),
(20, 66, 'f5bcac5b-3a18-45fc-8fc5-d35e54d3f053', '2025-05-04 13:01:42', 'events_list'),
(21, 67, 'f5bcac5b-3a18-45fc-8fc5-d35e54d3f053', '2025-05-04 13:01:42', 'events_list'),
(22, 71, 'f5bcac5b-3a18-45fc-8fc5-d35e54d3f053', '2025-05-04 13:01:42', 'events_list'),
(23, 81, 'f5bcac5b-3a18-45fc-8fc5-d35e54d3f053', '2025-05-04 13:01:42', 'events_list'),
(24, 78, 'f5bcac5b-3a18-45fc-8fc5-d35e54d3f053', '2025-05-04 13:01:42', 'events_list'),
(25, 82, 'f5bcac5b-3a18-45fc-8fc5-d35e54d3f053', '2025-05-04 13:01:42', 'events_list'),
(26, 93, 'f5bcac5b-3a18-45fc-8fc5-d35e54d3f053', '2025-05-04 13:01:42', 'events_list'),
(27, 84, 'f5bcac5b-3a18-45fc-8fc5-d35e54d3f053', '2025-05-04 13:01:42', 'events_list'),
(28, 86, 'f5bcac5b-3a18-45fc-8fc5-d35e54d3f053', '2025-05-04 13:01:42', 'events_list'),
(29, 87, 'f5bcac5b-3a18-45fc-8fc5-d35e54d3f053', '2025-05-04 13:01:42', 'events_list'),
(30, 66, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-05 05:53:26', 'events_list'),
(31, 67, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-05 05:53:26', 'events_list'),
(32, 71, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-05 05:53:26', 'events_list'),
(33, 81, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-05 05:53:26', 'events_list'),
(34, 78, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-05 05:53:26', 'events_list'),
(35, 95, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-05 05:53:26', 'events_list'),
(36, 96, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-05 05:53:26', 'events_list'),
(37, 97, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-05 05:53:26', 'events_list'),
(38, 98, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-05 05:53:26', 'events_list'),
(39, 82, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-05 05:53:26', 'events_list'),
(40, 66, '3a08d9d8-4dae-4908-b240-5a8933a4add9', '2025-05-04 15:28:04', 'events_list'),
(41, 67, '3a08d9d8-4dae-4908-b240-5a8933a4add9', '2025-05-04 15:28:04', 'events_list'),
(42, 71, '3a08d9d8-4dae-4908-b240-5a8933a4add9', '2025-05-04 15:28:04', 'events_list'),
(43, 81, '3a08d9d8-4dae-4908-b240-5a8933a4add9', '2025-05-04 15:28:04', 'events_list'),
(44, 78, '3a08d9d8-4dae-4908-b240-5a8933a4add9', '2025-05-04 15:28:04', 'events_list'),
(45, 82, '3a08d9d8-4dae-4908-b240-5a8933a4add9', '2025-05-04 15:28:04', 'events_list'),
(46, 93, '3a08d9d8-4dae-4908-b240-5a8933a4add9', '2025-05-04 15:28:04', 'events_list'),
(47, 84, '3a08d9d8-4dae-4908-b240-5a8933a4add9', '2025-05-04 15:28:04', 'events_list'),
(48, 86, '3a08d9d8-4dae-4908-b240-5a8933a4add9', '2025-05-04 15:28:04', 'events_list'),
(49, 87, '3a08d9d8-4dae-4908-b240-5a8933a4add9', '2025-05-04 15:28:04', 'events_list'),
(50, 66, '6a9912f9-1cdd-4f7a-bd5b-8937401177c4', '2025-05-04 16:23:12', 'events_list'),
(51, 67, '6a9912f9-1cdd-4f7a-bd5b-8937401177c4', '2025-05-04 16:23:12', 'events_list'),
(52, 71, '6a9912f9-1cdd-4f7a-bd5b-8937401177c4', '2025-05-04 16:23:12', 'events_list'),
(53, 81, '6a9912f9-1cdd-4f7a-bd5b-8937401177c4', '2025-05-04 16:23:12', 'events_list'),
(54, 78, '6a9912f9-1cdd-4f7a-bd5b-8937401177c4', '2025-05-04 16:23:12', 'events_list'),
(55, 82, '6a9912f9-1cdd-4f7a-bd5b-8937401177c4', '2025-05-04 16:23:12', 'events_list'),
(56, 93, '6a9912f9-1cdd-4f7a-bd5b-8937401177c4', '2025-05-04 16:23:12', 'events_list'),
(57, 84, '6a9912f9-1cdd-4f7a-bd5b-8937401177c4', '2025-05-04 16:23:12', 'events_list'),
(58, 86, '6a9912f9-1cdd-4f7a-bd5b-8937401177c4', '2025-05-04 16:23:12', 'events_list'),
(59, 87, '6a9912f9-1cdd-4f7a-bd5b-8937401177c4', '2025-05-04 16:23:12', 'events_list'),
(60, 66, '6a9912f9-1cdd-4f7a-bd5b-8937401177c4', '2025-05-04 16:23:17', 'event_detail'),
(61, 67, '6a9912f9-1cdd-4f7a-bd5b-8937401177c4', '2025-05-04 16:23:34', 'event_detail'),
(62, 71, '6a9912f9-1cdd-4f7a-bd5b-8937401177c4', '2025-05-04 16:23:36', 'event_detail'),
(63, 67, '6a9912f9-1cdd-4f7a-bd5b-8937401177c4', '2025-05-04 16:25:55', 'event_detail'),
(64, 66, '6a9912f9-1cdd-4f7a-bd5b-8937401177c4', '2025-05-04 16:26:45', 'events_list'),
(65, 67, '6a9912f9-1cdd-4f7a-bd5b-8937401177c4', '2025-05-04 16:26:45', 'events_list'),
(66, 71, '6a9912f9-1cdd-4f7a-bd5b-8937401177c4', '2025-05-04 16:26:45', 'events_list'),
(67, 81, '6a9912f9-1cdd-4f7a-bd5b-8937401177c4', '2025-05-04 16:26:45', 'events_list'),
(68, 78, '6a9912f9-1cdd-4f7a-bd5b-8937401177c4', '2025-05-04 16:26:45', 'events_list'),
(69, 82, '6a9912f9-1cdd-4f7a-bd5b-8937401177c4', '2025-05-04 16:26:45', 'events_list'),
(70, 93, '6a9912f9-1cdd-4f7a-bd5b-8937401177c4', '2025-05-04 16:26:45', 'events_list'),
(71, 84, '6a9912f9-1cdd-4f7a-bd5b-8937401177c4', '2025-05-04 16:26:45', 'events_list'),
(72, 86, '6a9912f9-1cdd-4f7a-bd5b-8937401177c4', '2025-05-04 16:26:45', 'events_list'),
(73, 87, '6a9912f9-1cdd-4f7a-bd5b-8937401177c4', '2025-05-04 16:26:45', 'events_list'),
(74, 66, '45390c52-5b0e-4cf7-a652-9b95b9175feb', '2025-05-05 08:51:43', 'event_detail'),
(75, 78, '45390c52-5b0e-4cf7-a652-9b95b9175feb', '2025-05-05 08:51:54', 'event_detail'),
(76, 66, '3709c6ec-68b2-4248-825e-1616f80b6456', '2025-05-04 07:35:51', 'events_list'),
(77, 67, '3709c6ec-68b2-4248-825e-1616f80b6456', '2025-05-04 07:35:51', 'events_list'),
(78, 71, '3709c6ec-68b2-4248-825e-1616f80b6456', '2025-05-04 07:35:51', 'events_list'),
(79, 81, '3709c6ec-68b2-4248-825e-1616f80b6456', '2025-05-04 07:35:51', 'events_list'),
(80, 78, '3709c6ec-68b2-4248-825e-1616f80b6456', '2025-05-04 07:35:51', 'events_list'),
(81, 82, '3709c6ec-68b2-4248-825e-1616f80b6456', '2025-05-04 07:35:51', 'events_list'),
(82, 84, '3709c6ec-68b2-4248-825e-1616f80b6456', '2025-05-04 07:35:51', 'events_list'),
(83, 86, '3709c6ec-68b2-4248-825e-1616f80b6456', '2025-05-04 07:35:51', 'events_list'),
(84, 87, '3709c6ec-68b2-4248-825e-1616f80b6456', '2025-05-04 07:35:51', 'events_list'),
(85, 88, '3709c6ec-68b2-4248-825e-1616f80b6456', '2025-05-04 07:35:51', 'events_list'),
(86, 66, '3e4d46f9-cd08-4c29-a593-32885bcd1b40', '2025-05-03 21:57:00', 'events_list'),
(87, 67, '3e4d46f9-cd08-4c29-a593-32885bcd1b40', '2025-05-03 21:57:00', 'events_list'),
(88, 71, '3e4d46f9-cd08-4c29-a593-32885bcd1b40', '2025-05-03 21:57:00', 'events_list'),
(89, 81, '3e4d46f9-cd08-4c29-a593-32885bcd1b40', '2025-05-03 21:57:00', 'events_list'),
(90, 78, '3e4d46f9-cd08-4c29-a593-32885bcd1b40', '2025-05-03 21:57:00', 'events_list'),
(91, 92, '3e4d46f9-cd08-4c29-a593-32885bcd1b40', '2025-05-03 21:57:00', 'events_list'),
(92, 74, '3e4d46f9-cd08-4c29-a593-32885bcd1b40', '2025-05-03 21:57:00', 'events_list'),
(93, 82, '3e4d46f9-cd08-4c29-a593-32885bcd1b40', '2025-05-03 21:57:00', 'events_list'),
(94, 84, '3e4d46f9-cd08-4c29-a593-32885bcd1b40', '2025-05-03 21:57:00', 'events_list'),
(95, 86, '3e4d46f9-cd08-4c29-a593-32885bcd1b40', '2025-05-03 21:57:00', 'events_list'),
(96, 66, '9ed5e697-8ac4-4042-83da-20ee135e3de0', '2025-05-05 12:45:31', 'events_list'),
(97, 67, '9ed5e697-8ac4-4042-83da-20ee135e3de0', '2025-05-05 12:45:31', 'events_list'),
(98, 71, '9ed5e697-8ac4-4042-83da-20ee135e3de0', '2025-05-05 12:45:31', 'events_list'),
(99, 81, '9ed5e697-8ac4-4042-83da-20ee135e3de0', '2025-05-05 12:45:31', 'events_list'),
(100, 78, '9ed5e697-8ac4-4042-83da-20ee135e3de0', '2025-05-05 12:45:31', 'events_list'),
(101, 95, '9ed5e697-8ac4-4042-83da-20ee135e3de0', '2025-05-05 12:45:31', 'events_list'),
(102, 96, '9ed5e697-8ac4-4042-83da-20ee135e3de0', '2025-05-05 12:45:31', 'events_list'),
(103, 97, '9ed5e697-8ac4-4042-83da-20ee135e3de0', '2025-05-05 12:45:31', 'events_list'),
(104, 98, '9ed5e697-8ac4-4042-83da-20ee135e3de0', '2025-05-05 12:45:31', 'events_list'),
(105, 82, '9ed5e697-8ac4-4042-83da-20ee135e3de0', '2025-05-05 12:45:31', 'events_list'),
(106, 66, '642a0963-4934-4206-a2d3-759d01a221d4', '2025-05-03 12:36:40', 'events_list'),
(107, 67, '642a0963-4934-4206-a2d3-759d01a221d4', '2025-05-03 12:36:40', 'events_list'),
(108, 71, '642a0963-4934-4206-a2d3-759d01a221d4', '2025-05-03 12:36:40', 'events_list'),
(109, 81, '642a0963-4934-4206-a2d3-759d01a221d4', '2025-05-03 12:36:40', 'events_list'),
(110, 78, '642a0963-4934-4206-a2d3-759d01a221d4', '2025-05-03 12:36:40', 'events_list'),
(111, 92, '642a0963-4934-4206-a2d3-759d01a221d4', '2025-05-03 12:36:40', 'events_list'),
(112, 74, '642a0963-4934-4206-a2d3-759d01a221d4', '2025-05-03 12:36:40', 'events_list'),
(113, 82, '642a0963-4934-4206-a2d3-759d01a221d4', '2025-05-03 12:36:40', 'events_list'),
(114, 84, '642a0963-4934-4206-a2d3-759d01a221d4', '2025-05-03 12:36:40', 'events_list'),
(115, 86, '642a0963-4934-4206-a2d3-759d01a221d4', '2025-05-03 12:36:40', 'events_list'),
(116, 66, 'd38e78c3-52d6-4f52-b0e0-b2e5048d5489', '2025-05-04 18:36:57', 'events_list'),
(117, 67, 'd38e78c3-52d6-4f52-b0e0-b2e5048d5489', '2025-05-04 18:36:57', 'events_list'),
(118, 71, 'd38e78c3-52d6-4f52-b0e0-b2e5048d5489', '2025-05-04 18:36:57', 'events_list'),
(119, 81, 'd38e78c3-52d6-4f52-b0e0-b2e5048d5489', '2025-05-04 18:36:57', 'events_list'),
(120, 78, 'd38e78c3-52d6-4f52-b0e0-b2e5048d5489', '2025-05-04 18:36:57', 'events_list'),
(121, 82, 'd38e78c3-52d6-4f52-b0e0-b2e5048d5489', '2025-05-04 18:36:57', 'events_list'),
(122, 93, 'd38e78c3-52d6-4f52-b0e0-b2e5048d5489', '2025-05-04 18:36:57', 'events_list'),
(123, 84, 'd38e78c3-52d6-4f52-b0e0-b2e5048d5489', '2025-05-04 18:36:57', 'events_list'),
(124, 86, 'd38e78c3-52d6-4f52-b0e0-b2e5048d5489', '2025-05-04 18:36:57', 'events_list'),
(125, 87, 'd38e78c3-52d6-4f52-b0e0-b2e5048d5489', '2025-05-04 18:36:57', 'events_list'),
(126, 66, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 07:54:47', 'events_list'),
(127, 67, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 07:54:47', 'events_list'),
(128, 71, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 07:54:47', 'events_list'),
(129, 81, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 07:54:47', 'events_list'),
(130, 78, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 07:54:47', 'events_list'),
(131, 82, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 07:54:47', 'events_list'),
(132, 93, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 07:54:47', 'events_list'),
(133, 84, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 07:54:47', 'events_list'),
(134, 86, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 07:54:47', 'events_list'),
(135, 87, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 07:54:47', 'events_list'),
(136, 78, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 07:54:52', 'events_list'),
(137, 66, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 07:54:55', 'events_list'),
(138, 67, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 07:54:55', 'events_list'),
(139, 71, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 07:54:55', 'events_list'),
(140, 78, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 07:54:55', 'events_list'),
(141, 82, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 07:54:55', 'events_list'),
(142, 84, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 07:54:55', 'events_list'),
(143, 86, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 07:54:55', 'events_list'),
(144, 66, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:41:32', 'events_list'),
(145, 67, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:41:32', 'events_list'),
(146, 71, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:41:32', 'events_list'),
(147, 81, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:41:32', 'events_list'),
(148, 78, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:41:32', 'events_list'),
(149, 95, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:41:32', 'events_list'),
(150, 96, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:41:32', 'events_list'),
(151, 97, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:41:32', 'events_list'),
(152, 98, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:41:32', 'events_list'),
(153, 82, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:41:32', 'events_list'),
(154, 66, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:42:26', 'events_list'),
(155, 67, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:42:26', 'events_list'),
(156, 71, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:42:26', 'events_list'),
(157, 81, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:42:26', 'events_list'),
(158, 78, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:42:26', 'events_list'),
(159, 95, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:42:26', 'events_list'),
(160, 96, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:42:26', 'events_list'),
(161, 97, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:42:26', 'events_list'),
(162, 98, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:42:26', 'events_list'),
(163, 82, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:42:26', 'events_list'),
(164, 66, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:42:31', 'events_list'),
(165, 67, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:42:31', 'events_list'),
(166, 71, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:42:31', 'events_list'),
(167, 81, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:42:31', 'events_list'),
(168, 78, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:42:31', 'events_list'),
(169, 95, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:42:31', 'events_list'),
(170, 96, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:42:31', 'events_list'),
(171, 97, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:42:31', 'events_list'),
(172, 98, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:42:31', 'events_list'),
(173, 82, 'b91c9c9e-a24f-400d-a7b0-c2d6bc20eb77', '2025-05-05 13:42:31', 'events_list'),
(174, 66, '05df1fe5-b018-4d1d-bb3d-a2ff505cf392', '2025-05-06 16:31:01', 'events_list'),
(175, 67, '05df1fe5-b018-4d1d-bb3d-a2ff505cf392', '2025-05-06 16:31:01', 'events_list'),
(176, 71, '05df1fe5-b018-4d1d-bb3d-a2ff505cf392', '2025-05-06 16:31:01', 'events_list'),
(177, 78, '05df1fe5-b018-4d1d-bb3d-a2ff505cf392', '2025-05-06 16:31:01', 'events_list'),
(178, 95, '05df1fe5-b018-4d1d-bb3d-a2ff505cf392', '2025-05-06 16:31:01', 'events_list'),
(179, 96, '05df1fe5-b018-4d1d-bb3d-a2ff505cf392', '2025-05-06 16:31:01', 'events_list'),
(180, 97, '05df1fe5-b018-4d1d-bb3d-a2ff505cf392', '2025-05-06 16:31:01', 'events_list'),
(181, 98, '05df1fe5-b018-4d1d-bb3d-a2ff505cf392', '2025-05-06 16:31:01', 'events_list'),
(182, 82, '05df1fe5-b018-4d1d-bb3d-a2ff505cf392', '2025-05-06 16:31:01', 'events_list'),
(183, 94, '05df1fe5-b018-4d1d-bb3d-a2ff505cf392', '2025-05-06 16:31:01', 'events_list'),
(184, 66, '2cf545a5-818d-44f3-bee0-9b6872df4b3e', '2025-05-06 18:50:32', 'events_list'),
(185, 67, '2cf545a5-818d-44f3-bee0-9b6872df4b3e', '2025-05-06 18:50:32', 'events_list'),
(186, 71, '2cf545a5-818d-44f3-bee0-9b6872df4b3e', '2025-05-06 18:50:32', 'events_list'),
(187, 78, '2cf545a5-818d-44f3-bee0-9b6872df4b3e', '2025-05-06 18:50:32', 'events_list'),
(188, 95, '2cf545a5-818d-44f3-bee0-9b6872df4b3e', '2025-05-06 18:50:32', 'events_list'),
(189, 96, '2cf545a5-818d-44f3-bee0-9b6872df4b3e', '2025-05-06 18:50:32', 'events_list'),
(190, 97, '2cf545a5-818d-44f3-bee0-9b6872df4b3e', '2025-05-06 18:50:32', 'events_list'),
(191, 98, '2cf545a5-818d-44f3-bee0-9b6872df4b3e', '2025-05-06 18:50:32', 'events_list'),
(192, 82, '2cf545a5-818d-44f3-bee0-9b6872df4b3e', '2025-05-06 18:50:32', 'events_list'),
(193, 94, '2cf545a5-818d-44f3-bee0-9b6872df4b3e', '2025-05-06 18:50:32', 'events_list'),
(194, 78, '2cf545a5-818d-44f3-bee0-9b6872df4b3e', '2025-05-06 18:50:33', 'events_list'),
(195, 98, '2cf545a5-818d-44f3-bee0-9b6872df4b3e', '2025-05-06 18:50:33', 'events_list'),
(196, 66, '1b1955cc-2e86-46b5-b54d-0861f7aefa63', '2025-05-07 07:53:50', 'events_list'),
(197, 67, '1b1955cc-2e86-46b5-b54d-0861f7aefa63', '2025-05-07 07:53:50', 'events_list'),
(198, 71, '1b1955cc-2e86-46b5-b54d-0861f7aefa63', '2025-05-07 07:53:50', 'events_list'),
(199, 78, '1b1955cc-2e86-46b5-b54d-0861f7aefa63', '2025-05-07 07:53:50', 'events_list'),
(200, 95, '1b1955cc-2e86-46b5-b54d-0861f7aefa63', '2025-05-07 07:53:50', 'events_list'),
(201, 96, '1b1955cc-2e86-46b5-b54d-0861f7aefa63', '2025-05-07 07:53:50', 'events_list'),
(202, 97, '1b1955cc-2e86-46b5-b54d-0861f7aefa63', '2025-05-07 07:53:50', 'events_list'),
(203, 98, '1b1955cc-2e86-46b5-b54d-0861f7aefa63', '2025-05-07 07:53:50', 'events_list'),
(204, 82, '1b1955cc-2e86-46b5-b54d-0861f7aefa63', '2025-05-07 07:53:50', 'events_list'),
(205, 94, '1b1955cc-2e86-46b5-b54d-0861f7aefa63', '2025-05-07 07:53:50', 'events_list'),
(206, 71, '1b1955cc-2e86-46b5-b54d-0861f7aefa63', '2025-05-07 07:54:11', 'event_detail'),
(207, 66, '1b1955cc-2e86-46b5-b54d-0861f7aefa63', '2025-05-07 07:54:45', 'event_detail'),
(208, 66, 'e76e4a57-7d3f-47bf-9727-36504ef8611f', '2025-05-07 10:46:30', 'events_list'),
(209, 67, 'e76e4a57-7d3f-47bf-9727-36504ef8611f', '2025-05-07 10:46:30', 'events_list'),
(210, 71, 'e76e4a57-7d3f-47bf-9727-36504ef8611f', '2025-05-07 10:46:30', 'events_list'),
(211, 78, 'e76e4a57-7d3f-47bf-9727-36504ef8611f', '2025-05-07 10:46:30', 'events_list'),
(212, 95, 'e76e4a57-7d3f-47bf-9727-36504ef8611f', '2025-05-07 10:46:30', 'events_list'),
(213, 96, 'e76e4a57-7d3f-47bf-9727-36504ef8611f', '2025-05-07 10:46:30', 'events_list'),
(214, 97, 'e76e4a57-7d3f-47bf-9727-36504ef8611f', '2025-05-07 10:46:30', 'events_list'),
(215, 98, 'e76e4a57-7d3f-47bf-9727-36504ef8611f', '2025-05-07 10:46:30', 'events_list'),
(216, 82, 'e76e4a57-7d3f-47bf-9727-36504ef8611f', '2025-05-07 10:46:30', 'events_list'),
(217, 94, 'e76e4a57-7d3f-47bf-9727-36504ef8611f', '2025-05-07 10:46:30', 'events_list'),
(218, 66, 'd3ed26c1-3d65-4158-9b90-cecddffbcb75', '2025-05-08 00:16:59', 'events_list'),
(219, 67, 'd3ed26c1-3d65-4158-9b90-cecddffbcb75', '2025-05-08 00:16:59', 'events_list'),
(220, 71, 'd3ed26c1-3d65-4158-9b90-cecddffbcb75', '2025-05-08 00:16:59', 'events_list'),
(221, 78, 'd3ed26c1-3d65-4158-9b90-cecddffbcb75', '2025-05-08 00:16:59', 'events_list'),
(222, 95, 'd3ed26c1-3d65-4158-9b90-cecddffbcb75', '2025-05-08 00:16:59', 'events_list'),
(223, 96, 'd3ed26c1-3d65-4158-9b90-cecddffbcb75', '2025-05-08 00:16:59', 'events_list'),
(224, 97, 'd3ed26c1-3d65-4158-9b90-cecddffbcb75', '2025-05-08 00:16:59', 'events_list'),
(225, 98, 'd3ed26c1-3d65-4158-9b90-cecddffbcb75', '2025-05-08 00:16:59', 'events_list'),
(226, 82, 'd3ed26c1-3d65-4158-9b90-cecddffbcb75', '2025-05-08 00:16:59', 'events_list'),
(227, 94, 'd3ed26c1-3d65-4158-9b90-cecddffbcb75', '2025-05-08 00:16:59', 'events_list'),
(228, 66, 'd3ed26c1-3d65-4158-9b90-cecddffbcb75', '2025-05-08 00:17:04', 'event_detail'),
(229, 66, 'd3ed26c1-3d65-4158-9b90-cecddffbcb75', '2025-05-08 00:17:06', 'event_detail'),
(230, 66, 'f45940fd-c112-42fa-8f46-71283b5a9af1', '2025-05-07 17:50:09', 'events_list'),
(231, 67, 'f45940fd-c112-42fa-8f46-71283b5a9af1', '2025-05-07 17:50:09', 'events_list'),
(232, 71, 'f45940fd-c112-42fa-8f46-71283b5a9af1', '2025-05-07 17:50:09', 'events_list'),
(233, 78, 'f45940fd-c112-42fa-8f46-71283b5a9af1', '2025-05-07 17:50:09', 'events_list'),
(234, 95, 'f45940fd-c112-42fa-8f46-71283b5a9af1', '2025-05-07 17:50:09', 'events_list'),
(235, 96, 'f45940fd-c112-42fa-8f46-71283b5a9af1', '2025-05-07 17:50:09', 'events_list'),
(236, 97, 'f45940fd-c112-42fa-8f46-71283b5a9af1', '2025-05-07 17:50:09', 'events_list'),
(237, 98, 'f45940fd-c112-42fa-8f46-71283b5a9af1', '2025-05-07 17:50:09', 'events_list'),
(238, 82, 'f45940fd-c112-42fa-8f46-71283b5a9af1', '2025-05-07 17:50:09', 'events_list'),
(239, 94, 'f45940fd-c112-42fa-8f46-71283b5a9af1', '2025-05-07 17:50:09', 'events_list'),
(240, 66, 'd2a35cd8-5121-40fa-b395-c4e08f3467fc', '2025-05-08 02:04:21', 'events_list'),
(241, 67, 'd2a35cd8-5121-40fa-b395-c4e08f3467fc', '2025-05-08 02:04:21', 'events_list'),
(242, 71, 'd2a35cd8-5121-40fa-b395-c4e08f3467fc', '2025-05-08 02:04:21', 'events_list'),
(243, 78, 'd2a35cd8-5121-40fa-b395-c4e08f3467fc', '2025-05-08 02:04:21', 'events_list'),
(244, 95, 'd2a35cd8-5121-40fa-b395-c4e08f3467fc', '2025-05-08 02:04:21', 'events_list'),
(245, 96, 'd2a35cd8-5121-40fa-b395-c4e08f3467fc', '2025-05-08 02:04:21', 'events_list'),
(246, 97, 'd2a35cd8-5121-40fa-b395-c4e08f3467fc', '2025-05-08 02:04:21', 'events_list'),
(247, 98, 'd2a35cd8-5121-40fa-b395-c4e08f3467fc', '2025-05-08 02:04:21', 'events_list'),
(248, 82, 'd2a35cd8-5121-40fa-b395-c4e08f3467fc', '2025-05-08 02:04:21', 'events_list'),
(249, 94, 'd2a35cd8-5121-40fa-b395-c4e08f3467fc', '2025-05-08 02:04:21', 'events_list'),
(250, 71, 'd2a35cd8-5121-40fa-b395-c4e08f3467fc', '2025-05-08 02:04:28', 'event_detail'),
(251, 66, '5a3c8437-0014-41c4-97f0-75129b5dc49f', '2025-05-08 13:45:48', 'events_list'),
(252, 67, '5a3c8437-0014-41c4-97f0-75129b5dc49f', '2025-05-08 13:45:48', 'events_list'),
(253, 71, '5a3c8437-0014-41c4-97f0-75129b5dc49f', '2025-05-08 13:45:48', 'events_list'),
(254, 78, '5a3c8437-0014-41c4-97f0-75129b5dc49f', '2025-05-08 13:45:48', 'events_list'),
(255, 95, '5a3c8437-0014-41c4-97f0-75129b5dc49f', '2025-05-08 13:45:48', 'events_list'),
(256, 96, '5a3c8437-0014-41c4-97f0-75129b5dc49f', '2025-05-08 13:45:48', 'events_list'),
(257, 97, '5a3c8437-0014-41c4-97f0-75129b5dc49f', '2025-05-08 13:45:48', 'events_list'),
(258, 98, '5a3c8437-0014-41c4-97f0-75129b5dc49f', '2025-05-08 13:45:48', 'events_list'),
(259, 82, '5a3c8437-0014-41c4-97f0-75129b5dc49f', '2025-05-08 13:45:48', 'events_list'),
(260, 94, '5a3c8437-0014-41c4-97f0-75129b5dc49f', '2025-05-08 13:45:48', 'events_list'),
(261, 66, 'f6b3a866-76d9-442e-b105-e2e9b9a17f0a', '2025-05-08 14:31:39', 'events_list'),
(262, 67, 'f6b3a866-76d9-442e-b105-e2e9b9a17f0a', '2025-05-08 14:31:39', 'events_list'),
(263, 71, 'f6b3a866-76d9-442e-b105-e2e9b9a17f0a', '2025-05-08 14:31:39', 'events_list'),
(264, 78, 'f6b3a866-76d9-442e-b105-e2e9b9a17f0a', '2025-05-08 14:31:39', 'events_list'),
(265, 95, 'f6b3a866-76d9-442e-b105-e2e9b9a17f0a', '2025-05-08 14:31:39', 'events_list'),
(266, 96, 'f6b3a866-76d9-442e-b105-e2e9b9a17f0a', '2025-05-08 14:31:39', 'events_list'),
(267, 97, 'f6b3a866-76d9-442e-b105-e2e9b9a17f0a', '2025-05-08 14:31:39', 'events_list'),
(268, 98, 'f6b3a866-76d9-442e-b105-e2e9b9a17f0a', '2025-05-08 14:31:39', 'events_list'),
(269, 82, 'f6b3a866-76d9-442e-b105-e2e9b9a17f0a', '2025-05-08 14:31:39', 'events_list'),
(270, 94, 'f6b3a866-76d9-442e-b105-e2e9b9a17f0a', '2025-05-08 14:31:39', 'events_list'),
(271, 66, 'f6b3a866-76d9-442e-b105-e2e9b9a17f0a', '2025-05-08 14:31:43', 'event_detail'),
(272, 98, 'f6b3a866-76d9-442e-b105-e2e9b9a17f0a', '2025-05-08 14:31:57', 'event_detail'),
(273, 66, '05dd8cf8-899f-4329-a828-0a602571054f', '2025-05-08 16:11:14', 'event_detail'),
(274, 78, '05dd8cf8-899f-4329-a828-0a602571054f', '2025-05-08 16:11:24', 'event_detail'),
(275, 84, '05dd8cf8-899f-4329-a828-0a602571054f', '2025-05-08 16:11:32', 'event_detail'),
(276, 66, '05dd8cf8-899f-4329-a828-0a602571054f', '2025-05-08 16:12:22', 'events_list'),
(277, 67, '05dd8cf8-899f-4329-a828-0a602571054f', '2025-05-08 16:12:22', 'events_list'),
(278, 71, '05dd8cf8-899f-4329-a828-0a602571054f', '2025-05-08 16:12:22', 'events_list'),
(279, 78, '05dd8cf8-899f-4329-a828-0a602571054f', '2025-05-08 16:12:22', 'events_list'),
(280, 95, '05dd8cf8-899f-4329-a828-0a602571054f', '2025-05-08 16:12:22', 'events_list'),
(281, 96, '05dd8cf8-899f-4329-a828-0a602571054f', '2025-05-08 16:12:22', 'events_list'),
(282, 97, '05dd8cf8-899f-4329-a828-0a602571054f', '2025-05-08 16:12:22', 'events_list'),
(283, 98, '05dd8cf8-899f-4329-a828-0a602571054f', '2025-05-08 16:12:22', 'events_list'),
(284, 82, '05dd8cf8-899f-4329-a828-0a602571054f', '2025-05-08 16:12:22', 'events_list'),
(285, 94, '05dd8cf8-899f-4329-a828-0a602571054f', '2025-05-08 16:12:22', 'events_list'),
(286, 66, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:35', 'events_list'),
(287, 67, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:35', 'events_list'),
(288, 71, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:35', 'events_list'),
(289, 78, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:35', 'events_list'),
(290, 95, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:35', 'events_list'),
(291, 96, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:35', 'events_list'),
(292, 97, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:35', 'events_list'),
(293, 98, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:35', 'events_list'),
(294, 82, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:35', 'events_list'),
(295, 94, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:35', 'events_list'),
(296, 66, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:38', 'events_list'),
(297, 67, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:38', 'events_list'),
(298, 71, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:38', 'events_list'),
(299, 78, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:38', 'events_list'),
(300, 95, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:38', 'events_list'),
(301, 96, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:38', 'events_list'),
(302, 97, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:38', 'events_list'),
(303, 98, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:38', 'events_list'),
(304, 82, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:38', 'events_list'),
(305, 94, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:38', 'events_list'),
(306, 66, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:54', 'events_list'),
(307, 67, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:54', 'events_list'),
(308, 71, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:54', 'events_list'),
(309, 78, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:54', 'events_list'),
(310, 95, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:54', 'events_list'),
(311, 96, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:54', 'events_list'),
(312, 97, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:54', 'events_list'),
(313, 98, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:54', 'events_list'),
(314, 82, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:54', 'events_list'),
(315, 94, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:18:54', 'events_list'),
(316, 78, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:19:02', 'event_detail'),
(317, 66, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:24:34', 'events_list'),
(318, 67, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:24:34', 'events_list'),
(319, 71, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:24:34', 'events_list'),
(320, 78, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:24:34', 'events_list'),
(321, 95, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:24:34', 'events_list'),
(322, 96, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:24:34', 'events_list'),
(323, 97, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:24:34', 'events_list'),
(324, 98, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:24:34', 'events_list'),
(325, 82, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:24:34', 'events_list'),
(326, 94, '80f6816b-2a97-4e37-9afa-1b08c1792dff', '2025-05-08 23:24:34', 'events_list'),
(327, 66, 'decb8bc1-24e5-41ac-ad48-196793a15a69', '2025-05-07 16:21:33', 'events_list'),
(328, 67, 'decb8bc1-24e5-41ac-ad48-196793a15a69', '2025-05-07 16:21:33', 'events_list'),
(329, 71, 'decb8bc1-24e5-41ac-ad48-196793a15a69', '2025-05-07 16:21:33', 'events_list'),
(330, 78, 'decb8bc1-24e5-41ac-ad48-196793a15a69', '2025-05-07 16:21:33', 'events_list'),
(331, 95, 'decb8bc1-24e5-41ac-ad48-196793a15a69', '2025-05-07 16:21:33', 'events_list'),
(332, 96, 'decb8bc1-24e5-41ac-ad48-196793a15a69', '2025-05-07 16:21:33', 'events_list'),
(333, 97, 'decb8bc1-24e5-41ac-ad48-196793a15a69', '2025-05-07 16:21:33', 'events_list'),
(334, 98, 'decb8bc1-24e5-41ac-ad48-196793a15a69', '2025-05-07 16:21:33', 'events_list'),
(335, 82, 'decb8bc1-24e5-41ac-ad48-196793a15a69', '2025-05-07 16:21:33', 'events_list'),
(336, 94, 'decb8bc1-24e5-41ac-ad48-196793a15a69', '2025-05-07 16:21:33', 'events_list'),
(337, 66, 'decb8bc1-24e5-41ac-ad48-196793a15a69', '2025-05-07 16:21:37', 'event_detail'),
(338, 66, 'd2cbfda8-c7e8-488d-ac97-4686911b0716', '2025-05-09 09:44:33', 'events_list'),
(339, 67, 'd2cbfda8-c7e8-488d-ac97-4686911b0716', '2025-05-09 09:44:33', 'events_list'),
(340, 71, 'd2cbfda8-c7e8-488d-ac97-4686911b0716', '2025-05-09 09:44:33', 'events_list'),
(341, 78, 'd2cbfda8-c7e8-488d-ac97-4686911b0716', '2025-05-09 09:44:33', 'events_list'),
(342, 95, 'd2cbfda8-c7e8-488d-ac97-4686911b0716', '2025-05-09 09:44:33', 'events_list'),
(343, 96, 'd2cbfda8-c7e8-488d-ac97-4686911b0716', '2025-05-09 09:44:33', 'events_list'),
(344, 97, 'd2cbfda8-c7e8-488d-ac97-4686911b0716', '2025-05-09 09:44:33', 'events_list'),
(345, 98, 'd2cbfda8-c7e8-488d-ac97-4686911b0716', '2025-05-09 09:44:33', 'events_list'),
(346, 82, 'd2cbfda8-c7e8-488d-ac97-4686911b0716', '2025-05-09 09:44:33', 'events_list'),
(347, 84, 'd2cbfda8-c7e8-488d-ac97-4686911b0716', '2025-05-09 09:44:33', 'events_list'),
(348, 66, 'ee492644-92ed-4585-84a5-851a2a401c6e', '2025-05-09 18:43:13', 'events_list'),
(349, 67, 'ee492644-92ed-4585-84a5-851a2a401c6e', '2025-05-09 18:43:13', 'events_list'),
(350, 71, 'ee492644-92ed-4585-84a5-851a2a401c6e', '2025-05-09 18:43:13', 'events_list'),
(351, 78, 'ee492644-92ed-4585-84a5-851a2a401c6e', '2025-05-09 18:43:13', 'events_list'),
(352, 95, 'ee492644-92ed-4585-84a5-851a2a401c6e', '2025-05-09 18:43:13', 'events_list'),
(353, 96, 'ee492644-92ed-4585-84a5-851a2a401c6e', '2025-05-09 18:43:13', 'events_list'),
(354, 97, 'ee492644-92ed-4585-84a5-851a2a401c6e', '2025-05-09 18:43:13', 'events_list'),
(355, 98, 'ee492644-92ed-4585-84a5-851a2a401c6e', '2025-05-09 18:43:13', 'events_list'),
(356, 99, 'ee492644-92ed-4585-84a5-851a2a401c6e', '2025-05-09 18:43:13', 'events_list'),
(357, 82, 'ee492644-92ed-4585-84a5-851a2a401c6e', '2025-05-09 18:43:13', 'events_list'),
(358, 66, 'e55dd2ce-ac84-407c-9ff7-02634d5c3962', '2025-05-10 13:23:37', 'events_list'),
(359, 67, 'e55dd2ce-ac84-407c-9ff7-02634d5c3962', '2025-05-10 13:23:37', 'events_list'),
(360, 71, 'e55dd2ce-ac84-407c-9ff7-02634d5c3962', '2025-05-10 13:23:37', 'events_list'),
(361, 78, 'e55dd2ce-ac84-407c-9ff7-02634d5c3962', '2025-05-10 13:23:37', 'events_list'),
(362, 95, 'e55dd2ce-ac84-407c-9ff7-02634d5c3962', '2025-05-10 13:23:37', 'events_list'),
(363, 96, 'e55dd2ce-ac84-407c-9ff7-02634d5c3962', '2025-05-10 13:23:37', 'events_list'),
(364, 97, 'e55dd2ce-ac84-407c-9ff7-02634d5c3962', '2025-05-10 13:23:37', 'events_list'),
(365, 98, 'e55dd2ce-ac84-407c-9ff7-02634d5c3962', '2025-05-10 13:23:37', 'events_list'),
(366, 99, 'e55dd2ce-ac84-407c-9ff7-02634d5c3962', '2025-05-10 13:23:37', 'events_list'),
(367, 84, 'e55dd2ce-ac84-407c-9ff7-02634d5c3962', '2025-05-10 13:23:37', 'events_list'),
(368, 66, 'e55dd2ce-ac84-407c-9ff7-02634d5c3962', '2025-05-10 13:23:47', 'events_list'),
(369, 67, 'e55dd2ce-ac84-407c-9ff7-02634d5c3962', '2025-05-10 13:23:47', 'events_list'),
(370, 71, 'e55dd2ce-ac84-407c-9ff7-02634d5c3962', '2025-05-10 13:23:47', 'events_list'),
(371, 78, 'e55dd2ce-ac84-407c-9ff7-02634d5c3962', '2025-05-10 13:23:47', 'events_list'),
(372, 95, 'e55dd2ce-ac84-407c-9ff7-02634d5c3962', '2025-05-10 13:23:47', 'events_list'),
(373, 96, 'e55dd2ce-ac84-407c-9ff7-02634d5c3962', '2025-05-10 13:23:47', 'events_list'),
(374, 97, 'e55dd2ce-ac84-407c-9ff7-02634d5c3962', '2025-05-10 13:23:47', 'events_list'),
(375, 98, 'e55dd2ce-ac84-407c-9ff7-02634d5c3962', '2025-05-10 13:23:47', 'events_list'),
(376, 99, 'e55dd2ce-ac84-407c-9ff7-02634d5c3962', '2025-05-10 13:23:47', 'events_list'),
(377, 84, 'e55dd2ce-ac84-407c-9ff7-02634d5c3962', '2025-05-10 13:23:47', 'events_list'),
(378, 78, 'e55dd2ce-ac84-407c-9ff7-02634d5c3962', '2025-05-10 13:23:49', 'events_list'),
(379, 98, 'e55dd2ce-ac84-407c-9ff7-02634d5c3962', '2025-05-10 13:23:49', 'events_list'),
(380, 99, 'e55dd2ce-ac84-407c-9ff7-02634d5c3962', '2025-05-10 13:23:49', 'events_list'),
(381, 66, '2cdf531a-5ce7-4d32-bf01-906e27c706b2', '2025-05-10 20:09:07', 'events_list'),
(382, 67, '2cdf531a-5ce7-4d32-bf01-906e27c706b2', '2025-05-10 20:09:07', 'events_list'),
(383, 71, '2cdf531a-5ce7-4d32-bf01-906e27c706b2', '2025-05-10 20:09:07', 'events_list'),
(384, 78, '2cdf531a-5ce7-4d32-bf01-906e27c706b2', '2025-05-10 20:09:07', 'events_list'),
(385, 95, '2cdf531a-5ce7-4d32-bf01-906e27c706b2', '2025-05-10 20:09:07', 'events_list'),
(386, 96, '2cdf531a-5ce7-4d32-bf01-906e27c706b2', '2025-05-10 20:09:07', 'events_list'),
(387, 97, '2cdf531a-5ce7-4d32-bf01-906e27c706b2', '2025-05-10 20:09:07', 'events_list'),
(388, 98, '2cdf531a-5ce7-4d32-bf01-906e27c706b2', '2025-05-10 20:09:07', 'events_list'),
(389, 99, '2cdf531a-5ce7-4d32-bf01-906e27c706b2', '2025-05-10 20:09:07', 'events_list'),
(390, 84, '2cdf531a-5ce7-4d32-bf01-906e27c706b2', '2025-05-10 20:09:07', 'events_list'),
(391, 66, '2cdf531a-5ce7-4d32-bf01-906e27c706b2', '2025-05-10 20:09:10', 'events_list'),
(392, 67, '2cdf531a-5ce7-4d32-bf01-906e27c706b2', '2025-05-10 20:09:10', 'events_list'),
(393, 71, '2cdf531a-5ce7-4d32-bf01-906e27c706b2', '2025-05-10 20:09:10', 'events_list'),
(394, 78, '2cdf531a-5ce7-4d32-bf01-906e27c706b2', '2025-05-10 20:09:10', 'events_list'),
(395, 95, '2cdf531a-5ce7-4d32-bf01-906e27c706b2', '2025-05-10 20:09:10', 'events_list'),
(396, 96, '2cdf531a-5ce7-4d32-bf01-906e27c706b2', '2025-05-10 20:09:10', 'events_list'),
(397, 97, '2cdf531a-5ce7-4d32-bf01-906e27c706b2', '2025-05-10 20:09:10', 'events_list'),
(398, 98, '2cdf531a-5ce7-4d32-bf01-906e27c706b2', '2025-05-10 20:09:10', 'events_list'),
(399, 99, '2cdf531a-5ce7-4d32-bf01-906e27c706b2', '2025-05-10 20:09:10', 'events_list'),
(400, 84, '2cdf531a-5ce7-4d32-bf01-906e27c706b2', '2025-05-10 20:09:10', 'events_list'),
(401, 78, '2cdf531a-5ce7-4d32-bf01-906e27c706b2', '2025-05-10 20:09:19', 'event_detail'),
(402, 84, '2cdf531a-5ce7-4d32-bf01-906e27c706b2', '2025-05-10 20:09:30', 'event_detail'),
(403, 66, '16965e15-b28a-4faf-9519-a90d2be06be3', '2025-05-11 14:52:14', 'events_list'),
(404, 67, '16965e15-b28a-4faf-9519-a90d2be06be3', '2025-05-11 14:52:14', 'events_list'),
(405, 71, '16965e15-b28a-4faf-9519-a90d2be06be3', '2025-05-11 14:52:14', 'events_list'),
(406, 78, '16965e15-b28a-4faf-9519-a90d2be06be3', '2025-05-11 14:52:14', 'events_list'),
(407, 95, '16965e15-b28a-4faf-9519-a90d2be06be3', '2025-05-11 14:52:14', 'events_list'),
(408, 96, '16965e15-b28a-4faf-9519-a90d2be06be3', '2025-05-11 14:52:14', 'events_list'),
(409, 97, '16965e15-b28a-4faf-9519-a90d2be06be3', '2025-05-11 14:52:14', 'events_list'),
(410, 98, '16965e15-b28a-4faf-9519-a90d2be06be3', '2025-05-11 14:52:14', 'events_list'),
(411, 99, '16965e15-b28a-4faf-9519-a90d2be06be3', '2025-05-11 14:52:14', 'events_list'),
(412, 84, '16965e15-b28a-4faf-9519-a90d2be06be3', '2025-05-11 14:52:14', 'events_list'),
(413, 67, 'c7ee4366-24f1-46aa-a09b-39cbedcc41b7', '2025-05-11 21:51:07', 'event_detail'),
(414, 98, '3bc545f5-6617-46c2-87de-0754791158e3', '2025-05-11 21:57:05', 'event_detail'),
(415, 66, '3bc545f5-6617-46c2-87de-0754791158e3', '2025-05-11 21:57:23', 'events_list'),
(416, 67, '3bc545f5-6617-46c2-87de-0754791158e3', '2025-05-11 21:57:23', 'events_list'),
(417, 71, '3bc545f5-6617-46c2-87de-0754791158e3', '2025-05-11 21:57:23', 'events_list'),
(418, 78, '3bc545f5-6617-46c2-87de-0754791158e3', '2025-05-11 21:57:23', 'events_list'),
(419, 95, '3bc545f5-6617-46c2-87de-0754791158e3', '2025-05-11 21:57:23', 'events_list'),
(420, 96, '3bc545f5-6617-46c2-87de-0754791158e3', '2025-05-11 21:57:23', 'events_list'),
(421, 97, '3bc545f5-6617-46c2-87de-0754791158e3', '2025-05-11 21:57:23', 'events_list'),
(422, 98, '3bc545f5-6617-46c2-87de-0754791158e3', '2025-05-11 21:57:23', 'events_list'),
(423, 99, '3bc545f5-6617-46c2-87de-0754791158e3', '2025-05-11 21:57:23', 'events_list'),
(424, 84, '3bc545f5-6617-46c2-87de-0754791158e3', '2025-05-11 21:57:23', 'events_list'),
(425, 66, '27a3cf36-caf0-493d-9521-51d34a6603e8', '2025-05-07 17:05:03', 'events_list'),
(426, 67, '27a3cf36-caf0-493d-9521-51d34a6603e8', '2025-05-07 17:05:03', 'events_list'),
(427, 71, '27a3cf36-caf0-493d-9521-51d34a6603e8', '2025-05-07 17:05:03', 'events_list'),
(428, 78, '27a3cf36-caf0-493d-9521-51d34a6603e8', '2025-05-07 17:05:03', 'events_list'),
(429, 95, '27a3cf36-caf0-493d-9521-51d34a6603e8', '2025-05-07 17:05:03', 'events_list'),
(430, 96, '27a3cf36-caf0-493d-9521-51d34a6603e8', '2025-05-07 17:05:03', 'events_list'),
(431, 97, '27a3cf36-caf0-493d-9521-51d34a6603e8', '2025-05-07 17:05:03', 'events_list'),
(432, 98, '27a3cf36-caf0-493d-9521-51d34a6603e8', '2025-05-07 17:05:03', 'events_list'),
(433, 82, '27a3cf36-caf0-493d-9521-51d34a6603e8', '2025-05-07 17:05:03', 'events_list'),
(434, 94, '27a3cf36-caf0-493d-9521-51d34a6603e8', '2025-05-07 17:05:03', 'events_list'),
(435, 66, '27a3cf36-caf0-493d-9521-51d34a6603e8', '2025-05-07 17:05:08', 'event_detail'),
(436, 97, '950278c2-683f-4b0b-907f-de88fc30706d', '2025-05-12 18:33:16', 'event_detail'),
(437, 71, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-13 06:07:07', 'events_list'),
(438, 78, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-13 06:07:07', 'events_list'),
(439, 96, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-13 06:07:07', 'events_list'),
(440, 98, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-13 06:07:07', 'events_list'),
(441, 99, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-13 06:07:07', 'events_list'),
(442, 86, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-13 06:07:07', 'events_list'),
(443, 87, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-13 06:07:07', 'events_list'),
(444, 88, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-13 06:07:07', 'events_list'),
(445, 89, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-13 06:07:07', 'events_list'),
(446, 91, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-13 06:07:07', 'events_list'),
(447, 71, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-13 06:07:37', 'events_list'),
(448, 78, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-13 06:07:37', 'events_list'),
(449, 96, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-13 06:07:37', 'events_list'),
(450, 98, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-13 06:07:37', 'events_list'),
(451, 99, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-13 06:07:37', 'events_list'),
(452, 86, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-13 06:07:37', 'events_list'),
(453, 87, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-13 06:07:37', 'events_list'),
(454, 88, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-13 06:07:37', 'events_list'),
(455, 89, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-13 06:07:37', 'events_list'),
(456, 91, '0716f133-8667-4e0b-befa-7b5ea05ee8fd', '2025-05-13 06:07:37', 'events_list'),
(457, 98, '7f96baa1-339a-4e7c-a8d9-896b6239c500', '2025-05-12 21:34:55', 'event_detail'),
(458, 71, '8c255a83-eed2-49b9-9765-02f8abe931c5', '2025-05-13 15:42:00', 'events_list'),
(459, 78, '8c255a83-eed2-49b9-9765-02f8abe931c5', '2025-05-13 15:42:00', 'events_list'),
(460, 96, '8c255a83-eed2-49b9-9765-02f8abe931c5', '2025-05-13 15:42:00', 'events_list'),
(461, 98, '8c255a83-eed2-49b9-9765-02f8abe931c5', '2025-05-13 15:42:00', 'events_list'),
(462, 99, '8c255a83-eed2-49b9-9765-02f8abe931c5', '2025-05-13 15:42:00', 'events_list'),
(463, 86, '8c255a83-eed2-49b9-9765-02f8abe931c5', '2025-05-13 15:42:00', 'events_list'),
(464, 87, '8c255a83-eed2-49b9-9765-02f8abe931c5', '2025-05-13 15:42:00', 'events_list'),
(465, 88, '8c255a83-eed2-49b9-9765-02f8abe931c5', '2025-05-13 15:42:00', 'events_list'),
(466, 89, '8c255a83-eed2-49b9-9765-02f8abe931c5', '2025-05-13 15:42:00', 'events_list'),
(467, 100, '8c255a83-eed2-49b9-9765-02f8abe931c5', '2025-05-13 15:42:00', 'events_list'),
(468, 71, '8c255a83-eed2-49b9-9765-02f8abe931c5', '2025-05-13 15:42:14', 'events_list'),
(469, 78, '8c255a83-eed2-49b9-9765-02f8abe931c5', '2025-05-13 15:42:14', 'events_list'),
(470, 96, '8c255a83-eed2-49b9-9765-02f8abe931c5', '2025-05-13 15:42:14', 'events_list'),
(471, 98, '8c255a83-eed2-49b9-9765-02f8abe931c5', '2025-05-13 15:42:14', 'events_list'),
(472, 99, '8c255a83-eed2-49b9-9765-02f8abe931c5', '2025-05-13 15:42:14', 'events_list'),
(473, 86, '8c255a83-eed2-49b9-9765-02f8abe931c5', '2025-05-13 15:42:14', 'events_list'),
(474, 87, '8c255a83-eed2-49b9-9765-02f8abe931c5', '2025-05-13 15:42:14', 'events_list'),
(475, 88, '8c255a83-eed2-49b9-9765-02f8abe931c5', '2025-05-13 15:42:14', 'events_list'),
(476, 89, '8c255a83-eed2-49b9-9765-02f8abe931c5', '2025-05-13 15:42:14', 'events_list'),
(477, 100, '8c255a83-eed2-49b9-9765-02f8abe931c5', '2025-05-13 15:42:14', 'events_list'),
(478, 71, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:00:25', 'events_list'),
(479, 78, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:00:25', 'events_list'),
(480, 96, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:00:25', 'events_list'),
(481, 98, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:00:25', 'events_list'),
(482, 99, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:00:25', 'events_list'),
(483, 86, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:00:25', 'events_list'),
(484, 87, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:00:25', 'events_list'),
(485, 88, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:00:25', 'events_list'),
(486, 89, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:00:25', 'events_list'),
(487, 100, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:00:25', 'events_list'),
(488, 78, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:00:29', 'event_detail'),
(489, 87, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:00:42', 'event_detail'),
(490, 100, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:00:50', 'event_detail'),
(491, 100, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:01:47', 'events_list'),
(492, 101, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:01:47', 'events_list'),
(493, 71, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:12:39', 'events_list'),
(494, 78, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:12:39', 'events_list'),
(495, 96, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:12:39', 'events_list'),
(496, 98, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:12:39', 'events_list'),
(497, 99, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:12:39', 'events_list'),
(498, 86, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:12:39', 'events_list'),
(499, 87, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:12:39', 'events_list'),
(500, 88, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:12:39', 'events_list'),
(501, 89, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:12:39', 'events_list'),
(502, 100, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:12:39', 'events_list'),
(503, 78, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:12:42', 'event_detail'),
(504, 71, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:16:07', 'events_list'),
(505, 78, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:16:07', 'events_list'),
(506, 96, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:16:07', 'events_list'),
(507, 98, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:16:07', 'events_list'),
(508, 99, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:16:07', 'events_list'),
(509, 86, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:16:07', 'events_list'),
(510, 87, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:16:07', 'events_list'),
(511, 88, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:16:07', 'events_list'),
(512, 89, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:16:07', 'events_list'),
(513, 100, '1c1d8ab1-5d23-4f78-b6cf-53c55b6d6e5c', '2025-05-14 01:16:07', 'events_list'),
(514, 71, 'ac7ca7b5-ea02-48aa-af25-7d80b73ba157', '2025-05-14 19:35:23', 'events_list'),
(515, 78, 'ac7ca7b5-ea02-48aa-af25-7d80b73ba157', '2025-05-14 19:35:23', 'events_list'),
(516, 96, 'ac7ca7b5-ea02-48aa-af25-7d80b73ba157', '2025-05-14 19:35:23', 'events_list'),
(517, 98, 'ac7ca7b5-ea02-48aa-af25-7d80b73ba157', '2025-05-14 19:35:23', 'events_list'),
(518, 99, 'ac7ca7b5-ea02-48aa-af25-7d80b73ba157', '2025-05-14 19:35:23', 'events_list'),
(519, 86, 'ac7ca7b5-ea02-48aa-af25-7d80b73ba157', '2025-05-14 19:35:23', 'events_list'),
(520, 87, 'ac7ca7b5-ea02-48aa-af25-7d80b73ba157', '2025-05-14 19:35:23', 'events_list'),
(521, 88, 'ac7ca7b5-ea02-48aa-af25-7d80b73ba157', '2025-05-14 19:35:23', 'events_list'),
(522, 89, 'ac7ca7b5-ea02-48aa-af25-7d80b73ba157', '2025-05-14 19:35:23', 'events_list'),
(523, 100, 'ac7ca7b5-ea02-48aa-af25-7d80b73ba157', '2025-05-14 19:35:23', 'events_list'),
(524, 71, '221c7043-d3cf-4843-bc17-1f5e001aef62', '2025-05-14 21:11:49', 'events_list'),
(525, 78, '221c7043-d3cf-4843-bc17-1f5e001aef62', '2025-05-14 21:11:49', 'events_list'),
(526, 96, '221c7043-d3cf-4843-bc17-1f5e001aef62', '2025-05-14 21:11:49', 'events_list'),
(527, 98, '221c7043-d3cf-4843-bc17-1f5e001aef62', '2025-05-14 21:11:49', 'events_list'),
(528, 99, '221c7043-d3cf-4843-bc17-1f5e001aef62', '2025-05-14 21:11:49', 'events_list'),
(529, 86, '221c7043-d3cf-4843-bc17-1f5e001aef62', '2025-05-14 21:11:49', 'events_list'),
(530, 87, '221c7043-d3cf-4843-bc17-1f5e001aef62', '2025-05-14 21:11:49', 'events_list'),
(531, 88, '221c7043-d3cf-4843-bc17-1f5e001aef62', '2025-05-14 21:11:49', 'events_list'),
(532, 89, '221c7043-d3cf-4843-bc17-1f5e001aef62', '2025-05-14 21:11:49', 'events_list'),
(533, 100, '221c7043-d3cf-4843-bc17-1f5e001aef62', '2025-05-14 21:11:49', 'events_list'),
(534, 71, '5e7941f4-b056-4fb0-8e6c-004587fc2774', '2025-05-15 17:04:46', 'events_list'),
(535, 78, '5e7941f4-b056-4fb0-8e6c-004587fc2774', '2025-05-15 17:04:46', 'events_list'),
(536, 96, '5e7941f4-b056-4fb0-8e6c-004587fc2774', '2025-05-15 17:04:46', 'events_list'),
(537, 98, '5e7941f4-b056-4fb0-8e6c-004587fc2774', '2025-05-15 17:04:46', 'events_list'),
(538, 99, '5e7941f4-b056-4fb0-8e6c-004587fc2774', '2025-05-15 17:04:46', 'events_list'),
(539, 87, '5e7941f4-b056-4fb0-8e6c-004587fc2774', '2025-05-15 17:04:46', 'events_list'),
(540, 88, '5e7941f4-b056-4fb0-8e6c-004587fc2774', '2025-05-15 17:04:46', 'events_list'),
(541, 89, '5e7941f4-b056-4fb0-8e6c-004587fc2774', '2025-05-15 17:04:46', 'events_list'),
(542, 100, '5e7941f4-b056-4fb0-8e6c-004587fc2774', '2025-05-15 17:04:46', 'events_list'),
(543, 91, '5e7941f4-b056-4fb0-8e6c-004587fc2774', '2025-05-15 17:04:46', 'events_list'),
(544, 71, '937ca41b-501e-4fc4-bac3-6ec99a91d676', '2025-05-15 22:27:36', 'events_list'),
(545, 78, '937ca41b-501e-4fc4-bac3-6ec99a91d676', '2025-05-15 22:27:36', 'events_list'),
(546, 96, '937ca41b-501e-4fc4-bac3-6ec99a91d676', '2025-05-15 22:27:36', 'events_list'),
(547, 98, '937ca41b-501e-4fc4-bac3-6ec99a91d676', '2025-05-15 22:27:36', 'events_list'),
(548, 99, '937ca41b-501e-4fc4-bac3-6ec99a91d676', '2025-05-15 22:27:36', 'events_list'),
(549, 87, '937ca41b-501e-4fc4-bac3-6ec99a91d676', '2025-05-15 22:27:36', 'events_list'),
(550, 88, '937ca41b-501e-4fc4-bac3-6ec99a91d676', '2025-05-15 22:27:36', 'events_list'),
(551, 89, '937ca41b-501e-4fc4-bac3-6ec99a91d676', '2025-05-15 22:27:36', 'events_list'),
(552, 100, '937ca41b-501e-4fc4-bac3-6ec99a91d676', '2025-05-15 22:27:36', 'events_list'),
(553, 91, '937ca41b-501e-4fc4-bac3-6ec99a91d676', '2025-05-15 22:27:36', 'events_list'),
(554, 71, 'e5902879-49ea-4583-b1a9-76a1b78e5f1b', '2025-05-15 21:56:41', 'events_list'),
(555, 78, 'e5902879-49ea-4583-b1a9-76a1b78e5f1b', '2025-05-15 21:56:41', 'events_list'),
(556, 96, 'e5902879-49ea-4583-b1a9-76a1b78e5f1b', '2025-05-15 21:56:41', 'events_list'),
(557, 98, 'e5902879-49ea-4583-b1a9-76a1b78e5f1b', '2025-05-15 21:56:41', 'events_list'),
(558, 99, 'e5902879-49ea-4583-b1a9-76a1b78e5f1b', '2025-05-15 21:56:41', 'events_list'),
(559, 87, 'e5902879-49ea-4583-b1a9-76a1b78e5f1b', '2025-05-15 21:56:41', 'events_list'),
(560, 88, 'e5902879-49ea-4583-b1a9-76a1b78e5f1b', '2025-05-15 21:56:41', 'events_list'),
(561, 89, 'e5902879-49ea-4583-b1a9-76a1b78e5f1b', '2025-05-15 21:56:41', 'events_list'),
(562, 100, 'e5902879-49ea-4583-b1a9-76a1b78e5f1b', '2025-05-15 21:56:41', 'events_list'),
(563, 91, 'e5902879-49ea-4583-b1a9-76a1b78e5f1b', '2025-05-15 21:56:41', 'events_list'),
(564, 71, 'e5902879-49ea-4583-b1a9-76a1b78e5f1b', '2025-05-15 21:56:43', 'events_list'),
(565, 78, 'e5902879-49ea-4583-b1a9-76a1b78e5f1b', '2025-05-15 21:56:43', 'events_list'),
(566, 96, 'e5902879-49ea-4583-b1a9-76a1b78e5f1b', '2025-05-15 21:56:43', 'events_list'),
(567, 98, 'e5902879-49ea-4583-b1a9-76a1b78e5f1b', '2025-05-15 21:56:43', 'events_list'),
(568, 99, 'e5902879-49ea-4583-b1a9-76a1b78e5f1b', '2025-05-15 21:56:43', 'events_list'),
(569, 87, 'e5902879-49ea-4583-b1a9-76a1b78e5f1b', '2025-05-15 21:56:43', 'events_list'),
(570, 88, 'e5902879-49ea-4583-b1a9-76a1b78e5f1b', '2025-05-15 21:56:43', 'events_list'),
(571, 89, 'e5902879-49ea-4583-b1a9-76a1b78e5f1b', '2025-05-15 21:56:43', 'events_list'),
(572, 100, 'e5902879-49ea-4583-b1a9-76a1b78e5f1b', '2025-05-15 21:56:43', 'events_list'),
(573, 91, 'e5902879-49ea-4583-b1a9-76a1b78e5f1b', '2025-05-15 21:56:43', 'events_list'),
(574, 71, '80cc8ebb-6c74-42dc-b16c-8926d3225118', '2025-05-16 11:37:28', 'events_list'),
(575, 78, '80cc8ebb-6c74-42dc-b16c-8926d3225118', '2025-05-16 11:37:28', 'events_list'),
(576, 98, '80cc8ebb-6c74-42dc-b16c-8926d3225118', '2025-05-16 11:37:28', 'events_list'),
(577, 99, '80cc8ebb-6c74-42dc-b16c-8926d3225118', '2025-05-16 11:37:28', 'events_list'),
(578, 87, '80cc8ebb-6c74-42dc-b16c-8926d3225118', '2025-05-16 11:37:28', 'events_list');
INSERT INTO `event_impressions` (`id`, `event_id`, `user_id`, `timestamp`, `source`) VALUES
(579, 88, '80cc8ebb-6c74-42dc-b16c-8926d3225118', '2025-05-16 11:37:28', 'events_list'),
(580, 89, '80cc8ebb-6c74-42dc-b16c-8926d3225118', '2025-05-16 11:37:28', 'events_list'),
(581, 100, '80cc8ebb-6c74-42dc-b16c-8926d3225118', '2025-05-16 11:37:28', 'events_list'),
(582, 91, '80cc8ebb-6c74-42dc-b16c-8926d3225118', '2025-05-16 11:37:28', 'events_list'),
(583, 101, '80cc8ebb-6c74-42dc-b16c-8926d3225118', '2025-05-16 11:37:28', 'events_list'),
(584, 77, '80cc8ebb-6c74-42dc-b16c-8926d3225118', '2025-05-16 11:37:34', 'events_list'),
(585, 77, '80cc8ebb-6c74-42dc-b16c-8926d3225118', '2025-05-16 11:37:36', 'events_list'),
(586, 77, '80cc8ebb-6c74-42dc-b16c-8926d3225118', '2025-05-16 11:37:37', 'events_list'),
(587, 99, '80cc8ebb-6c74-42dc-b16c-8926d3225118', '2025-05-16 11:37:38', 'events_list'),
(588, 99, '80cc8ebb-6c74-42dc-b16c-8926d3225118', '2025-05-16 11:37:39', 'events_list'),
(589, 99, '80cc8ebb-6c74-42dc-b16c-8926d3225118', '2025-05-16 11:37:39', 'events_list'),
(590, 99, '80cc8ebb-6c74-42dc-b16c-8926d3225118', '2025-05-16 11:37:40', 'events_list'),
(591, 99, '80cc8ebb-6c74-42dc-b16c-8926d3225118', '2025-05-16 11:37:40', 'events_list'),
(592, 99, '80cc8ebb-6c74-42dc-b16c-8926d3225118', '2025-05-16 11:37:40', 'events_list'),
(593, 99, '80cc8ebb-6c74-42dc-b16c-8926d3225118', '2025-05-16 11:37:41', 'events_list'),
(594, 71, '98a5f5fd-ddf2-4e79-84cc-d34b709a530d', '2025-05-16 21:56:35', 'events_list'),
(595, 78, '98a5f5fd-ddf2-4e79-84cc-d34b709a530d', '2025-05-16 21:56:35', 'events_list'),
(596, 98, '98a5f5fd-ddf2-4e79-84cc-d34b709a530d', '2025-05-16 21:56:35', 'events_list'),
(597, 99, '98a5f5fd-ddf2-4e79-84cc-d34b709a530d', '2025-05-16 21:56:35', 'events_list'),
(598, 87, '98a5f5fd-ddf2-4e79-84cc-d34b709a530d', '2025-05-16 21:56:35', 'events_list'),
(599, 88, '98a5f5fd-ddf2-4e79-84cc-d34b709a530d', '2025-05-16 21:56:35', 'events_list'),
(600, 102, '98a5f5fd-ddf2-4e79-84cc-d34b709a530d', '2025-05-16 21:56:35', 'events_list'),
(601, 89, '98a5f5fd-ddf2-4e79-84cc-d34b709a530d', '2025-05-16 21:56:35', 'events_list'),
(602, 100, '98a5f5fd-ddf2-4e79-84cc-d34b709a530d', '2025-05-16 21:56:35', 'events_list'),
(603, 91, '98a5f5fd-ddf2-4e79-84cc-d34b709a530d', '2025-05-16 21:56:35', 'events_list'),
(604, 71, '98a5f5fd-ddf2-4e79-84cc-d34b709a530d', '2025-05-16 21:58:41', 'events_list'),
(605, 78, '98a5f5fd-ddf2-4e79-84cc-d34b709a530d', '2025-05-16 21:58:41', 'events_list'),
(606, 98, '98a5f5fd-ddf2-4e79-84cc-d34b709a530d', '2025-05-16 21:58:41', 'events_list'),
(607, 99, '98a5f5fd-ddf2-4e79-84cc-d34b709a530d', '2025-05-16 21:58:41', 'events_list'),
(608, 87, '98a5f5fd-ddf2-4e79-84cc-d34b709a530d', '2025-05-16 21:58:41', 'events_list'),
(609, 88, '98a5f5fd-ddf2-4e79-84cc-d34b709a530d', '2025-05-16 21:58:41', 'events_list'),
(610, 102, '98a5f5fd-ddf2-4e79-84cc-d34b709a530d', '2025-05-16 21:58:41', 'events_list'),
(611, 89, '98a5f5fd-ddf2-4e79-84cc-d34b709a530d', '2025-05-16 21:58:41', 'events_list'),
(612, 100, '98a5f5fd-ddf2-4e79-84cc-d34b709a530d', '2025-05-16 21:58:41', 'events_list'),
(613, 91, '98a5f5fd-ddf2-4e79-84cc-d34b709a530d', '2025-05-16 21:58:41', 'events_list'),
(614, 71, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-16 19:28:26', 'events_list'),
(615, 78, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-16 19:28:26', 'events_list'),
(616, 98, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-16 19:28:26', 'events_list'),
(617, 99, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-16 19:28:26', 'events_list'),
(618, 87, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-16 19:28:26', 'events_list'),
(619, 88, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-16 19:28:26', 'events_list'),
(620, 89, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-16 19:28:26', 'events_list'),
(621, 100, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-16 19:28:26', 'events_list'),
(622, 91, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-16 19:28:26', 'events_list'),
(623, 101, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-16 19:28:26', 'events_list'),
(624, 71, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-16 19:28:56', 'events_list'),
(625, 78, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-16 19:28:56', 'events_list'),
(626, 98, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-16 19:28:56', 'events_list'),
(627, 99, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-16 19:28:56', 'events_list'),
(628, 87, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-16 19:28:56', 'events_list'),
(629, 88, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-16 19:28:56', 'events_list'),
(630, 89, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-16 19:28:56', 'events_list'),
(631, 100, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-16 19:28:56', 'events_list'),
(632, 91, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-16 19:28:56', 'events_list'),
(633, 101, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-16 19:28:56', 'events_list'),
(634, 71, 'de1aca1a-5925-43d5-994c-5b0573646eb8', '2025-05-18 00:42:32', 'event_detail'),
(635, 71, 'e3b0ad52-b0be-4bd2-b5e0-a9a05c26284c', '2025-05-17 23:59:50', 'events_list'),
(636, 103, 'e3b0ad52-b0be-4bd2-b5e0-a9a05c26284c', '2025-05-17 23:59:50', 'events_list'),
(637, 78, 'e3b0ad52-b0be-4bd2-b5e0-a9a05c26284c', '2025-05-17 23:59:50', 'events_list'),
(638, 98, 'e3b0ad52-b0be-4bd2-b5e0-a9a05c26284c', '2025-05-17 23:59:50', 'events_list'),
(639, 99, 'e3b0ad52-b0be-4bd2-b5e0-a9a05c26284c', '2025-05-17 23:59:50', 'events_list'),
(640, 87, 'e3b0ad52-b0be-4bd2-b5e0-a9a05c26284c', '2025-05-17 23:59:50', 'events_list'),
(641, 88, 'e3b0ad52-b0be-4bd2-b5e0-a9a05c26284c', '2025-05-17 23:59:50', 'events_list'),
(642, 102, 'e3b0ad52-b0be-4bd2-b5e0-a9a05c26284c', '2025-05-17 23:59:50', 'events_list'),
(643, 89, 'e3b0ad52-b0be-4bd2-b5e0-a9a05c26284c', '2025-05-17 23:59:50', 'events_list'),
(644, 100, 'e3b0ad52-b0be-4bd2-b5e0-a9a05c26284c', '2025-05-17 23:59:50', 'events_list'),
(645, 71, '2f4f15ba-0890-4b74-817d-f36d5273725a', '2025-05-17 23:20:25', 'events_list'),
(646, 103, '2f4f15ba-0890-4b74-817d-f36d5273725a', '2025-05-17 23:20:25', 'events_list'),
(647, 78, '2f4f15ba-0890-4b74-817d-f36d5273725a', '2025-05-17 23:20:25', 'events_list'),
(648, 98, '2f4f15ba-0890-4b74-817d-f36d5273725a', '2025-05-17 23:20:25', 'events_list'),
(649, 99, '2f4f15ba-0890-4b74-817d-f36d5273725a', '2025-05-17 23:20:25', 'events_list'),
(650, 87, '2f4f15ba-0890-4b74-817d-f36d5273725a', '2025-05-17 23:20:25', 'events_list'),
(651, 88, '2f4f15ba-0890-4b74-817d-f36d5273725a', '2025-05-17 23:20:25', 'events_list'),
(652, 102, '2f4f15ba-0890-4b74-817d-f36d5273725a', '2025-05-17 23:20:25', 'events_list'),
(653, 89, '2f4f15ba-0890-4b74-817d-f36d5273725a', '2025-05-17 23:20:25', 'events_list'),
(654, 100, '2f4f15ba-0890-4b74-817d-f36d5273725a', '2025-05-17 23:20:25', 'events_list'),
(655, 71, '2f4f15ba-0890-4b74-817d-f36d5273725a', '2025-05-17 23:21:27', 'events_list'),
(656, 103, '2f4f15ba-0890-4b74-817d-f36d5273725a', '2025-05-17 23:21:27', 'events_list'),
(657, 78, '2f4f15ba-0890-4b74-817d-f36d5273725a', '2025-05-17 23:21:27', 'events_list'),
(658, 98, '2f4f15ba-0890-4b74-817d-f36d5273725a', '2025-05-17 23:21:27', 'events_list'),
(659, 99, '2f4f15ba-0890-4b74-817d-f36d5273725a', '2025-05-17 23:21:27', 'events_list'),
(660, 87, '2f4f15ba-0890-4b74-817d-f36d5273725a', '2025-05-17 23:21:27', 'events_list'),
(661, 88, '2f4f15ba-0890-4b74-817d-f36d5273725a', '2025-05-17 23:21:27', 'events_list'),
(662, 102, '2f4f15ba-0890-4b74-817d-f36d5273725a', '2025-05-17 23:21:27', 'events_list'),
(663, 89, '2f4f15ba-0890-4b74-817d-f36d5273725a', '2025-05-17 23:21:27', 'events_list'),
(664, 100, '2f4f15ba-0890-4b74-817d-f36d5273725a', '2025-05-17 23:21:27', 'events_list'),
(665, 71, '2a240a98-cf72-4751-8462-fd2761e81369', '2025-05-15 21:23:18', 'events_list'),
(666, 78, '2a240a98-cf72-4751-8462-fd2761e81369', '2025-05-15 21:23:18', 'events_list'),
(667, 96, '2a240a98-cf72-4751-8462-fd2761e81369', '2025-05-15 21:23:18', 'events_list'),
(668, 98, '2a240a98-cf72-4751-8462-fd2761e81369', '2025-05-15 21:23:18', 'events_list'),
(669, 99, '2a240a98-cf72-4751-8462-fd2761e81369', '2025-05-15 21:23:18', 'events_list'),
(670, 87, '2a240a98-cf72-4751-8462-fd2761e81369', '2025-05-15 21:23:18', 'events_list'),
(671, 88, '2a240a98-cf72-4751-8462-fd2761e81369', '2025-05-15 21:23:18', 'events_list'),
(672, 89, '2a240a98-cf72-4751-8462-fd2761e81369', '2025-05-15 21:23:18', 'events_list'),
(673, 100, '2a240a98-cf72-4751-8462-fd2761e81369', '2025-05-15 21:23:18', 'events_list'),
(674, 91, '2a240a98-cf72-4751-8462-fd2761e81369', '2025-05-15 21:23:18', 'events_list'),
(675, 71, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-18 10:55:49', 'events_list'),
(676, 103, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-18 10:55:49', 'events_list'),
(677, 78, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-18 10:55:49', 'events_list'),
(678, 98, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-18 10:55:49', 'events_list'),
(679, 99, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-18 10:55:49', 'events_list'),
(680, 88, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-18 10:55:49', 'events_list'),
(681, 102, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-18 10:55:49', 'events_list'),
(682, 89, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-18 10:55:49', 'events_list'),
(683, 91, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-18 10:55:49', 'events_list'),
(684, 101, '7d85ba01-caf8-4307-843f-696d2e4a3185', '2025-05-18 10:55:49', 'events_list'),
(685, 71, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:08', 'events_list'),
(686, 103, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:08', 'events_list'),
(687, 78, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:08', 'events_list'),
(688, 98, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:08', 'events_list'),
(689, 99, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:08', 'events_list'),
(690, 88, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:08', 'events_list'),
(691, 102, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:08', 'events_list'),
(692, 89, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:08', 'events_list'),
(693, 91, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:08', 'events_list'),
(694, 101, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:08', 'events_list'),
(695, 77, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:17', 'events_list'),
(696, 77, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:19', 'events_list'),
(697, 77, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:20', 'events_list'),
(698, 77, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:21', 'events_list'),
(699, 77, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:21', 'events_list'),
(700, 77, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:22', 'events_list'),
(701, 77, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:22', 'events_list'),
(702, 103, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:24', 'events_list'),
(703, 103, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:26', 'events_list'),
(704, 103, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:26', 'events_list'),
(705, 103, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:27', 'events_list'),
(706, 103, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:28', 'events_list'),
(707, 103, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:28', 'events_list'),
(708, 103, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:29', 'events_list'),
(709, 103, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:29', 'events_list'),
(710, 103, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:30', 'events_list'),
(711, 103, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:31', 'events_list'),
(712, 99, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:31', 'events_list'),
(713, 71, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:32', 'events_list'),
(714, 103, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:32', 'events_list'),
(715, 78, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:32', 'events_list'),
(716, 98, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:32', 'events_list'),
(717, 99, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:32', 'events_list'),
(718, 102, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:32', 'events_list'),
(719, 89, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:32', 'events_list'),
(720, 91, '965eebeb-c980-43cd-ab4a-0e7ba1bb1c16', '2025-05-18 10:48:32', 'events_list'),
(721, 78, 'c89c1336-4be3-4933-9c23-3f948cffeafa', '2025-05-15 12:13:46', 'event_detail'),
(722, 96, 'c89c1336-4be3-4933-9c23-3f948cffeafa', '2025-05-15 12:13:52', 'event_detail'),
(723, 98, 'c89c1336-4be3-4933-9c23-3f948cffeafa', '2025-05-15 12:13:55', 'event_detail'),
(724, 71, 'c89c1336-4be3-4933-9c23-3f948cffeafa', '2025-05-15 12:14:14', 'event_detail'),
(725, 71, 'c89c1336-4be3-4933-9c23-3f948cffeafa', '2025-05-15 12:15:48', 'events_list'),
(726, 78, 'c89c1336-4be3-4933-9c23-3f948cffeafa', '2025-05-15 12:15:48', 'events_list'),
(727, 96, 'c89c1336-4be3-4933-9c23-3f948cffeafa', '2025-05-15 12:15:48', 'events_list'),
(728, 98, 'c89c1336-4be3-4933-9c23-3f948cffeafa', '2025-05-15 12:15:48', 'events_list'),
(729, 99, 'c89c1336-4be3-4933-9c23-3f948cffeafa', '2025-05-15 12:15:48', 'events_list'),
(730, 87, 'c89c1336-4be3-4933-9c23-3f948cffeafa', '2025-05-15 12:15:48', 'events_list'),
(731, 88, 'c89c1336-4be3-4933-9c23-3f948cffeafa', '2025-05-15 12:15:48', 'events_list'),
(732, 89, 'c89c1336-4be3-4933-9c23-3f948cffeafa', '2025-05-15 12:15:48', 'events_list'),
(733, 100, 'c89c1336-4be3-4933-9c23-3f948cffeafa', '2025-05-15 12:15:48', 'events_list'),
(734, 91, 'c89c1336-4be3-4933-9c23-3f948cffeafa', '2025-05-15 12:15:48', 'events_list'),
(735, 71, '9eac2b11-41f8-4eba-aa9e-e29c847c97f7', '2025-05-18 12:40:34', 'events_list'),
(736, 103, '9eac2b11-41f8-4eba-aa9e-e29c847c97f7', '2025-05-18 12:40:34', 'events_list'),
(737, 78, '9eac2b11-41f8-4eba-aa9e-e29c847c97f7', '2025-05-18 12:40:34', 'events_list'),
(738, 98, '9eac2b11-41f8-4eba-aa9e-e29c847c97f7', '2025-05-18 12:40:34', 'events_list'),
(739, 99, '9eac2b11-41f8-4eba-aa9e-e29c847c97f7', '2025-05-18 12:40:34', 'events_list'),
(740, 88, '9eac2b11-41f8-4eba-aa9e-e29c847c97f7', '2025-05-18 12:40:34', 'events_list'),
(741, 102, '9eac2b11-41f8-4eba-aa9e-e29c847c97f7', '2025-05-18 12:40:34', 'events_list'),
(742, 89, '9eac2b11-41f8-4eba-aa9e-e29c847c97f7', '2025-05-18 12:40:34', 'events_list'),
(743, 91, '9eac2b11-41f8-4eba-aa9e-e29c847c97f7', '2025-05-18 12:40:34', 'events_list'),
(744, 101, '9eac2b11-41f8-4eba-aa9e-e29c847c97f7', '2025-05-18 12:40:34', 'events_list'),
(745, 71, '9eac2b11-41f8-4eba-aa9e-e29c847c97f7', '2025-05-18 12:41:09', 'events_list'),
(746, 103, '9eac2b11-41f8-4eba-aa9e-e29c847c97f7', '2025-05-18 12:41:09', 'events_list'),
(747, 78, '9eac2b11-41f8-4eba-aa9e-e29c847c97f7', '2025-05-18 12:41:09', 'events_list'),
(748, 98, '9eac2b11-41f8-4eba-aa9e-e29c847c97f7', '2025-05-18 12:41:09', 'events_list'),
(749, 99, '9eac2b11-41f8-4eba-aa9e-e29c847c97f7', '2025-05-18 12:41:09', 'events_list'),
(750, 88, '9eac2b11-41f8-4eba-aa9e-e29c847c97f7', '2025-05-18 12:41:09', 'events_list'),
(751, 102, '9eac2b11-41f8-4eba-aa9e-e29c847c97f7', '2025-05-18 12:41:09', 'events_list'),
(752, 89, '9eac2b11-41f8-4eba-aa9e-e29c847c97f7', '2025-05-18 12:41:09', 'events_list'),
(753, 91, '9eac2b11-41f8-4eba-aa9e-e29c847c97f7', '2025-05-18 12:41:09', 'events_list'),
(754, 101, '9eac2b11-41f8-4eba-aa9e-e29c847c97f7', '2025-05-18 12:41:09', 'events_list'),
(755, 66, 'c3f07de5-e37b-47a9-95ba-ca55f588c727', '2025-05-08 00:44:42', 'events_list'),
(756, 67, 'c3f07de5-e37b-47a9-95ba-ca55f588c727', '2025-05-08 00:44:42', 'events_list'),
(757, 71, 'c3f07de5-e37b-47a9-95ba-ca55f588c727', '2025-05-08 00:44:42', 'events_list'),
(758, 78, 'c3f07de5-e37b-47a9-95ba-ca55f588c727', '2025-05-08 00:44:42', 'events_list'),
(759, 95, 'c3f07de5-e37b-47a9-95ba-ca55f588c727', '2025-05-08 00:44:42', 'events_list'),
(760, 96, 'c3f07de5-e37b-47a9-95ba-ca55f588c727', '2025-05-08 00:44:42', 'events_list'),
(761, 97, 'c3f07de5-e37b-47a9-95ba-ca55f588c727', '2025-05-08 00:44:42', 'events_list'),
(762, 98, 'c3f07de5-e37b-47a9-95ba-ca55f588c727', '2025-05-08 00:44:42', 'events_list'),
(763, 82, 'c3f07de5-e37b-47a9-95ba-ca55f588c727', '2025-05-08 00:44:42', 'events_list'),
(764, 94, 'c3f07de5-e37b-47a9-95ba-ca55f588c727', '2025-05-08 00:44:42', 'events_list'),
(765, 71, 'c3f07de5-e37b-47a9-95ba-ca55f588c727', '2025-05-19 02:43:07', 'events_list'),
(766, 103, 'c3f07de5-e37b-47a9-95ba-ca55f588c727', '2025-05-19 02:43:07', 'events_list'),
(767, 78, 'c3f07de5-e37b-47a9-95ba-ca55f588c727', '2025-05-19 02:43:07', 'events_list'),
(768, 98, 'c3f07de5-e37b-47a9-95ba-ca55f588c727', '2025-05-19 02:43:07', 'events_list'),
(769, 99, 'c3f07de5-e37b-47a9-95ba-ca55f588c727', '2025-05-19 02:43:07', 'events_list'),
(770, 88, 'c3f07de5-e37b-47a9-95ba-ca55f588c727', '2025-05-19 02:43:07', 'events_list'),
(771, 102, 'c3f07de5-e37b-47a9-95ba-ca55f588c727', '2025-05-19 02:43:07', 'events_list'),
(772, 89, 'c3f07de5-e37b-47a9-95ba-ca55f588c727', '2025-05-19 02:43:07', 'events_list'),
(773, 91, 'c3f07de5-e37b-47a9-95ba-ca55f588c727', '2025-05-19 02:43:07', 'events_list'),
(774, 104, 'c3f07de5-e37b-47a9-95ba-ca55f588c727', '2025-05-19 02:43:07', 'events_list'),
(775, 71, '5e37f247-36d2-415d-adce-81aa7e41f366', '2025-05-19 13:24:14', 'events_list'),
(776, 103, '5e37f247-36d2-415d-adce-81aa7e41f366', '2025-05-19 13:24:14', 'events_list'),
(777, 78, '5e37f247-36d2-415d-adce-81aa7e41f366', '2025-05-19 13:24:14', 'events_list'),
(778, 98, '5e37f247-36d2-415d-adce-81aa7e41f366', '2025-05-19 13:24:14', 'events_list'),
(779, 99, '5e37f247-36d2-415d-adce-81aa7e41f366', '2025-05-19 13:24:14', 'events_list'),
(780, 88, '5e37f247-36d2-415d-adce-81aa7e41f366', '2025-05-19 13:24:14', 'events_list'),
(781, 102, '5e37f247-36d2-415d-adce-81aa7e41f366', '2025-05-19 13:24:14', 'events_list'),
(782, 89, '5e37f247-36d2-415d-adce-81aa7e41f366', '2025-05-19 13:24:14', 'events_list'),
(783, 91, '5e37f247-36d2-415d-adce-81aa7e41f366', '2025-05-19 13:24:14', 'events_list'),
(784, 104, '5e37f247-36d2-415d-adce-81aa7e41f366', '2025-05-19 13:24:14', 'events_list'),
(785, 71, 'b73a89a5-f05a-4725-a70b-e6076aae1c99', '2025-05-19 17:23:00', 'events_list'),
(786, 103, 'b73a89a5-f05a-4725-a70b-e6076aae1c99', '2025-05-19 17:23:00', 'events_list'),
(787, 78, 'b73a89a5-f05a-4725-a70b-e6076aae1c99', '2025-05-19 17:23:00', 'events_list'),
(788, 98, 'b73a89a5-f05a-4725-a70b-e6076aae1c99', '2025-05-19 17:23:00', 'events_list'),
(789, 99, 'b73a89a5-f05a-4725-a70b-e6076aae1c99', '2025-05-19 17:23:00', 'events_list'),
(790, 88, 'b73a89a5-f05a-4725-a70b-e6076aae1c99', '2025-05-19 17:23:00', 'events_list'),
(791, 102, 'b73a89a5-f05a-4725-a70b-e6076aae1c99', '2025-05-19 17:23:00', 'events_list'),
(792, 89, 'b73a89a5-f05a-4725-a70b-e6076aae1c99', '2025-05-19 17:23:00', 'events_list'),
(793, 91, 'b73a89a5-f05a-4725-a70b-e6076aae1c99', '2025-05-19 17:23:00', 'events_list'),
(794, 104, 'b73a89a5-f05a-4725-a70b-e6076aae1c99', '2025-05-19 17:23:00', 'events_list'),
(795, 104, 'b73a89a5-f05a-4725-a70b-e6076aae1c99', '2025-05-19 17:23:12', 'event_detail'),
(796, 71, 'b73a89a5-f05a-4725-a70b-e6076aae1c99', '2025-05-20 11:57:27', 'events_list'),
(797, 103, 'b73a89a5-f05a-4725-a70b-e6076aae1c99', '2025-05-20 11:57:27', 'events_list'),
(798, 78, 'b73a89a5-f05a-4725-a70b-e6076aae1c99', '2025-05-20 11:57:27', 'events_list'),
(799, 98, 'b73a89a5-f05a-4725-a70b-e6076aae1c99', '2025-05-20 11:57:27', 'events_list'),
(800, 99, 'b73a89a5-f05a-4725-a70b-e6076aae1c99', '2025-05-20 11:57:27', 'events_list'),
(801, 88, 'b73a89a5-f05a-4725-a70b-e6076aae1c99', '2025-05-20 11:57:27', 'events_list'),
(802, 102, 'b73a89a5-f05a-4725-a70b-e6076aae1c99', '2025-05-20 11:57:27', 'events_list'),
(803, 89, 'b73a89a5-f05a-4725-a70b-e6076aae1c99', '2025-05-20 11:57:27', 'events_list'),
(804, 91, 'b73a89a5-f05a-4725-a70b-e6076aae1c99', '2025-05-20 11:57:27', 'events_list'),
(805, 104, 'b73a89a5-f05a-4725-a70b-e6076aae1c99', '2025-05-20 11:57:27', 'events_list');

-- --------------------------------------------------------

--
-- Table structure for table `event_interactions`
--

CREATE TABLE `event_interactions` (
  `id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `user_id` text DEFAULT NULL,
  `interaction_type` text DEFAULT NULL,
  `timestamp` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `event_interactions`
--

INSERT INTO `event_interactions` (`id`, `event_id`, `user_id`, `interaction_type`, `timestamp`) VALUES
(6, 66, '62a121d9-fa6f-47e1-9d89-0208590e11f6', 'website_visit', '2025-05-03 15:30:38'),
(7, 71, '62a121d9-fa6f-47e1-9d89-0208590e11f6', 'website_visit', '2025-05-03 15:32:13'),
(8, 71, '6a9912f9-1cdd-4f7a-bd5b-8937401177c4', 'website_visit', '2025-05-04 16:23:54'),
(9, 71, 'd2a35cd8-5121-40fa-b395-c4e08f3467fc', 'website_visit', '2025-05-08 02:04:50');

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `id` int(11) NOT NULL,
  `degree_name` varchar(255) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `admission_year` int(11) NOT NULL,
  `university_id` int(11) NOT NULL,
  `exam_name` varchar(255) NOT NULL,
  `exam_date` date NOT NULL,
  `exam_url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `initiatives`
--

CREATE TABLE `initiatives` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `eligibility` text NOT NULL,
  `website_url` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('active','inactive') DEFAULT 'active',
  `department` varchar(100) DEFAULT NULL,
  `target_group` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `initiatives`
--

INSERT INTO `initiatives` (`id`, `name`, `description`, `eligibility`, `website_url`, `created_at`, `updated_at`, `status`, `department`, `target_group`, `start_date`, `end_date`) VALUES
(4, 'Additional Skill Acquisition Programme (ASAP Kerala)', 'Provides industry-aligned skill training to enhance employability. Offers courses like cybersecurity, banking, etc.', 'College students, recent graduates', 'asapkerala.gov.in', '2025-02-25 05:09:13', '2025-02-25 05:09:13', 'active', NULL, NULL, NULL, NULL),
(5, 'Kerala State Higher Education Council Scholarship', 'Offers scholarships (up to Rs 1,54,000 over 5 years) to 1,000 talented degree students in Govt./Aided colleges.', '1st-year UG students in Govt./Aided colleges', 'kshec.kerala.gov.in', '2025-02-25 05:09:13', '2025-03-08 04:27:41', 'active', NULL, NULL, NULL, NULL),
(6, 'C H Muhammed Koya Muslim Girls Scholarship', 'Financial aid for Muslim, Latin, and converted Christian female students in UG/PG or professional courses.', 'Female UG/PG students (merit quota)', 'minoritywelfare.kerala.gov.in', '2025-02-25 05:09:13', '2025-02-25 05:09:13', 'active', NULL, NULL, NULL, NULL),
(7, 'Suvarna Jubilee Merit Scholarship', 'Supports BPL students in 1st-year UG/PG courses in Govt./Aided colleges.', 'BPL UG/PG students', 'dcescholarship.kerala.gov.in', '2025-02-25 05:09:13', '2025-02-25 05:09:13', 'active', NULL, NULL, NULL, NULL),
(8, 'Kerala Knowledge Economy Mission', 'Connects students to job opportunities in tech and service sectors via training and placements.', 'College students, job seekers', 'knowledgeeconomy.kerala.gov.in', '2025-02-25 05:09:13', '2025-02-25 05:09:13', 'active', NULL, NULL, NULL, NULL),
(9, 'Kerala Startup Mission (KSUM) - Student Programs', 'Offers innovation grants, mentorship (SMILE), and startup exposure (INSPIRE) for student entrepreneurs.', 'College students with startup ideas', 'startupmission.kerala.gov.in', '2025-02-25 05:09:13', '2025-02-25 05:09:13', 'active', NULL, NULL, NULL, NULL),
(10, 'Central Sector Scholarship Scheme', 'Scholarships for students scoring above 80% in 12th, pursuing UG/PG with income < Rs 6 lakh.', '1st-year UG students', 'scholarships.gov.in', '2025-02-25 05:09:13', '2025-03-08 04:27:41', 'active', NULL, NULL, NULL, NULL),
(11, 'National Scholarship Scheme for Minorities', 'Financial aid for minority students (Muslim, Christian, etc.) in UG/PG/MPhil/PhD with income < Rs 2 lakh.', 'Minority UG/PG students', 'scholarships.gov.in', '2025-02-25 05:09:13', '2025-03-08 04:27:41', 'active', NULL, NULL, NULL, NULL),
(12, 'Pradhan Mantri Kaushal Vikas Yojana (PMKVY)', 'Free skill training in various trades to improve employability.', 'College students, youth', 'pmkvyofficial.org', '2025-02-25 05:09:13', '2025-02-25 05:09:13', 'active', NULL, NULL, NULL, NULL),
(13, 'SWAYAM (Study Webs of Active Learning)', 'Free online courses from top institutions for academic and skill enhancement.', 'All students', 'swayam.gov.in', '2025-02-25 05:09:13', '2025-02-25 05:09:13', 'active', NULL, NULL, NULL, NULL),
(14, 'Udaan Scheme', 'Training and placement for unemployed graduates in companies, especially in PSU sectors.', 'College graduates', 'nsdcindia.org/udaan', '2025-02-25 05:09:13', '2025-02-25 05:09:13', 'active', NULL, NULL, NULL, NULL),
(15, 'Startup India Seed Fund Scheme', 'Funding support (up to Rs 50 lakh) for student startups and innovators.', 'College students with startups', 'startupindia.gov.in', '2025-02-25 05:09:13', '2025-03-08 04:27:41', 'active', NULL, NULL, NULL, NULL),
(18, 'Online Certificate Apllication', 'In a major stride towards digitization, Kerala University has announced the launch of its Kerala University Online Certificate Services for key student services. Starting mid-December, 12 critical services will be available online, marking a significant shift from traditional offline methods. This initiative is aimed at enhancing convenience, reducing paperwork, and ensuring faster processing for students and alumni alike.', 'Kerala University’s initial phase of digitization includes the following 12 services:\r\n\r\nMedium of Instruction Certificate\r\nThis certificate specifies the language of instruction used during a student’s course of study.\r\nMigration Certificate\r\nEssential for students transferring to other universities or institutions outside Kerala University.\r\nCourse Cancellation Certificate\r\nFor students opting to discontinue a course and obtain confirmation of the same from the university.\r\nTransfer Certificate (TC) for Private Students\r\nA document needed when private students wish to move to a different institution or course.\r\nCollege Transfer Approvals\r\nThe process for students seeking to shift from one affiliated college to another.\r\nEquivalency Certificate\r\nThis certifies the equivalency of qualifications for courses completed in institutions outside Kerala University.\r\nTranscript of Marks\r\nOfficial statements summarizing marks obtained by a student during their course of study.\r\nDegree Certificate\r\nA vital document certifying successful completion of a degree program.\r\nAffiliation Certificate for Students\r\nIssued to students to confirm the affiliation of their course or institution to Kerala University.\r\nCourse Duration Certificate\r\nA certificate specifying the duration of a particular course of study.', 'https://promallu.in/kerala-university-online-certificate-services/', '2025-04-13 17:05:31', '2025-04-13 17:05:31', 'active', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `post_name` varchar(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `deadline` date NOT NULL,
  `description` text NOT NULL,
  `qualifications` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `email` varchar(200) NOT NULL DEFAULT 'o@g.c',
  `website` varchar(200) NOT NULL DEFAULT '0000000000',
  `phone` varchar(20) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `salary_range` varchar(100) DEFAULT NULL,
  `job_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `post_name`, `company_name`, `deadline`, `description`, `qualifications`, `created_at`, `updated_at`, `email`, `website`, `phone`, `location`, `salary_range`, `job_type`) VALUES
(1, 'Full Stack Developer (.NET and Angular)', 'kamedainfologics\r\n', '2025-04-01', 'Preferred Skills\r\nOther Requirements:\r\nStrong analytical and problem-solving skills.\r\nExcellent communication and teamwork abilities.\r\nAbility to manage multiple tasks and meet project deadlines.\r\nA keen eye for detail and a commitment to delivering high-quality code.\r\n\r\n\r\n', 'Preferred Qualifications:\r\nBachelor’s degree in Computer Science, Engineering, or a related field.\r\nKnowledge of software development lifecycle (SDLC) and Agile methodologies.\r\nExperience Required: 3-6 years', '2025-03-01 05:33:28', '2025-04-06 15:28:16', 'a@g.c', 'https://www.example.com', '1234567890', NULL, NULL, NULL),
(5, 'TCS Fresher Hiring NQT 2025', 'Tata Consultancy Services ', '2025-04-01', 'Engineering Fresher Hiring for the Graduating Batch of 2025\r\n\r\nRegistrations Open Now\r\n\r\nRegistration End Date: Sunday, 23rd March 2025\r\nTest Date: Saturday, 15th March 2025 onwards', '2025 Admission ', '2025-03-09 13:33:12', '2025-04-06 15:28:16', 'ilp.support@tcs.com', 'https://on.tcs.com/41v81D7', '0', NULL, NULL, NULL),
(6, 'Business Development Associate ', 'Avodha edutech ', '2025-04-01', '*Walk in drive at Infopark, Kochi*\r\n\r\nBUSINESS DEVELOPMENT ASSOCIATE (BDA)\r\n\r\nFRESHERS (15 NOS)\r\n\r\nSALARY FROM: 15000RS TO 60000RS\r\n\r\nREQUIREMENTS\r\n\r\n# GOOD COMMUNICATION SKILL\r\n\r\n# EAGERNESS TO LEARN\r\n\r\n# IMMEDIATE JOINERS PREFERRED\r\n\r\n# PREVIOUS EXPERIENCE IN EDTECH COMPANY IS PLUS\r\n\r\nWALK IN INTERVIEW ON 10/3/2025 and 13/3/2025\r\n\r\nSEND YOUR CV AND COVER LETTER TO:\r\n\r\n7012681742\r\n\r\nAvodhaEduTech PVT LTD\r\nPhase 1, 2nd Floor Carnival InfoPark, Kakkanad, Kochi', 'Any freshers ', '2025-03-09 13:56:54', '2025-04-06 15:28:16', 'help@avodha.co.in', 'https://avodha.co.in', '2147483647', NULL, NULL, NULL),
(11, ' Junior Executive', 'Airport Authority of India', '2025-05-24', '309 postRECRUITMENT FOR THE POST OF JUNIOR ASSISTANT (FIRE SERVICE) IN AAI, EASTERN REGION (ADVT NO. ER/01/2024) ', 'B.E/B.Tech/BSc', '2025-04-06 15:36:35', '2025-04-13 17:03:29', 'info@keralatechreach.in', 'https://promallu.in/aai-junior-executive-recruitment-2025-apply-for-309-vacancies/', '000000000000', NULL, NULL, NULL),
(12, 'GenC Next, GenC Pro, GenC & Analyst Trainee', 'Cognizant ', '2025-04-30', 'Freshers\r\n? CTC: Rs. 4 - 6.75 LPA\r\n', 'B.E/B.Tech/M.E/M.Tech/BCA/BSc/Any Degree\r\n', '2025-04-12 17:18:09', '2025-04-12 17:18:09', 'a@g.c', 'https://www.foundit.in/job/data-analyst-l4-wipro-limited-bengaluru-bangalore-34360726?searchId=', '0000000000', NULL, NULL, NULL),
(13, 'Project Assistant - Human Resource', 'Kerala Startup Mission', '2025-04-23', 'We’re looking for a Project Assistant - Human Resource to join our dynamic team and support our growing ecosystem of innovators and entrepreneurs.', 'Any degree', '2025-04-12 17:20:43', '2025-04-12 17:20:43', 'a@g.c', 'https://startupmission.kerala.gov.in/career', '0000000000', NULL, NULL, NULL),
(14, 'Internship 2025 - School of Electronic Systems and Automation, Digital University Kerala', 'Digital University Kerala', '2025-04-20', 'Internship 2025 - School of Electronic Systems and Automation, Digital University Kerala', 'Degree', '2025-04-13 06:08:54', '2025-04-13 06:08:54', 'a@g.c', 'https://docs.google.com/forms/d/e/1FAIpQLSdVdB_decVRL_T92k9hU8dfUoZ_7XrgY4uLnQUQQN1WdKCDEA/viewform', '0000000000', NULL, NULL, NULL),
(15, 'Fellowship – Maker Ecosystem', 'Kerala Startup Mission ', '2025-04-15', 'This fellowship position focuses on strengthening the ‘Maker Ecosystem’ within Kerala. Fellows will likely be involved in initiatives promoting hands-on STEM (Science, Technology, Engineering, Mathematics) learning, potentially working with schools, students, and teachers. The role involves utilizing and promoting digital fabrication tools, encouraging creative problem-solving, and contributing to KSUM’s mission of fostering innovation from the ground up.', 'Age Limit: Candidates must be below 28 years of age as of January 1, 2025.\r\nEducational Qualification: A B.Tech degree in any discipline from a recognized university is required.\r\nSelected fellows will receive a monthly stipend of Rs. 15,000.', '2025-04-13 17:02:29', '2025-04-13 17:02:29', 'info@keralatechreach.in', 'https://promallu.in/ksum-recruitment-2025-maker-ecosystem-fellowship-vacancy-apply-online/', '9874563210', NULL, NULL, NULL),
(16, 'Assistant Loco Pilot (ALP)', 'Indian Railway', '2025-05-11', '? 19,900/- per month, 9970 vacancy', 'Matric, ITI, Diploma', '2025-04-15 10:20:19', '2025-04-15 10:20:19', 'a@g.c', 'https://www.rrbapply.gov.in/#/auth/landing', '0000000000', NULL, NULL, NULL),
(17, 'Mega Walk In For Malayalam Voice Process-Customer Support', 'Matrimony com', '2025-04-25', '0 - 4 years1.75-3.25 Lacs P.A.KochiTime and Venue15th April - 24 April , 10.00 AM - 4.30 PMKerala matrimony, 3rd Floor,Coastal Chambers, Opposite Shipyard ,Ravipuram,Cochin-15 Meet Priyanka HR - 8075600699Contact - Priyanka A N ( 8075600699 )', 'Any Degree (2025 batch can also Apply)', '2025-04-18 12:57:25', '2025-04-18 12:59:56', 'a@g.c', 'https://www.naukri.com/job-listings-mega-walk-in-for-malayalam-voice-process-customer-support-matrimony-com-kochi-0-to-4-years-120225007832?src=jddesktop&sid=17449811739872650&xp=1&px=1', '8075600699 ', NULL, NULL, NULL),
(18, 'TCS Service Desk', 'TCS ', '2025-04-23', 'Requires exceptional verbal and written communication skills as well as strong customer service and interpersonal skills.\r\n\r\nWillingness to work in any shifts including night shifts and weekends.\r\n\r\nAccountable to answer customer requests and assisting customer either by over the phone, email, chat or Web.\r\n\r\nShould be flexible for voice support.', '12', '2025-04-20 17:27:29', '2025-04-20 17:27:29', 'a@g.c', 'https://www.foundit.in/seeker/cjt/job-vacancy-service-desk-tata-consultancy-services-limited-chennai-1-5-years-105460489', '00000000', NULL, NULL, NULL),
(19, 'Axis Bank Recruitment 2025 - Bank Jo', 'Axis Bank', '2025-04-30', 'Graduates or Post Graduates from any stream with 50% and above in their FINAL year of graduation OR aggregate of 50% and above in all years of Graduation.\r\nCandidates in the Final Year of their Graduation/Post Graduation who have appeared for their examination & are awaiting results are also eligible for the program. However, Original Final Year mark sheet & degree certificate will have to be submitted on joining the academy.\r\nGraduation Degree (10+2+3 patterns ) is compulsory\r\n \r\n\r\nAge: Not more than 30 years', 'Any degree', '2025-04-21 08:49:11', '2025-04-21 08:49:11', 'a@g.c', 'https://learnforjobs.niit.com/india/axisbankyb', '0000000000', NULL, NULL, NULL),
(20, 'Urgent Hiring For International Voice Process', 'Sutherland', '2025-04-30', 'Role & responsibilities\r\n\r\n    Handle real-time voice calls and chat with customer queries\r\n    Handle email queries and respond promptly\r\n    Attempt to provide resolutions on the first interaction with customers\r\n    Handle multiple cases at the same time with varying degrees of severity\r\n    Update customers on the progress of their cases regularly\r\n\r\nFor more details:\r\n\r\nAnna.Francis3@sutherlandglobal.com\r\n\r\n7907716867', 'Graduation Not required', '2025-04-22 15:40:46', '2025-04-22 15:40:46', 'Anna.Francis3@sutherlandglobal.com', 'https://www.naukri.com/job-listings-urgent-hiring-for-international-voice-process-sutherland-kochi-0-to-5-years-220425021054?src=gnbjobs_homepage_srch&sid=17453362625309337&xp=3&px=1', '0000000000', NULL, NULL, NULL),
(21, 'Volunteer Super 30 Team: Kerala Innovation Festival 2025    ', ' Kerala Startup Mission, Kochi', '2025-04-28', 'Be part of India’s largest innovation festival. Gain hands-on experience, network with industry leaders and contribute to shaping the future of innovation.\r\nWhy Volunteer?\r\n\r\n    Work with experts and innovators\r\n    Gain real-world event experience\r\n    Build connections with entrepreneurs and industry leaders\r\n\r\nEvent Date: 25-26 July 2025\r\nLocation: Kerala Startup Mission, Kochi\r\nLast Date to Apply: 27 April 2025', 'Degree', '2025-04-23 10:39:23', '2025-04-23 10:39:23', 'a@g.vc', 'https://docs.google.com/forms/d/e/1FAIpQLSd71M7wL52gRT98vITkmyzSDV2bAb69S7-wHyp0fgHoQIFsEQ/viewform', '0000000000', NULL, NULL, NULL),
(22, 'Data Entry Operator (DEO)', 'Gokaldas Exports &nbsp;', '2025-04-30', 'Bulk Over Time Entries\r\n\r\nHR Documents handling\r\n\r\nJob Type: Full-time\r\n\r\nPay: From ?15,000.00 per month\r\n\r\nBenefits:\r\n\r\n    Food provided\r\n    Paid sick time\r\n    Provident Fund\r\n\r\nLanguage:\r\n\r\n    English (Preferred)\r\n\r\nWork Location: In person', '10', '2025-04-25 13:42:18', '2025-04-25 13:42:18', 'a@g.vc', 'https://in.indeed.com/viewjob?jk=b120c87a020e4619&from=shareddesktop_copy', '0000000000', NULL, NULL, NULL),
(23, 'Data Entry', 'Stellar Creations &nbsp; Angamali, Kerala', '2025-04-30', 'Key Responsibilities:\r\n\r\n    Enter customer, product, and transaction details into databases or software systems accurately.\r\n    Update and maintain inventory records for gold, ornaments, and other precious items.\r\n    Ensure accuracy and consistency in weight, purity, price, and certification data.\r\n    Generate and review reports on stock and sales.\r\n    Perform routine backups and ensure data integrity.\r\n\r\nExperience - 0-1 year\r\nLocation :- Angamaly, Kerala\r\n\r\nJob Type: Full-time\r\n\r\nSchedule:\r\n\r\n    Day shift\r\n\r\nLanguage:\r\n\r\n    English (Preferred)\r\n\r\nWork Location: In person', '10', '2025-04-25 13:43:48', '2025-04-25 13:43:48', 'a@g.vc', 'https://in.indeed.com/viewjob?jk=d8edd979ab42c366&from=shareddesktop_copy', '0000000000', NULL, NULL, NULL),
(24, 'Deloitte Off Campus Drive ', 'Deloitte ', '2025-04-28', 'We are looking for a motivated and detail-oriented Analyst to join our consulting team in Pune. This role offers a great opportunity to work on strategic projects, perform in-depth research, analyze business problems, and support client engagements across various industries. \r\nJob Role:   Analyst\r\nExperience:  0 - 2 Years\r\n', '  B.E/B.Tech/BBA/BA/BCom\r\n', '2025-04-26 12:12:52', '2025-04-26 12:12:52', 'a@g.vc', 'https://southasiacareers.deloitte.com/job/Pune-Analyst-Fresher-Pune-Technology-Strategy-&-Transformation/38920644/', '0000000000', NULL, NULL, NULL),
(25, 'Pacelab Internship Program', 'Pace Lab', '2025-06-01', '- Pace Lab  1 & 2 week Offline Internship - 10000+ registered- Most favoured programmeBenefits:- Upto 60 KTU points- IIT certifications- Blockchain integrated certification - Fun events and activities- Music Fest - free pass- Job networking access- VR experience & gaming- For all branches- Accomodation available ', 'For all branches', '2025-04-26 16:52:16', '2025-05-04 10:33:16', 'a@g.c', 'http://internship.pacelab.in', '8075795538', NULL, NULL, NULL),
(27, 'Accounts Executive', 'Pankajakasthuri Herbals India (P) Ltd', '2025-05-10', 'Preferred Experience:\r\n\r\n    Proven work experience as an Accounts Executive or similar role.\r\n    Experience handling statutory compliance and taxation.\r\n    Familiarity with ERP systems is a plus.\r\n\r\nJob Type: Full-time\r\n\r\nPay: ?22,000.00 - ?29,000.00 per month', 'Bachelor’s degree in Commerce, Accounting, Finance, or a related field.\r\n', '2025-04-30 09:52:33', '2025-04-30 09:52:33', 'a@g.vc', 'https://in.indeed.com/viewjob?cmp=Pankajakasthuri-Herbals-India-%28P%29-Ltd.&t=Account+Executive&jk=8bb0cfa049b25882&xpse=SoCV67I3yC3YCZW2o50LbzkdCdPP&xfps=2756d13e-65f0-4436-aad6-2711d848836c&xkcb=So', '0000000000', NULL, NULL, NULL),
(28, 'Software Internship Training Program', 'Cyvents technologies Pvt Ltd', '2025-05-12', 'Pay: 5000\r\n\r\nJob type: Internship\r\n\r\n', 'Degree', '2025-05-01 06:50:52', '2025-05-01 06:50:52', 'a@g.vc', 'https://in.indeed.com/?vjk=fef51742005bc16d', '0000000000', NULL, NULL, NULL),
(29, 'Digital Marketing Specialist', 'Medvision', '2025-05-09', 'Job Type: Full-time\r\n\r\nPay: Up to ?30,000.00 per month\r\n\r\nSchedule:\r\n\r\n    Day shift\r\n\r\nSupplemental Pay:\r\n\r\n    Performance bonus\r\n\r\nWork Location: In person', 'Degree', '2025-05-01 06:53:16', '2025-05-01 06:53:16', 'medvisiongeo@gmail.com', 'https://in.indeed.com/?vjk=5c0a87fe2479e6cc', '91 9061424897', NULL, NULL, NULL),
(30, 'Creative Content Writer', 'Konceptale', '2025-05-14', 'Creative Content Maker\r\n\r\n1. Need good idea about the latest trends\r\n\r\n2.Must know how script works\r\n\r\n3.Creative poster content writing skill\r\n\r\n4.Video content making\r\n\r\n5.Must have reading ability and story telling skill\r\n\r\n6.Presentations skills need to good\r\n\r\n7.Need good idea about social media hooks\r\n\r\nJob Types: Full-time, Fresher, Internship\r\nContract length: 6 months\r\n\r\nPay: ?8,000.00 - ?25,000.00 per month', '12', '2025-05-03 11:09:59', '2025-05-03 11:09:59', 'a@g.vc', 'https://in.indeed.com/jobs?q=&l=Vizhinjam%2C+Thiruvananthapuram%2C+Kerala&from=searchOnHP&vjk=cf3c2f8b97cfdda6', '0000000000', NULL, NULL, NULL),
(31, 'delivery Boy/Girl', 'Orchid Internationa', '2025-05-15', '\r\n    Product Delivery.\r\n    Payment Collection\r\n    On site Product repair.\r\n    In Office Product repair.\r\n\r\nCandidates with valid driving License, and two wheeler may apply.\r\n\r\nCandidates with electronics background preferred.\r\n\r\nAttractive Incentives and flexible work timings.\r\n\r\nJob Types: Full-time, Permanent\r\n\r\nPay: ?14,000.00 - ?16,000.00 per month', 'NIL', '2025-05-03 11:11:09', '2025-05-03 11:11:09', 'a@g.vc', 'https://in.indeed.com/jobs?q=&l=Vizhinjam%2C+Thiruvananthapuram%2C+Kerala&from=searchOnHP&vjk=475ccb2117034ea9', '0000000000', NULL, NULL, NULL),
(32, 'Digital Marketing Executive', 'CORE INSTITUTE OF TECHNOLOGY &nbsp;', '2025-05-14', 'Key Responsibilities\r\n\r\n    Stay up-to-date with the latest trends and best practice in digital marketing.\r\n    Digital Marketing executive will be responsible for developing and implementing digital marketing strategies to promote our programs and services.\r\n\r\n\r\nJob Type: Full-time\r\n\r\nPay: ?15,000.00 - ?20,000.00 per mont', 'Requirements\r\n\r\n    B.tech/ MCA\r\n    Strong Knowledge of Google Ads and Social media Ads.\r\n    Min.1 year Experience.\r\n', '2025-05-03 11:12:40', '2025-05-03 11:12:40', 'a@g.vc', 'https://in.indeed.com/jobs?q=&l=Vizhinjam%2C+Thiruvananthapuram%2C+Kerala&from=searchOnHP&vjk=53b49aa6910d4251', '0000000000', NULL, NULL, NULL),
(33, 'Zoho | Software Developer (Recommended)', 'Zoho ', '2025-05-22', 'Experience : 0-2 YearsJob Description:* Work as part of a software development team* Design and develop high-volume, low-latency applications delivering high-availability and performance.* Optimize application for maximum speed and scalability* Contribute in all phases of the product development life cycle.* Write well designed, testable, efficient code.Requirements:* Proficient knowledge of latest Java and decent knowledge in SQL and No-SQL.* Proficient knowledge of any IDE and debugging tools* Strong understanding of the web development cycle and programming techniques and tools.* Strong problem-solving skills and a passion for learning new technologies.* Looking for a candidate who can join us immediately.Note:Only the shortlisted candidates will be receiving the interview call letter. 2026 Candidates are not eligible for this interview process .', '-', '2025-05-03 11:15:00', '2025-05-03 11:18:02', 'a@g.vc', 'https://careers.zohocorp.com/jobs/Careers/2803000614929615/Software-Developers?source=CareerSite', '0000000000', NULL, NULL, NULL),
(34, ' Zoho Corporation | Full time Technical Support Engineers ', 'Zoho ', '2025-05-30', 'Job Description\r\n\r\n    Provide voice-based support to international/domestic customers over the phone (Inbound and Outbound).\r\n    Build a rapport with customers with clear and confident communication.\r\n    Focus on customer satisfaction and first-time-resolution.\r\n    Engage with the technical team to provide faster resolutions to technical issues.\r\n    Work closely with the technical content team to identify gaps in the help module.\r\n    Should be willing to work night shifts.\r\n', '-', '2025-05-03 11:34:13', '2025-05-03 11:34:13', 'a@g.vc', 'https://careers.zohocorp.com/jobs/Careers/2803000614929125/Technical-Support-Engineers?source=CareerSite', '0000000000', NULL, NULL, NULL),
(35, ' Zoho Corporation | Full time Digital Marketing Analyst ', 'Zoho ', '2025-05-30', 'Job Description\r\n\r\n    Manage Google Adwords Campaigns to improve Return on Investment and generate reports\r\n    Develop performance metrics to provide recommendations and continually revise campaign strategy\r\n    Understand data and arrive at decisions based on Web Analytics data and generate reports \r\n    Integrate SEM campaigns, including both Paid Search (Pay-Per-Click), Search Engine Optimization (SEO), Social Media and other paid/non-paid mediums\r\n    Manage Search Engine Optimization for a few products and generate reports\r\n    Engage in all facets of search engine marketing (SEM) campaigns, including initial planning, implementation, monitoring, optimization, analysis and reporting\r\n\r\n\r\n\r\n', '-', '2025-05-03 11:35:24', '2025-05-03 11:35:24', 'a@g.vc', 'https://careers.zohocorp.com/jobs/Careers/2803000855343758/Digital-Marketing-Analyst?source=CareerSite', '0000000000', NULL, NULL, NULL),
(36, '  Zoho Corporation | Full time Content/Technical Writers ', 'Zoho ', '2025-05-30', 'Job Description\r\n\r\n    Ideate and create content for blogs, articles, social media copies, and other formats on a regular basis.\r\n    Stay up to date with content in the market to understand the kind of content being written in digital media across platforms.\r\n    Create documents for different markets and domains based on user proficiency.\r\n\r\nPlease note that we have requirements for this role in Chennai, Salem, Coimbatore, Tirunelveli, and Madurai.\r\n\r\n\r\n', '-', '2025-05-03 11:36:49', '2025-05-03 11:36:49', 'a@g.vc', 'https://careers.zohocorp.com/jobs/Careers/2803000614929029/Content-Technical-Writers?source=CareerSite', '0000000000', NULL, NULL, NULL),
(37, '  Zoho Corporation | Full time QA Engineers ', 'Zoho ', '2025-05-30', 'Job Description\r\n\r\n    Experience in manual and automation testing.\r\n    Knowledge of Java Programming (data types, variables, operators, flow control statements, methods (built-in as well as user-defined), Exception handling, File Handling, Database Operations, and OOPS concepts.\r\n    Experience in MySQL/PgSQL.\r\n    Experience in Selenium and Jmeter.\r\n    Should be able to perform rigorous testing by creating large data sets, conduct back-end testing, and validate information as it flows through the system.\r\n    Assist developers, support reps, and product managers in debugging issues.\r\n    Re-test and verify the bugs/issues that have been fixed.\r\n\r\nPlease note that we have requirements for this role in Chennai, Salem, Coimbatore, Tirunelveli, and Madurai.\r\n\r\n', '-', '2025-05-03 11:37:43', '2025-05-03 11:37:43', 'a@g.vc', 'https://careers.zohocorp.com/jobs/Careers/2803000614913581/QA-Engineers?source=CareerSite', '0000000000', NULL, NULL, NULL),
(38, '  Zoho Corporation | Full time Sales Executives', 'Zoho ', '2025-05-30', 'Job Description\r\n\r\n    Build rapport with contacts and understand where the prospect is in the buying process.\r\n    Identify opportunities that meet a minimum qualification criteria for the sales team.\r\n    Tend incoming sales calls and emails, and assign them to sales reps.\r\n\r\nWe\'re looking for someone with:\r\n\r\n    Excellent interpersonal, communication, and product presentation skills.\r\n    Attention to detail and a strong desire to learn.\r\n    Ability to work independently and deliver value to the customers and the company.\r\n    Should be willing to work all shifts.\r\n\r\nPlease note that we have requirements for this role in Chennai, Salem, Coimbatore, Tirunelveli, and Madurai.', '-', '2025-05-03 11:39:50', '2025-05-03 11:39:50', 'a@g.vc', 'https://careers.zohocorp.com/jobs/Careers/2803000614929688/Sales-Executives?source=CareerSite', '0000000000', NULL, NULL, NULL),
(39, '  Zoho Corporation | Full time Designers- UI/UX/Visual/Graphic ', 'Zoho ', '2025-05-30', 'Job Description\r\n\r\n    Help build design work across multiple mediums on various projects, from small pieces to multi-channel campaigns.\r\n    Build digital assets for marketing campaigns that align with the look and feel of those campaigns across other touch points.\r\n    Assist in the planning and creation of designs for marketing automation campaigns to include email, social media, and PPC.\r\n    Design templates for landing pages and emails using custom CSS and styling to help support brand messages.\r\n    Design onsite creatives, including A/B testing and better UX design to help drive user engagement.\r\n    Design dynamic and static banners for Google Display Network and other 3rd party networks.\r\n    Assist in designing websites with wire-framing and UX capabilities.\r\n    Design printed collateral, signage, print ads, etc.\r\n\r\nPlease note that we have requirements for this role in Chennai, Salem, Coimbatore, Tirunelveli, and Madurai.\r\n\r\n\r\n', '-', '2025-05-03 11:41:07', '2025-05-03 11:41:07', 'a@g.vc', 'https://careers.zohocorp.com/jobs/Careers/2803000614929898/Designers--UI-UX-Visual-Graphic?source=CareerSite', '0000000000', NULL, NULL, NULL),
(40, ' Zoho Corporation | Full time Web Developers ', 'Zoho ', '2025-05-30', 'Job Description\r\n\r\n    Develop new components based on design specs.\r\n    Work independently and write maintainable code.\r\n    Understand existing code and suggest optimization in terms of functionality and performance.\r\n    Work on client frameworks for caching and develop reusable components.\r\n\r\nPlease note that we have requirements for this role in Chennai, Salem, Coimbatore, Tirunelveli, and Madurai.\r\n\r\n\r\n\r\n', '-', '2025-05-03 11:42:40', '2025-05-03 11:42:40', 'a@g.vc', 'https://careers.zohocorp.com/jobs/Careers/2803000614913786/Web-Developers?source=CareerSite', '0000000000', NULL, NULL, NULL),
(41, 'Junior Software Developer Remote', 'Leuwint technologies &nbsp;', '2025-05-08', '\r\n    Assist in the development, testing, and maintenance of software applications.\r\n    Collaborate with team members to design and implement new features.\r\n    Debug and resolve technical issues under the guidance of senior developers.\r\n    Write clean, maintainable, and efficient code following best practices.\r\n    Contribute to project documentation and participate in code reviews.\r\n    Educational Qualification: Bachelors degree in Computer Science, Information Technology, or a related field.\r\n    Technical Skills: Knowledge of at least one programming language (e.g., Python, Java, JavaScript, C++), basic web development (HTML, CSS, JavaScript), and familiarity with Git.\r\n\r\n    Location : Palakkad/Remote\r\n', '-', '2025-05-04 06:56:07', '2025-05-04 06:56:07', 'a@g.vc', 'https://in.indeed.com/jobs?q=work+from+home&rbl=Kerala&forceLocation=0&jlid=b2ef2f03f7a1c2f3&vjk=d23124c0deabd661', '0000000000', NULL, NULL, NULL),
(42, 'Capgemini Off Campus Drive 2025 ', 'Capgemini ', '2025-05-15', 'Job Role 	Contact Support Group (CSG)\r\nJob Type 	Off Campus Drive\r\nQualification 	Any Degree/Diploma\r\nBatch 	2024/2025\r\nExperience 	Freshers\r\nCTC/Salary 	Rs. 3.25 LPA\r\nJob Location 	Coimbatore\r\nLast Date 	15 May 2025', 'Any Degree/Diploma', '2025-05-04 13:50:42', '2025-05-04 13:50:42', 'a@g.vc', 'https://app.joinsuperset.com/join/#/signup/student/jobprofiles/8fbf0e81-fb1d-4bdd-b624-4a3bbab66e6b', '0000000000', NULL, NULL, NULL),
(43, 'Cloud application Developer/trainer', 'Don bosco tech Kollam', '2025-05-20', 'Fresher', 'PG in MCA, MSc CS And Mtech', '2025-05-05 10:19:42', '2025-05-05 10:19:42', 'kollam.fcdp@dbtech.co.in', 'https://www.dbtech.in', '8891924337', NULL, NULL, NULL),
(44, 'Fresher Mern stack developer Intern', 'Salat management', '2025-05-10', 'Calicut, Kerala\r\nRs 9000 salary\r\n\r\n\r\n\r\nGood communication.\r\n\r\nFront end development.\r\n\r\nBack end development.\r\n\r\npython Development\r\n\r\nDjango framework.\r\n\r\nMongoDB\r\n\r\nExpress\r\n\r\nReact\r\n\r\nNode JS', 'Btech, Mtech, MSc, MCA, BSc, BCA, BCom and any degree.', '2025-05-06 15:26:58', '2025-05-06 15:26:58', 'a@g.vc', 'https://in.indeed.com/?vjk=bfe29d4ed3f99b9b', '0000000000', NULL, NULL, NULL),
(45, 'Chemistry Teacher | Remote', 'Kerala English Medium School', '2025-05-12', 'Job Title : Chemistry Teacher (High School)\r\n\r\nJob Code:CHEM01\r\n\r\nLocation: Ryshi School, Anantapur, Andhra Pradesh (Preferred: Candidates from Kerala )\r\n\r\nSalary: ?25,000 – ?30,000 per month\r\n\r\nJob Type: Full-time\r\n', 'Bachelor’s/Master’s degree in Chemistry or a related discipline', '2025-05-06 15:29:24', '2025-05-06 15:29:24', 'a@g.vc', 'https://in.indeed.com/jobs?q=work+from+home&l=&ts=1746341557419&rbl=Kerala&jlid=b2ef2f03f7a1c2f3&from=searchOnHP&rq=1&rsIdx=0&newcount=260&fromage=last&vjk=a40745a8539d02b2', '0000000000', NULL, NULL, NULL),
(46, 'HR Intern', 'PEEPL Automation Private Limited &nbsp;', '2025-05-12', 'Pay: ?2,500.00 per month\r\nWe are looking for a motivated and detail-oriented HR Intern to join our team for a 3-month internship. This is an excellent opportunity for students or fresh graduates who want hands-on experience in human resources functions within a professional work environment.\r\n\r\nRoles & Responsibilities:\r\n\r\n    Assist in recruitment processes (sourcing, screening, scheduling interviews)\r\n    Maintain and update employee records\r\n    Support onboarding and documentation\r\n    Help in preparing HR reports and maintaining spreadsheets\r\n    Assist in organizing training and employee engagement activities\r\n    Support daily HR administrative tasks\r\n', 'Completed MBA or degree with specialization in HR or related field', '2025-05-06 15:31:08', '2025-05-06 15:31:08', 'a@g.vc', 'https://in.indeed.com/jobs?q=work+from+home&l=&ts=1746341557419&rbl=Kerala&jlid=b2ef2f03f7a1c2f3&from=searchOnHP&rq=1&rsIdx=0&newcount=260&fromage=last&vjk=7e5a827081e66b20', '0000000000', NULL, NULL, NULL),
(47, 'Sales and Marketing Trainee | Walk In ', 'JUNIORDEC25 PRIVATE LIMITED', '2025-05-09', 'Walk In Date:09,May 2025 -09,May 2025\r\nFrom: 10:30:00\r\nTo: 15:30:00\r\n\r\nWe are seeking fresh talent to join our growing team. As a Sales and Marketing Trainee, you will play a crucial role in supporting our company’s growth and expansion. This is an excellent opportunity to learn and develop your skills in a fast-paced and dynamic environment.', 'Bachelor\'s degree or MBA in business, marketing, or a related field.', '2025-05-06 15:55:17', '2025-05-06 15:55:17', 'info@juniordec25.com', 'https://technopark.org/job-details/19907?job=Sales%20and%20Marketing%20Trainee', '0000000000', NULL, NULL, NULL),
(48, 'JUNIOR ACCOUNTANT', 'REIZEND PRIVATE LIMITED', '2025-05-16', 'Closing Date:18,June 2025\r\nJob Published: 04,May 2025\r\nContact Email: careers@reizend.ai ', 'degree', '2025-05-06 16:00:47', '2025-05-06 16:00:47', 'careers@reizend.ai', 'https://technopark.org/job-details/19911?job=JUNIOR%20ACCOUNTANT', '0000000000', NULL, NULL, NULL),
(49, 'Data Entry Operator', 'Upcommune Business Network Pvt Ltd', '2025-05-20', 'We are seeking a detail-oriented and dependable Data Entry Operator to join our team. The ideal candidate will be responsible for accurately entering, updating, and maintaining information in our databases and systems. You should have fast typing skills, excellent attention to detail, and a passion for organizing and maintaining data integrity.', '-', '2025-05-06 16:02:22', '2025-05-06 16:02:22', 'mail@upcommune.net', 'https://technopark.org/job-details/19987?job=Data%20Entry%20Operator', '91 9074882688', NULL, NULL, NULL),
(50, 'CSR Fundraising Manager', 'GENROBOTIC INNOVATIONS PRIVATE LIMITED', '2025-05-22', 'We are excited to announce an opportunity for a dynamic and visionary leader to join our team as the head of our Partnerships & CSR vertical. In this role, you will be at the forefront of driving strategic alliances, securing CSR and philanthropic funding, and forging impactful collaborations with corporations, foundations, and government organizations. Your contributions will be instrumental in advancing our mission and creating lasting change through innovative partnerships.', 'Qualification: Bachelor\'s/Master\'s degree in Business, Social Work, or a related field (preferred).\r\n\r\n', '2025-05-06 16:05:23', '2025-05-06 16:05:23', 'career@genrobotics.org', 'https://technopark.org/job-details/19906?job=CSR%20Fundraising%20Manager', '0000000000', NULL, NULL, NULL),
(51, 'Kochi Metro Regular and  contract', 'Kochi Metro', '2025-05-14', 'Kochi metro regular and contract \r\nRs 50000 -90000\r\nlook webstite', 'look webstite', '2025-05-07 14:31:48', '2025-05-07 14:31:48', 'a@g.vc', 'https://kochimetro.org/careers/kmrl_vacancy.php?vac_type=jobs&company=KMRL', '0000000000', NULL, NULL, NULL),
(52, 'Railway Assistant Loco Pilot (ALP) Recruitment 2025', 'Railways', '2025-05-12', 'Total Post -9970', '\r\n    Class 10th Matric with ITI from NCVT / SCVT Certificate in Fitter, Electrician, Instrument Mechanic, Millwright/Maintenance Mechanic, Mechanic (Radio & TV), Electronics Mechanic, Mechanic (Motor Vehicle), Wireman, Tractor Mechanic, Armature & Coil Winder, Mechanic (Diesel), Heat Engine, Turner, Machinist, Refrigeration & Air- Conditioning Mechanic. OR\r\n    Class 10th with Diploma in Mechanical / Electrical / Electronics / Automobile Engineering (OR) combination of various streams of these Engineering disciplines from a recognised Institution in lieu of ITI. OR\r\n    BE / B.Tech Degree in Mechanical / Electrical / Electronics / Automobile Engineering.\r\n    More Eligibility Details Read the Notification.', '2025-05-07 14:47:39', '2025-05-07 14:47:39', '', 'https://www.sarkariresult.com/railway/rrb-alp-cen-01-2025/', '', NULL, NULL, NULL),
(53, 'Content Writer Intern', 'Lean Transitions Solutions', '2025-05-14', '\r\n    Recently completed a degree in English, Journalism, Marketing, Communications, or a related field (Preferably 2024 Passed out). \r\n    Strong research, writing, editing, and proofreading skills. \r\n    Basic understanding of SEO and keywords. \r\n', 'degree', '2025-05-10 14:04:10', '2025-05-10 14:04:10', 'careers@ltslean.com', 'https://technopark.org/job-details/20068?job=Content%20Writer%20Intern', '', NULL, NULL, NULL),
(54, 'Business Development Intern', 'Lean Transitions Solutions', '2025-05-14', 'Qualification: Recently completed MBA (Marketing) \r\n\r\n* Strong written and verbal communication skills in English.\r\n\r\n* Ability to work collaboratively with different teams in a dynamic, fast-paced environment.', 'MBA', '2025-05-10 14:08:56', '2025-05-10 14:08:56', 'careers@ltslean.com', 'https://technopark.org/job-details/20069?job=Business%20Development%20Intern', '', NULL, NULL, NULL),
(55, 'Talent Acquisition - Intern', '2Base Technologies Pvt Ltd', '2025-05-12', '1. Assist in job posting and vacancy management.\r\n2. Sourcing, screening, calling, and scheduling the interviews, as well as communicating with candidates. for IT requirements\r\n3. Maintain applicant records', '. Education: Any graduate or MBA in HR', '2025-05-10 15:40:04', '2025-05-10 15:40:04', 'careers@2basetechnologies.com', 'https://infopark.in/company-jobs/details/18706/312', '', NULL, NULL, NULL),
(56, 'Telecaller (Female Candidates Only)', 'Techstas Info Solutions (P) Ltd', '2025-05-31', 'We are looking for an enthusiastic and skilled Telecaller to join our dynamic team. The ideal candidate will be fluent in Hindi, Tamil, Malayalam, and English, and will play a vital role in reaching out to potential and existing customers, offering product/service information, and ensuring a positive customer experience. Female candidates who meet all the specified criteria are encouraged to apply.', '\r\n    Female candidates only.\r\n    Immediate joiners are highly preferred.\r\n    Previous experience in telecalling or a similar customer-facing role is a plus.\r\n', '2025-05-13 08:10:05', '2025-05-13 08:10:05', '', 'https://technopark.org/job-details/20158?job=Telecaller%20(Female%20Candidates%20Only)', '', NULL, NULL, NULL),
(57, 'AI/ML Engineer', 'Techversant', '2025-05-22', 'Develop ML and Deep Learning Solutions\r\nCreate predictive, classification, and optimization models using supervised, unsupervised, and reinforcement learning.\r\n? Design and Implement Generative AI Systems\r\nBuild and fine-tune Large Language Models (LLMs) and diffusion models for a range of use cases involving text, code, and multi-modal data.\r\n? Build Scalable Recommendation Engines', 'Minimum 4 years of experience in building and deploying production-level ML/DL systems\r\n? Develop proofs of concept AI/ML-based solutions and services and demonstrate them to Business stakeholders\r\n? Design and deliver ML architecture patterns operable in native and hybrid cloud architectures.\r\n? Create Functional and technical specifications for AI/ML solutions.', '2025-05-13 08:14:04', '2025-05-13 08:14:04', '', 'https://infopark.in/company-jobs/details/18757/85', '', NULL, NULL, NULL),
(58, 'PHP Software Engineer', ' Grapelime Innovations Private Limited.', '2025-05-14', 'Strong knowledge of PHP or web server exploits and their solutions\r\n• Demonstrable knowledge of web technologies including HTML, CSS, Javascript, AJAX etc\r\n• Good knowledge of relational databases, version control tools and of developing web services\r\n• Experience in common third-party APIs', 'Experience : Upto 3 years\r\n\r\nInterested professionals can share their CVs at hr@grapelime.in ', '2025-05-13 08:16:44', '2025-05-13 08:16:44', 'hr@grapelime.in', 'https://infopark.in/company-jobs/details/18815/296', '', NULL, NULL, NULL),
(59, 'Research Assistant - AI/ ML', 'JK Lucent Pvt Ltd', '2025-05-15', '\r\nRoles and Responsibilities\r\n• Collaborate with the research team on ongoing and upcoming research projects.\r\n• Conduct detailed literature reviews and design experiments or simulations.\r\n• Draft, edit, and submit manuscripts to peer-reviewed journals and conferences.\r\n• Assist in the preparation of research proposals, funding applications, and technical reports.\r\n• Analyze complex data sets using statistical and programming tools.\r\n• Participate in collaborative and interdisciplinary research discussions.\r\n• Ensure the quality, integrity, and reproducibility of research output.', 'Requirements\r\n• Research Experience in Computer Science or a Closely Related Field.\r\n• Proven track record of published research in peer-reviewed journals (please include DOIs or links).\r\n• Strong foundation in mathematics, statistics, and data-driven research methodologies.', '2025-05-13 08:18:50', '2025-05-13 08:18:50', 'careers@jklucent.com.au', 'https://infopark.in/company-jobs/details/18586/415', '', NULL, NULL, NULL),
(60, 'Digital Marketing/ SEO Intern (WFH)', ' Techware Lab Pvt.Ltd.', '2025-05-15', '*Assist in SEO, SEM, and social media marketing campaigns.\r\n*Work on content creation, email marketing, and paid ad campaigns.\r\n*Analyze digital marketing data and generate insightful reports.\r\n*Optimize website and social media channels for improved reach and engagement.', 'Graduation Year: 2023 to 2025 passed graduates.\r\n*Education: Must be a graduate (BBA/MBA)\r\n*Internet Connection: Must have stable internet connection, Laptop will be provided from office ', '2025-05-13 08:20:08', '2025-05-13 08:20:08', 'careers@techwarelab.com', 'https://infopark.in/company-jobs/details/17990/268', '', NULL, NULL, NULL),
(61, 'HR-Internship-3months', 'Techware Lab Pvt.Ltd.', '2025-05-31', 'Position Overview: We are seeking enthusiastic and proactive HR Interns to join our team remotely. ', 'Education: BBA/MBA Graduates (Graduation Year: 2023, 2024, or 2025)', '2025-05-14 12:26:18', '2025-05-14 12:26:18', 'careers@techwarelab.com', 'https://infopark.in/company-jobs/details/17463/268', '', NULL, NULL, NULL),
(62, 'Human Resources Intern ( HR, Intern)', 'Paoyaila Animation Studios LLP', '2025-05-31', 'We are seeking a highly motivated and detail-oriented HR Intern to oversee all aspects of human resources practices and\r\nprocesses. ', 'Master’s degree / M.B.A / Bachelor\'s degree in Human Resources, Business Administration, or a related field.\r\n', '2025-05-14 12:27:51', '2025-05-14 12:27:51', 'paoyaila@gmail.com', 'https://infopark.in/company-jobs/details/18536/476', '', NULL, NULL, NULL),
(63, 'HR Intern', 'Advenser Engineering Services Private Limited', '2025-05-31', 'This is a full-time on-site role for a Human Resources Intern located in Kochi. ', 'MBA-HR or other qualifying degree in Human resources.\r\n', '2025-05-14 12:29:00', '2025-05-14 12:29:00', 'info@advenser.com', 'https://infopark.in/company-jobs/details/18799/107', '', NULL, NULL, NULL),
(64, 'HR Intern', ' Nuvento Systems Private Limited', '2025-06-01', 'Recruitment Support: Assist in sourcing, screening, and scheduling interviews for candidates.\r\n', 'MBA degree (HR specialization preferred).\r\n', '2025-05-14 12:30:34', '2025-05-14 12:30:34', 'mohan@nuvento.com', 'https://infopark.in/company-jobs/details/18422/58', '', NULL, NULL, NULL),
(65, 'HR Intern', 'Innovature Software Labs (P) Ltd', '2025-05-25', 'We are looking for energetic MBA HR Intern to join our team ', '-', '2025-05-14 12:33:48', '2025-05-14 12:33:48', 'hr@innovaturelabs.com', 'https://infopark.in/company-jobs/details/18458/190', '', NULL, NULL, NULL),
(66, 'INTERNSHIP – HR ', 'Aabasoft Technologies India Private Limited', '2025-06-30', 'Monitor office operations.\r\n• Employee Engagement\r\n• Assists office staff in maintaining files and databases. ', '-', '2025-05-14 12:35:21', '2025-05-14 12:35:21', 'career@aabasoft.com', 'https://infopark.in/company-jobs/details/6898/95', '', NULL, NULL, NULL),
(67, 'Academic Counselor', 'Mashuptech', '2025-05-17', 'Provide personalized counseling to students regarding course selections and academic pathways.\r\nAssist students with the admissions process and clarify program requirements.', 'Bachelor’s degree in Education or a related field (fresh graduates encouraged to apply).\r\n', '2025-05-14 12:46:20', '2025-05-14 12:46:20', '', 'https://infopark.in/company-jobs/details/17013/360', '', NULL, NULL, NULL),
(68, 'AI Engineer Training & Internship', 'GALTech Technologies Pvt Ltd', '2025-05-17', 'We are excited to offer a rewarding opportunity for freshers and recent AI or Data Science graduates. If you\'re passionate about machine learning, AI innovation, and NLP solutions, we invite you to join us and gain hands-on experience working on impactful projects.\r\n', '-', '2025-05-14 12:48:47', '2025-05-14 12:48:47', '', 'https://infopark.in/company-jobs/details/18652/189', '', NULL, NULL, NULL),
(69, 'Fresher - Content Writer Cum Social Media Executive', 'Digiora Technologies Pvt.Ltd.', '2025-05-30', 'Responsibilities\r\n*Preparing social media plan, content and creative ideas\r\n*Implement social media strategies for clients\r\n*Manage social media campaigns and day to day activitie', '-', '2025-05-14 12:50:00', '2025-05-14 12:50:00', '', 'https://infopark.in/company-jobs/details/18357/250', '', NULL, NULL, NULL),
(70, 'Creative Designer Internship', 'Appadore Private Limited', '2025-05-31', 'We’re on the lookout for a talented Creative Designer who is eager to bring fresh ideas to the table and help us elevate our brand to new heights. ', '-', '2025-05-14 12:50:59', '2025-05-14 12:50:59', '', 'https://infopark.in/company-jobs/details/18253/253', '', NULL, NULL, NULL),
(71, 'Quality Analyst/Tester Internship', 'Appadore Private Limited', '2025-05-31', 'As a Quality Analyst/Tester Intern, you will assist our QA team in ensuring the highest quality of our applications. This internship provides a fantastic opportunity to learn about testing processes, create test plans, and work closely with developers to enhance the overall quality of our products.', 'Currently pursuing or recently completed a Bachelor’s degree, B.Tech, BCA, MCA, or a related field.\r\n', '2025-05-14 12:52:00', '2025-05-14 12:52:00', '', 'https://infopark.in/company-jobs/details/16980/253', '', NULL, NULL, NULL),
(72, 'State Bank of India Circle Based Officer (CBO) Vacancy 2025 [2964 Posts] ', 'State Bank of India ', '2025-05-29', 'Circle Based Officer (CBO) Vacancy 2025 [2964 Posts] \r\n21 to 30 years (as of April 30, 2025)\r\nRs 48,480 per month (starting)\r\nall India', 'Any Bachelor’s Degree', '2025-05-17 15:52:56', '2025-05-17 15:52:56', '', 'https://ibpsonline.ibps.in/sbicboapr25/', '', NULL, NULL, NULL),
(73, 'IDBI Bank Junior Assistant Manager (JAM) Vacancy 2025 [676 Posts] ', 'IDBI Bank ', '2025-05-20', '? 6.14 lakh to ? 6.50 lakh per annum (CTC, Class A city)\r\n20 to 25 years\r\nBachelor’s Degree (60% for General/EWS/OBC, 55% for SC/ST/PwBD)\r\n20/05/2025 - last date', 'Bachelor’s Degree (60% for General/EWS/OBC, 55% for SC/ST/PwBD)', '2025-05-17 15:56:57', '2025-05-17 15:56:57', '', 'https://ibpsonline.ibps.in/idbiamapr25/', '', NULL, NULL, NULL),
(74, 'Indian Overseas Bank Local Based Officers (LBO) Vacancy 2025 [400 Posts] ', 'Indian Overseas Bank ', '2025-05-31', '20 to 30 years\r\n? 48,480 – ? 85,920\r\nClosing Date:       31/05/2025\r\n', 'Any Graduate', '2025-05-17 15:59:03', '2025-05-17 15:59:03', '', 'https://ibpsonline.ibps.in/ioblboapr25/', '', NULL, NULL, NULL),
(75, 'Union Bank of India Office Assistant Vacancy 2025 [500 Posts] ', 'Union Bank of India', '2025-05-23', '22–30 years for General/EWS candidates.\r\nAge Relaxation: 5 years for SC/ST, 3 years for OBC (Non-Creamy Layer), 10 years for PwBD (General/EWS), 13 years for PwBD (OBC), 15 years for PwBD (SC/ST), as per Government of India guidelines.\r\n\r\nAssistant Manager (Credit) JMGS [250 post] ? 48480-2000/ 7-62480-2340/ 2- 67160-2680/ 7-85920\r\n\r\n\r\nAssistant Manager (IT) JMGS I [250 Post] ? 48480-2000/ 7-62480-2340/ 2- 67160-2680/ 7-85920\r\n	\r\n\r\n\r\n', 'Assistant Manager (Credit): Graduate in any discipline .\r\nAssistant Manager (IT): Full-time B.E./ B.Tech/ MCA/ M.Sc. (IT)/ M.Tech/ 5-year Integrated M.Tech in Computer Science/ IT/ Electronics/ Electronics & Computer Science/ Electronics & Telecommunications/ Data Science/ Machine Learning & AI/ Cyber Security (recognized by Govt. of India). ', '2025-05-17 16:04:23', '2025-05-17 16:04:23', '', 'https://ibpsonline.ibps.in/ubisoapr25/index.php', '', NULL, NULL, NULL),
(76, ' HAL Hyderabad Recruitment 2025 (127 Graduate / Diploma / ITI Apprentice Posts)', ' HAL ', '2025-05-31', 'Engineering Graduate Apprentice, General Stream Graduate Apprentice, Technician (Diploma) Apprentice.\r\n127 POST\r\nWalk-in Dates :   29/05/2025 to 31/05/2025\r\nJob Location:   Hyderabad, Telangana', 'Degree/ Diploma in relevant discipline', '2025-05-17 16:08:15', '2025-05-17 16:08:15', 'trg.hyd@hal-india.co.in', 'https://drive.google.com/file/d/1X90fXLF1VUFv4aAusL13WKXzmgAFJC69/view?usp=sharing', '040-23778283.', NULL, NULL, NULL),
(77, 'Bank of Baroda Office Assistant Recruitment 2025 [500 POST]', 'Bank of Baroda', '2025-05-23', '\r\n    Hiring Body: Bank of Baroda (BOB) \r\n    Post Name: Office Assistant (Peon) in Subordinate Cadre \r\n    Number of Posts: 500 \r\n    Location: Various states across India (Refer to Vacancy Breakdown) \r\n    Employment Basis: Regular \r\nCandidates must have been born not earlier than 01.05.1999 and not later than 01.05.2007 (both dates inclusive).', 'Must have passed the 10th Standard (S.S.C./Matriculation) or equivalent examination from a recognized Board/Institute.', '2025-05-17 16:12:23', '2025-05-17 16:12:23', '', 'https://ibpsonline.ibps.in/bobapr25/', '', NULL, NULL, NULL),
(78, 'IAF Group C Civilian Recruitment 2025 for 153 Posts', 'IAF', '2025-06-15', 'Indian Air Force (IAF) invites applications from eligible Indian citizens for direct recruitment of 153 Group \'C\' civilian posts, including Lower Division Clerk (LDC), Hindi Typist, Multi-Tasking Staff (MTS), Civilian Mechanical Transport Driver (CMTD), and other posts at various Air Force Stations/Units. Applications must be sent by post within 30 days from the publication of the advertisement in Employment News (17-23 May 2025).', 'Minimum Matriculation / 12th Class Pass from a recognized board or university', '2025-05-19 14:32:22', '2025-05-19 14:32:22', '', 'https://drive.google.com/file/d/1J-k_WbgQG36QX3re4OhsrzPhaafXEOyS/view', '', NULL, NULL, NULL),
(79, ' CISF Recruitment 2025 (403 Head Constable Posts) ', 'CISF ', '2025-06-06', 'Central Industrial Security Force (CISF) invites online applications from eligible Male and Female Indian citizens for 403 Head Constable (General Duty) posts against Sports Quota-2025. The recruitment targets meritorious sportspersons in disciplines like Wushu, Taekwondo, Karate, Athletics, and others. The candidates must fill Online Application Form at CISF Recruitment Portal from 18/05/2025 to 06/06/2025.', 'Matric + 12th pass + sports achievements', '2025-05-19 14:34:38', '2025-05-19 14:34:38', '', 'https://cisfrectt.cisf.gov.in/index.php', '', NULL, NULL, NULL),
(80, 'CSIR IITR Recruitment 2025 (04 Junior Stenographer Posts)', 'CSIR ', '2025-05-31', 'CSIR-Indian Institute of Toxicology Research (IITR), Lucknow, invites online applications from talented and result-oriented Indian Nationals for 04 posts of Junior Stenographer. The Candidates must fill Online Application Form through IITR Official website between 07/05/2025 (5:00 PM) and 31/05/2025 (5:00 PM). The CSIR IITR, a constituent laboratory of Council of Scientific and industrial Research (CSIR), which is an autonomous organization under the Department of Scientific and Industrial Research (DSIR), Ministry of Science and Technology, Government of India.', '10+2/ XII with Stenography proficiency', '2025-05-19 14:39:30', '2025-05-19 14:39:30', '', 'https://csiriitrprograms.in/jst/index.html', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `approved_id` int(11) NOT NULL,
  `degree` text DEFAULT NULL,
  `semester` text DEFAULT NULL,
  `module` text DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `qtext` text DEFAULT NULL,
  `qyear` text DEFAULT NULL,
  `university` varchar(11) DEFAULT NULL,
  `updated_date` text DEFAULT NULL,
  `nu_id` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`approved_id`, `degree`, `semester`, `module`, `subject`, `qtext`, `qyear`, `university`, `updated_date`, `nu_id`) VALUES
(3, 'B.Sc Physics', '6', '1', 'Optics', 'notes/1745237449_optics.pdf', '2022', '1', '2025-04-21 17:40:55', 0),
(5, 'BA English', '1', '1', 'world literature', 'notes/note_5_1745932385.pdf', '2025', '1', '2025-04-29 18:43:05', 5),
(6, 'MA Economics', '2', '1', 'International Finance and Monetary Policy', 'notes/1746090461_International Finance.pdf', '2025', '1', '2025-05-01 14:37:41', 0),
(7, 'BTech Mechanical', '1', '1', 'Maths', 'notes/1746090583_Maths.pdf', '2025', '1', '2025-05-01 14:39:45', 0),
(8, 'BA English', '5', '1', 'English for media', 'notes/note_6_1747068651.pdf', '2024', '1', '2025-05-12 22:20:51', 6),
(9, 'Common', '4', '1', 'Global voices and cultures TEXT', 'notes/S4_Global_Voices_and_Cultures_Text.pdf', '2024', '1', '2025-05-12 22:20:51', 0),
(10, 'Common', '4', '1', 'S4_Global_voice_GUIDE', 'notes/S4_Global_voice_GUIDE.pdf', '2024', '1', '2025-05-12 22:20:51', 0);

-- --------------------------------------------------------

--
-- Table structure for table `notes_upload`
--

CREATE TABLE `notes_upload` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL,
  `degree` varchar(100) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `university` varchar(100) NOT NULL,
  `year` varchar(4) NOT NULL,
  `file` varchar(255) NOT NULL,
  `upload_date` datetime NOT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `notes_upload`
--

INSERT INTO `notes_upload` (`id`, `title`, `module`, `degree`, `semester`, `university`, `year`, `file`, `upload_date`, `status`) VALUES
(2, 'world literature', '1', 'B.Com', '1', '1', '2020', '../upload/notes/note_6810b94b80193_20250429.pdf', '2025-04-29 17:04:35', 0),
(5, 'world literature', '1', 'BA English', '1', '1', '2025', '../upload/notes/note_6810d057c9135_20250429.pdf', '2025-04-29 18:42:55', 0),
(6, 'English for media', '1', 'BA English', '5', '1', '2024', '../upload/notes/note_682226e1e4b2a_20250512.pdf', '2025-05-12 22:20:41', 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(500) NOT NULL,
  `amazon_url` varchar(500) DEFAULT NULL,
  `flipkart_url` varchar(500) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `featured` tinyint(4) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `category_id`, `price`, `image_url`, `amazon_url`, `flipkart_url`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(9, 'MSI Modern 14, Intel 12Th Gen. i7-1255U,', '36Cm FHD 60Hz Laptop(16GB/512GB NVME SSD/Windows 11 Home/Bluetooth/Mso 2021/Intel Iris Xe Graphics/Classic Black/1.4Kg), C12MO-1211IN ', 2, 44990.00, 'https://keralatechreach.in/Affiliated/product/1747217200_1810.jpg', 'https://amzn.to/44xzDJM', NULL, 1, 1, '2025-05-14 10:06:40', '2025-05-14 16:19:00'),
(10, 'Acer Aspire Lite 12th Gen Intel Core i7-1255U', 'Premium Metal Laptop (Windows 11 Home/16 GB RAM/512 GB SSD) AL15-52, 39.62cm (15.6\") Full HD Display, Metal Body, Steel Gray, 1.59 Kg ', 2, 48990.00, 'https://keralatechreach.in/Affiliated/product/1747217822_2436.jpg', 'https://amzn.to/3GSS2Hb', NULL, 1, 1, '2025-05-14 10:17:02', '2025-05-14 16:19:51'),
(11, 'MSI Modern 15, Intel 13th Gen. i7-1355U', '40CM FHD 60Hz Laptop (8GB/512GB NVMe SSD/Windows 11 Home/Iris Xe Graphics/Star Blue/1.7Kg), B13M-290IN ', 2, 42990.00, 'https://keralatechreach.in/Affiliated/product/1747217940_6852.jpg', 'https://amzn.to/459wW15', NULL, 1, 1, '2025-05-14 10:19:00', '2025-05-14 16:20:17'),
(12, 'Lenovo V15 G4 AMD Ryzen 5 7520U', '15.6 inch FHD Thin & Lite Laptop, AMD Graphics, 16GB DDR5 5500Mhz Ram, 512GB SSD NVMe, Windows 11, Dolby Audio, Arctic Grey, 1 Year Onsite Brand Warranty ', 2, 34990.00, 'https://keralatechreach.in/Affiliated/product/1747218461_7131.jpg', 'https://amzn.to/4kgWQEq', NULL, 1, 1, '2025-05-14 10:27:41', '2025-05-14 16:20:53'),
(13, 'Acer Aspire Lite AMD Ryzen 5 5500U', 'Premium Thin and Light Laptop (16 GB RAM/1 TB SSD/Windows 11 Home) AL15-41, 39.62 cm (15.6\") Full HD Display, Metal Body, Steel Gray, 1.59 KG ', 2, 39990.00, 'https://keralatechreach.in/Affiliated/product/1747218800_8434.jpg', 'https://amzn.to/3H78ZNY', NULL, 1, 1, '2025-05-14 10:33:20', '2025-05-14 16:22:04'),
(14, 'Acer Aspire Lite, 13th Gen, Intel Core i3-1305U', '8GB RAM, 512GB SSD, Full HD, 15.6\"/39.62cm, Windows 11 Home, Steel Gray, 1.59KG, AL15-53, Metal Body, 36 WHR, Thin and Light Premium Laptop ', 2, 30990.00, 'https://keralatechreach.in/Affiliated/product/1747218930_7482.jpg', 'https://amzn.to/3S18nfj', NULL, 1, 1, '2025-05-14 10:35:30', '2025-05-14 16:22:55'),
(15, 'MSI Modern 14, Intel 12th Gen. i3-1225U', '36CM FHD 60Hz Laptop(8GB/512GB NVMe SSD/Windows 11 Home/MSO 2021/Intel UHD Graphics/Urban Silver/1.4Kg), C12MO-1401IN ', 2, 29850.00, 'https://keralatechreach.in/Affiliated/product/1747219066_7363.jpg', 'https://amzn.to/4mmFice', NULL, 1, 1, '2025-05-14 10:37:46', '2025-05-14 16:23:51'),
(16, 'Lenovo V15 Intel Core i3 12th Gen ', '15.6\" (39.62 cm) FHD (1920x1080) Antiglare 250 Nits Thin and Light Laptop (8GB RAM/512GB SSD/DOS/Iron Grey/1Y Onsite + 1Y ADP/1.7 kg), 82TTA00UIH ', 2, 29999.00, 'https://keralatechreach.in/Affiliated/product/1747219208_6119.jpg', 'https://amzn.to/4dfFmWO', NULL, 1, 1, '2025-05-14 10:40:08', '2025-05-14 16:24:18'),
(17, 'Samsung 80 cm (32 inches) ', 'HD Ready Smart LED TV UA32T4380AKXXL (Glossy Black) ', 10, 13989.00, 'https://keralatechreach.in/Affiliated/product/1747224722_2262.jpg', 'https://amzn.to/4kjtyVW', NULL, 1, 1, '2025-05-14 12:12:02', '2025-05-14 16:24:48'),
(18, 'LG 80 cms (32 inches)', 'LR570 Series Smart webOS LED TV 32LR570B6LA ', 10, 14490.00, 'https://keralatechreach.in/Affiliated/product/1747224867_5737.jpg', 'https://amzn.to/4dBAewF', NULL, 1, 1, '2025-05-14 12:14:27', '2025-05-14 16:25:19'),
(19, 'Motorola G35 5G ', 'Ultra-Fast 5G Smartphone | 50MP AI Camera | 5000mAh Battery ', 1, 9999.00, 'https://keralatechreach.in/Affiliated/product/1747579317_7132.jpg', 'https://amzn.to/4dnyyq4', '', 1, 1, '2025-05-18 14:41:57', '2025-05-18 14:41:57'),
(20, 'POCO C75 5G', '50MP Rear Camera | 5MP Front Camera \r\n5160 mAh Battery \r\n4 GB RAM | 64 GB ROM | Expandable Upto 1 TB ', 1, 8299.00, 'https://keralatechreach.in/Affiliated/product/1747579518_3611.jpg', 'https://amzn.to/3FgBRCW', '', 1, 1, '2025-05-18 14:45:18', '2025-05-18 14:45:18'),
(21, 'Samsung Galaxy F06 5G', '4 GB RAM | 128 GB ROM | Expandable Upto 1500 GB \r\n17.02 cm (6.7 inch) HD+ Display \r\n50MP + 2MP | 8MP Front Camera \r\n5000 mAh Battery ', 1, 9299.00, 'https://keralatechreach.in/Affiliated/product/1747579664_6801.jpg', 'https://amzn.to/3S71PvH', '', 1, 1, '2025-05-18 14:47:44', '2025-05-18 14:47:44'),
(22, 'realme P2 Pro 5G', '8 GB RAM | 128 GB ROM \r\n17.02 cm (6.7 inch) Full HD+ Display \r\n50MP + 8MP | 32MP Front Camera \r\n5200 mAh Battery ', 1, 18879.00, 'https://keralatechreach.in/Affiliated/product/1747579798_1775.jpg', 'https://amzn.to/4j9KPQn', '', 1, 1, '2025-05-18 14:49:58', '2025-05-18 14:49:58'),
(23, 'POCO X6 Pro 5G ', '8gb | 256gb\r\n1.5K 120Hz AMOLED Display with Dolby Vision\r\nMediaTek Dimensity D8300 \r\n64 MP OIS Triple Rear camera with 2X In-Sensor zoom\r\n 5000 mAh and 67W charger in-box?Android 14, Hyper OS ', 1, 19838.00, 'https://keralatechreach.in/Affiliated/product/1747579988_1311.jpg', 'https://amzn.to/3FdKfmN', '', 1, 1, '2025-05-18 14:53:08', '2025-05-18 14:53:08'),
(24, 'Motorola G64 5G ', '8GB | 128GB\r\n6000mAh battery\r\nShake Free 50MP camera | 8MP Ultra-Wide | 16MP Front Camera\r\nMediaTek Dimensity 7025 Processor', 1, 14999.00, 'https://keralatechreach.in/Affiliated/product/1747580267_6472.jpg', 'https://amzn.to/4dtXnB4', '', 1, 1, '2025-05-18 14:57:47', '2025-05-18 15:12:43'),
(25, 'Nothing Phone (3a) Pro 5G ', '8GB RAM + 256GB Storage\r\nBattery Power 	5000mAh \r\n6.77-inch AMOLED display with a 120Hz refresh rate\r\n Snapdragon 7s Gen 3 chipset\r\n50MP main sensor +  8MP ultra-wide lens + 50MP periscope telephoto lens with 3x optical zoom', 1, 30890.00, 'https://keralatechreach.in/Affiliated/product/1747580531_8689.jpg', 'https://amzn.to/4mmyGdz', '', 1, 1, '2025-05-18 15:02:11', '2025-05-18 15:02:11'),
(26, 'realme 14 Pro+ 5G', '8GB RAM, 256GB Storage\r\n6.83\" Curved AMOLED Display\r\n50MP Sony IMX896 OIS + 50MP Periscope Rear Cam\r\n6000mAh Battery\r\nSnapdragon 7s Gen 3 Processor\r\n80W SUPERVOOC', 1, 30925.00, 'https://keralatechreach.in/Affiliated/product/1747580693_8015.jpg', 'https://amzn.to/4mkDCzB', '', 1, 1, '2025-05-18 15:04:53', '2025-05-18 15:17:25'),
(27, 'vivo T3 Ultra 5G ', '8GB RAM+ 256GB Storage\r\nMediaTek Dimensity 9200+ Processor\r\n5500mAh Battery \r\nExperience pro-level photography with the 50 MP Sony IMX921 camera sensor \r\nBoth front and rear main cameras support 4K at 60 FPS ', 1, 29999.00, 'https://keralatechreach.in/Affiliated/product/1747580978_9767.jpg', 'https://amzn.to/3SNABKB', '', 1, 1, '2025-05-18 15:09:38', '2025-05-18 15:09:38');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `deg` varchar(255) NOT NULL,
  `subj` varchar(255) NOT NULL,
  `sem` varchar(50) NOT NULL,
  `qyear` varchar(10) NOT NULL,
  `file` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `university` varchar(255) NOT NULL,
  `upload_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `deg`, `subj`, `sem`, `qyear`, `file`, `status`, `university`, `upload_date`) VALUES
(37, 'BCA', 'Artificial intelligence', '6', '2022', '../upload/paper_67fa17807d74b_20250412.pdf', 1, '1', '2025-04-12 13:04:26'),
(38, 'B.Sc Mathematics', 'Complex Analysis', '6', '2024', '../upload/paper_67fd306806558_20250414.pdf', 1, '1', '2025-04-14 21:27:33'),
(39, 'BA history', 'history', '6', '2023', '../upload/paper_67fd3d00cd004_20250414.pdf', 1, '1', '2025-04-14 22:21:12'),
(40, 'BA English', 'American Literature', '6', '2024', '../upload/paper_67ff2cdb628f8_20250416.pdf', 1, '1', '2025-04-16 09:36:51'),
(41, 'BA English', 'American Literature', '6', '2024', '../upload/paper_67ff2d59304fd_20250416.pdf', 1, '1', '2025-04-16 09:38:57'),
(44, 'BA English', 'world literature', '3', '2024', '../upload/paper_67ff5023bb246_20250416.pdf', 1, '1', '2025-04-16 12:07:23'),
(49, 'B.Sc Physics', 'Classical and Modern Optics 2019 adm', '6', '2023', '../upload/paper_6801e1f260001_20250418.pdf', 1, '1', '2025-04-18 10:54:02'),
(50, 'B.Sc Physics', 'optics 2023', '6', '2023', '../upload/paper_6803ca14983c1_20250419.pdf', 1, '1', '2025-04-19 21:36:44'),
(53, 'BA Hindi', 'anuvad thatha prayog', '6', '2023', '../upload/paper_6806509cc89a7_20250421.pdf', 1, '1', '2025-04-21 19:35:16'),
(54, 'BA Hindi', 'anuvad thatha prayog', '6', '2024', '../upload/paper_680650b312602_20250421.pdf', 1, '1', '2025-04-21 19:35:39'),
(55, 'BA English', 'Gender Studies 2025', '6', '2025', '../upload/paper_68066b9aa92b8_20250421.pdf', 1, '1', '2025-04-21 21:30:27'),
(56, 'BA English 2025', 'film studies', '6', '2025', '../upload/paper_68066bb02a523_20250421.pdf', 1, '1', '2025-04-21 21:30:49'),
(57, 'BA English', 'indian writings in English 2025', '6', '2025', '../upload/paper_68066bc81de0e_20250421.pdf', 1, '1', '2025-04-21 21:31:13'),
(60, 'B.Sc Physics', 'Space science ', '6', '2023', '../upload/paper_680917093d0e2_20250423.pdf', 1, '1', '2025-04-23 22:06:27'),
(62, 'BA English', 'world classics', '6', '2025', '../upload/paper_680bba2d74d30_20250425.pdf', 1, '1', '2025-04-25 22:07:02'),
(63, 'BA English', 'American Literature', '6', '2025', '../upload/paper_680bba7151833_20250425.pdf', 1, '1', '2025-04-25 22:08:10'),
(64, 'MSc Physics', 'advanced quantum mechanics', '3', '2023', '../upload/paper_681a1171b136e_20250506.pdf', 1, '1', '2025-05-06 19:11:06'),
(65, 'B.Sc Physics', 'Nano Science', '6', '2024', '../upload/paper_682226182922c_20250512.pdf', 1, '1', '2025-05-12 22:17:22');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image_url` varchar(500) NOT NULL,
  `redirect_url` varchar(500) NOT NULL,
  `display_order` int(11) DEFAULT 0,
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `image_url`, `redirect_url`, `display_order`, `status`, `created_at`, `updated_at`) VALUES
(1, 'New Mobile Offers', 'https://keralatechreach.in/Affiliated/slider/slider1.png', 'https://www.amazon.in/', 1, 1, '2025-05-09 16:10:14', '2025-05-14 09:44:56'),
(2, 'Laptop Deals', 'https://keralatechreach.in/Affiliated/slider/slider2.png', 'https://www.flipkart.com/', 2, 1, '2025-05-09 16:10:14', '2025-05-14 09:45:21'),
(3, 'Headphone Sale', 'https://keralatechreach.in/Affiliated/slider/slider3.png', 'https://www.amazon.in/', 3, 1, '2025-05-09 16:10:14', '2025-05-14 09:45:36');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `username`, `password`) VALUES
(2, 'keerthana', '$2y$10$DU1H.pear92jZuT7Jt6UVeZmAOqroJRBEdhW2nMyrIs2vaq/isFNm');

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

CREATE TABLE `university` (
  `id` int(11) NOT NULL,
  `university_name` varchar(255) NOT NULL,
  `updated_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `university`
--

INSERT INTO `university` (`id`, `university_name`, `updated_date`) VALUES
(1, 'University of Kerala', '2025-03-21 17:22:39');

--
-- Triggers `university`
--
DELIMITER $$
CREATE TRIGGER `update_universities_timestamp` AFTER UPDATE ON `university` FOR EACH ROW BEGIN
    UPDATE university SET updated_date = CURRENT_TIMESTAMP WHERE id = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(200) NOT NULL,
  `userid` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userid`, `password`) VALUES
(1, 'manju', '$2y$10$W8dSk5GosnozQQUNYrK5t.43Yq4likhfx7IKXQBwU4Mxm2KzzGMM2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `approved`
--
ALTER TABLE `approved`
  ADD PRIMARY KEY (`approved_id`);

--
-- Indexes for table `app_versions`
--
ALTER TABLE `app_versions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budget_selections`
--
ALTER TABLE `budget_selections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `degree`
--
ALTER TABLE `degree`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_degree_per_university` (`degree_name`,`university_id`),
  ADD KEY `university_id` (`university_id`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`district_id`);

--
-- Indexes for table `entrance_notifications`
--
ALTER TABLE `entrance_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event_category`
--
ALTER TABLE `event_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `event_impressions`
--
ALTER TABLE `event_impressions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `event_interactions`
--
ALTER TABLE `event_interactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `university_id` (`university_id`);

--
-- Indexes for table `initiatives`
--
ALTER TABLE `initiatives`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`approved_id`);

--
-- Indexes for table `notes_upload`
--
ALTER TABLE `notes_upload`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_university` (`university`),
  ADD KEY `idx_degree` (`degree`),
  ADD KEY `idx_semester` (`semester`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `university`
--
ALTER TABLE `university`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `university_name` (`university_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `approved`
--
ALTER TABLE `approved`
  MODIFY `approved_id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=634;

--
-- AUTO_INCREMENT for table `app_versions`
--
ALTER TABLE `app_versions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `budget_selections`
--
ALTER TABLE `budget_selections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `message_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1008;

--
-- AUTO_INCREMENT for table `degree`
--
ALTER TABLE `degree`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `district_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `entrance_notifications`
--
ALTER TABLE `entrance_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `event_impressions`
--
ALTER TABLE `event_impressions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=806;

--
-- AUTO_INCREMENT for table `event_interactions`
--
ALTER TABLE `event_interactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `initiatives`
--
ALTER TABLE `initiatives`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `approved_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `notes_upload`
--
ALTER TABLE `notes_upload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `university`
--
ALTER TABLE `university`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `budget_selections`
--
ALTER TABLE `budget_selections`
  ADD CONSTRAINT `budget_selections_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `degree`
--
ALTER TABLE `degree`
  ADD CONSTRAINT `degree_ibfk_1` FOREIGN KEY (`university_id`) REFERENCES `university` (`id`);

--
-- Constraints for table `event_impressions`
--
ALTER TABLE `event_impressions`
  ADD CONSTRAINT `event_impressions_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

--
-- Constraints for table `event_interactions`
--
ALTER TABLE `event_interactions`
  ADD CONSTRAINT `event_interactions_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`university_id`) REFERENCES `university` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
