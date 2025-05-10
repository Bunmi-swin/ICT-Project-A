-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2025 at 02:18 PM
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
-- Table structure for table `appointments table`
--

CREATE TABLE `appointments table` (
  `appointment_id` int(11) NOT NULL,
  `resident_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `appointment_date` int(11) NOT NULL,
  `time_slot` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `assigned_staff_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments table`
--

INSERT INTO `appointments table` (`appointment_id`, `resident_id`, `service_id`, `appointment_date`, `time_slot`, `status`, `assigned_staff_id`) VALUES
(0, 1, 2, 2025, 21, 0, NULL);

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
(0, 1, 1, 'sdsds@gmail.com', 'acsd', 'afcavr');

-- --------------------------------------------------------

--
-- Table structure for table `family_member table`
--

CREATE TABLE `family_member table` (
  `id` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `family_member table`
--

INSERT INTO `family_member table` (`id`, `name`, `email`, `password`) VALUES
('F001', 'Mary Johnson', 'mary.johnson@gmail.com', 'Mary#123'),
('F002', 'Tom Carter', 'tom.carter@gmail.com', 'Tom#123'),
('F003', 'Anil Patel', 'anil.patel@gmail.com', 'Anil#123'),
('F004', 'Jane Doe', 'jane.doe@gmail.com', 'Jane#123');

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
(0, 0, 0, '0', '0000-00-00 00:00:00.000000'),
(0, 0, 0, 'cdsDfv', '0000-00-00 00:00:00.000000'),
(0, 0, 0, 'ASDaS', '0000-00-00 00:00:00.000000'),
(0, 0, 0, 'sdsds', '0000-00-00 00:00:00.000000'),
(0, 0, 0, 'fgf', '2025-05-10 08:58:30.000000');

-- --------------------------------------------------------

--
-- Table structure for table `resident table`
--

CREATE TABLE `resident table` (
  `resident_id` text NOT NULL,
  `full_name` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `gender` text NOT NULL,
  `date_of_birth` date NOT NULL,
  `contact_number` int(11) NOT NULL,
  `family_contact` text NOT NULL,
  `medication` text NOT NULL,
  `accessibility_requirements` text NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `family_member_name` varchar(100) DEFAULT NULL,
  `medical_conditions` text DEFAULT NULL,
  `allergies` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resident table`
--

INSERT INTO `resident table` (`resident_id`, `full_name`, `email`, `password`, `gender`, `date_of_birth`, `contact_number`, `family_contact`, `medication`, `accessibility_requirements`, `address`, `family_member_name`, `medical_conditions`, `allergies`) VALUES
('R001', 'Alice Johnson', 'alicej@gmail.com', 'Alice@123', 'Female', '1945-06-12', 411122233, 'Mary Johnson', 'Aspirin, Metformin', 'Wheelchair access', '12 Rosewood Ave, Melbourne', 'Mary Johnson', 'Diabetes, Arthritis', 'Penicillin'),
('R002', 'George Carter', 'georgec@gmail.com', 'George@123', 'Male', '1938-09-25', 411223344, 'Tom Carter', 'Lisinopril', 'Hearing aid required', '88 Lakeview Rd, Geelong', 'Tom Carter', 'Hypertension', 'None'),
('R003', 'Mina Patel', 'minap@gmail.com', 'Mina@123', 'Female', '1950-03-08', 411334455, 'Anil Patel', 'Atorvastatin, Paracetamol', 'Ground floor room', '21 Garden St, Dandenong', 'Anil Patel', 'High cholesterol', 'Gluten'),
('R004', 'John Doe', 'johndoe@gmail.com', 'John.123', 'Male', '1945-03-12', 412345678, '0412000111', 'Requires assistance with dressing, eating, hygiene, and mobility', 'Wheelchair access, shower seat', '123 Homecare Lane, Melbourne VIC', 'Jane Doe', 'Hypertension, Type 2 Diabetes', 'Penicillin');

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
-- Table structure for table `staff table`
--

CREATE TABLE `staff table` (
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
-- Dumping data for table `staff table`
--

INSERT INTO `staff table` (`staff_id`, `email`, `password`, `phone`, `qualification`, `employment_type`, `salary`, `start_date`, `full_name`, `role`, `responsibilities`) VALUES
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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
