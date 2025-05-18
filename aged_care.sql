-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2025 at 01:59 PM
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
(8, '', 'alicej@gmail.com', 'Residential Care', '2025-05-19', '20:25:00', 'care', NULL),
(9, '', 'alicej@gmail.com', 'Medical Check-up', '2025-05-21', '22:29:00', 'medical', NULL),
(10, '', 'alicej@gmail.com', 'Medical Check-up', '2025-05-21', '22:29:00', 'medical', NULL),
(11, '', 'alicej@gmail.com', 'Medical Check-up', '2025-05-21', '22:29:00', 'medical', NULL),
(12, '', 'alicej@gmail.com', 'Medical Check-up', '2025-05-21', '22:29:00', 'medical', NULL),
(13, '', 'alicej@gmail.com', 'Medical Check-up', '2025-05-21', '22:29:00', 'medical', NULL),
(14, '', 'alicej@gmail.com', 'Medical Check-up', '2025-05-21', '22:29:00', 'medical', NULL),
(15, '', 'alicej@gmail.com', 'Residential Care', '2025-05-30', '19:23:00', 'care', NULL),
(16, '', 'alicej@gmail.com', 'In-home Care', '2025-05-28', '19:24:00', 'care', NULL),
(17, '', 'alicej@gmail.com', 'Medical Check-up', '2025-05-20', '21:29:00', 'medical', NULL);

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
('F001', 'Mary Johnson', 'mary.johnson@gmail.com', '$2y$10$bjuLwWwGiYd0wP3vSo6WVuNGuGhziHEp2qCXRPFx6guo3kHkDQhKK'),
('F002', 'Tom Carter', 'tom.carter@gmail.com', '$2y$10$eEVj4CXN0oBexQiDEQX3w.xL4BMnFfgB4LBurVjO0MYD4CPQtYk5y'),
('F003', 'Anil Patel', 'anil.patel@gmail.com', '$2y$10$2BnuvY3p4xw1TIvLkmUGl.0sop4TKX7W4DmqLE..Bkqo.boxrLFqe'),
('F004', 'Jane Doe', 'jane.doe@gmail.com', '$2y$10$9wJDke7sR874cQjRzBLqB.w6/9yJ1HZpyimJ4TsLN1rr3OQYB7snS');

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `stock_quantity`, `description`) VALUES
(1, 'Face Mask', 102, 'Disposable 3-layer medical face masks'),
(2, 'Hand Sanitizer ', 50, '70% alcohol-based sanitizer, 500ml'),
(3, 'Gloves', 203, 'Latex-free exam gloves, box of 100'),
(4, 'Disposable Cups', 300, ''),
(5, 'Paper Towels', 150, ''),
(6, 'Antiseptic Wipes', 120, '');

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
('R004', 'Ben', 'Ben@gmail.com', '$2y$10$irjFYHVsBzZwSeZrtcuX3e/tEwX/KKo0cb7p0SuoCXoTT3GcCPuh.', 'male', '2001-11-11', 422566566, 'Jane@yahoo.comm', 'nightly', 'n/a', '!0 ySTONE', 'jANE', 'insomnia', 'n/a'),
('R005', 'Chris', '104061195@student.swin.edu.au', '$2y$10$KEKVL.4NF3vxaTO3j/U4POpNckmSmoVO71HnBqcGybMmJaq69wfpC', 'female', '2025-05-13', 80709605, '090090909', 'none', 'noine', '104 Spencer', 'Emily', 'none', 'none');

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
