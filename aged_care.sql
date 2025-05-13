-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2025 at 06:49 AM
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
  `assigned_staff_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 1, 1, '0', '0', '0'),
(2, 1, 1, 'Umbrella@gmail.com', 'Penelope', 'Hi staff.');

-- --------------------------------------------------------

--
-- Table structure for table `messages table`
--

CREATE TABLE `messages table` (
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `message_content` text NOT NULL,
  `timestamp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages table`
--

INSERT INTO `messages table` (`message_id`, `sender_id`, `recipient_id`, `message_content`, `timestamp`) VALUES
(0, 0, 0, '0', '0000-00-00'),
(0, 0, 0, '0', '0000-00-00'),
(0, 0, 0, 'Hello world!', '2025-05-10');

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
('R001', 'Alice Johnson', 'alicej@gmail.com', '$2y$10$XKqMTbK2TMe1AyTD0r7Ryum9cHdyuBkR0tMhSZ1uDqPKVrQLDLTpG', 'Female', '1945-06-12', 411122233, 'Mary Johnson', 'Aspirin, Metformin', 'Wheelchair access', '12 Rosewood Ave, Melbourne', 'Mary Johnson', 'Diabetes, Arthritis', 'Penicillin'),
('R002', 'George Carter', 'georgec@gmail.com', '$2y$10$lfoQpyxH9SNegfFPRHNFTOGCmeVCckJXrsJRoDXzGrD3QVxrR9RKq', 'Male', '1938-09-25', 411223344, 'Tom Carter', 'Lisinopril', 'Hearing aid required', '88 Lakeview Rd, Geelong', 'Tom Carter', 'Hypertension', 'None'),
('R003', 'Mina Patel', 'minap@gmail.com', '$2y$10$hVFeEYmJwkX42oV4k5RxMOzLQoKiM40tdTMOCtKJQnXc/GSr3BylS', 'Female', '1950-03-08', 411334455, 'Anil Patel', 'Atorvastatin, Paracetamol', 'Ground floor room', '21 Garden St, Dandenong', 'Anil Patel', 'High cholesterol', 'Gluten'),
('R004', 'John Doe', 'johndoe@gmail.com', '$2y$10$Xd7GvG0Wn887W08HbFiK/e8cHpT3vHkiRPwSbuLkvcy/bDGN4PH3C', 'Male', '1945-03-12', 412345678, '0412000111', 'Requires assistance with dressing, eating, hygiene, and mobility', 'Wheelchair access, shower seat', '123 Homecare Lane, Melbourne VIC', 'Jane Doe', 'Hypertension, Type 2 Diabetes', 'Penicillin'),
('R005', 'Jonn Doe', 'Deer@gmail.com', 'Beagle', 'male', '2001-11-11', 621566566, 'Tiger@yahoo.com', 'Nighly', 'n/a', '10 Ystone', 'Jenn Doe', 'insomnia', 'n/a');

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
('S001', 'emily@gmail.com', '$2y$10$NPodS7W.T3j8z2/uYJZ.nehIqXs0d5WV39AtrE9hcvkOjo9y3rfS6', 458762154, 'Bachelor of Nursing', 'Full-time', 60000, '2023-01-10', 'Emily James', 'Senior Caregiver', 'Patient care, daily monitoring, and medication administration'),
('S002', 'mark@gmail.com', '$2y$10$WldrCtXFsmWR/fyvEo2uD.TL4bg8tCN/JHAadciPuxQJ0vnUpDuSy', 412345678, 'Diploma in Health Administration', 'Full-time', 72000, '2023-09-01', 'Mark Allen', 'Facility Manager', 'Oversee daily operations, ensure compliance, manage staff and budgets'),
('S003', 'sarah@gmail.com', '$2y$10$D8FWLFskQUrESI6PShvOQubeW7wSNLnA2w0s5tlddeHWV8Yqswc8.', 411223344, 'MBBS, FRACGP', 'Part-time', 95000, '2024-03-15', 'Dr. Sarah Lee', 'General Practitioner', 'Conduct routine checkups, diagnose illnesses, prescribe treatments'),
('S004', 'david@gmail.com', '$2y$10$UvL7/8ke1qNQ05DwmFvopeRuUHrq4cxhtkNsiS7rqREyaXib4A/ES', 411556677, 'Certificate IV in Nursing', 'Casual', 48000, '2023-11-05', 'David Smith', 'Home Nurse', 'Provide in-home patient care, administer medications, monitor health conditions'),
('S005', 'linda@gmail.com', '$2y$10$Ea1EH7Hcahuy.aBVzay5nOVDe9TLX9nGEgvNSIK65mSTwqp6VG.re', 411889900, 'Bachelor of Social Work', 'Full-time', 61000, '2024-01-20', 'Linda Brown', 'Support Coordinator', 'Assist residents in accessing services, coordinate care plans, liaise with families'),
('S006', 'kevin@gmail.com', '$2y$10$6vkQ/bAO4E2aq7FHzpXxwOrRfWVQOSFYzCuZJkZc2MC45UDDHOkBO', 411778899, 'MD, Specialist Certification', 'Contract', 110000, '2024-02-10', 'Dr. Kevin Wu', 'Specialist Consultant', 'Provide expert consultations, evaluate complex medical cases, recommend treatment plans');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Username` text NOT NULL,
  `Role` enum('Admin','Resident','Family Member') NOT NULL,
  `Password` varchar(255) NOT NULL,
  `lockout_time` int(11) NOT NULL,
  `failed_attempts` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `Email`, `Username`, `Role`, `Password`, `lockout_time`, `failed_attempts`) VALUES
(1, 'Calmmind@gmail.com', '2025-05-01', 'Admin', '$2y$10$nXbwxhD3VX61UcJc4rY7F.eUzORWkgJbvZhQExGy0Mr1br8krneaa', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact us table`
--
ALTER TABLE `contact us table`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact us table`
--
ALTER TABLE `contact us table`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
