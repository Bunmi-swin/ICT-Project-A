-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2025 at 03:14 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aged_care`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment_table`
--

CREATE TABLE `appointment_table` (
  `appointment_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `resident_email` varchar(255) NOT NULL,
  `service` text NOT NULL,
  `appointment_date` date NOT NULL,
  `time_slot` time NOT NULL,
  `notes` text DEFAULT NULL,
  `assigned_staff` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment_table`
--

INSERT INTO `appointment_table` (`appointment_id`, `name`, `resident_email`, `service`, `appointment_date`, `time_slot`, `notes`, `assigned_staff`) VALUES
(6, '', 'alicej@gmail.com', 'Medical Check-up', '2025-05-21', '17:10:00', 'Medical', NULL),
(7, '', 'alicej@gmail.com', 'Medical Check-up', '2025-05-21', '17:10:00', 'Medical', NULL),
(17, '', 'alicej@gmail.com', 'Medical Check-up', '2025-05-20', '21:29:00', 'medical', NULL),
(18, '', 'georgec@gmail.com', 'Residential Care', '2025-05-23', '12:54:00', 'care', NULL),
(19, '', 'alicej@gmail.com', 'Residential Care', '2025-05-22', '13:06:00', 'care', NULL),
(20, '', 'alicej@gmail.com', 'Medical Check-up', '2025-05-28', '13:17:00', 'care', NULL),
(21, '', 'alicej@gmail.com', 'In-home Care', '2025-05-26', '14:10:00', 'care', NULL),
(22, '', 'johndoe@gmail.com', 'In-home Care', '2025-05-19', '15:14:00', 'care', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact us table`
--

CREATE TABLE `contact us table` (
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `email` text NOT NULL,
  `name` text NOT NULL,
  `message_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact us table`
--

INSERT INTO `contact us table` (`message_id`, `sender_id`, `recipient_id`, `email`, `name`, `message_content`) VALUES
(0, 1, 1, '0', '0', '0'),
(0, 1, 1, 'asas@fgg', 'sdf', 'fghj'),
(0, 1, 1, 'fgfg@gmail.com', 'dfd', 'blah blah'),
(0, 1, 1, 'aaa@gmail.com', 'asdd', 'aasdf'),
(0, 1, 1, 'luna@gmail.com', 'luna', 'Hello'),
(0, 1, 1, 'luna@gmail.com', 'luna', 'Hello'),
(0, 1, 1, 'luna@gmail.com', 'luna', 'hello'),
(0, 1, 1, 'emma@gmail.com', 'Emma', 'hi'),
(0, 1, 1, 'ava@gmail.com', 'ava', 'hi'),
(0, 1, 1, 'sofia@gmail.com', 'sofia', 'hello'),
(0, 1, 1, 'leo@gmail.com', 'leo', 'hello');

-- --------------------------------------------------------

--
-- Table structure for table `family_member_table`
--

CREATE TABLE `family_member_table` (
  `id` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `family_member_table`
--

INSERT INTO `family_member_table` (`id`, `name`, `email`, `password`) VALUES
('F001', 'Mary Johnson', 'mary.johnson@gmail.com', 'Mary#123'),
('F002', 'Tom Carter', 'tom.carter@gmail.com', 'Tom#123'),
('F003', 'Anil Patel', 'anil.patel@gmail.com', 'Anil#123'),
('F004', 'Jane Doe', 'jane.doe@gmail.com', 'Jane#123'),
('F005', 'fsdsdfdg', 'dfdf@sgdr', '2222'),
('F006', 'dfgfdb', 'zfdgd@dfsd', 'aaaa'),
('F007', 'dfgfdb', 'zfdd@dfsd', 'aaaa'),
('F008', 'dfgfdb', 'fdd@dfsd', 'aaaa'),
('F009', 'swsw', 'qg@sw', '666'),
('F010', 'swsw', 'g@sw', '666'),
('F011', 'swsw', 'e@sw', '666'),
('F012', 'swsw', 'ed@sw', '666'),
('F013', 'ssasa', 'sa@dw', '33'),
('F014', 'sfdvs', 'sdf@zsgf', '3333'),
('F015', 'zdvcdv', 'cvx@dfgd', 'ssss'),
('F016', 'Anne', 'anne@gmail.com', '3333'),
('F017', 'sdf', 'sdf@xfg', 'eeee'),
('F018', 'olivia', 'olivia@gmail.com', 'ffff'),
('F019', 'mia', 'mia@gmail.com', 'gggg'),
('F020', 'elani', 'elani@gmail.com', 'hhhh'),
('F021', 'jack', 'jack@gmail.com', 'yyyy');

-- --------------------------------------------------------

--
-- Table structure for table `messages table`
--

CREATE TABLE `messages table` (
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `message_content` text NOT NULL,
  `timestamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages table`
--

INSERT INTO `messages table` (`message_id`, `sender_id`, `recipient_id`, `message_content`, `timestamp`) VALUES
(1, 1, 0, '0000-00-00', '0000-00-00 00:00:00.000000'),
(2, 2, 0, 'dcac', '2025-05-18 01:10:21.000000'),
(4, 3, 0, 'aaa', '2025-05-18 01:11:21.000000'),
(0, 0, 0, 'Hello', '2025-05-18 04:19:14.000000'),
(0, 0, 0, 'hello', '2025-05-18 11:04:53.000000'),
(0, 0, 0, 'hi', '2025-05-18 11:16:51.000000'),
(0, 0, 0, 'hello', '2025-05-18 12:17:39.000000');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` text NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `stock_quantity`, `description`) VALUES
(1, 'Face Mask', 106, 'Disposable 3-layer medical face masks'),
(2, 'Hand Sanitizer ', 50, '70% alcohol-based sanitizer, 500ml'),
(3, 'Gloves', 201, 'Latex-free exam gloves, box of 100'),
(4, 'Disposable Cups', 300, 'Single-use cups are suitable for hot and cold beverages'),
(5, 'Paper Towels', 150, 'Multi-purpose paper towels for cleaning and drying'),
(6, 'Antiseptic Wipes', 121, 'Individually wrapped wipes for disinfecting hands and surfaces'),
(7, 'Adjustable Bed Rai', 12, 'Provides support for residents getting in and out of bed; height-adjustable with locking mechanism'),
(8, 'Wheelchair Cushion', 8, 'Memory foam cushion for wheelchairs to enhance comfort and prevent pressure sores'),
(9, 'Walking Frame (Folding)', 10, 'Lightweight aluminum folding walking frame with rubber grips and anti-slip feet for safe indoor and outdoor use.'),
(10, 'Overbed Table ', 20, 'Easy-to-move overbed table with tilt function and adjustable height. Ideal for meals, reading, or activities while in bed or a chair.'),
(11, 'Shower Chair', 22, 'Height-adjustable shower chair with non-slip rubber tips and backrest support.\r\n'),
(12, 'Pill Organizer', 31, 'Easy-to-use weekly pill organizer with separate compartments for morning and evening doses.\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `resident_table`
--

CREATE TABLE `resident_table` (
  `resident_id` text NOT NULL,
  `full_name` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `gender` text NOT NULL,
  `date_of_birth` date NOT NULL,
  `contact_number` int(11) NOT NULL,
  `family_contact` text NOT NULL,
  `medication` text NOT NULL,
  `accessibility_requirements` text NOT NULL,
  `address` text NOT NULL,
  `family_member_name` text NOT NULL,
  `medical_conditions` text NOT NULL,
  `allergies` text NOT NULL,
  `appointments` text DEFAULT NULL,
  `family_member_email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resident_table`
--

INSERT INTO `resident_table` (`resident_id`, `full_name`, `email`, `password`, `gender`, `date_of_birth`, `contact_number`, `family_contact`, `medication`, `accessibility_requirements`, `address`, `family_member_name`, `medical_conditions`, `allergies`, `appointments`, `family_member_email`) VALUES
('R001', 'Alice Johnson', 'alicej@gmail.com', 'Alice@123', 'Female', '1945-06-12', 411122233, 'Mary Johnson', 'Aspirin, Metformin', 'Wheelchair access', '12 Rosewood Ave, Melbourne', 'Mary Johnson', 'Diabetes, Arthritis', 'Penicillin', '2025-05-20 at 21:29 for Medical Check-up\n2025-05-22 at 13:06 for Residential Care\n2025-05-28 at 13:17 for Medical Check-up\n2025-05-26 at 14:10 for In-home Care', 'mary.johnson@gmail.com'),
('R006', 'emma', 'emma@gmail.com', '5555', 'female', '2025-05-01', 2147483647, '3456543234', 'none', 'none', 'street', 'olivia', 'none', 'none', NULL, 'olivia@gmail.com'),
('R002', 'George Carter', 'georgec@gmail.com', 'George@123', 'Male', '1938-09-25', 411223344, 'Tom Carter', 'Lisinopril', 'Hearing aid required', '88 Lakeview Rd, Geelong', 'Tom Carter', 'Hypertension', 'None', '2025-05-23 at 12:54 for Residential Care', 'tom.carter@gmail.com'),
('R004', 'John Doe', 'johndoe@gmail.com', 'John.123', 'Male', '1945-03-12', 412345678, 'Jane Doe', 'Requires assistance with dressing, eating, hygiene, and mobility', 'Wheelchair access, shower seat', '123 Homecare Lane, Melbourne VIC', 'Jane Doe', 'Hypertension, Type 2 Diabetes', 'Penicillin', '2025-05-19 at 15:14 for In-home Care', 'jane.doe@gmail.com'),
('R008', 'leo', 'leo@gmail.com', 'gggg', 'male', '2025-05-03', 2147483647, '2787654356', 'none', 'none', 'street', 'jack', 'none', 'none', NULL, 'jack@gmail.com'),
('R003', 'Mina Patel', 'minap@gmail.com', 'Mina@123', 'Female', '1950-03-08', 411334455, 'Anil Patel', 'Atorvastatin, Paracetamol', 'Ground floor room', '21 Garden St, Dandenong', 'Anil Patel', 'High cholesterol', 'Gluten', '0', 'anil.patel@gmail.com'),
('R007', 'sofia', 'sofia@gmail.com', 'cccc', 'female', '2025-05-02', 2147483647, '2345434567', 'none', 'none', 'street', 'elani', 'none', 'none', NULL, 'elani@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `services table`
--

CREATE TABLE `services table` (
  `service_id` int(11) NOT NULL,
  `service_name` int(11) NOT NULL,
  `description` int(11) NOT NULL,
  `duration_minutes` int(11) NOT NULL,
  `time_slot` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `assigned_staff_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_table`
--

CREATE TABLE `staff_table` (
  `staff_id` varchar(11) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `phone` int(11) NOT NULL,
  `qualification` text NOT NULL,
  `employment_type` text NOT NULL,
  `salary` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `responsibilities` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff_table`
--

INSERT INTO `staff_table` (`staff_id`, `email`, `password`, `phone`, `qualification`, `employment_type`, `salary`, `start_date`, `full_name`, `role`, `responsibilities`) VALUES
('S001', 'emily@gmail.com', 'Emily.001', 458762154, 'Bachelor of Nursing', 'Full-time', 60000, '2023-01-10', 'Emily James', 'Senior Caregiver', 'Patient care, daily monitoring, and medication administration'),
('S002', 'mark@gmail.com', 'Mark@123', 412345678, 'Diploma in Health Administration', 'Full-time', 72000, '2023-09-01', 'Mark Allen', 'Facility Manager', 'Oversee daily operations, ensure compliance, manage staff and budgets'),
('S003', 'sarah@gmail.com', 'Sarah@123', 411223344, 'MBBS, FRACGP', 'Part-time', 95000, '2024-03-15', 'Dr. Sarah Lee', 'General Practitioner', 'Conduct routine checkups, diagnose illnesses, prescribe treatments'),
('S004', 'david@gmail.com', 'David@123', 411556677, 'Certificate IV in Nursing', 'Casual', 48000, '2023-11-05', 'David Smith', 'Home Nurse', 'Provide in-home patient care, administer medications, monitor health conditions'),
('S005', 'linda@gmail.com', 'Linda@123', 411889900, 'Bachelor of Social Work', 'Full-time', 61000, '2024-01-20', 'Linda Brown', 'Support Coordinator', 'Assist residents in accessing services, coordinate care plans, liaise with families'),
('S006', 'kevin@gmail.com', 'Kevin@123', 411778899, 'MD, Specialist Certification', 'Contract', 110000, '2024-02-10', 'Dr. Kevin Wu', 'Specialist Consultant', 'Provide expert consultations, evaluate complex medical cases, recommend treatment plans');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Username` text NOT NULL,
  `Role` enum('Admin','Resident','Family Member') NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `Email`, `Username`, `Role`, `Password`) VALUES
(1, 'Calmmind@gmail.com', '2025-05-01', 'Admin', '$2y$10$nXbwxhD3VX61UcJc4rY7F.eUzORWkgJbvZhQExGy0Mr1br8krneaa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment_table`
--
ALTER TABLE `appointment_table`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `fk_resident_email` (`resident_email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `resident_table`
--
ALTER TABLE `resident_table`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment_table`
--
ALTER TABLE `appointment_table`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment_table`
--
ALTER TABLE `appointment_table`
  ADD CONSTRAINT `fk_resident_email` FOREIGN KEY (`resident_email`) REFERENCES `resident_table` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
