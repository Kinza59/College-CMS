-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2019 at 05:22 AM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `college_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_nature`
--

CREATE TABLE `account_nature` (
  `account_nature_id` int(11) NOT NULL,
  `account_nature_name` varchar(64) NOT NULL,
  `account_nature_status` enum('+ve','-ve') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_nature`
--

INSERT INTO `account_nature` (`account_nature_id`, `account_nature_name`, `account_nature_status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Expense', '-ve', '2016-03-12 00:00:00', '2016-03-12 00:00:00', 1, 1),
(2, 'Income', '+ve', '2016-03-12 00:00:00', '2016-03-12 00:00:00', 1, 1),
(3, 'Capital', '+ve', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(4, 'Liability', '-ve', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0),
(5, 'Assets', '+ve', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `account_register`
--

CREATE TABLE `account_register` (
  `account_register_id` int(11) NOT NULL,
  `account_nature_id` int(11) NOT NULL,
  `account_name` varchar(64) NOT NULL,
  `account_description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `account_register`
--

INSERT INTO `account_register` (`account_register_id`, `account_nature_id`, `account_name`, `account_description`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(2, 1, 'Utility Bill', 'dfghjjhbgvvgh', '2018-10-02 14:06:50', '0000-00-00 00:00:00', 2, 0),
(3, 1, 'Refreshment', 'dfghjkjhgfdfgh', '2018-10-02 14:09:42', '0000-00-00 00:00:00', 2, 0),
(4, 1, 'Internet Bill', 'dfghjkjhcvb', '2018-10-02 14:14:21', '0000-00-00 00:00:00', 2, 0),
(5, 2, 'Student Fee', 'Student Tuition Fee ', '2019-03-07 17:02:36', '0000-00-00 00:00:00', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `trans_id` int(11) NOT NULL,
  `account_nature` varchar(11) NOT NULL,
  `account_register_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(200) NOT NULL,
  `total_amount` double NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_transactions`
--

INSERT INTO `account_transactions` (`trans_id`, `account_nature`, `account_register_id`, `date`, `description`, `total_amount`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Income', 5, '2019-03-08 09:19:28', 'partiall student fee', 10000, '2019-03-08 09:19:54', '2019-03-08 09:20:46', 3, 3),
(2, 'Expense', 3, '2019-03-08 09:20:59', 'Guests', 500, '2019-03-08 09:21:17', '0000-00-00 00:00:00', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '3', NULL),
('data entry operator', '4', NULL),
('data entry operator', '6', NULL),
('reviewer', '5', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, 'admin can create advocate , view advocate , update advocate , delete advocate', NULL, NULL, NULL, NULL),
('create-advocate', 1, 'allow user to create advocate', NULL, NULL, NULL, NULL),
('data entry operator', 1, 'can create , view , update the record of the advocate', NULL, NULL, NULL, NULL),
('delete-advocate', 1, 'user can delete the advocate', NULL, NULL, NULL, NULL),
('export record', 1, 'Superadmin can export the record', NULL, NULL, NULL, NULL),
('go to index', 1, 'user can go to advocates index page', NULL, NULL, NULL, NULL),
('reviewer', 1, 'can update and read records', NULL, NULL, NULL, NULL),
('update-advocate', 1, 'user can update the advocate', NULL, NULL, NULL, NULL),
('view-advocate', 1, 'user can view the advocate', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', 'create-advocate'),
('admin', 'delete-advocate'),
('admin', 'export record'),
('admin', 'go to index'),
('admin', 'update-advocate'),
('admin', 'view-advocate'),
('data entry operator', 'create-advocate'),
('data entry operator', 'go to index'),
('data entry operator', 'update-advocate'),
('data entry operator', 'view-advocate'),
('reviewer', 'go to index'),
('reviewer', 'update-advocate'),
('reviewer', 'view-advocate');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `branch_id` int(11) NOT NULL,
  `institute_id` int(11) NOT NULL,
  `branch_code` varchar(32) NOT NULL,
  `branch_name` varchar(32) NOT NULL,
  `branch_type` enum('Franchise','Group') NOT NULL,
  `branch_location` varchar(50) NOT NULL,
  `branch_contact_no` varchar(32) NOT NULL,
  `branch_email` varchar(100) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `branch_head_name` varchar(50) NOT NULL,
  `branch_head_contact_no` varchar(15) NOT NULL,
  `branch_head_email` varchar(120) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`branch_id`, `institute_id`, `branch_code`, `branch_name`, `branch_type`, `branch_location`, `branch_contact_no`, `branch_email`, `status`, `branch_head_name`, `branch_head_contact_no`, `branch_head_email`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(5, 2, 'RYK01', 'BROOKFIELD COLLEGE RYK', 'Group', 'East Canal View', '068-58-75860', 'brookfield@gmail.com', 'Active', 'Shahzad Qayoom', '+92-333-7668866', 'shahzaqayoom@gmail.com', '2019-03-05 08:35:31', '2019-03-05 08:35:31', 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `concession`
--

CREATE TABLE `concession` (
  `concession_id` int(11) NOT NULL,
  `concession_name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `concession`
--

INSERT INTO `concession` (`concession_id`, `concession_name`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, '100% Concession ', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 1, 1),
(2, '90% Concession ', '2019-01-10 08:16:15', '0000-00-00 00:00:00', 1, 1, 1),
(3, '80% Concession', '2019-01-10 08:16:39', '2019-01-10 08:16:39', 1, 1, 1),
(4, '70% Concession', '2019-01-10 08:16:54', '2019-01-10 08:16:54', 1, 1, 1),
(5, '60% Concession', '2019-01-10 08:17:28', '0000-00-00 00:00:00', 1, 0, 1),
(6, '50% Concession', '2019-01-10 08:17:47', '0000-00-00 00:00:00', 1, 0, 1),
(7, '40% Concession ', '2019-01-10 08:18:40', '2019-01-10 08:18:40', 1, 1, 1),
(8, '30% Concession', '2019-01-10 08:18:08', '0000-00-00 00:00:00', 1, 0, 1),
(9, '25% Concession', '2019-01-10 08:18:19', '0000-00-00 00:00:00', 1, 0, 1),
(10, 'Kinship', '2019-01-10 08:18:27', '0000-00-00 00:00:00', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `department_description` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`, `department_description`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Computer Science Department', 'Computer Science Department', '2019-02-19 05:42:48', '0000-00-00 00:00:00', 3, 0),
(2, 'Biology Department', 'Biology Department', '2019-02-19 05:43:07', '0000-00-00 00:00:00', 3, 0),
(3, 'Chemistry Department', 'Chemistry Department', '2019-02-19 05:43:25', '0000-00-00 00:00:00', 3, 0),
(4, 'Physics Department', 'Physics Department', '2019-02-19 05:43:44', '0000-00-00 00:00:00', 3, 0),
(5, 'Mathematics Department', 'Mathematics Department', '2019-02-19 05:44:16', '0000-00-00 00:00:00', 3, 0),
(6, 'Urdu Department', 'Urdu Department', '2019-02-19 05:44:42', '0000-00-00 00:00:00', 3, 0),
(7, 'English Department', 'English Department', '2019-02-19 05:45:05', '0000-00-00 00:00:00', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `emial_id` int(11) NOT NULL,
  `receiver_name` varchar(60) NOT NULL,
  `receiver_email` varchar(120) NOT NULL,
  `email_subject` varchar(255) NOT NULL,
  `email_content` text NOT NULL,
  `email_attachment` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`emial_id`, `receiver_name`, `receiver_email`, `email_subject`, `email_content`, `email_attachment`, `created_at`, `created_by`, `updated_at`, `updated_by`, `delete_status`) VALUES
(1, 'Anas', 'anasshafqat01@gmail.com', 'Welcome', 'This is testing email from yii2...!', 'attachments/1545482896.png', '2018-12-22 12:48:24', 0, '0000-00-00 00:00:00', 0, 1),
(3, 'Anas Shafqat', 'anasshafqat01@gmail.com', 'Wellcome to DEXDEVS', 'This is testing email from Yii2...!', 'attachments/1545483278.png', '2018-12-22 12:54:44', 1, '0000-00-00 00:00:00', 0, 1),
(4, 'Saif ur Rehman', 'saifarshad.6987@gmail.com', 'Wellcome To DEXDEVS', 'This is testing email from Yii2...!', 'attachments/1545483348.png', '2018-12-22 12:55:52', 1, '0000-00-00 00:00:00', 0, 1),
(5, 'Nauman Shahid', 'hwhasmhi1625@gmail.com', 'Wellcome To DEXDEVS', 'This is testing email from Yii2...!', 'attachments/1545483409.png', '2018-12-22 12:56:55', 1, '0000-00-00 00:00:00', 0, 1),
(6, 'Nauman Shahid', 'hwhashmi1625@gmail.com', 'Wellcome To DEXDEVS', 'This is testing email with file attachment from Yii2...!', 'attachments/1545483610.png', '2018-12-22 13:00:16', 1, '0000-00-00 00:00:00', 0, 1),
(7, 'Nadia Gull', 'nadiagull285@gmail.com', 'Wellcome To DEXDEVS', 'This is testing email with file attachment from Yii2...!', 'attachments/1545483685.png', '2018-12-22 13:01:39', 1, '0000-00-00 00:00:00', 0, 1),
(8, 'Kinza Fatima', 'kinza.fatima522@gmail.com', 'Wellcome To DEXDEVS', 'This is testing email with file attachment from Yii2...!', 'attachments/1545483773.png', '2018-12-22 13:02:59', 1, '0000-00-00 00:00:00', 0, 1),
(9, 'Rana Faraz', 'ranafarazahmed@gmail.com', 'Wellcome To DEXDEVS', 'This is testing email with file attachment from Yii2...!	', 'attachments/1545484174.png', '2018-12-22 13:09:38', 1, '0000-00-00 00:00:00', 0, 1),
(10, 'Anas Shafqat', 'anasshafqat01@gmail.com', 'Wellcome To DEXDEVS', 'This is testing email with file attachment from Yii2...!', 'attachments/1545484846.jpg', '2018-12-31 10:46:04', 1, '2018-12-31 10:46:04', 1, 0),
(11, 'anas', 'anasshafqat01@gmail.com', 'helli', 'mlklkk', 'attachments/1545761723.jpg', '2018-12-31 10:44:52', 1, '2018-12-31 10:44:52', 1, 0),
(12, 'Anas', 'anasshafqat01@gmail.com', 'Hello', 'heloo heloo heloo heloo', 'attachments/1545764108.jpg', '2018-12-31 11:11:53', 1, '2018-12-31 11:11:53', 1, 0),
(13, 'Anas', 'anasshafqat01@gmail.com', 'Hello', 'Testing Email....', 'attachments/1545804180.jpg', '2018-12-26 06:03:14', 1, '0000-00-00 00:00:00', 0, 1),
(14, 'khh', 'anasshafqat01@gmail.com', 'hello', 'jkhjkh', 'attachments/1545816221.sql', '2018-12-26 09:23:48', 1, '0000-00-00 00:00:00', 0, 1),
(15, 'Mehtab', 'chmehtab4@gmail.com', 'Hello', 'This is testing Email with file attachment from Yii2....', 'attachments/1546064434.png', '2018-12-29 06:21:12', 1, '0000-00-00 00:00:00', 0, 1),
(16, 'Anas Shafqat', 'anasshafqat01@gmail.com', 'Wellcome', 'Testing Email...', 'attachments/1546066690.png', '2018-12-29 06:58:16', 1, '0000-00-00 00:00:00', 0, 1),
(17, 'Anas Shafqat', 'anasshafqat01@gmail.com', 'Hello', '<h2>Hello Sir,</h2><p><b><i>This is testing email from yii2...</i></b><br></p><p><b><i><br></i></b></p><p><b></b>Regards<b></b></p><p><b><i>Anas Shafqat</i></b></p>', 'attachments/1546068232.mp4', '2018-12-29 07:26:27', 1, '0000-00-00 00:00:00', 0, 1),
(18, 'Rana Faraz', 'ranafarazahmed@gmail.com', 'Testing Email', '<h2><b>Hello Sir,</b></h2><p><b><i></i><i>This is testing Email from Yii2 with text formatting.</i><i></i></b><b></b></p><p><b><i><br></i></b></p><p><b>Note:</b></p><p><ol><li><i>jkhjhj</i></li><li><i>erwrwe</i></li><li><i>werwe</i></li><li><i>were</i></li><li><i>werwerwr</i></li></ol><p>Regards,<br></p><p><b><i>Anas Shafqat</i></b></p></p>', 'attachments/1546069705.jpg', '2018-12-29 07:48:30', 1, '0000-00-00 00:00:00', 0, 1),
(19, 'ans', 'anasshafqat01@gmail.com', 'hello', '<p><b><i>anasshafqat01@gmail.com</i></b><br></p>', 'attachments/1548138607.jpg', '2019-01-22 06:30:23', 9, '0000-00-00 00:00:00', 0, 1),
(20, 'Kinza Mustafah', 'kinza@gmail.com', 'Wellcome', 'Hello....', '', '2019-03-04 09:49:21', 0, '0000-00-00 00:00:00', 0, 1),
(21, 'Kinza Mustafah', 'kinza@gmail.com', 'Wellcome', 'Hello....', '', '2019-03-04 09:49:40', 0, '0000-00-00 00:00:00', 0, 1),
(22, 'Rana Faraz', 'ranafarazahmed@gmail.com', 'Testing', '<p>lkjhgfdsdfghjk</p>', 'attachments/1551947170.jpg', '2019-03-07 08:26:26', 3, '0000-00-00 00:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `emp_departments`
--

CREATE TABLE `emp_departments` (
  `emp_department_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_departments`
--

INSERT INTO `emp_departments` (`emp_department_id`, `emp_id`, `dept_id`) VALUES
(1, 4, 1),
(2, 1, 5),
(3, 5, 1),
(4, 8, 5),
(5, 9, 4);

-- --------------------------------------------------------

--
-- Table structure for table `emp_designation`
--

CREATE TABLE `emp_designation` (
  `emp_designation_id` int(11) NOT NULL,
  `emp_designation` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_designation`
--

INSERT INTO `emp_designation` (`emp_designation_id`, `emp_designation`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 'Principal', '2018-10-31 08:17:08', '2018-10-31 08:17:08', 1, 1, 1),
(2, 'Vise Principal', '2018-10-31 08:17:30', '2018-10-31 08:17:30', 1, 1, 1),
(3, 'Coordinator', '2018-10-31 08:23:02', '0000-00-00 00:00:00', 1, 0, 1),
(4, 'Teacher', '2018-10-31 08:23:21', '0000-00-00 00:00:00', 1, 0, 1),
(5, 'Security Gaurd', '2018-10-31 09:55:43', '2018-10-31 09:55:43', 1, 1, 1),
(6, 'Accountant', '2018-12-07 06:29:32', '0000-00-00 00:00:00', 1, 0, 1),
(7, 'Librarian', '2019-01-14 17:59:26', '0000-00-00 00:00:00', 0, 0, 1),
(8, 'Office Boy', '2019-02-20 13:33:12', '0000-00-00 00:00:00', 9, 0, 1),
(9, 'HOD', '2019-02-22 07:33:33', '2019-02-22 07:33:33', 9, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `emp_documents`
--

CREATE TABLE `emp_documents` (
  `emp_document_id` int(11) NOT NULL,
  `emp_info_id` int(11) NOT NULL,
  `emp_document_name` varchar(30) NOT NULL,
  `emp_document` varchar(120) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_documents`
--

INSERT INTO `emp_documents` (`emp_document_id`, `emp_info_id`, `emp_document_name`, `emp_document`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(10, 2, '', 'uploads/2_DFD 0 level.PNG', '2019-02-20 08:34:38', '0000-00-00 00:00:00', 9, 0),
(11, 2, '', 'uploads/2_DFD 1 level.PNG', '2019-02-20 08:51:38', '0000-00-00 00:00:00', 9, 0),
(12, 2, '', 'uploads/2_CODING.jpg', '2019-02-21 05:07:07', '0000-00-00 00:00:00', 9, 0),
(13, 1, '', 'uploads/1_ER Diagram of Hospital_DB.PNG', '2019-02-21 05:27:58', '0000-00-00 00:00:00', 9, 0),
(14, 1, '', 'uploads/1_DFD 1 level.PNG', '2019-02-21 05:30:06', '0000-00-00 00:00:00', 9, 0),
(15, 1, '', 'uploads/1_Cnic Backk.jpg', '2019-02-21 05:33:21', '0000-00-00 00:00:00', 9, 0),
(16, 1, '', 'uploads/1_ER Diagram of Hospital_DB.PNG', '2019-02-21 05:36:19', '0000-00-00 00:00:00', 9, 0),
(17, 1, '', 'uploads/1_DFD 1 level.PNG', '2019-02-21 05:37:11', '0000-00-00 00:00:00', 9, 0),
(18, 3, 'BSCS Degree', 'uploads/3_Capture.PNG', '2019-02-23 13:40:41', '0000-00-00 00:00:00', 9, 0),
(19, 3, 'Web Development Certificate', 'uploads/3Web Development Certificate_Anas Shafqat 10293858.jpg', '2019-02-23 13:59:53', '0000-00-00 00:00:00', 9, 0),
(20, 3, 'Certificate Logo', 'uploads/3_Certified partner Banner.jpg', '2019-02-23 14:10:30', '0000-00-00 00:00:00', 9, 0),
(21, 3, 'BForm', 'uploads/3_browser-market-shares-in (1).png', '2019-02-23 14:11:37', '0000-00-00 00:00:00', 9, 0),
(22, 1, 'BSCS Degree', 'uploads/1_course_Page-1.jpg', '2019-02-24 06:39:59', '0000-00-00 00:00:00', 9, 0),
(23, 2, 'Web Development Certificate', 'uploads/2_Anas Shafqat 10293858.jpg', '2019-02-24 06:46:28', '0000-00-00 00:00:00', 9, 0),
(24, 5, 'BSCS Degree', 'uploads/5_My Updated Cv.pdf', '2019-02-24 06:50:37', '0000-00-00 00:00:00', 9, 0),
(25, 7, 'MSC Degree', 'uploads/7_1.jpeg', '2019-02-24 07:05:19', '0000-00-00 00:00:00', 9, 0),
(26, 7, 'Certificate Logo', 'uploads/7_WhatsApp Image 2018-08-08 at 1.14.06 PM.jpeg', '2019-02-24 07:36:27', '0000-00-00 00:00:00', 9, 0),
(27, 7, 'BForm', 'uploads/7_Certified partner Banner.jpg', '2019-02-24 07:37:38', '0000-00-00 00:00:00', 9, 0);

-- --------------------------------------------------------

--
-- Table structure for table `emp_info`
--

CREATE TABLE `emp_info` (
  `emp_id` int(11) NOT NULL,
  `emp_reg_no` varchar(50) NOT NULL,
  `emp_name` varchar(50) NOT NULL,
  `emp_father_name` varchar(50) NOT NULL,
  `emp_cnic` varchar(15) NOT NULL,
  `emp_contact_no` varchar(15) NOT NULL,
  `emp_perm_address` varchar(200) NOT NULL,
  `emp_temp_address` varchar(200) NOT NULL,
  `emp_marital_status` enum('Single','Married') NOT NULL,
  `emp_fb_ID` varchar(30) NOT NULL,
  `emp_gender` enum('Male','Female') NOT NULL,
  `emp_photo` varchar(200) NOT NULL,
  `emp_dept_id` varchar(11) NOT NULL,
  `emp_designation_id` int(11) NOT NULL,
  `emp_type_id` int(11) NOT NULL,
  `emp_salary_type` enum('Salaried','Per Lecture') NOT NULL,
  `group_by` enum('Faculty','Management','Clerical Staff','Office Boys','Security Guard') NOT NULL,
  `emp_branch_id` int(11) NOT NULL,
  `emp_email` varchar(84) NOT NULL,
  `emp_qualification` varchar(50) NOT NULL,
  `emp_passing_year` int(11) NOT NULL,
  `emp_institute_name` varchar(50) NOT NULL,
  `degree_scan_copy` varchar(200) NOT NULL,
  `emp_salary` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_info`
--

INSERT INTO `emp_info` (`emp_id`, `emp_reg_no`, `emp_name`, `emp_father_name`, `emp_cnic`, `emp_contact_no`, `emp_perm_address`, `emp_temp_address`, `emp_marital_status`, `emp_fb_ID`, `emp_gender`, `emp_photo`, `emp_dept_id`, `emp_designation_id`, `emp_type_id`, `emp_salary_type`, `group_by`, `emp_branch_id`, `emp_email`, `emp_qualification`, `emp_passing_year`, `emp_institute_name`, `degree_scan_copy`, `emp_salary`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 'EMP-Y19-1', 'Kinza Mustafa', 'G Mustafa', '45678-9876545-6', '+56-777-7777777', 'RYK', 'RYK', 'Single', 'Kinza@gmail.com', 'Female', 'uploads/Kinza Mustafa_emp_photo.jpg', '1', 1, 4, 'Salaried', 'Faculty', 5, 'kinza.fatima.522@gmail.com', 'BSCS', 2017, 'IUB', 'uploads/Kinza Mustafa_degree_scan_copy.jpg', 10000, '2019-02-22 07:24:29', '2019-02-20 09:30:25', 3, 9, 1),
(2, 'EMP-Y19-2', 'Nadia', 'Gull', '88888-8888888-8', '+66-666-6666666', 'ryk', 'ryk', 'Single', 'fghj@gmail.com', 'Female', 'uploads/nadia_emp_photo.jpg', '1', 4, 5, 'Per Lecture', 'Faculty', 5, 'fghj@gmail.com', 'BSCS', 2019, 'fghjk', 'uploads/Nadia_degree_scan_copy.png', 1300, '2019-02-24 06:45:28', '2019-02-24 06:45:28', 3, 9, 1),
(3, 'EMP-Y19-3', 'Nauman', 'shahid', '24654-5468546-5', '+65-465-4546546', 'RYK', 'RYK', 'Single', 'nauman@gmail.com', 'Male', 'uploads/Nauman_emp_photo.jpg', '1,7', 4, 5, 'Per Lecture', 'Faculty', 5, 'nauman@gmail.com', 'BSCS', 2108, 'Superior', 'uploads/Nauman_degree_scan_copy.jpg', 1400, '2019-02-23 14:08:59', '2019-02-23 14:08:59', 8, 9, 1),
(4, 'EMP-Y19-4', 'Ayesha', 'Ali', '46545-4654654-6', '+65-465-6549841', 'RYK', 'RYK', 'Single', 'ayesha@gmail.com', 'Female', 'uploads/Ayesha_emp_photo.png', '1', 9, 4, 'Salaried', 'Faculty', 5, 'ayesha@gmail.com', 'BSCS', 2018, 'Superior', 'uploads/Ayesha_degree_scan_copy.xps', 40000, '2019-03-03 15:31:57', '2019-03-03 15:31:57', 8, 3, 1),
(5, 'EMP-Y19-5', 'Qasim Khan', 'M. Ali Khan', '12345-6789098-7', '+34-567-8909876', 'RYK', 'RYK', 'Married', 'qasim@gmail.com', 'Male', '0', '', 4, 4, 'Salaried', 'Faculty', 5, 'ali@gmail.com', 'BSCS', 2018, 'Superior College', '0', 25000, '2019-02-24 06:39:07', '0000-00-00 00:00:00', 9, 0, 1),
(6, 'EMP-Y19-6', 'Shahzaib Akram', 'Akram Ali', '12345-6543234-5', '+92-332-1234456', 'Gulshan Iqbal', 'Gulshan Iqbal', 'Single', 'shahzaib@gmail.com', 'Male', '0', '', 4, 4, 'Salaried', 'Faculty', 5, 'shahzaib@gmail.com', 'MSC Maths', 2018, 'IUB', '0', 25000, '2019-02-24 07:02:07', '2019-02-24 07:02:07', 9, 9, 1),
(7, 'EMP-Y19-7', 'Adnan Akram', 'Akram Ali', '12345-6787654-3', '+92-234-5678987', 'RYK', 'RYK', 'Single', 'adnan@gmail.com', 'Male', '0', '', 4, 4, 'Salaried', 'Faculty', 5, 'adnan@gmail.com', 'MSC Maths', 2018, 'IUB', '0', 25000, '2019-02-24 07:04:41', '2019-02-24 07:04:41', 9, 9, 1),
(8, 'EMP-Y19-8', 'Sajid Umar', 'Umar Khan', '12345-6787654-7', '+92-334-4567898', 'Gulshan Iqbal', 'Gulshan Iqbal', 'Single', 'sajid@gmail.com', 'Male', 'uploads/Sajid Umar_emp_photo.jpeg', '', 4, 4, 'Salaried', 'Faculty', 5, 'sajid@gmail.com', 'MSC Maths', 2018, 'IUB', '0', 25000, '2019-02-24 07:01:02', '0000-00-00 00:00:00', 9, 0, 1),
(9, 'EMP-Y19-9', 'Zia ur Rehman', 'A. Rehman', '31303-2345678-8', '+92-345-6789876', 'Gulshan Iqbal', 'Gulshan Iqbal', 'Single', 'zia@gmail.com', 'Male', 'uploads/Zia ur Rehman_emp_photo.jpg', '', 4, 4, 'Salaried', 'Faculty', 5, 'zia@gmail.com', 'MSC Physics', 2018, 'IUB', '0', 30000, '2019-02-25 04:39:20', '0000-00-00 00:00:00', 9, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `emp_reference`
--

CREATE TABLE `emp_reference` (
  `emp_ref_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `ref_name` varchar(50) NOT NULL,
  `ref_contact_no` varchar(15) NOT NULL,
  `ref_cnic` varchar(15) NOT NULL,
  `ref_designation` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_reference`
--

INSERT INTO `emp_reference` (`emp_ref_id`, `emp_id`, `ref_name`, `ref_contact_no`, `ref_cnic`, `ref_designation`) VALUES
(1, 2, 'Sir Faraz', '+35-465-4546546', '54687-4687465-4', 'CEO'),
(2, 4, 'Sir Ahmad', '+32-454-6546546', '68798-7513465-4', 'KIPS Principal'),
(3, 8, 'Anas', '+92-334-4567876', '31303-5678987-6', 'Teacher'),
(4, 9, 'Anas', '+92-345-6789876', '31303-3456788-7', 'Teacher');

-- --------------------------------------------------------

--
-- Table structure for table `emp_type`
--

CREATE TABLE `emp_type` (
  `emp_type_id` int(11) NOT NULL,
  `emp_type` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_type`
--

INSERT INTO `emp_type` (`emp_type_id`, `emp_type`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 'Daily Wadges', '2019-01-14 18:24:08', '0000-00-00 00:00:00', 1, 0, 1),
(2, 'Weekly Wedges', '2019-01-14 18:24:12', '0000-00-00 00:00:00', 1, 0, 1),
(3, 'Contract Basis', '2019-01-14 18:24:23', '0000-00-00 00:00:00', 1, 0, 1),
(4, 'Permanent ', '2018-12-14 07:52:24', '0000-00-00 00:00:00', 1, 0, 1),
(5, 'Visiting', '2019-02-26 05:02:48', '2019-02-26 05:02:48', 0, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `title`, `description`, `created_at`) VALUES
(1, 'Hello', 'Something in the description', '2019-01-27 17:14:06'),
(2, 'Another Event', 'Another Event Description', '2019-01-27 19:10:28'),
(3, 'Another Event 2', 'Another Event 2 Description', '2019-01-27 19:12:23');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `event_title` varchar(80) NOT NULL,
  `event_detail` text NOT NULL,
  `event_venue` varchar(100) NOT NULL,
  `event_start_datetime` datetime NOT NULL,
  `event_end_datetime` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `event_title`, `event_detail`, `event_venue`, `event_start_datetime`, `event_end_datetime`, `created_at`, `created_by`, `updated_at`, `updated_by`, `is_status`) VALUES
(1, 'Last Day', 'Last Day of Janvi', '', '2015-05-30 00:00:00', '2015-05-30 00:00:00', '2015-05-27 15:34:53', 1, '2015-05-27 15:40:30', 1, 'Inactive'),
(2, 'Janvi BDay', 'Happy Birthday Janvi ', '', '2015-07-05 00:00:00', '2015-07-05 00:00:00', '2015-05-27 15:35:38', 1, '2015-05-27 15:40:48', 1, 'Inactive'),
(3, 'Happy Bday', 'HAppy Birthday KarmrajSir', '', '2015-07-25 00:00:00', '2015-07-25 00:00:00', '2015-05-27 15:36:10', 1, '2015-05-27 15:41:05', 1, 'Inactive'),
(4, 'Launching New Application', 'Launch of Edusec Yii2', '', '2015-06-02 09:30:00', '2015-06-02 10:00:00', '2015-05-27 15:37:00', 1, '2015-05-27 15:39:37', 1, ''),
(5, 'Meeting for staff ', 'All Staff Members-Meeting', '', '2015-06-09 00:00:00', '2015-06-09 00:00:00', '2015-05-27 15:37:42', 1, NULL, NULL, ''),
(7, 'Celebration Time', 'Celebration Time', '', '2015-06-25 00:00:00', '2015-06-25 00:00:00', '2015-05-27 15:39:12', 1, NULL, NULL, ''),
(8, 'Sports Week', 'Annual sports week of Brookfield Group of Colleges.', 'Shiekh Zaid Sports Complex', '2019-01-31 08:00:05', '2019-02-04 05:00:05', '2019-01-30 16:57:53', 9, '2019-01-30 17:00:43', 9, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `fee_transaction_detail`
--

CREATE TABLE `fee_transaction_detail` (
  `fee_trans_detail_id` int(11) NOT NULL,
  `fee_trans_detail_head_id` int(11) NOT NULL,
  `fee_type_id` int(11) NOT NULL,
  `fee_amount` double DEFAULT NULL,
  `collected_fee_amount` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fee_transaction_detail`
--

INSERT INTO `fee_transaction_detail` (`fee_trans_detail_id`, `fee_trans_detail_head_id`, `fee_type_id`, `fee_amount`, `collected_fee_amount`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(9, 9, 1, 9960, 9960, '2019-02-26 05:49:46', '0000-00-00 00:00:00', 0, 0, 1),
(10, 9, 2, 8000, 8000, '2019-02-26 05:49:46', '0000-00-00 00:00:00', 0, 0, 1),
(11, 10, 1, 5600, 5600, '2019-02-28 08:45:00', '0000-00-00 00:00:00', 0, 0, 1),
(12, 10, 2, 10000, 10000, '2019-03-01 08:54:18', '0000-00-00 00:00:00', 0, 0, 1),
(13, 11, 2, 10000, 5000, '2019-03-07 10:05:33', '0000-00-00 00:00:00', 0, 0, 1),
(14, 11, 4, 100, 100, '2019-03-07 10:05:33', '0000-00-00 00:00:00', 0, 0, 1),
(15, 12, 2, 18000, 0, '2019-03-07 10:02:14', '0000-00-00 00:00:00', 0, 0, 1),
(16, 12, 6, 1000, 0, '2019-03-07 10:02:21', '0000-00-00 00:00:00', 0, 0, 1),
(17, 13, 1, 5800, 5800, '2019-03-05 08:28:00', '0000-00-00 00:00:00', 0, 0, 1),
(18, 13, 2, 15000, 15000, '2019-03-05 08:28:00', '0000-00-00 00:00:00', 0, 0, 1),
(19, 14, 1, 4900, 4900, '2019-03-05 08:28:20', '0000-00-00 00:00:00', 0, 0, 1),
(20, 14, 2, 10000, 10000, '2019-03-05 08:28:20', '0000-00-00 00:00:00', 0, 0, 1),
(21, 15, 1, 9000, 9000, '2019-03-05 08:28:45', '0000-00-00 00:00:00', 0, 0, 1),
(22, 15, 2, 15000, 10000, '2019-03-05 08:28:45', '0000-00-00 00:00:00', 0, 0, 1),
(23, 16, 1, 9000, 0, '2019-03-05 08:26:54', '0000-00-00 00:00:00', 0, 0, 1),
(24, 16, 2, 15000, 0, '2019-03-05 08:26:54', '0000-00-00 00:00:00', 0, 0, 1),
(25, 17, 1, 4877, 4877, '2019-03-05 08:29:18', '0000-00-00 00:00:00', 0, 0, 1),
(26, 17, 2, 7500, 7500, '2019-03-05 08:29:18', '0000-00-00 00:00:00', 0, 0, 1),
(27, 18, 1, 9000, 9000, '2019-03-07 09:41:44', '0000-00-00 00:00:00', 0, 0, 1),
(28, 18, 2, 10000, 500, '2019-03-07 09:41:44', '0000-00-00 00:00:00', 0, 0, 1),
(29, 19, 2, 15000, 0, '2019-03-07 09:56:59', '0000-00-00 00:00:00', 0, 0, 1),
(30, 20, 2, 10000, 0, '2019-03-07 09:56:59', '0000-00-00 00:00:00', 0, 0, 1),
(31, 21, 2, 12500, 0, '2019-03-07 09:57:00', '0000-00-00 00:00:00', 0, 0, 1),
(32, 26, 2, 10000, 0, '2019-03-07 09:57:00', '0000-00-00 00:00:00', 0, 0, 1),
(33, 27, 2, 7500, 0, '2019-03-07 09:57:00', '0000-00-00 00:00:00', 0, 0, 1),
(34, 28, 2, 10000, 0, '2019-03-07 09:57:00', '0000-00-00 00:00:00', 0, 0, 1),
(35, 29, 2, 12000, 0, '2019-03-07 10:06:36', '0000-00-00 00:00:00', 0, 0, 1),
(36, 30, 2, 14000, 0, '2019-03-07 10:06:36', '0000-00-00 00:00:00', 0, 0, 1),
(37, 22, 2, 10000, 0, '2019-03-07 10:39:08', '0000-00-00 00:00:00', 0, 0, 1),
(38, 23, 2, 9000, 0, '2019-03-07 10:39:08', '0000-00-00 00:00:00', 0, 0, 1),
(39, 25, 2, 10000, 0, '2019-03-07 10:39:08', '0000-00-00 00:00:00', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fee_transaction_head`
--

CREATE TABLE `fee_transaction_head` (
  `fee_trans_id` int(11) NOT NULL,
  `class_name_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `std_name` varchar(75) NOT NULL,
  `month` varchar(20) NOT NULL,
  `installment_no` varchar(20) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `total_amount` double NOT NULL,
  `total_discount` double NOT NULL,
  `paid_amount` double NOT NULL,
  `remaining` double NOT NULL,
  `status` enum('Paid','Unpaid','Partially Paid') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fee_transaction_head`
--

INSERT INTO `fee_transaction_head` (`fee_trans_id`, `class_name_id`, `session_id`, `section_id`, `std_id`, `std_name`, `month`, `installment_no`, `transaction_date`, `total_amount`, `total_discount`, `paid_amount`, `remaining`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(9, 1, 4, 1, 1, 'Kinza Mustafah', '2019-02', '1', '2019-02-25 00:00:00', 17960, 0, 17960, 0, 'Paid', '2019-02-26 05:49:46', '0000-00-00 00:00:00', 0, 0, 1),
(10, 1, 4, 1, 2, 'Nadia Gull', '2019-02', '1', '2019-02-25 00:00:00', 15600, 0, 15600, 0, 'Paid', '2019-03-01 08:54:18', '0000-00-00 00:00:00', 0, 0, 1),
(11, 1, 4, 1, 1, 'Kinza Mustafah', '2019-04', '2', '2019-04-01 00:00:00', 10100, 0, 5100, 5000, 'Partially Paid', '2019-03-07 10:05:33', '0000-00-00 00:00:00', 0, 0, 1),
(12, 1, 4, 1, 2, 'Nadia Gull', '2019-04', '2', '2019-04-01 00:00:00', 19000, 0, 0, 0, 'Unpaid', '2019-03-07 10:01:37', '0000-00-00 00:00:00', 0, 0, 1),
(13, 5, 4, 5, 3, 'Mehtab Ahmed Ali', '2019-03', '1', '2019-03-05 00:00:00', 20800, 0, 20800, 0, 'Paid', '2019-03-05 08:28:00', '0000-00-00 00:00:00', 0, 0, 1),
(14, 5, 4, 5, 4, 'Ali', '2019-03', '1', '2019-03-05 00:00:00', 14900, 0, 14900, 0, 'Paid', '2019-03-05 08:28:20', '0000-00-00 00:00:00', 0, 0, 1),
(15, 5, 4, 5, 15, 'Anas', '2019-03', '1', '2019-03-05 00:00:00', 24000, 0, 19000, 5000, 'Partially Paid', '2019-03-05 08:28:45', '0000-00-00 00:00:00', 0, 0, 1),
(16, 5, 4, 5, 16, 'Waleed Bin Naeem', '2019-03', '1', '2019-03-05 00:00:00', 24000, 0, 0, 0, 'Unpaid', '2019-03-05 08:26:54', '0000-00-00 00:00:00', 0, 0, 1),
(17, 5, 4, 5, 18, 'M. Akram', '2019-03', '1', '2019-03-05 00:00:00', 12377, 0, 12377, 0, 'Paid', '2019-03-05 08:29:18', '0000-00-00 00:00:00', 0, 0, 1),
(18, 5, 4, 5, 24, 'M.Azaan', '2019-03', '1', '2019-03-05 00:00:00', 19000, 0, 9500, 9500, 'Partially Paid', '2019-03-07 09:41:43', '0000-00-00 00:00:00', 0, 0, 1),
(19, 5, 4, 5, 3, 'Mehtab Ahmed Ali', '2019-05', '2', '2019-05-04 00:00:00', 15000, 0, 0, 0, 'Unpaid', '2019-03-07 10:39:08', '0000-00-00 00:00:00', 0, 0, 1),
(20, 5, 4, 5, 4, 'Ali', '2019-05', '2', '2019-05-04 00:00:00', 10000, 0, 0, 0, 'Unpaid', '2019-03-07 10:39:08', '0000-00-00 00:00:00', 0, 0, 1),
(21, 5, 4, 5, 6, 'Qasim', '2019-05', '2', '2019-05-04 00:00:00', 12500, 0, 0, 0, 'Unpaid', '2019-03-07 10:39:08', '0000-00-00 00:00:00', 0, 0, 1),
(22, 5, 4, 5, 7, 'Anas Shafqat', '2019-05', '2', '2019-05-04 00:00:00', 10000, 0, 0, 0, 'Unpaid', '2019-03-07 10:39:08', '0000-00-00 00:00:00', 0, 0, 1),
(23, 5, 4, 5, 8, 'Zia Ali', '2019-05', '2', '2019-05-04 00:00:00', 9000, 0, 0, 0, 'Unpaid', '2019-03-07 10:39:08', '0000-00-00 00:00:00', 0, 0, 1),
(24, 5, 4, 5, 9, 'Ali Naveed', '2019-05', '2', '2019-05-04 00:00:00', 0, 0, 0, 0, 'Unpaid', '2019-03-07 10:39:08', '0000-00-00 00:00:00', 0, 0, 1),
(25, 5, 4, 5, 10, 'M. Rehan', '2019-05', '2', '2019-05-04 00:00:00', 10000, 0, 0, 0, 'Unpaid', '2019-03-07 10:39:08', '0000-00-00 00:00:00', 0, 0, 1),
(26, 5, 4, 5, 15, 'Anas', '2019-05', '2', '2019-05-04 00:00:00', 10000, 0, 0, 0, 'Unpaid', '2019-03-07 10:39:08', '0000-00-00 00:00:00', 0, 0, 1),
(27, 5, 4, 5, 18, 'M. Akram', '2019-05', '2', '2019-05-04 00:00:00', 7500, 0, 0, 0, 'Unpaid', '2019-03-07 10:39:08', '0000-00-00 00:00:00', 0, 0, 1),
(28, 5, 4, 5, 24, 'M.Azaan', '2019-05', '2', '2019-05-04 00:00:00', 10000, 0, 0, 0, 'Unpaid', '2019-03-07 10:39:08', '0000-00-00 00:00:00', 0, 0, 1),
(29, 1, 4, 1, 1, 'Kinza Mustafah', '2019-08', '3', '2019-08-01 00:00:00', 12000, 0, 0, 0, 'Unpaid', '2019-03-07 10:06:36', '0000-00-00 00:00:00', 0, 0, 1),
(30, 1, 4, 1, 2, 'Nadia Gull', '2019-08', '3', '2019-08-01 00:00:00', 14000, 0, 0, 0, 'Unpaid', '2019-03-07 10:06:36', '0000-00-00 00:00:00', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fee_type`
--

CREATE TABLE `fee_type` (
  `fee_type_id` int(11) NOT NULL,
  `fee_type_name` varchar(64) NOT NULL,
  `fee_type_description` varchar(120) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fee_type`
--

INSERT INTO `fee_type` (`fee_type_id`, `fee_type_name`, `fee_type_description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 'Admission Fee', 'Student have to pay admission fee only one time', '2018-11-03 06:36:22', '0000-00-00 00:00:00', 1, 0, 1),
(2, 'Tuition Fee', 'Paid on monthly bases', '2018-11-03 06:48:34', '0000-00-00 00:00:00', 1, 0, 1),
(3, 'Late Fee Fine', 'Pay fine after due date', '2018-11-03 06:50:23', '2018-11-03 06:50:23', 1, 1, 1),
(4, 'Absent Fine', 'pay fine when student is absent', '2018-11-03 06:51:12', '0000-00-00 00:00:00', 1, 0, 1),
(5, 'Library Fine', 'Pay fine in case of library rules voilation', '2018-11-03 06:52:59', '0000-00-00 00:00:00', 1, 0, 1),
(6, 'Transportation Fee', 'Pay when student take transportation service.', '2018-11-03 06:54:41', '0000-00-00 00:00:00', 1, 0, 1),
(7, 'Exams Fee', 'Examination Fee', '2019-02-28 05:03:40', '0000-00-00 00:00:00', 3, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `installment`
--

CREATE TABLE `installment` (
  `installment_id` int(11) NOT NULL,
  `installment_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `installment`
--

INSERT INTO `installment` (`installment_id`, `installment_name`) VALUES
(1, '1st Installment'),
(2, '2nd Installment'),
(3, '3rd Installment'),
(4, '4th Installment'),
(5, '5th Installment'),
(6, '6th Installment');

-- --------------------------------------------------------

--
-- Table structure for table `institute`
--

CREATE TABLE `institute` (
  `institute_id` int(11) NOT NULL,
  `institute_name` varchar(65) NOT NULL,
  `institute_logo` varchar(200) NOT NULL,
  `institute_account_no` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `institute`
--

INSERT INTO `institute` (`institute_id`, `institute_name`, `institute_logo`, `institute_account_no`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(2, 'BROOKFIELD GROUP OF COLLEGES', '', ' 0190 002 2965 3403 UBL Shahi Road, RYK', '2019-01-08 08:12:22', '0000-00-00 00:00:00', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1538846625),
('m130524_201442_init', 1538846629);

-- --------------------------------------------------------

--
-- Table structure for table `month`
--

CREATE TABLE `month` (
  `month_id` int(11) NOT NULL,
  `month_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `month`
--

INSERT INTO `month` (`month_id`, `month_name`) VALUES
(1, 'January'),
(2, 'Fabruary'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `msg_of_day`
--

CREATE TABLE `msg_of_day` (
  `msg_of_day_id` int(11) NOT NULL,
  `msg_details` varchar(100) NOT NULL,
  `msg_user_type` enum('Students','Parents','Employees','Others') NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` enum('Active','Inactive') NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `msg_of_day`
--

INSERT INTO `msg_of_day` (`msg_of_day_id`, `msg_details`, `msg_user_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `is_status`, `delete_status`) VALUES
(1, 'Each Day is a GIFT don\'t send it BACK unopened.  Have a nice Day !', 'Students', '2015-05-27 15:21:01', 1, NULL, NULL, 'Active', 1),
(2, 'Every day may not be GOOD but there is something GOOD in every day.', 'Parents', '2015-05-27 15:21:22', 1, NULL, NULL, 'Active', 1),
(3, 'Every ONE wants happiness, No ONE needs pain, But its not possible to get a rainbow.', 'Employees', '2015-05-27 15:21:41', 1, NULL, NULL, 'Active', 1),
(4, 'Smile is the Electricity and Life is a Battery whenever you Smile the Battery gets Charges.', 'Students', '2015-05-27 15:21:59', 1, '2018-12-26 18:11:26', 1, 'Active', 1),
(5, 'The Best for the Group comes when everyone in the group does what’s best for himself AND the group.', 'Students', '2015-05-27 15:22:20', 1, NULL, NULL, 'Active', 1),
(6, 'In life, as in football, you won\'t go far unless you know where the goalposts are.-- Arnold Glasow', 'Students', '2015-05-27 15:24:54', 1, '2018-12-26 18:11:18', 1, 'Active', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `notice_id` int(11) NOT NULL,
  `notice_title` varchar(25) NOT NULL,
  `notice_description` text,
  `notice_start` datetime NOT NULL,
  `notice_end` datetime NOT NULL,
  `notice_user_type` enum('Students','Parents','Employees','Others') NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `is_status` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`notice_id`, `notice_title`, `notice_description`, `notice_start`, `notice_end`, `notice_user_type`, `created_at`, `created_by`, `updated_at`, `updated_by`, `is_status`) VALUES
(1, 'Final Term Exams ', 'Final Term Exams will be conducted on coming monday. All The Best !', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Students', '2015-05-27 15:26:29', 1, '2019-01-26 11:59:21', 9, 'Active'),
(2, 'Monthly Report', 'All Employee have to submit their report on month end.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Employees', '2015-05-27 15:27:23', 1, '2018-12-26 18:43:37', 1, 'Active'),
(3, 'Summer Vacation', 'Summer Vacation starts from June to  2nd week of July.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Students', '2015-05-27 15:28:37', 1, '2018-12-26 18:44:16', 1, 'Inactive'),
(4, 'Attendance Report', 'All Employees collect their class wise  attendance report', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Employees', '2015-05-27 15:30:35', 1, '2018-12-26 18:44:19', 1, 'Active'),
(5, 'Exam From Fill', 'All Students come and fill their exam forms', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Students', '2015-05-27 15:33:07', 1, '2018-12-26 18:44:03', 1, 'Active'),
(6, 'Roll No Slip', 'Collect your roll no slips from the exams department.', '2019-01-30 04:10:44', '1900-12-02 03:00:00', 'Students', '2019-01-30 15:04:08', 9, '2019-01-30 16:12:50', 9, 'Active'),
(7, 'Meeting', 'Meeting at 5:00 Pm for final exams conduction.', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Employees', '2019-01-30 15:11:30', 9, '0000-00-00 00:00:00', 0, 'Active'),
(9, 'PTM', 'Parent teacher meeting on 01-Feb-2019 at 5:00 Pm.<br><b>Venue: Brookfield Group of Colleges</b>.', '2019-01-30 04:01:59', '2019-02-01 05:00:53', 'Parents', '2019-01-30 16:02:23', 9, '2019-01-30 16:36:13', 9, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `sms`
--

CREATE TABLE `sms` (
  `sms_id` int(11) NOT NULL,
  `sms_name` varchar(120) NOT NULL,
  `sms_template` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms`
--

INSERT INTO `sms` (`sms_id`, `sms_name`, `sms_template`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 'Absent Message', 'Absent Message', '2019-03-07 08:20:16', '0000-00-00 00:00:00', 3, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_academic_info`
--

CREATE TABLE `std_academic_info` (
  `academic_id` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `class_name_id` int(11) NOT NULL,
  `subject_combination` int(11) NOT NULL,
  `previous_class` varchar(50) NOT NULL,
  `passing_year` varchar(32) NOT NULL,
  `previous_class_rollno` int(11) NOT NULL,
  `total_marks` int(11) DEFAULT NULL,
  `obtained_marks` int(11) DEFAULT NULL,
  `grades` varchar(10) NOT NULL,
  `percentage` varchar(5) DEFAULT NULL,
  `Institute` varchar(50) NOT NULL,
  `std_enroll_status` varchar(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_academic_info`
--

INSERT INTO `std_academic_info` (`academic_id`, `std_id`, `class_name_id`, `subject_combination`, `previous_class`, `passing_year`, `previous_class_rollno`, `total_marks`, `obtained_marks`, `grades`, `percentage`, `Institute`, `std_enroll_status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 1, 1, 1, 'matric', '2012', 12234, 1100, 900, 'A', '82%', 'ABC', 'signed', '2019-03-06 04:46:21', '0000-00-00 00:00:00', 3, 0, 1),
(2, 2, 1, 1, 'matric', '2012', 12346, 1100, 800, 'B+', '73%', 'XYZ', 'signed', '2019-03-01 07:00:27', '0000-00-00 00:00:00', 3, 0, 1),
(3, 3, 5, 5, 'matric', '2018', 123, 1100, 789, 'B+', '72%', 'Superior', 'signed', '2019-03-07 05:37:06', '0000-00-00 00:00:00', 3, 0, 1),
(4, 4, 5, 5, 'martic', '2018', 7654, 1100, 678, 'B', '62%', 'fghjk', 'signed', '2019-03-07 06:08:28', '0000-00-00 00:00:00', 3, 0, 1),
(5, 5, 5, 6, 'matric', '2018', 4567, 505, 450, 'A', '89%', 'fghbjn', 'signed', '2019-03-07 05:25:10', '0000-00-00 00:00:00', 3, 0, 1),
(6, 6, 5, 5, 'matric', '2018', 3865, 1100, 987, 'A+', '90%', 'fvgbhnj', 'signed', '2019-03-07 06:08:28', '0000-00-00 00:00:00', 3, 0, 1),
(7, 7, 5, 6, 'matric', '2017', 9876, 505, 432, 'A', '86%', 'fgvhj', 'signed', '2019-03-07 06:08:58', '0000-00-00 00:00:00', 3, 0, 1),
(8, 8, 5, 3, 'matric', '2018', 3964, 505, 400, 'A+', '79%', 'fgvhj', 'signed', '2019-03-07 06:08:58', '0000-00-00 00:00:00', 3, 0, 1),
(9, 9, 5, 6, 'matric', '2018', 9123, 505, 390, 'B+', '77%', 'vbnhj', 'signed', '2019-03-07 06:08:58', '0000-00-00 00:00:00', 3, 0, 1),
(10, 10, 5, 6, 'matric', '2018', 6754, 505, 340, 'B', '67%', 'fghj', 'signed', '2019-03-07 06:08:58', '0000-00-00 00:00:00', 3, 0, 1),
(11, 11, 3, 3, 'matric', '2018', 8567, 1100, 789, 'B+', '72%', 'gbhnjk', 'signed', '2019-03-03 14:54:47', '0000-00-00 00:00:00', 3, 0, 1),
(12, 12, 3, 3, 'matric', '2018', 7896, 1100, 900, 'A', '82%', 'ghjk', 'signed', '2019-03-03 14:54:47', '0000-00-00 00:00:00', 3, 0, 1),
(13, 13, 3, 5, 'matric', '2018', 9234, 1100, 890, 'A', '81%', 'ghjk', 'signed', '2019-03-03 14:54:47', '0000-00-00 00:00:00', 3, 0, 1),
(14, 15, 5, 5, 'matric', '2018', 5674, 1100, 987, 'A+', '90%', 'bhnjmk', 'signed', '2019-03-07 06:08:58', '0000-00-00 00:00:00', 3, 0, 1),
(15, 16, 1, 5, 'matric', '2018', 3462, 1100, 678, 'B', '62%', 'gbhnj', 'unsign', '2019-03-07 05:28:07', '2019-03-06 05:00:07', 3, 3, 1),
(16, 18, 5, 5, 'matric', '2018', 9087, 1100, 999, 'A+', '91%', 'vbnhjm', 'signed', '2019-03-07 06:08:58', '0000-00-00 00:00:00', 3, 0, 1),
(17, 19, 3, 3, 'matric', '2018', 3827, 1100, 900, 'A', '82%', 'vbnhjm', 'unsign', '2019-03-06 04:52:29', '0000-00-00 00:00:00', 3, 0, 1),
(18, 20, 4, 4, 'FCS Pre-Engineering (Part I)', '2018', 3456, 505, 450, 'A', '89%', 'TCI', 'unsign', '2019-02-19 04:54:40', '0000-00-00 00:00:00', 3, 0, 1),
(21, 24, 5, 5, 'Matric', '2018', 123456, 1100, 890, 'A', '81%', 'ESNA School', 'signed', '2019-03-07 06:08:58', '0000-00-00 00:00:00', 3, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_attendance`
--

CREATE TABLE `std_attendance` (
  `std_attend_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `class_name_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `student_id` int(11) NOT NULL,
  `status` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_attendance`
--

INSERT INTO `std_attendance` (`std_attend_id`, `teacher_id`, `class_name_id`, `session_id`, `section_id`, `subject_id`, `date`, `student_id`, `status`) VALUES
(1, 1, 1, 4, 1, 5, '2019-03-01 00:00:00', 1, 'L'),
(2, 1, 1, 4, 1, 5, '2019-03-01 00:00:00', 2, 'P');

-- --------------------------------------------------------

--
-- Table structure for table `std_class_name`
--

CREATE TABLE `std_class_name` (
  `class_name_id` int(11) NOT NULL,
  `class_name` varchar(120) NOT NULL,
  `class_name_description` varchar(255) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_class_name`
--

INSERT INTO `std_class_name` (`class_name_id`, `class_name`, `class_name_description`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 'FSC Pre-Medical (Part - I)', 'Intermediate FSC Pre-Medical (Part - I)', 'Active', '2018-12-26 09:45:54', '2018-12-26 09:45:54', 1, 1, 1),
(2, 'FSC Pre-Medical (Part - II)', 'Intermediate FSC Pre-Medical (Part - II)', 'Active', '2018-12-26 09:46:55', '2018-12-26 09:46:55', 1, 1, 1),
(3, 'FSC Pre-Engineering (Part - I)', 'Intermediate FSC Pre-Engineering (Part - I)', 'Active', '2018-12-26 09:47:39', '2018-12-26 09:47:39', 1, 1, 1),
(4, 'FSC Pre-Engineering (Part - II)', 'Intermediate FSC Pre-Engineering (Part - II)', 'Active', '2018-12-26 09:48:09', '2018-12-26 09:48:09', 1, 1, 1),
(5, 'ICS (Part - I)', 'Intermediate ICS (Part - I)', 'Active', '2018-12-26 09:48:46', '2018-12-26 09:48:46', 1, 1, 1),
(6, 'ICS (Part - II)', 'Intermediate ICS (Part - II)', 'Active', '2018-12-26 09:49:18', '2018-12-26 09:49:18', 1, 1, 1),
(7, 'BSC - ZBC (Part - I)', 'Bachelor BSC - ZBC (Part - I)', 'Active', '2018-12-26 09:50:48', '2018-12-26 09:50:48', 1, 1, 1),
(8, 'BSC - Double Computer-Math (Part - I)', 'Bachelor BSC - Double Computer-Math (Part - I)', 'Active', '2018-12-26 10:10:58', '2018-12-26 10:10:58', 1, 1, 1),
(9, 'BSC - Double Computer-Math (Part - II)', 'Bachelor 	BSC - Double Computer-Math (Part - II)', 'Active', '2018-12-26 10:11:24', '2018-12-26 10:11:24', 1, 1, 1),
(11, 'MCS', 'Master in Computer Science', 'Inactive', '2019-02-28 07:30:01', '2019-02-28 07:30:01', 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_enrollment_detail`
--

CREATE TABLE `std_enrollment_detail` (
  `std_enroll_detail_id` int(11) NOT NULL,
  `std_enroll_detail_head_id` int(11) NOT NULL,
  `std_reg_no` varchar(15) NOT NULL,
  `std_roll_no` varchar(32) NOT NULL,
  `std_enroll_detail_std_id` int(11) NOT NULL,
  `std_enroll_detail_std_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_enrollment_detail`
--

INSERT INTO `std_enrollment_detail` (`std_enroll_detail_id`, `std_enroll_detail_head_id`, `std_reg_no`, `std_roll_no`, `std_enroll_detail_std_id`, `std_enroll_detail_std_name`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(28, 1, 'REG-Y19-001', '001-FMG1-191', 1, 'Kinza Mustafah', '2019-03-01 07:00:27', '0000-00-00 00:00:00', 3, 0, 1),
(29, 1, 'REG-Y19-002', '001-FMG1-191', 2, 'Nadia Gull', '2019-03-01 07:00:27', '0000-00-00 00:00:00', 3, 0, 1),
(36, 4, 'REG-Y19-011', '001-FEG1-191', 11, 'Aisha Ameen', '2019-03-03 14:54:47', '0000-00-00 00:00:00', 3, 0, 1),
(37, 4, 'REG-Y19-012', '001-FEG1-191', 12, 'Aniqa Gull', '2019-03-03 14:54:47', '0000-00-00 00:00:00', 3, 0, 1),
(38, 4, 'REG-Y19-013', '001-FEG1-191', 13, 'Faheem Ameen', '2019-03-03 14:54:47', '0000-00-00 00:00:00', 3, 0, 1),
(57, 5, 'REG-Y19-003', 'RYK01-ICB1-1901', 3, 'Mehtab Ahmed Ali', '2019-03-07 05:37:06', '0000-00-00 00:00:00', 3, 0, 1),
(70, 5, 'REG-Y19-004', 'RYK01-ICB1-1902', 4, 'Ali', '2019-03-07 06:08:28', '0000-00-00 00:00:00', 3, 0, 1),
(71, 5, 'REG-Y19-006', 'RYK01-ICB1-1903', 6, 'Qasim', '2019-03-07 06:08:28', '0000-00-00 00:00:00', 3, 0, 1),
(72, 5, 'REG-Y19-007', 'RYK01-ICB1-1904', 7, 'Anas Shafqat', '2019-03-07 06:08:58', '0000-00-00 00:00:00', 3, 0, 1),
(73, 5, 'REG-Y19-008', 'RYK01-ICB1-1905', 8, 'Zia Ali', '2019-03-07 06:08:58', '0000-00-00 00:00:00', 3, 0, 1),
(74, 5, 'REG-Y19-009', 'RYK01-ICB1-1906', 9, 'Ali Naveed', '2019-03-07 06:08:58', '0000-00-00 00:00:00', 3, 0, 1),
(75, 5, 'REG-Y19-010', 'RYK01-ICB1-1907', 10, 'M. Rehan', '2019-03-07 06:08:58', '0000-00-00 00:00:00', 3, 0, 1),
(76, 5, 'REG-Y19-015', 'RYK01-ICB1-1908', 15, 'Anas', '2019-03-07 06:08:58', '0000-00-00 00:00:00', 3, 0, 1),
(77, 5, 'REG-Y19-018', 'RYK01-ICB1-1909', 18, 'M. Akram', '2019-03-07 06:08:58', '0000-00-00 00:00:00', 3, 0, 1),
(78, 5, 'STD-Y19-21', 'RYK01-ICB1-19010', 24, 'M.Azaan', '2019-03-07 06:08:58', '0000-00-00 00:00:00', 3, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_enrollment_head`
--

CREATE TABLE `std_enrollment_head` (
  `std_enroll_head_id` int(11) NOT NULL,
  `class_name_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `std_enroll_head_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_enrollment_head`
--

INSERT INTO `std_enrollment_head` (`std_enroll_head_id`, `class_name_id`, `session_id`, `section_id`, `std_enroll_head_name`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 1, 4, 1, 'FSC Pre-Medical (Part - I)-2018 - 2020 -FMG1', '2019-02-17 14:25:26', '0000-00-00 00:00:00', 3, 0, 1),
(4, 3, 4, 3, 'FSC Pre-Engineering (Part - I)-2018 - 2020 -FEG1', '2019-03-01 05:52:09', '0000-00-00 00:00:00', 3, 0, 1),
(5, 5, 4, 5, 'ICS (Part - I)-2018 - 2020 -ICB1', '2019-03-05 08:06:08', '0000-00-00 00:00:00', 3, 0, 1),
(6, 6, 4, 6, 'ICS (Part - II)-2018 - 2020 -ICB2', '2019-03-05 10:36:35', '0000-00-00 00:00:00', 3, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_fee_details`
--

CREATE TABLE `std_fee_details` (
  `fee_id` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `admission_fee` double NOT NULL,
  `addmission_fee_discount` double NOT NULL,
  `net_addmission_fee` double NOT NULL,
  `fee_category` enum('Annual','Semester') NOT NULL,
  `concession_id` int(11) NOT NULL,
  `no_of_installment` int(11) NOT NULL,
  `tuition_fee` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_fee_details`
--

INSERT INTO `std_fee_details` (`fee_id`, `std_id`, `admission_fee`, `addmission_fee_discount`, `net_addmission_fee`, `fee_category`, `concession_id`, `no_of_installment`, `tuition_fee`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(4, 4, 5000, 100, 4900, 'Annual', 2, 4, 40000, '2019-01-03 10:32:48', '0000-00-00 00:00:00', 0, 0, 1),
(5, 3, 6000, 200, 5800, 'Annual', 3, 3, 45000, '2019-01-03 10:33:47', '0000-00-00 00:00:00', 0, 0, 1),
(6, 5, 5000, 300, 4700, 'Annual', 1, 1, 10, '2019-01-03 10:35:25', '0000-00-00 00:00:00', 0, 0, 1),
(7, 6, 5000, 400, 4600, 'Annual', 2, 4, 50000, '2019-01-03 10:37:14', '0000-00-00 00:00:00', 0, 0, 1),
(8, 7, 2000, 200, 1800, 'Annual', 4, 3, 30000, '2019-01-03 10:43:08', '0000-00-00 00:00:00', 0, 0, 1),
(9, 10, 5000, 500, 4500, 'Annual', 4, 4, 40000, '2019-01-03 11:45:25', '0000-00-00 00:00:00', 1, 0, 1),
(10, 9, 5000, 600, 4400, 'Annual', 1, 1, 10, '2019-01-05 17:58:43', '0000-00-00 00:00:00', 0, 0, 1),
(11, 11, 5000, 300, 4700, 'Annual', 2, 4, 50000, '2019-01-06 15:19:03', '0000-00-00 00:00:00', 1, 0, 1),
(12, 12, 5000, 400, 4600, 'Annual', 2, 4, 40000, '2019-01-06 15:39:41', '0000-00-00 00:00:00', 1, 0, 1),
(13, 13, 5000, 700, 4300, 'Annual', 3, 3, 40500, '2019-01-06 15:52:57', '0000-00-00 00:00:00', 1, 0, 1),
(15, 15, 10000, 1000, 9000, 'Annual', 6, 3, 35000, '2019-01-14 06:39:34', '0000-00-00 00:00:00', 1, 0, 1),
(16, 16, 10000, 1000, 9000, 'Annual', 6, 3, 35000, '2019-01-14 07:33:44', '0000-00-00 00:00:00', 1, 0, 1),
(18, 8, 10000, 1000, 9000, 'Annual', 2, 5, 45000, '2019-01-30 14:24:30', '0000-00-00 00:00:00', 0, 0, 1),
(19, 18, 5000, 123, 4877, 'Annual', 6, 4, 30000, '2019-02-06 05:25:48', '0000-00-00 00:00:00', 3, 0, 1),
(20, 19, 5000, 1200, 3800, 'Annual', 7, 3, 28000, '2019-02-06 05:44:57', '0000-00-00 00:00:00', 3, 0, 1),
(24, 7, 1000, 200, 800, 'Annual', 3, 5, 3000, '2019-02-16 16:56:43', '0000-00-00 00:00:00', 3, 0, 1),
(27, 2, 6000, 400, 5600, 'Annual', 6, 4, 56000, '2019-02-16 17:37:24', '0000-00-00 00:00:00', 3, 0, 1),
(28, 1, 10000, 40, 9960, 'Annual', 4, 4, 40000, '2019-02-17 14:41:37', '0000-00-00 00:00:00', 3, 0, 1),
(29, 20, 5000, 1000, 4000, 'Annual', 6, 4, 30000, '2019-02-19 04:54:40', '0000-00-00 00:00:00', 3, 0, 1),
(32, 24, 10000, 1000, 9000, 'Annual', 6, 3, 30000, '2019-03-04 08:17:35', '0000-00-00 00:00:00', 3, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_fee_installments`
--

CREATE TABLE `std_fee_installments` (
  `fee_installment_id` int(11) NOT NULL,
  `std_fee_id` int(11) NOT NULL,
  `installment_no` int(11) NOT NULL,
  `installment_amount` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_fee_installments`
--

INSERT INTO `std_fee_installments` (`fee_installment_id`, `std_fee_id`, `installment_no`, `installment_amount`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(10, 27, 1, 10000, '2019-02-17 17:31:55', '0000-00-00 00:00:00', 3, 0),
(11, 27, 2, 18000, '2019-02-17 17:32:20', '0000-00-00 00:00:00', 3, 0),
(12, 27, 3, 14000, '2019-02-17 17:32:31', '0000-00-00 00:00:00', 3, 0),
(13, 27, 4, 14000, '2019-02-17 17:32:37', '0000-00-00 00:00:00', 3, 0),
(14, 28, 1, 8000, '2019-02-17 17:32:44', '0000-00-00 00:00:00', 3, 0),
(15, 28, 2, 10000, '2019-02-17 17:32:51', '0000-00-00 00:00:00', 3, 0),
(16, 28, 3, 12000, '2019-02-17 17:32:57', '0000-00-00 00:00:00', 3, 0),
(17, 28, 4, 10000, '2019-02-26 08:49:54', '0000-00-00 00:00:00', 0, 0),
(23, 32, 1, 10000, '2019-03-04 08:17:35', '0000-00-00 00:00:00', 3, 0),
(24, 32, 2, 10000, '2019-03-04 08:17:35', '0000-00-00 00:00:00', 3, 0),
(25, 32, 3, 10000, '2019-03-04 08:17:36', '0000-00-00 00:00:00', 3, 0),
(26, 5, 1, 15000, '2019-03-05 07:13:35', '0000-00-00 00:00:00', 0, 0),
(27, 5, 2, 15000, '2019-03-05 07:14:14', '0000-00-00 00:00:00', 0, 0),
(28, 5, 3, 15000, '2019-03-05 07:14:14', '0000-00-00 00:00:00', 0, 0),
(29, 7, 1, 12500, '2019-03-05 07:18:56', '0000-00-00 00:00:00', 0, 0),
(30, 7, 2, 12500, '2019-03-05 07:21:01', '0000-00-00 00:00:00', 0, 0),
(31, 7, 3, 12500, '2019-03-05 07:21:01', '0000-00-00 00:00:00', 0, 0),
(32, 7, 4, 12500, '2019-03-05 07:21:01', '0000-00-00 00:00:00', 0, 0),
(33, 15, 1, 15000, '2019-03-05 07:47:05', '0000-00-00 00:00:00', 0, 0),
(34, 15, 2, 10000, '2019-03-05 07:48:19', '0000-00-00 00:00:00', 0, 0),
(35, 15, 3, 10000, '2019-03-05 07:48:29', '0000-00-00 00:00:00', 0, 0),
(36, 16, 1, 15000, '2019-03-05 07:50:17', '0000-00-00 00:00:00', 0, 0),
(37, 16, 2, 10000, '2019-03-05 07:50:46', '0000-00-00 00:00:00', 0, 0),
(38, 16, 3, 10000, '2019-03-05 07:50:46', '0000-00-00 00:00:00', 0, 0),
(39, 19, 1, 7500, '2019-03-05 07:52:32', '0000-00-00 00:00:00', 0, 0),
(40, 19, 2, 7500, '2019-03-05 07:54:03', '0000-00-00 00:00:00', 0, 0),
(41, 19, 3, 7500, '2019-03-05 07:54:03', '0000-00-00 00:00:00', 0, 0),
(42, 19, 4, 7500, '2019-03-05 07:54:03', '0000-00-00 00:00:00', 0, 0),
(43, 4, 1, 10000, '2019-03-05 07:56:09', '0000-00-00 00:00:00', 0, 0),
(44, 4, 2, 10000, '2019-03-05 07:56:37', '0000-00-00 00:00:00', 0, 0),
(45, 4, 3, 10000, '2019-03-05 07:56:37', '0000-00-00 00:00:00', 0, 0),
(46, 4, 4, 10000, '2019-03-05 07:56:37', '0000-00-00 00:00:00', 0, 0),
(47, 9, 1, 10000, '2019-03-07 10:37:11', '0000-00-00 00:00:00', 0, 0),
(48, 9, 2, 10000, '2019-03-07 10:37:02', '0000-00-00 00:00:00', 0, 0),
(49, 9, 3, 10000, '2019-03-07 10:36:53', '0000-00-00 00:00:00', 0, 0),
(50, 9, 4, 10000, '2019-03-07 10:36:46', '0000-00-00 00:00:00', 0, 0),
(51, 10, 1, 10, '2019-03-07 10:35:57', '0000-00-00 00:00:00', 0, 0),
(54, 8, 1, 10000, '2019-03-07 10:30:52', '0000-00-00 00:00:00', 0, 0),
(55, 8, 2, 10000, '2019-03-07 10:31:14', '0000-00-00 00:00:00', 0, 0),
(56, 8, 3, 10000, '2019-03-07 10:31:14', '0000-00-00 00:00:00', 0, 0),
(57, 18, 1, 9000, '2019-03-07 10:33:19', '0000-00-00 00:00:00', 0, 0),
(58, 18, 2, 9000, '2019-03-07 10:34:02', '0000-00-00 00:00:00', 0, 0),
(59, 18, 3, 9000, '2019-03-07 10:34:02', '0000-00-00 00:00:00', 0, 0),
(60, 18, 4, 9000, '2019-03-07 10:34:02', '0000-00-00 00:00:00', 0, 0),
(61, 18, 5, 9000, '2019-03-07 10:34:02', '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `std_fee_pkg`
--

CREATE TABLE `std_fee_pkg` (
  `std_fee_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `admission_fee` double NOT NULL,
  `tutuion_fee` double DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_fee_pkg`
--

INSERT INTO `std_fee_pkg` (`std_fee_id`, `session_id`, `class_id`, `admission_fee`, `tutuion_fee`, `created_at`, `created_by`, `updated_at`, `updated_by`, `delete_status`) VALUES
(1, 4, 1, 10000, 70000, '2019-01-06 16:13:28', 1, '0000-00-00 00:00:00', 0, 1),
(2, 4, 2, 5000, 70000, '2019-01-06 16:13:36', 1, '0000-00-00 00:00:00', 0, 1),
(3, 4, 3, 10000, 60000, '2019-01-06 16:13:42', 1, '0000-00-00 00:00:00', 0, 1),
(4, 4, 4, 5000, 60000, '2019-01-06 16:13:48', 1, '0000-00-00 00:00:00', 0, 1),
(5, 4, 5, 10000, 60000, '2019-01-06 16:13:53', 1, '0000-00-00 00:00:00', 0, 1),
(6, 4, 6, 5000, 60000, '2019-01-06 16:13:58', 1, '0000-00-00 00:00:00', 0, 1),
(7, 4, 7, 10000, 65000, '2019-01-06 16:14:04', 1, '0000-00-00 00:00:00', 0, 1),
(8, 4, 8, 10000, 65000, '2019-01-06 16:14:10', 1, '0000-00-00 00:00:00', 0, 1),
(9, 4, 9, 5000, 65000, '2019-01-06 16:14:16', 1, '0000-00-00 00:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_guardian_info`
--

CREATE TABLE `std_guardian_info` (
  `std_guardian_info_id` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `guardian_name` varchar(50) NOT NULL,
  `guardian_relation` varchar(50) NOT NULL,
  `guardian_cnic` varchar(15) NOT NULL,
  `guardian_email` varchar(84) NOT NULL,
  `guardian_contact_no_1` varchar(15) NOT NULL,
  `guardian_contact_no_2` varchar(15) NOT NULL,
  `guardian_monthly_income` int(11) NOT NULL,
  `guardian_occupation` varchar(50) NOT NULL,
  `guardian_designation` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_guardian_info`
--

INSERT INTO `std_guardian_info` (`std_guardian_info_id`, `std_id`, `guardian_name`, `guardian_relation`, `guardian_cnic`, `guardian_email`, `guardian_contact_no_1`, `guardian_contact_no_2`, `guardian_monthly_income`, `guardian_occupation`, `guardian_designation`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 1, 'G. Mustafah', 'Father', '12345-6789123-4', 'abu@gmail.com', '+92-306-3772105', '+12-345-6789123', 35000, 'Businessmen', 'MD', '2019-01-14 13:21:46', '0000-00-00 00:00:00', 1, 0, 1),
(2, 2, 'Iftkhar', 'Rehman', '12345-6789123-4', 'abu@gmail.com', '+92-331-7375027', '+12-345-6789123', 30000, 'Govt. Employee', 'Teacher', '2019-01-14 11:06:25', '0000-00-00 00:00:00', 1, 0, 1),
(3, 3, 'M. Ahmed', 'Brother', '12345-6787545-6', 'ahmed@gmail.com', '+92-331-4567876', '+92-334-5609876', 50000, 'Employee', 'Manager', '2019-01-14 17:18:38', '0000-00-00 00:00:00', 1, 0, 1),
(4, 9, 'Naveed Anjum', 'Father', '12345-6789098-7', 'Naveed@gmail.com', '', '+92-123-4567876', 0, 'abc', '', '2018-12-30 14:55:12', '0000-00-00 00:00:00', 1, 0, 1),
(5, 10, 'M. Arshad', 'Father', '31303-0388634-5', 'arshad@gmail.com', '+92-305-6466494', '+92-894-6161333', 50000, 'Self Employee', '', '2019-01-03 11:45:25', '0000-00-00 00:00:00', 1, 0, 1),
(6, 11, 'Muhammad Ameen', 'Father', '34567-8987654-5', 'ameen@gmail.com', '+45-678-7654567', '+34-567-8765434', 15000, 'govt employee', '', '2019-01-06 15:19:03', '0000-00-00 00:00:00', 1, 0, 1),
(7, 12, 'Asmat Ara', 'Mother', '23456-7890987-6', 'asmat@gmail.com', '+43-234-5678909', '+34-567-8987654', 12000, 'house wife', '', '2019-01-06 15:39:40', '0000-00-00 00:00:00', 1, 0, 1),
(8, 13, 'Muhammed Ameen', 'Father', '34567-8987656-7', 'ameenn@gmail.com', '+45-678-9098765', '+76-545-6789098', 50000, 'asd', '', '2019-01-06 15:52:57', '0000-00-00 00:00:00', 1, 0, 1),
(10, 15, 'M. Ali', 'Brother', '31303-2345678-9', 'anas@gmail.com', '+92-345-6789987', '+92-334-9876543', 35000, 'Govt. Teacher', '', '2019-01-14 06:39:34', '0000-00-00 00:00:00', 1, 0, 1),
(11, 16, 'Naeem Wahid', 'Father', '31305-6789987-6', 'naeem@gmail.com', '+92-334-4568998', '+92-333-4234567', 50000, 'Govt. Employe', 'Teacher', '2019-03-06 05:30:48', '0000-00-00 00:00:00', 1, 0, 1),
(13, 18, 'abc', 'Father', '23456-7890933-4', 'abc@gmail.com', '+23-456-7898765', '+39-876-5456784', 2345432, 'asdds', 'dswqwsdsx', '2019-02-06 05:25:48', '0000-00-00 00:00:00', 3, 0, 1),
(14, 19, 'Asad Ali', 'Father', '56776-5567876-5', 'asad@gmail.com', '+66-666-6666666', '+77-777-7777777', 3456787, 'ghjk', 'fghj', '2019-02-06 05:44:57', '0000-00-00 00:00:00', 3, 0, 1),
(15, 4, 'Ahmed', 'Father', '45678-9098765-4', 'ahmed@gmail.com', '+77-777-7777777', '+88-888-8888888', 30000, 'Landlord', 'Owner', '2019-02-18 05:26:25', '0000-00-00 00:00:00', 0, 0, 1),
(16, 5, 'Ali', 'Father', '77777-7777777-7', 'ali@gmail.com', '+99-999-9999999', '+32-333-3333333', 70000, 'ghjkjkk', 'fghj', '2019-02-18 05:27:30', '0000-00-00 00:00:00', 0, 0, 1),
(17, 6, 'Shehzad', 'Brother', '22222-2222222-2', 'shahzad@gmail.com', '+88-888-8888888', '+66-666-6666666', 20000, 'fghj', 'GHJH', '2019-02-18 05:28:33', '0000-00-00 00:00:00', 0, 0, 1),
(18, 7, 'M Shafqat', 'Father', '77777-7777777-7', 'shafqat@gmail.com', '+88-888-8888888', '+55-555-5555555', 50000, 'fghj', 'ghj', '2019-02-18 05:29:26', '0000-00-00 00:00:00', 0, 0, 1),
(19, 8, 'M Ali', 'Father', '99999-9999999-9', 'ali@gmail.com', '+99-999-9999999', '+66-666-6666666', 60000, 'ghju', 'frdeh', '2019-02-18 05:30:09', '0000-00-00 00:00:00', 0, 0, 1),
(20, 20, 'M Yaqoob', 'Father', '33333-3333333-3', 'myaqoob@gmail.com', '+44-444-4444444', '+55-555-5555555', 50000, 'LandLord', 'Owner', '2019-02-19 04:54:40', '0000-00-00 00:00:00', 3, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_ice_info`
--

CREATE TABLE `std_ice_info` (
  `std_ice_id` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `std_ice_name` varchar(64) NOT NULL,
  `std_ice_relation` varchar(64) NOT NULL,
  `std_ice_contact_no` varchar(15) NOT NULL,
  `std_ice_address` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_ice_info`
--

INSERT INTO `std_ice_info` (`std_ice_id`, `std_id`, `std_ice_name`, `std_ice_relation`, `std_ice_contact_no`, `std_ice_address`, `created_at`, `created_by`, `updated_at`, `updated_by`, `delete_status`) VALUES
(1, 1, 'M. Ahmed', 'Mamu G', '+92-306-3456760', '', '2019-02-07 09:22:31', 0, '0000-00-00 00:00:00', 0, 1),
(3, 15, 'M. Ahmed', 'Brother', '+92-332-3456989', '', '2019-01-14 17:19:07', 1, '0000-00-00 00:00:00', 0, 1),
(4, 16, 'Wahid', 'Father', '+92-332-1234576', ';lkjhgfdfghj', '2019-03-06 05:33:15', 1, '0000-00-00 00:00:00', 0, 1),
(6, 18, 'dfdsa', 'fdswdssdcds', '+23-456-7898765', '', '2019-02-06 05:25:48', 3, '0000-00-00 00:00:00', 0, 1),
(7, 19, 'fghj', 'ghuj', '+88-888-8888888', '', '2019-02-06 05:44:57', 3, '0000-00-00 00:00:00', 0, 1),
(8, 20, 'Asad YAqoob', 'Brother', '+66-666-6666666', 'RYK', '2019-02-19 04:54:40', 3, '0000-00-00 00:00:00', 0, 1),
(11, 24, 'Asad Shafqat', 'Father', '+98-898-9898946', 'RYK', '2019-03-04 08:17:35', 3, '0000-00-00 00:00:00', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_inquiry`
--

CREATE TABLE `std_inquiry` (
  `std_inquiry_id` int(11) NOT NULL,
  `std_inquiry_no` varchar(15) NOT NULL,
  `std_name` varchar(32) NOT NULL,
  `std_father_name` varchar(32) NOT NULL,
  `std_contact_no` varchar(15) NOT NULL,
  `std_father_contact_no` varchar(15) NOT NULL,
  `std_inquiry_date` date NOT NULL,
  `std_intrested_class` varchar(50) NOT NULL,
  `std_previous_class` varchar(32) NOT NULL,
  `previous_institute` varchar(120) NOT NULL,
  `std_roll_no` varchar(10) NOT NULL,
  `std_obtained_marks` int(4) NOT NULL,
  `std_total_marks` int(4) NOT NULL,
  `std_percentage` varchar(6) NOT NULL,
  `refrence_name` varchar(32) NOT NULL,
  `refrence_contact_no` varchar(15) NOT NULL,
  `refrence_designation` varchar(30) NOT NULL,
  `std_address` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_inquiry`
--

INSERT INTO `std_inquiry` (`std_inquiry_id`, `std_inquiry_no`, `std_name`, `std_father_name`, `std_contact_no`, `std_father_contact_no`, `std_inquiry_date`, `std_intrested_class`, `std_previous_class`, `previous_institute`, `std_roll_no`, `std_obtained_marks`, `std_total_marks`, `std_percentage`, `refrence_name`, `refrence_contact_no`, `refrence_designation`, `std_address`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'STD-Y19-01', 'nauman', 'shahid', '+92-333-7486807', '+92-300-6738133', '2019-02-13', 'ICS', 'BSCS', 'ESNA Public School', '025', 900, 1100, '82%', 'Anas', '+90-331-7375027', 'MD DEXDEVS', 'RYK', '2019-03-06 08:06:43', '2019-03-06 08:03:22', 9, 3),
(2, 'STD-Y19-02', 'Farhan', 'Shahid', '+92-331-5994989', '+92-331-5848948', '2019-03-06', 'ICS', 'Matric', 'ESNA Public School', '12345', 850, 1100, '77%', 'Nauman', '+92-333-7486807', 'MD', 'Satelite Town, Rahim Yar Khan', '2019-03-06 08:09:38', '0000-00-00 00:00:00', 3, 0),
(3, 'STD-Y19-03', 'Kinza', 'Mustafa', '+92-345-6789098', '+92-456-7890987', '2019-03-07', 'FSC', 'metric', 'Horizon School', '12365', 800, 1100, '73%', 'Nadia', '+92-987-6543345', 'hgh', 'lkjhgfdfghj', '2019-03-07 07:11:14', '0000-00-00 00:00:00', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `std_personal_info`
--

CREATE TABLE `std_personal_info` (
  `std_id` int(11) NOT NULL,
  `std_reg_no` varchar(50) NOT NULL,
  `std_name` varchar(50) NOT NULL,
  `std_father_name` varchar(50) NOT NULL,
  `std_contact_no` varchar(15) NOT NULL,
  `std_DOB` date NOT NULL,
  `std_gender` enum('Male','Female') NOT NULL,
  `std_permanent_address` varchar(255) NOT NULL,
  `std_temporary_address` varchar(255) NOT NULL,
  `std_email` varchar(84) NOT NULL,
  `std_photo` varchar(200) NOT NULL,
  `std_b_form` varchar(255) NOT NULL,
  `std_district` varchar(50) NOT NULL,
  `std_religion` varchar(50) NOT NULL,
  `std_nationality` varchar(50) NOT NULL,
  `std_tehseel` varchar(50) NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `academic_status` enum('Active','Promote','Left','Struck off') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_personal_info`
--

INSERT INTO `std_personal_info` (`std_id`, `std_reg_no`, `std_name`, `std_father_name`, `std_contact_no`, `std_DOB`, `std_gender`, `std_permanent_address`, `std_temporary_address`, `std_email`, `std_photo`, `std_b_form`, `std_district`, `std_religion`, `std_nationality`, `std_tehseel`, `status`, `academic_status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 'REG-Y19-001', 'Kinza Mustafah', 'Mustafa Ali', '+12-345-6789098', '2019-01-14', 'Female', 'RYK', 'RYK', 'kinza@gmail.com', 'uploads/Kinza Mustafah_photo.png', '12345-1234567-1', 'RYK', 'Islam', 'Pakistani', 'RYK', 'Active', 'Left', '2019-03-04 09:39:51', '2019-03-04 09:39:51', 1, 3, 1),
(2, 'REG-Y19-002', 'Nadia Gull', 'Iftikhar Ali', '+92-314-8790789', '2018-10-29', 'Female', 'RYK', 'RYK', 'nadia@gmail.com', 'uploads/Nadia Gull_photo.png', '12345-6789123-4', 'RYK', 'RYK', 'Pakistan', 'Islam', 'Active', 'Active', '2019-03-05 05:26:08', '2019-03-05 05:26:08', 1, 3, 1),
(3, 'REG-Y19-003', 'Mehtab Ahmed Ali', 'M. Ahmed', '+92-333-7967676', '1996-07-04', 'Male', 'RYK', 'RYK', 'mehtab@gmail.com', 'uploads/Mehtab Ahmed Ali_photo.jpeg', '12345-6789123-4', 'RYK', 'Islam', 'Pakistani', 'RYK', 'Active', 'Active', '2019-03-07 07:20:48', '2019-03-07 07:20:48', 1, 3, 1),
(4, 'REG-Y19-004', 'Ali', '', '+56-234-6789098', '2018-10-27', 'Male', 'seuh', 'hggyu', 'hiuuhi', '', '23456-7890987-6', 'jbjbj', 'knk', 'jjj', 'jhjh', 'Active', 'Active', '2019-02-08 05:24:41', '0000-00-00 00:00:00', 1, 0, 1),
(5, 'REG-Y19-005', 'Hamza', '', '+35-678-9009876', '2018-10-27', 'Male', 'tghjk', 'lkokjo', '4567kpok', 'uploads/Hamza_photo.jpg', '23678-7654345-6', 'dfhjk', 'jojoj', 'jjoijho', 'hukhukhk', 'Active', 'Active', '2019-02-08 05:24:46', '2018-11-01 06:49:57', 1, 1, 1),
(6, 'REG-Y19-006', 'Qasim', 'Khan', '+38-909-8765445', '2018-10-27', 'Male', 'Rahim Yar Khan', 'Rahim Yar Khan', 'qasim@gmail.com', 'uploads/Qasim_photo.jpg', '23678-8765434-5', 'Rahim Yar Khan', 'Islam', 'Pakistani', 'Rahim Yar Khan', 'Active', 'Active', '2019-02-08 05:24:51', '2019-01-12 17:09:27', 1, 1, 1),
(7, 'REG-Y19-007', 'Anas Shafqat', 'Shafqat Ali', '+92-331-7375027', '2018-10-27', 'Male', 'Gulshan Iqbal, Rahim Yar Khan', 'Gulshan Iqbal, Rahim Yar Khan', 'anasshafqat01@gmail.com', 'uploads/Anas Shafqat_photo.jpg', '31303-0437789-0', 'Rahim Yar Khan', 'Islam', 'Pakistani', 'Rahim Yar Khan', 'Active', 'Active', '2019-02-08 05:24:56', '2019-01-11 15:45:24', 1, 1, 1),
(8, 'REG-Y19-008', 'Zia Ali', 'Ali Ahmed', '+12-345-6789098', '2009-06-09', 'Male', 'Gulshan Iqbal, Rahim Yar Khan', 'Gulshan Iqbal, Rahim Yar Khan', 'zia@gmail.com', 'uploads/Zia Ali_photo.jpg', '12345-6789876-5', 'Rahim Yar Khan', 'Islam', 'Pakistani', 'Rahim Yar Khan', 'Active', 'Active', '2019-02-08 05:25:01', '2018-11-05 16:42:39', 1, 1, 1),
(9, 'REG-Y19-009', 'Ali Naveed', 'Naveed Anjum', '+12-345-6789098', '2018-11-03', 'Male', 'mnhgbfdsfvbghgfd', '', 'sdfghjkllkjhgvc', 'uploads/Ali Naveed_photo.jpg', '23456-7890987-6', 'RYK', 'Islam', 'Pakistani', 'RKY', 'Active', 'Active', '2019-02-08 05:25:06', '0000-00-00 00:00:00', 1, 0, 1),
(10, 'REG-Y19-010', 'M. Rehan', 'M. Arshad', '+92-306-3772105', '1992-04-03', 'Male', 'Rahim Yar Khan', 'Rahim Yar Khan', 'rehan@gmail.com', 'uploads/M. Rehan_photo.png', '31303-8898966-5', 'Rahim Yar Khan', 'Islam', 'Pakistani', 'Rahim Yar Khan', 'Active', 'Active', '2019-02-08 05:25:11', '0000-00-00 00:00:00', 1, 0, 1),
(11, 'REG-Y19-011', 'Aisha Ameen', 'Muhammad Ameen', '', '1991-01-01', 'Female', 'sdfghjkjhg678', 'xcvbnjmklkjhg6789', 'aisha@gmail.com', 'uploads/Aisha Ameen_photo.png', '34567-8765456-7', 'RYK', 'Islam', 'Pakistani', 'RYK', 'Active', 'Active', '2019-02-08 05:25:17', '0000-00-00 00:00:00', 1, 0, 1),
(12, 'REG-Y19-012', 'Aniqa Gull', 'Iftikhar Ali', '+92-456-7898765', '2019-01-06', 'Female', 'uytfdfghujio', 'fdfghjkl', 'aniqa@gmail.com', 'uploads/Aniqa Gull_photo.png', '34567-8987654-5', 'RYK', 'Islam', 'Pakistani', 'RYK', 'Active', 'Active', '2019-02-08 05:25:21', '0000-00-00 00:00:00', 1, 0, 1),
(13, 'REG-Y19-013', 'Faheem Ameen', 'Muhammed Ameen', '+23-456-7898765', '2019-01-06', 'Male', 'ghjkkjhgfdvbn', 'ddtyuioiuytr', 'faheem@gmail.com', 'uploads/Faheem Ameen_photo.jpg', '23456-7898765-4', 'RYK', 'Islam', 'Pakistani', 'RYK', 'Active', 'Active', '2019-02-08 05:25:37', '0000-00-00 00:00:00', 1, 0, 1),
(15, 'REG-Y19-015', 'Anas', 'M.Akram', '+92-321-6518489', '2019-01-14', 'Male', 'RYK', 'RYK', 'anas@gmail.com', 'uploads/Anas_photo.jpeg', '31302-3456789-8', 'RYK', 'Islam', 'Pakistani', 'RYK', 'Active', 'Left', '2019-03-04 09:35:23', '2019-03-04 09:35:23', 1, 3, 1),
(16, 'REG-Y19-016', 'Waleed Bin Naeem', 'Naeem', '+23-456-7756999', '1993-05-05', 'Male', 'Rahim Yar Khan', 'Rahim Yar Khan', 'waleed@gmail.com', '', '12367-8765432-8', 'Rahim Yar Khan', 'Islam', 'Pakistani', 'Rahim Yar Khan', 'Active', 'Active', '2019-03-06 04:57:13', '0000-00-00 00:00:00', 1, 0, 1),
(18, 'REG-Y19-018', 'M. Akram', 'jhgfddfgh', '+34-567-8909876', '2019-02-06', 'Male', '23456789jhgfxxfghjk', 'hgfdxszdfghj345678ijhgvc', 'xyz@gmail.com', 'uploads/M. Akram_photo.png', '34567-8909876-5', 'RYK', 'Islam', 'Pakistani', 'RYK', 'Active', 'Active', '2019-02-07 17:09:21', '2019-02-06 08:15:54', 3, 3, 1),
(19, 'REG-Y19-019', 'anam asad', 'asad ali', '+33-333-3333333', '2019-02-06', 'Female', 'dfghjfgh', 'fgvbhjn', 'anam@gmail.com', 'uploads/std_default.jpg', '55555-5555555-5', 'RYK', 'Islam', 'Pakistani', 'RYK', 'Active', 'Active', '2019-03-06 05:44:45', '0000-00-00 00:00:00', 3, 0, 1),
(20, 'STD-Y19-20', 'Iqra Yaqoob', 'M Yaqoob', '+11-111-1111111', '2019-02-18', 'Female', 'RYK', 'RYK', 'iqra@gmail.com', 'uploads/Iqra Yaqoob_photo.jpg', '22222-2222222-2', 'RYK', 'Islam', 'Pakistani', 'RYK', 'Active', 'Active', '2019-02-19 04:54:40', '0000-00-00 00:00:00', 3, 0, 1),
(24, 'STD-Y19-21', 'M.Azaan', 'Asad Shafqat', '+92-336-5489498', '2019-03-04', 'Male', 'RYK', '', 'azaan@gmail.com', '', '31303-2648948-9', 'RYK', 'Islam', 'Pakistani', 'RYK', 'Active', 'Active', '2019-03-06 04:55:07', '0000-00-00 00:00:00', 3, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_sections`
--

CREATE TABLE `std_sections` (
  `section_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `section_name` varchar(50) NOT NULL,
  `section_description` varchar(100) NOT NULL,
  `section_intake` int(11) NOT NULL,
  `section_subjects` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_sections`
--

INSERT INTO `std_sections` (`section_id`, `session_id`, `section_name`, `section_description`, `section_intake`, `section_subjects`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 4, 'FMG1', 'Medical Girls Part-I', 25, 1, '2019-02-17 14:25:01', '0000-00-00 00:00:00', 3, 0, 1),
(2, 4, 'FMG2', 'Medical Girls Part II', 30, 2, '2019-02-18 05:14:12', '2019-02-18 05:14:12', 3, 3, 1),
(3, 4, 'FEG1', 'Engineering Girls part I', 30, 3, '2019-02-18 05:16:16', '2019-02-18 05:16:16', 3, 3, 1),
(4, 4, 'FEG2', 'Engineering Girls part II', 30, 4, '2019-02-18 05:18:57', '2019-02-18 05:18:57', 3, 3, 1),
(5, 4, 'ICB1', 'ICS Boys part 1', 30, 5, '2019-02-18 05:17:03', '0000-00-00 00:00:00', 3, 0, 1),
(6, 4, 'ICB2', 'ICS Boys part II', 30, 6, '2019-02-18 05:17:31', '0000-00-00 00:00:00', 3, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_sessions`
--

CREATE TABLE `std_sessions` (
  `session_id` int(11) NOT NULL,
  `session_branch_id` int(11) NOT NULL,
  `session_name` varchar(32) NOT NULL,
  `session_start_date` date NOT NULL,
  `session_end_date` date NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_sessions`
--

INSERT INTO `std_sessions` (`session_id`, `session_branch_id`, `session_name`, `session_start_date`, `session_end_date`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(4, 5, '2018 - 2020 ', '2018-05-01', '2020-05-01', 'Active', '2019-01-03 11:18:28', '0000-00-00 00:00:00', 1, 0, 1),
(5, 5, '2019-2021', '2019-01-01', '2021-01-31', 'Inactive', '2019-02-28 07:26:41', '2019-02-28 07:26:41', 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `std_subjects`
--

CREATE TABLE `std_subjects` (
  `std_subject_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `std_subject_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `std_subjects`
--

INSERT INTO `std_subjects` (`std_subject_id`, `class_id`, `std_subject_name`) VALUES
(1, 1, 'Biology I,Chemistry I,Physic I,English I,Urdu I,Islamiyat'),
(2, 2, 'Biology II,Chemistry II,Physics II,English II,Urdu II,Pak-Studies'),
(3, 3, 'Math I,Chemistry I,Physics I,English I,Urdu I,Islamiyat'),
(4, 4, 'Math II,Chemistry II,Physics II,English II,Urdu II,Pak-Studies'),
(5, 5, 'Computer I,Math I,Physics I,English I,Urdu I,Islamiyat'),
(6, 6, 'Computer II,Math II,Physics II,English II,Urdu II,Islamiyat'),
(7, 6, 'Computer I,Statistics I,Economics I,English I,Urdu I,Islamiyat'),
(8, 6, 'Computer II,Statistics II,Economics II,English II,Urdu II,Pak-studies');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(32) NOT NULL,
  `subject_alias` varchar(10) NOT NULL,
  `subject_description` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_name`, `subject_alias`, `subject_description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(1, 'Math I', 'M', 'Intermediate Mathematics', '2019-03-06 06:27:50', '0000-00-00 00:00:00', 0, 0, 1),
(2, 'English I', 'E', '', '2019-03-06 06:28:04', '0000-00-00 00:00:00', 0, 0, 1),
(3, 'Urdu I', 'U', '', '2019-03-06 06:28:21', '0000-00-00 00:00:00', 0, 0, 1),
(4, 'Physics I', 'P', '', '2019-03-06 06:28:38', '0000-00-00 00:00:00', 0, 0, 1),
(5, 'Biology I', 'B', '', '2019-03-06 06:29:07', '0000-00-00 00:00:00', 0, 0, 1),
(6, 'Islamiyat', 'I', '', '2019-03-06 06:35:18', '0000-00-00 00:00:00', 0, 0, 1),
(7, 'Computer I', 'Cm', '', '2019-03-06 06:29:37', '0000-00-00 00:00:00', 0, 0, 1),
(8, 'Chemistry I', 'Ch', '', '2019-03-06 06:29:52', '0000-00-00 00:00:00', 0, 0, 1),
(9, 'Pak Studies', 'Ps', '', '2019-03-06 06:30:14', '2018-12-31 11:57:46', 0, 1, 0),
(10, 'Economics I', 'Ec', '', '2019-03-06 06:30:36', '0000-00-00 00:00:00', 9, 0, 1),
(11, 'Statistics I', 'St', '', '2019-03-06 06:31:35', '0000-00-00 00:00:00', 0, 0, 1),
(12, 'Math II', 'M', '', '2019-03-06 06:31:53', '0000-00-00 00:00:00', 0, 0, 1),
(13, 'English II', 'E', '', '2019-03-06 06:32:15', '0000-00-00 00:00:00', 0, 0, 1),
(14, 'Urdu II', 'U', '', '2019-03-06 06:32:26', '0000-00-00 00:00:00', 0, 0, 1),
(15, 'Physics II', 'P', '', '2019-03-06 06:32:42', '0000-00-00 00:00:00', 0, 0, 1),
(16, 'Biology II', 'B', '', '2019-03-06 06:32:59', '0000-00-00 00:00:00', 0, 0, 1),
(17, 'Computer II', 'Cm', '', '2019-03-06 06:33:24', '0000-00-00 00:00:00', 0, 0, 1),
(18, 'Chemistry II', 'Ch', '', '2019-03-06 06:33:40', '0000-00-00 00:00:00', 0, 0, 1),
(19, 'Economics II', 'Ec', '', '2019-03-06 06:34:11', '0000-00-00 00:00:00', 0, 0, 1),
(20, 'Statistics II', 'St', '', '2019-03-06 06:34:31', '0000-00-00 00:00:00', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_subject_assign_detail`
--

CREATE TABLE `teacher_subject_assign_detail` (
  `teacher_subject_assign_detail_id` int(11) NOT NULL,
  `teacher_subject_assign_detail_head_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `no_of_lecture` enum('1 Lecture','2 Lectures','3 Lectures','4 Lectures','5 Lectures','6 Lectures','Full Week') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_subject_assign_detail`
--

INSERT INTO `teacher_subject_assign_detail` (`teacher_subject_assign_detail_id`, `teacher_subject_assign_detail_head_id`, `class_id`, `subject_id`, `no_of_lecture`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(8, 8, 1, 5, '2 Lectures', '2019-02-25 06:46:22', '0000-00-00 00:00:00', 9, 0, 1),
(9, 8, 1, 8, '2 Lectures', '2019-02-25 06:46:22', '0000-00-00 00:00:00', 9, 0, 1),
(10, 8, 5, 7, '2 Lectures', '2019-03-05 10:13:54', '0000-00-00 00:00:00', 9, 0, 1),
(11, 9, 5, 6, '1 Lecture', '2019-03-05 10:14:01', '0000-00-00 00:00:00', 3, 0, 1),
(12, 9, 4, 6, '1 Lecture', '2019-03-03 15:25:07', '0000-00-00 00:00:00', 3, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teacher_subject_assign_head`
--

CREATE TABLE `teacher_subject_assign_head` (
  `teacher_subject_assign_head_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `teacher_subject_assign_head_name` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `delete_status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_subject_assign_head`
--

INSERT INTO `teacher_subject_assign_head` (`teacher_subject_assign_head_id`, `teacher_id`, `teacher_subject_assign_head_name`, `created_at`, `updated_at`, `created_by`, `updated_by`, `delete_status`) VALUES
(8, 1, 'Kinza Mustafa', '2019-02-25 06:46:22', '0000-00-00 00:00:00', 9, 0, 1),
(9, 9, 'Zia ur Rehman', '2019-03-03 15:25:07', '0000-00-00 00:00:00', 3, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_photo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `user_photo`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Nadia Gull', 'gQfgRy6bOrf6c0rA3GcHbJ8NBBkNOvav', '$2y$13$jZNfJkMzYUgfTOKlS4/J5OGCYddtOkPUX4HuDldfO42z4QehkAnnS', 'BQQPywNyB5CLu8tQB6fdmSq7JAQpVUSQ_1544169305', 'nadiagull285@gmail.com', '', 10, 1544164564, 1544169305),
(3, 'kinza', '49-7nkeRO0S1DiJufMw2Z_03csIPfFKv', '$2y$13$GsKlW7WedO19nhEeSeELruQiVbrcn3fkw2cKDvun9.bw7qfQElrRW', NULL, 'kinza.fatima.522@gmail.com', '', 10, 1544420311, 1544420311),
(8, 'nauman', 'zBR6bzgL2TXBUAih87cKZmfM16f8jzfN', '$2y$13$TSDjjWiuBqtNrqR4Kw7LRui4p32B6zQbQYs6bd/g10K2m7.03X2NK', NULL, 'nauman@gmail.com', 'uploads/nauman_photo.jpg', 10, 1547628657, 1547628657),
(9, 'anasshafqat', 'VIzes-7TZINTaoCcloH2dOXuXkA0M2AL', '$2y$13$TufdQR.BjMgz1iQdX/eTq.6UqneK6KT45AamG.pt.6RYYM4emvq.u', NULL, 'anasshafqat01@gmail.com', 'uploads/anasshafqat_photo.jpeg', 10, 1547628726, 1547628726),
(12, 'farhan', 'PMgYC_9aJZvlAgCpKB7Jq0q7Z92-dURX', '$2y$13$o9czwzeCeLAY3YBvLX0XJePnRY2uj2wnRgMCObX1D/NxvKFIU/E6K', NULL, 'farhan@gmail.com', 'uploads/farhan_photo.jpg', 10, 1547632554, 1547632554),
(18, 'ali', '0QpSNKlONTE0HCgKeNk2pTjmWAVodpb2', '$2y$13$ZLMrQ.RqluExDnZ0Ri4NT.Dno0Z9HEqByIunDTmB9TCCPoFrYagSq', NULL, 'ali@gmail.com', 'userphotos/ali_photo.jpg', 10, 1547663221, 1547663221);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_nature`
--
ALTER TABLE `account_nature`
  ADD PRIMARY KEY (`account_nature_id`);

--
-- Indexes for table `account_register`
--
ALTER TABLE `account_register`
  ADD PRIMARY KEY (`account_register_id`),
  ADD KEY `account_register_account_nature_id` (`account_nature_id`);

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `trans_head_account_id` (`account_nature`),
  ADD KEY `trans_head_voucher_type_id` (`account_register_id`);

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`branch_id`),
  ADD KEY `institute_id` (`institute_id`);

--
-- Indexes for table `concession`
--
ALTER TABLE `concession`
  ADD PRIMARY KEY (`concession_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`emial_id`);

--
-- Indexes for table `emp_departments`
--
ALTER TABLE `emp_departments`
  ADD PRIMARY KEY (`emp_department_id`),
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `department_id` (`dept_id`);

--
-- Indexes for table `emp_designation`
--
ALTER TABLE `emp_designation`
  ADD PRIMARY KEY (`emp_designation_id`);

--
-- Indexes for table `emp_documents`
--
ALTER TABLE `emp_documents`
  ADD PRIMARY KEY (`emp_document_id`),
  ADD KEY `emp_info_id` (`emp_info_id`);

--
-- Indexes for table `emp_info`
--
ALTER TABLE `emp_info`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `emp_designation_id` (`emp_designation_id`),
  ADD KEY `emp_branch_id` (`emp_branch_id`),
  ADD KEY `emp_type_id` (`emp_type_id`),
  ADD KEY `emp_dept_id` (`emp_dept_id`);

--
-- Indexes for table `emp_reference`
--
ALTER TABLE `emp_reference`
  ADD PRIMARY KEY (`emp_ref_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `emp_type`
--
ALTER TABLE `emp_type`
  ADD PRIMARY KEY (`emp_type_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `fee_transaction_detail`
--
ALTER TABLE `fee_transaction_detail`
  ADD PRIMARY KEY (`fee_trans_detail_id`),
  ADD KEY `fee_trans_detail_head_id` (`fee_trans_detail_head_id`),
  ADD KEY `fee_type_id` (`fee_type_id`);

--
-- Indexes for table `fee_transaction_head`
--
ALTER TABLE `fee_transaction_head`
  ADD PRIMARY KEY (`fee_trans_id`),
  ADD KEY `std_id` (`std_id`),
  ADD KEY `month_id` (`month`),
  ADD KEY `class_name_id` (`class_name_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `fee_type`
--
ALTER TABLE `fee_type`
  ADD PRIMARY KEY (`fee_type_id`);

--
-- Indexes for table `installment`
--
ALTER TABLE `installment`
  ADD PRIMARY KEY (`installment_id`);

--
-- Indexes for table `institute`
--
ALTER TABLE `institute`
  ADD PRIMARY KEY (`institute_id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `month`
--
ALTER TABLE `month`
  ADD PRIMARY KEY (`month_id`);

--
-- Indexes for table `msg_of_day`
--
ALTER TABLE `msg_of_day`
  ADD PRIMARY KEY (`msg_of_day_id`),
  ADD UNIQUE KEY `msg_details` (`msg_details`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`notice_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`sms_id`);

--
-- Indexes for table `std_academic_info`
--
ALTER TABLE `std_academic_info`
  ADD PRIMARY KEY (`academic_id`),
  ADD KEY `std_id` (`std_id`),
  ADD KEY `class_name_id` (`class_name_id`),
  ADD KEY `subject_combination` (`subject_combination`);

--
-- Indexes for table `std_attendance`
--
ALTER TABLE `std_attendance`
  ADD PRIMARY KEY (`std_attend_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `class_id` (`class_name_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `std_class_name`
--
ALTER TABLE `std_class_name`
  ADD PRIMARY KEY (`class_name_id`);

--
-- Indexes for table `std_enrollment_detail`
--
ALTER TABLE `std_enrollment_detail`
  ADD PRIMARY KEY (`std_enroll_detail_id`),
  ADD KEY `std_enroll_detail_head_id` (`std_enroll_detail_head_id`),
  ADD KEY `std_enroll_detail_std_id` (`std_enroll_detail_std_id`);

--
-- Indexes for table `std_enrollment_head`
--
ALTER TABLE `std_enrollment_head`
  ADD PRIMARY KEY (`std_enroll_head_id`),
  ADD KEY `class_name_id` (`class_name_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `std_fee_details`
--
ALTER TABLE `std_fee_details`
  ADD PRIMARY KEY (`fee_id`),
  ADD KEY `std_id` (`std_id`),
  ADD KEY `concession_id` (`concession_id`);

--
-- Indexes for table `std_fee_installments`
--
ALTER TABLE `std_fee_installments`
  ADD PRIMARY KEY (`fee_installment_id`),
  ADD KEY `std_fee_id` (`std_fee_id`),
  ADD KEY `installment_no` (`installment_no`);

--
-- Indexes for table `std_fee_pkg`
--
ALTER TABLE `std_fee_pkg`
  ADD PRIMARY KEY (`std_fee_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `std_guardian_info`
--
ALTER TABLE `std_guardian_info`
  ADD PRIMARY KEY (`std_guardian_info_id`),
  ADD KEY `std_id` (`std_id`);

--
-- Indexes for table `std_ice_info`
--
ALTER TABLE `std_ice_info`
  ADD PRIMARY KEY (`std_ice_id`),
  ADD KEY `std_id` (`std_id`);

--
-- Indexes for table `std_inquiry`
--
ALTER TABLE `std_inquiry`
  ADD PRIMARY KEY (`std_inquiry_id`);

--
-- Indexes for table `std_personal_info`
--
ALTER TABLE `std_personal_info`
  ADD PRIMARY KEY (`std_id`),
  ADD KEY `std_name` (`std_name`);

--
-- Indexes for table `std_sections`
--
ALTER TABLE `std_sections`
  ADD PRIMARY KEY (`section_id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `section_subjects` (`section_subjects`);

--
-- Indexes for table `std_sessions`
--
ALTER TABLE `std_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `session_branch_id` (`session_branch_id`);

--
-- Indexes for table `std_subjects`
--
ALTER TABLE `std_subjects`
  ADD PRIMARY KEY (`std_subject_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `teacher_subject_assign_detail`
--
ALTER TABLE `teacher_subject_assign_detail`
  ADD PRIMARY KEY (`teacher_subject_assign_detail_id`),
  ADD KEY `teacher_subject_assign_detail_head_id` (`teacher_subject_assign_detail_head_id`),
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `teacher_subject_assign_head`
--
ALTER TABLE `teacher_subject_assign_head`
  ADD PRIMARY KEY (`teacher_subject_assign_head_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_nature`
--
ALTER TABLE `account_nature`
  MODIFY `account_nature_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `account_register`
--
ALTER TABLE `account_register`
  MODIFY `account_register_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `concession`
--
ALTER TABLE `concession`
  MODIFY `concession_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `emial_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `emp_departments`
--
ALTER TABLE `emp_departments`
  MODIFY `emp_department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `emp_designation`
--
ALTER TABLE `emp_designation`
  MODIFY `emp_designation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `emp_documents`
--
ALTER TABLE `emp_documents`
  MODIFY `emp_document_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `emp_info`
--
ALTER TABLE `emp_info`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `emp_reference`
--
ALTER TABLE `emp_reference`
  MODIFY `emp_ref_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `emp_type`
--
ALTER TABLE `emp_type`
  MODIFY `emp_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `fee_transaction_detail`
--
ALTER TABLE `fee_transaction_detail`
  MODIFY `fee_trans_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `fee_transaction_head`
--
ALTER TABLE `fee_transaction_head`
  MODIFY `fee_trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `fee_type`
--
ALTER TABLE `fee_type`
  MODIFY `fee_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `installment`
--
ALTER TABLE `installment`
  MODIFY `installment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `institute`
--
ALTER TABLE `institute`
  MODIFY `institute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `month`
--
ALTER TABLE `month`
  MODIFY `month_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `msg_of_day`
--
ALTER TABLE `msg_of_day`
  MODIFY `msg_of_day_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sms`
--
ALTER TABLE `sms`
  MODIFY `sms_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `std_academic_info`
--
ALTER TABLE `std_academic_info`
  MODIFY `academic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `std_attendance`
--
ALTER TABLE `std_attendance`
  MODIFY `std_attend_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `std_class_name`
--
ALTER TABLE `std_class_name`
  MODIFY `class_name_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `std_enrollment_detail`
--
ALTER TABLE `std_enrollment_detail`
  MODIFY `std_enroll_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `std_enrollment_head`
--
ALTER TABLE `std_enrollment_head`
  MODIFY `std_enroll_head_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `std_fee_details`
--
ALTER TABLE `std_fee_details`
  MODIFY `fee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `std_fee_installments`
--
ALTER TABLE `std_fee_installments`
  MODIFY `fee_installment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `std_fee_pkg`
--
ALTER TABLE `std_fee_pkg`
  MODIFY `std_fee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `std_guardian_info`
--
ALTER TABLE `std_guardian_info`
  MODIFY `std_guardian_info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `std_ice_info`
--
ALTER TABLE `std_ice_info`
  MODIFY `std_ice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `std_inquiry`
--
ALTER TABLE `std_inquiry`
  MODIFY `std_inquiry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `std_personal_info`
--
ALTER TABLE `std_personal_info`
  MODIFY `std_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `std_sections`
--
ALTER TABLE `std_sections`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `std_sessions`
--
ALTER TABLE `std_sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `std_subjects`
--
ALTER TABLE `std_subjects`
  MODIFY `std_subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `teacher_subject_assign_detail`
--
ALTER TABLE `teacher_subject_assign_detail`
  MODIFY `teacher_subject_assign_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `teacher_subject_assign_head`
--
ALTER TABLE `teacher_subject_assign_head`
  MODIFY `teacher_subject_assign_head_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_register`
--
ALTER TABLE `account_register`
  ADD CONSTRAINT `account_register_ibfk_1` FOREIGN KEY (`account_nature_id`) REFERENCES `account_nature` (`account_nature_id`);

--
-- Constraints for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD CONSTRAINT `account_transactions_ibfk_2` FOREIGN KEY (`account_register_id`) REFERENCES `account_register` (`account_register_id`);

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_ibfk_1` FOREIGN KEY (`institute_id`) REFERENCES `institute` (`institute_id`);

--
-- Constraints for table `emp_departments`
--
ALTER TABLE `emp_departments`
  ADD CONSTRAINT `emp_departments_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `emp_info` (`emp_id`),
  ADD CONSTRAINT `emp_departments_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`department_id`);

--
-- Constraints for table `emp_documents`
--
ALTER TABLE `emp_documents`
  ADD CONSTRAINT `emp_documents_ibfk_1` FOREIGN KEY (`emp_info_id`) REFERENCES `emp_info` (`emp_id`);

--
-- Constraints for table `emp_info`
--
ALTER TABLE `emp_info`
  ADD CONSTRAINT `emp_info_ibfk_1` FOREIGN KEY (`emp_designation_id`) REFERENCES `emp_designation` (`emp_designation_id`),
  ADD CONSTRAINT `emp_info_ibfk_2` FOREIGN KEY (`emp_branch_id`) REFERENCES `branches` (`branch_id`),
  ADD CONSTRAINT `emp_info_ibfk_3` FOREIGN KEY (`emp_type_id`) REFERENCES `emp_type` (`emp_type_id`);

--
-- Constraints for table `emp_reference`
--
ALTER TABLE `emp_reference`
  ADD CONSTRAINT `emp_reference_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `emp_info` (`emp_id`);

--
-- Constraints for table `fee_transaction_detail`
--
ALTER TABLE `fee_transaction_detail`
  ADD CONSTRAINT `fee_transaction_detail_ibfk_1` FOREIGN KEY (`fee_trans_detail_head_id`) REFERENCES `fee_transaction_head` (`fee_trans_id`);

--
-- Constraints for table `fee_transaction_head`
--
ALTER TABLE `fee_transaction_head`
  ADD CONSTRAINT `fee_transaction_head_ibfk_5` FOREIGN KEY (`class_name_id`) REFERENCES `std_class_name` (`class_name_id`),
  ADD CONSTRAINT `fee_transaction_head_ibfk_6` FOREIGN KEY (`session_id`) REFERENCES `std_sessions` (`session_id`),
  ADD CONSTRAINT `fee_transaction_head_ibfk_8` FOREIGN KEY (`std_id`) REFERENCES `std_personal_info` (`std_id`),
  ADD CONSTRAINT `fee_transaction_head_ibfk_9` FOREIGN KEY (`section_id`) REFERENCES `std_sections` (`section_id`);

--
-- Constraints for table `std_academic_info`
--
ALTER TABLE `std_academic_info`
  ADD CONSTRAINT `std_academic_info_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `std_personal_info` (`std_id`),
  ADD CONSTRAINT `std_academic_info_ibfk_2` FOREIGN KEY (`class_name_id`) REFERENCES `std_class_name` (`class_name_id`),
  ADD CONSTRAINT `std_academic_info_ibfk_3` FOREIGN KEY (`subject_combination`) REFERENCES `std_subjects` (`std_subject_id`);

--
-- Constraints for table `std_attendance`
--
ALTER TABLE `std_attendance`
  ADD CONSTRAINT `std_attendance_ibfk_2` FOREIGN KEY (`class_name_id`) REFERENCES `std_class_name` (`class_name_id`),
  ADD CONSTRAINT `std_attendance_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `std_personal_info` (`std_id`),
  ADD CONSTRAINT `std_attendance_ibfk_5` FOREIGN KEY (`session_id`) REFERENCES `std_sessions` (`session_id`),
  ADD CONSTRAINT `std_attendance_ibfk_6` FOREIGN KEY (`section_id`) REFERENCES `std_sections` (`section_id`),
  ADD CONSTRAINT `std_attendance_ibfk_7` FOREIGN KEY (`teacher_id`) REFERENCES `emp_info` (`emp_id`),
  ADD CONSTRAINT `std_attendance_ibfk_8` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`);

--
-- Constraints for table `std_enrollment_detail`
--
ALTER TABLE `std_enrollment_detail`
  ADD CONSTRAINT `std_enrollment_detail_ibfk_2` FOREIGN KEY (`std_enroll_detail_std_id`) REFERENCES `std_personal_info` (`std_id`),
  ADD CONSTRAINT `std_enrollment_detail_ibfk_3` FOREIGN KEY (`std_enroll_detail_head_id`) REFERENCES `std_enrollment_head` (`std_enroll_head_id`);

--
-- Constraints for table `std_enrollment_head`
--
ALTER TABLE `std_enrollment_head`
  ADD CONSTRAINT `std_enrollment_head_ibfk_1` FOREIGN KEY (`class_name_id`) REFERENCES `std_class_name` (`class_name_id`),
  ADD CONSTRAINT `std_enrollment_head_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `std_sessions` (`session_id`),
  ADD CONSTRAINT `std_enrollment_head_ibfk_3` FOREIGN KEY (`section_id`) REFERENCES `std_sections` (`section_id`);

--
-- Constraints for table `std_fee_details`
--
ALTER TABLE `std_fee_details`
  ADD CONSTRAINT `std_fee_details_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `std_personal_info` (`std_id`),
  ADD CONSTRAINT `std_fee_details_ibfk_2` FOREIGN KEY (`concession_id`) REFERENCES `concession` (`concession_id`);

--
-- Constraints for table `std_fee_installments`
--
ALTER TABLE `std_fee_installments`
  ADD CONSTRAINT `std_fee_installments_ibfk_1` FOREIGN KEY (`std_fee_id`) REFERENCES `std_fee_details` (`fee_id`),
  ADD CONSTRAINT `std_fee_installments_ibfk_2` FOREIGN KEY (`installment_no`) REFERENCES `installment` (`installment_id`);

--
-- Constraints for table `std_fee_pkg`
--
ALTER TABLE `std_fee_pkg`
  ADD CONSTRAINT `std_fee_pkg_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `std_sessions` (`session_id`),
  ADD CONSTRAINT `std_fee_pkg_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `std_class_name` (`class_name_id`);

--
-- Constraints for table `std_guardian_info`
--
ALTER TABLE `std_guardian_info`
  ADD CONSTRAINT `std_guardian_info_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `std_personal_info` (`std_id`);

--
-- Constraints for table `std_ice_info`
--
ALTER TABLE `std_ice_info`
  ADD CONSTRAINT `std_ice_info_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `std_personal_info` (`std_id`);

--
-- Constraints for table `std_sections`
--
ALTER TABLE `std_sections`
  ADD CONSTRAINT `std_sections_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `std_sessions` (`session_id`),
  ADD CONSTRAINT `std_sections_ibfk_2` FOREIGN KEY (`section_subjects`) REFERENCES `std_subjects` (`std_subject_id`);

--
-- Constraints for table `std_sessions`
--
ALTER TABLE `std_sessions`
  ADD CONSTRAINT `std_sessions_ibfk_1` FOREIGN KEY (`session_branch_id`) REFERENCES `branches` (`branch_id`);

--
-- Constraints for table `std_subjects`
--
ALTER TABLE `std_subjects`
  ADD CONSTRAINT `std_subjects_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `std_class_name` (`class_name_id`);

--
-- Constraints for table `teacher_subject_assign_detail`
--
ALTER TABLE `teacher_subject_assign_detail`
  ADD CONSTRAINT `teacher_subject_assign_detail_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `teacher_subject_assign_detail_ibfk_7` FOREIGN KEY (`class_id`) REFERENCES `std_enrollment_head` (`std_enroll_head_id`),
  ADD CONSTRAINT `teacher_subject_assign_detail_ibfk_8` FOREIGN KEY (`teacher_subject_assign_detail_head_id`) REFERENCES `teacher_subject_assign_head` (`teacher_subject_assign_head_id`);

--
-- Constraints for table `teacher_subject_assign_head`
--
ALTER TABLE `teacher_subject_assign_head`
  ADD CONSTRAINT `teacher_subject_assign_head_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `emp_info` (`emp_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
