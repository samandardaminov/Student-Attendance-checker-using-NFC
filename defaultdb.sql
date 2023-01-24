-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 23, 2022 at 09:01 AM
-- Server version: 8.0.24
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `defaultdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` varchar(255) NOT NULL,
  `guid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `department_id` varchar(255) DEFAULT NULL,
  `credit` int DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `year` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `guid`, `name`, `code`, `department_id`, `credit`, `semester`, `year`) VALUES
('1', NULL, 'Operating System', 'SOC3010', '1', 3, 'Fall', 2022),
('2', NULL, 'Electronic Circuit', 'ICE2080', '1', 3, 'Fall', 2022),
('3', NULL, 'Engineering Communications', 'ICE2080', '1', 3, 'Fall', 2022),
('4', NULL, 'Database', 'SOC3020', '1', 3, 'Fall', 2022),
('5', NULL, 'Computer Algorithm', 'SOC3030', '1', 3, 'Fall', 2022);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` varchar(255) NOT NULL,
  `guid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `university_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `guid`, `name`, `university_id`) VALUES
('1', NULL, 'SOCIE', '1');

-- --------------------------------------------------------

--
-- Table structure for table `lecture_attendance`
--

CREATE TABLE `lecture_attendance` (
  `id` int NOT NULL,
  `guid` varchar(255) DEFAULT NULL,
  `take_id` varchar(255) DEFAULT NULL,
  `time_slot_id` varchar(255) DEFAULT NULL,
  `attendance` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `lecture_attendance`
--

INSERT INTO `lecture_attendance` (`id`, `guid`, `take_id`, `time_slot_id`, `attendance`, `active`) VALUES
(1, NULL, '179', '21', 1, 0),
(2, NULL, '179', '25', 0, 0),
(3, NULL, '179', '29', 0, 0),
(4, NULL, '179', '33', 0, 0),
(5, NULL, '179', '37', 0, 0),
(8, NULL, '180', '22', 1, 0),
(9, NULL, '180', '26', 1, 0),
(10, NULL, '180', '30', 0, 0),
(11, NULL, '180', '34', 1, 0),
(12, NULL, '180', '38', 0, 0),
(15, NULL, '181', '23', 0, 0),
(16, NULL, '181', '27', 0, 0),
(17, NULL, '181', '31', 0, 0),
(18, NULL, '181', '35', 0, 0),
(19, NULL, '181', '39', 0, 0),
(22, NULL, '182', '24', 0, 0),
(23, NULL, '182', '28', 0, 0),
(24, NULL, '182', '32', 0, 0),
(25, NULL, '182', '36', 0, 0),
(26, NULL, '182', '40', 0, 0),
(29, NULL, '183', '41', 1, 0),
(30, NULL, '183', '42', 0, 0),
(31, NULL, '183', '43', 0, 0),
(32, NULL, '183', '44', 1, 0),
(33, NULL, '183', '45', 0, 0),
(34, NULL, '183', '46', 0, 0),
(36, NULL, '184', '47', 0, 0),
(37, NULL, '184', '51', 0, 0),
(38, NULL, '184', '55', 0, 0),
(39, NULL, '184', '59', 0, 0),
(40, NULL, '184', '63', 0, 0),
(41, NULL, '184', '67', 0, 0),
(43, NULL, '185', '48', 0, 0),
(44, NULL, '185', '52', 0, 0),
(45, NULL, '185', '56', 0, 0),
(46, NULL, '185', '60', 0, 0),
(47, NULL, '185', '64', 0, 0),
(48, NULL, '185', '68', 0, 0),
(50, NULL, '186', '49', 0, 0),
(51, NULL, '186', '53', 0, 0),
(52, NULL, '186', '57', 0, 0),
(53, NULL, '186', '61', 0, 0),
(54, NULL, '186', '65', 0, 0),
(55, NULL, '186', '69', 0, 0),
(57, NULL, '187', '50', 0, 0),
(58, NULL, '187', '54', 0, 0),
(59, NULL, '187', '58', 0, 0),
(60, NULL, '187', '62', 0, 0),
(61, NULL, '187', '66', 0, 0),
(62, NULL, '187', '70', 0, 0),
(64, NULL, '188', '1', 1, 0),
(65, NULL, '188', '5', 0, 0),
(66, NULL, '188', '9', 0, 0),
(67, NULL, '188', '13', 0, 0),
(68, NULL, '188', '17', 0, 0),
(71, NULL, '189', '2', 1, 0),
(72, NULL, '189', '6', 0, 0),
(73, NULL, '189', '10', 0, 0),
(74, NULL, '189', '14', 0, 0),
(75, NULL, '189', '18', 0, 0),
(78, NULL, '190', '3', 1, 0),
(79, NULL, '190', '7', 1, 0),
(80, NULL, '190', '11', 0, 0),
(81, NULL, '190', '15', 1, 0),
(82, NULL, '190', '19', 0, 0),
(85, NULL, '191', '4', 0, 0),
(86, NULL, '191', '8', 1, 0),
(87, NULL, '191', '12', 0, 0),
(88, NULL, '191', '16', 0, 0),
(89, NULL, '191', '20', 0, 0),
(92, NULL, '192', '71', 0, 0),
(93, NULL, '192', '75', 0, 0),
(94, NULL, '192', '79', 0, 0),
(95, NULL, '192', '83', 0, 0),
(96, NULL, '192', '87', 0, 0),
(99, NULL, '193', '72', 0, 0),
(100, NULL, '193', '76', 0, 0),
(101, NULL, '193', '80', 0, 0),
(102, NULL, '193', '84', 0, 0),
(103, NULL, '193', '88', 0, 0),
(106, NULL, '194', '73', 0, 0),
(107, NULL, '194', '77', 0, 0),
(108, NULL, '194', '81', 0, 0),
(109, NULL, '194', '85', 0, 0),
(110, NULL, '194', '89', 0, 0),
(113, NULL, '195', '74', 0, 0),
(114, NULL, '195', '78', 0, 0),
(115, NULL, '195', '82', 0, 0),
(116, NULL, '195', '86', 1, 0),
(117, NULL, '195', '90', 0, 0),
(120, NULL, '196', '21', 0, 0),
(121, NULL, '196', '25', 0, 0),
(122, NULL, '196', '29', 0, 0),
(123, NULL, '196', '33', 1, 0),
(124, NULL, '196', '37', 0, 0),
(127, NULL, '197', '22', 0, 0),
(128, NULL, '197', '26', 0, 0),
(129, NULL, '197', '30', 0, 0),
(130, NULL, '197', '34', 1, 0),
(131, NULL, '197', '38', 0, 0),
(134, NULL, '198', '23', 0, 0),
(135, NULL, '198', '27', 0, 0),
(136, NULL, '198', '31', 0, 0),
(137, NULL, '198', '35', 0, 0),
(138, NULL, '198', '39', 0, 0),
(141, NULL, '199', '24', 0, 0),
(142, NULL, '199', '28', 0, 0),
(143, NULL, '199', '32', 0, 0),
(144, NULL, '199', '36', 0, 0),
(145, NULL, '199', '40', 0, 0),
(148, NULL, '200', '47', 0, 0),
(149, NULL, '200', '51', 0, 0),
(150, NULL, '200', '55', 0, 0),
(151, NULL, '200', '59', 0, 0),
(152, NULL, '200', '63', 0, 0),
(153, NULL, '200', '67', 0, 0),
(155, NULL, '201', '48', 0, 0),
(156, NULL, '201', '52', 0, 0),
(157, NULL, '201', '56', 0, 0),
(158, NULL, '201', '60', 0, 0),
(159, NULL, '201', '64', 0, 0),
(160, NULL, '201', '68', 0, 0),
(162, NULL, '202', '49', 0, 0),
(163, NULL, '202', '53', 0, 0),
(164, NULL, '202', '57', 0, 0),
(165, NULL, '202', '61', 0, 0),
(166, NULL, '202', '65', 0, 0),
(167, NULL, '202', '69', 0, 0),
(169, NULL, '203', '50', 0, 0),
(170, NULL, '203', '54', 0, 0),
(171, NULL, '203', '58', 0, 0),
(172, NULL, '203', '62', 0, 0),
(173, NULL, '203', '66', 0, 0),
(174, NULL, '203', '70', 0, 0),
(176, NULL, '204', '1', 0, 0),
(177, NULL, '204', '5', 0, 0),
(178, NULL, '204', '9', 0, 0),
(179, NULL, '204', '13', 0, 0),
(180, NULL, '204', '17', 0, 0),
(183, NULL, '205', '2', 0, 0),
(184, NULL, '205', '6', 0, 0),
(185, NULL, '205', '10', 0, 0),
(186, NULL, '205', '14', 0, 0),
(187, NULL, '205', '18', 0, 0),
(190, NULL, '206', '3', 1, 0),
(191, NULL, '206', '7', 0, 0),
(192, NULL, '206', '11', 0, 0),
(193, NULL, '206', '15', 1, 0),
(194, NULL, '206', '19', 0, 0),
(197, NULL, '207', '4', 0, 0),
(198, NULL, '207', '8', 0, 0),
(199, NULL, '207', '12', 0, 0),
(200, NULL, '207', '16', 0, 0),
(201, NULL, '207', '20', 0, 0),
(204, NULL, '208', '71', 0, 0),
(205, NULL, '208', '75', 0, 0),
(206, NULL, '208', '79', 0, 0),
(207, NULL, '208', '83', 0, 0),
(208, NULL, '208', '87', 0, 0),
(211, NULL, '209', '72', 0, 0),
(212, NULL, '209', '76', 0, 0),
(213, NULL, '209', '80', 0, 0),
(214, NULL, '209', '84', 0, 0),
(215, NULL, '209', '88', 0, 0),
(218, NULL, '210', '73', 0, 0),
(219, NULL, '210', '77', 0, 0),
(220, NULL, '210', '81', 0, 0),
(221, NULL, '210', '85', 0, 0),
(222, NULL, '210', '89', 0, 0),
(225, NULL, '211', '74', 0, 0),
(226, NULL, '211', '78', 0, 0),
(227, NULL, '211', '82', 0, 0),
(228, NULL, '211', '86', 1, 0),
(229, NULL, '211', '90', 0, 0),
(232, NULL, '212', '21', 1, 0),
(233, NULL, '212', '25', 0, 0),
(234, NULL, '212', '29', 0, 0),
(235, NULL, '212', '33', 0, 0),
(236, NULL, '212', '37', 0, 0),
(239, NULL, '213', '22', 1, 0),
(240, NULL, '213', '26', 0, 0),
(241, NULL, '213', '30', 0, 0),
(242, NULL, '213', '34', 1, 0),
(243, NULL, '213', '38', 0, 0),
(246, NULL, '214', '23', 0, 0),
(247, NULL, '214', '27', 0, 0),
(248, NULL, '214', '31', 0, 0),
(249, NULL, '214', '35', 0, 0),
(250, NULL, '214', '39', 0, 0),
(253, NULL, '215', '24', 0, 0),
(254, NULL, '215', '28', 0, 0),
(255, NULL, '215', '32', 0, 0),
(256, NULL, '215', '36', 0, 0),
(257, NULL, '215', '40', 0, 0),
(260, NULL, '216', '47', 0, 0),
(261, NULL, '216', '51', 0, 0),
(262, NULL, '216', '55', 0, 0),
(263, NULL, '216', '59', 0, 0),
(264, NULL, '216', '63', 0, 0),
(265, NULL, '216', '67', 0, 0),
(267, NULL, '217', '48', 0, 0),
(268, NULL, '217', '52', 0, 0),
(269, NULL, '217', '56', 0, 0),
(270, NULL, '217', '60', 0, 0),
(271, NULL, '217', '64', 0, 0),
(272, NULL, '217', '68', 0, 0),
(274, NULL, '218', '49', 0, 0),
(275, NULL, '218', '53', 0, 0),
(276, NULL, '218', '57', 0, 0),
(277, NULL, '218', '61', 0, 0),
(278, NULL, '218', '65', 0, 0),
(279, NULL, '218', '69', 0, 0),
(281, NULL, '219', '50', 0, 0),
(282, NULL, '219', '54', 0, 0),
(283, NULL, '219', '58', 0, 0),
(284, NULL, '219', '62', 0, 0),
(285, NULL, '219', '66', 0, 0),
(286, NULL, '219', '70', 0, 0),
(288, NULL, '220', '1', 1, 0),
(289, NULL, '220', '5', 0, 0),
(290, NULL, '220', '9', 0, 0),
(291, NULL, '220', '13', 0, 0),
(292, NULL, '220', '17', 0, 0),
(295, NULL, '221', '2', 1, 0),
(296, NULL, '221', '6', 0, 0),
(297, NULL, '221', '10', 0, 0),
(298, NULL, '221', '14', 0, 0),
(299, NULL, '221', '18', 0, 0),
(302, NULL, '222', '3', 0, 0),
(303, NULL, '222', '7', 1, 0),
(304, NULL, '222', '11', 0, 0),
(305, NULL, '222', '15', 1, 0),
(306, NULL, '222', '19', 0, 0),
(309, NULL, '223', '4', 0, 0),
(310, NULL, '223', '8', 1, 0),
(311, NULL, '223', '12', 0, 0),
(312, NULL, '223', '16', 1, 0),
(313, NULL, '223', '20', 0, 0),
(316, NULL, '224', '71', 0, 0),
(317, NULL, '224', '75', 0, 0),
(318, NULL, '224', '79', 0, 0),
(319, NULL, '224', '83', 0, 0),
(320, NULL, '224', '87', 0, 0),
(323, NULL, '225', '72', 0, 0),
(324, NULL, '225', '76', 0, 0),
(325, NULL, '225', '80', 0, 0),
(326, NULL, '225', '84', 0, 0),
(327, NULL, '225', '88', 0, 0),
(330, NULL, '226', '73', 0, 0),
(331, NULL, '226', '77', 0, 0),
(332, NULL, '226', '81', 0, 0),
(333, NULL, '226', '85', 0, 0),
(334, NULL, '226', '89', 0, 0),
(337, NULL, '227', '74', 0, 0),
(338, NULL, '227', '78', 0, 0),
(339, NULL, '227', '82', 0, 0),
(340, NULL, '227', '86', 1, 0),
(341, NULL, '227', '90', 0, 0),
(344, NULL, '228', '21', 1, 0),
(345, NULL, '228', '25', 0, 0),
(346, NULL, '228', '29', 0, 0),
(347, NULL, '228', '33', 0, 0),
(348, NULL, '228', '37', 0, 0),
(351, NULL, '229', '22', 1, 0),
(352, NULL, '229', '26', 1, 0),
(353, NULL, '229', '30', 0, 0),
(354, NULL, '229', '34', 1, 0),
(355, NULL, '229', '38', 0, 0),
(358, NULL, '230', '23', 0, 0),
(359, NULL, '230', '27', 0, 0),
(360, NULL, '230', '31', 0, 0),
(361, NULL, '230', '35', 0, 0),
(362, NULL, '230', '39', 0, 0),
(365, NULL, '231', '24', 0, 0),
(366, NULL, '231', '28', 0, 0),
(367, NULL, '231', '32', 0, 0),
(368, NULL, '231', '36', 0, 0),
(369, NULL, '231', '40', 0, 0),
(372, NULL, '232', '47', 0, 0),
(373, NULL, '232', '51', 0, 0),
(374, NULL, '232', '55', 0, 0),
(375, NULL, '232', '59', 0, 0),
(376, NULL, '232', '63', 0, 0),
(377, NULL, '232', '67', 0, 0),
(379, NULL, '233', '48', 0, 0),
(380, NULL, '233', '52', 0, 0),
(381, NULL, '233', '56', 0, 0),
(382, NULL, '233', '60', 0, 0),
(383, NULL, '233', '64', 0, 0),
(384, NULL, '233', '68', 0, 0),
(386, NULL, '234', '49', 0, 0),
(387, NULL, '234', '53', 0, 0),
(388, NULL, '234', '57', 0, 0),
(389, NULL, '234', '61', 0, 0),
(390, NULL, '234', '65', 0, 0),
(391, NULL, '234', '69', 0, 0),
(393, NULL, '235', '50', 0, 0),
(394, NULL, '235', '54', 0, 0),
(395, NULL, '235', '58', 0, 0),
(396, NULL, '235', '62', 0, 0),
(397, NULL, '235', '66', 0, 0),
(398, NULL, '235', '70', 0, 0),
(400, NULL, '236', '1', 1, 0),
(401, NULL, '236', '5', 0, 0),
(402, NULL, '236', '9', 0, 0),
(403, NULL, '236', '13', 0, 0),
(404, NULL, '236', '17', 0, 0),
(407, NULL, '237', '2', 1, 0),
(408, NULL, '237', '6', 0, 0),
(409, NULL, '237', '10', 0, 0),
(410, NULL, '237', '14', 0, 0),
(411, NULL, '237', '18', 0, 0),
(414, NULL, '238', '3', 1, 0),
(415, NULL, '238', '7', 1, 0),
(416, NULL, '238', '11', 0, 0),
(417, NULL, '238', '15', 1, 0),
(418, NULL, '238', '19', 0, 0),
(421, NULL, '239', '4', 0, 0),
(422, NULL, '239', '8', 1, 0),
(423, NULL, '239', '12', 0, 0),
(424, NULL, '239', '16', 0, 0),
(425, NULL, '239', '20', 0, 0),
(428, NULL, '240', '71', 0, 0),
(429, NULL, '240', '75', 0, 0),
(430, NULL, '240', '79', 0, 0),
(431, NULL, '240', '83', 0, 0),
(432, NULL, '240', '87', 0, 0),
(435, NULL, '241', '72', 0, 0),
(436, NULL, '241', '76', 0, 0),
(437, NULL, '241', '80', 0, 0),
(438, NULL, '241', '84', 0, 0),
(439, NULL, '241', '88', 0, 0),
(442, NULL, '242', '73', 0, 0),
(443, NULL, '242', '77', 0, 0),
(444, NULL, '242', '81', 0, 0),
(445, NULL, '242', '85', 0, 0),
(446, NULL, '242', '89', 0, 0),
(449, NULL, '243', '74', 0, 0),
(450, NULL, '243', '78', 0, 0),
(451, NULL, '243', '82', 0, 0),
(452, NULL, '243', '86', 0, 0),
(453, NULL, '243', '90', 0, 0),
(456, NULL, '244', '21', 1, 0),
(457, NULL, '244', '25', 0, 0),
(458, NULL, '244', '29', 0, 0),
(459, NULL, '244', '33', 0, 0),
(460, NULL, '244', '37', 0, 0),
(463, NULL, '245', '22', 1, 0),
(464, NULL, '245', '26', 1, 0),
(465, NULL, '245', '30', 0, 0),
(466, NULL, '245', '34', 0, 0),
(467, NULL, '245', '38', 0, 0),
(470, NULL, '246', '23', 0, 0),
(471, NULL, '246', '27', 0, 0),
(472, NULL, '246', '31', 0, 0),
(473, NULL, '246', '35', 0, 0),
(474, NULL, '246', '39', 0, 0),
(477, NULL, '247', '24', 0, 0),
(478, NULL, '247', '28', 0, 0),
(479, NULL, '247', '32', 0, 0),
(480, NULL, '247', '36', 0, 0),
(481, NULL, '247', '40', 0, 0),
(484, NULL, '248', '47', 0, 0),
(485, NULL, '248', '51', 0, 0),
(486, NULL, '248', '55', 0, 0),
(487, NULL, '248', '59', 0, 0),
(488, NULL, '248', '63', 0, 0),
(489, NULL, '248', '67', 0, 0),
(491, NULL, '249', '48', 0, 0),
(492, NULL, '249', '52', 0, 0),
(493, NULL, '249', '56', 0, 0),
(494, NULL, '249', '60', 0, 0),
(495, NULL, '249', '64', 0, 0),
(496, NULL, '249', '68', 0, 0),
(498, NULL, '250', '49', 0, 0),
(499, NULL, '250', '53', 0, 0),
(500, NULL, '250', '57', 0, 0),
(501, NULL, '250', '61', 0, 0),
(502, NULL, '250', '65', 0, 0),
(503, NULL, '250', '69', 0, 0),
(505, NULL, '251', '50', 0, 0),
(506, NULL, '251', '54', 0, 0),
(507, NULL, '251', '58', 0, 0),
(508, NULL, '251', '62', 0, 0),
(509, NULL, '251', '66', 0, 0),
(510, NULL, '251', '70', 0, 0),
(512, NULL, '252', '1', 0, 0),
(513, NULL, '252', '5', 0, 0),
(514, NULL, '252', '9', 0, 0),
(515, NULL, '252', '13', 0, 0),
(516, NULL, '252', '17', 0, 0),
(519, NULL, '253', '2', 1, 0),
(520, NULL, '253', '6', 0, 0),
(521, NULL, '253', '10', 0, 0),
(522, NULL, '253', '14', 0, 0),
(523, NULL, '253', '18', 0, 0),
(526, NULL, '254', '3', 1, 0),
(527, NULL, '254', '7', 1, 0),
(528, NULL, '254', '11', 0, 0),
(529, NULL, '254', '15', 1, 0),
(530, NULL, '254', '19', 0, 0),
(533, NULL, '255', '4', 0, 0),
(534, NULL, '255', '8', 1, 0),
(535, NULL, '255', '12', 0, 0),
(536, NULL, '255', '16', 1, 0),
(537, NULL, '255', '20', 0, 0),
(540, NULL, '256', '71', 0, 0),
(541, NULL, '256', '75', 0, 0),
(542, NULL, '256', '79', 0, 0),
(543, NULL, '256', '83', 0, 0),
(544, NULL, '256', '87', 0, 0),
(547, NULL, '257', '72', 0, 0),
(548, NULL, '257', '76', 0, 0),
(549, NULL, '257', '80', 0, 0),
(550, NULL, '257', '84', 0, 0),
(551, NULL, '257', '88', 0, 0),
(554, NULL, '258', '73', 0, 0),
(555, NULL, '258', '77', 0, 0),
(556, NULL, '258', '81', 0, 0),
(557, NULL, '258', '85', 0, 0),
(558, NULL, '258', '89', 0, 0),
(561, NULL, '259', '74', 0, 0),
(562, NULL, '259', '78', 0, 0),
(563, NULL, '259', '82', 0, 0),
(564, NULL, '259', '86', 0, 0),
(565, NULL, '259', '90', 0, 0),
(568, NULL, '260', '21', 1, 0),
(569, NULL, '260', '25', 0, 0),
(570, NULL, '260', '29', 0, 0),
(571, NULL, '260', '33', 0, 0),
(572, NULL, '260', '37', 0, 0),
(575, NULL, '261', '22', 1, 0),
(576, NULL, '261', '26', 1, 0),
(577, NULL, '261', '30', 0, 0),
(578, NULL, '261', '34', 1, 0),
(579, NULL, '261', '38', 0, 0),
(582, NULL, '262', '23', 0, 0),
(583, NULL, '262', '27', 0, 0),
(584, NULL, '262', '31', 0, 0),
(585, NULL, '262', '35', 0, 0),
(586, NULL, '262', '39', 0, 0),
(589, NULL, '263', '24', 0, 0),
(590, NULL, '263', '28', 0, 0),
(591, NULL, '263', '32', 0, 0),
(592, NULL, '263', '36', 0, 0),
(593, NULL, '263', '40', 0, 0),
(596, NULL, '264', '47', 0, 0),
(597, NULL, '264', '51', 0, 0),
(598, NULL, '264', '55', 0, 0),
(599, NULL, '264', '59', 0, 0),
(600, NULL, '264', '63', 0, 0),
(601, NULL, '264', '67', 0, 0),
(603, NULL, '265', '48', 0, 0),
(604, NULL, '265', '52', 0, 0),
(605, NULL, '265', '56', 0, 0),
(606, NULL, '265', '60', 0, 0),
(607, NULL, '265', '64', 0, 0),
(608, NULL, '265', '68', 0, 0),
(610, NULL, '266', '49', 0, 0),
(611, NULL, '266', '53', 0, 0),
(612, NULL, '266', '57', 0, 0),
(613, NULL, '266', '61', 0, 0),
(614, NULL, '266', '65', 0, 0),
(615, NULL, '266', '69', 0, 0),
(617, NULL, '267', '50', 0, 0),
(618, NULL, '267', '54', 0, 0),
(619, NULL, '267', '58', 0, 0),
(620, NULL, '267', '62', 0, 0),
(621, NULL, '267', '66', 0, 0),
(622, NULL, '267', '70', 0, 0),
(624, NULL, '268', '1', 1, 0),
(625, NULL, '268', '5', 0, 0),
(626, NULL, '268', '9', 0, 0),
(627, NULL, '268', '13', 0, 0),
(628, NULL, '268', '17', 0, 0),
(631, NULL, '269', '2', 1, 0),
(632, NULL, '269', '6', 0, 0),
(633, NULL, '269', '10', 0, 0),
(634, NULL, '269', '14', 0, 0),
(635, NULL, '269', '18', 0, 0),
(638, NULL, '270', '3', 1, 0),
(639, NULL, '270', '7', 1, 0),
(640, NULL, '270', '11', 0, 0),
(641, NULL, '270', '15', 1, 0),
(642, NULL, '270', '19', 0, 0),
(645, NULL, '271', '4', 0, 0),
(646, NULL, '271', '8', 1, 0),
(647, NULL, '271', '12', 0, 0),
(648, NULL, '271', '16', 1, 0),
(649, NULL, '271', '20', 0, 0),
(652, NULL, '272', '71', 0, 0),
(653, NULL, '272', '75', 0, 0),
(654, NULL, '272', '79', 0, 0),
(655, NULL, '272', '83', 0, 0),
(656, NULL, '272', '87', 0, 0),
(659, NULL, '273', '72', 0, 0),
(660, NULL, '273', '76', 0, 0),
(661, NULL, '273', '80', 0, 0),
(662, NULL, '273', '84', 0, 0),
(663, NULL, '273', '88', 0, 0),
(666, NULL, '274', '73', 0, 0),
(667, NULL, '274', '77', 0, 0),
(668, NULL, '274', '81', 0, 0),
(669, NULL, '274', '85', 0, 0),
(670, NULL, '274', '89', 0, 0),
(673, NULL, '275', '74', 0, 0),
(674, NULL, '275', '78', 0, 0),
(675, NULL, '275', '82', 0, 0),
(676, NULL, '275', '86', 0, 0),
(677, NULL, '275', '90', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `professor`
--

CREATE TABLE `professor` (
  `id` varchar(255) NOT NULL,
  `guid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `professor`
--

INSERT INTO `professor` (`id`, `guid`, `name`, `last_name`) VALUES
('1', NULL, 'Abdul Rahim', 'Naseer'),
('2', '', 'Agostini', 'Alessandro'),
('3', '', 'Seth', 'Ashish'),
('4', '', 'Kang', 'Saejin'),
('5', '', 'An', 'Chongkoo');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `id` varchar(255) NOT NULL,
  `guid` varchar(255) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `professor_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`id`, `guid`, `name`, `course_id`, `professor_id`) VALUES
('1', NULL, '001', '1', '1'),
('10', NULL, '002', '3', '4'),
('11', NULL, '003', '3', '4'),
('12', NULL, '004', '3', '4'),
('13', NULL, '001', '4', '2'),
('14', NULL, '002', '4', '2'),
('15', NULL, '003', '4', '2'),
('16', NULL, '004', '4', '2'),
('17', NULL, '001', '5', '3'),
('18', NULL, '002', '5', '3'),
('19', NULL, '003', '5', '3'),
('2', NULL, '002', '1', '1'),
('20', NULL, '004', '5', '3'),
('3', NULL, '003', '1', '1'),
('4', NULL, '004', '1', '1'),
('5', NULL, '001', '2', '5'),
('9', NULL, '001', '3', '4');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` varchar(255) NOT NULL,
  `guid` varchar(255) DEFAULT NULL,
  `university_id` varchar(255) CHARACTER SET utf16 COLLATE utf16_bin NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `nfc_token` varchar(255) DEFAULT NULL,
  `department_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `guid`, `university_id`, `name`, `last_name`, `nfc_token`, `department_id`) VALUES
('1', NULL, 'U2010210', 'Ubaydulla', 'Pulatov', '481437695', '1'),
('2', '', 'u2010257', 'Javokhir', 'Shomuratov', '1601738595', '1'),
('3', '', 'u2010223', 'Khasan', 'Rashidov', '1602688148', '1'),
('4', '', 'u2010224', 'Khusan', 'Rashidov', '1441386595', '1'),
('5', '', 'u2010277', 'Azizullo', 'Temirov', '48518754', '1'),
('6', '', 'u2010060', 'Samandar', 'Daminov', '7610714013', '1'),
('7', '', 'u2010046', 'Mekhrol', 'Bazarov', '7591005', '1');

-- --------------------------------------------------------

--
-- Table structure for table `takes`
--

CREATE TABLE `takes` (
  `id` int NOT NULL,
  `guid` varchar(255) DEFAULT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  `section_id` varchar(255) DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `takes`
--

INSERT INTO `takes` (`id`, `guid`, `student_id`, `section_id`, `course_id`) VALUES
(179, NULL, '1', '1', '1'),
(180, NULL, '1', '2', '1'),
(181, NULL, '1', '3', '1'),
(182, NULL, '1', '4', '1'),
(183, NULL, '1', '5', '2'),
(184, NULL, '1', '9', '3'),
(185, NULL, '1', '10', '3'),
(186, NULL, '1', '11', '3'),
(187, NULL, '1', '12', '3'),
(188, NULL, '1', '13', '4'),
(189, NULL, '1', '14', '4'),
(190, NULL, '1', '15', '4'),
(191, NULL, '1', '16', '4'),
(192, NULL, '1', '17', '5'),
(193, NULL, '1', '18', '5'),
(194, NULL, '1', '19', '5'),
(195, NULL, '1', '20', '5'),
(196, NULL, '2', '1', '1'),
(197, NULL, '2', '2', '1'),
(198, NULL, '2', '3', '1'),
(199, NULL, '2', '4', '1'),
(200, NULL, '2', '9', '3'),
(201, NULL, '2', '10', '3'),
(202, NULL, '2', '11', '3'),
(203, NULL, '2', '12', '3'),
(204, NULL, '2', '13', '4'),
(205, NULL, '2', '14', '4'),
(206, NULL, '2', '15', '4'),
(207, NULL, '2', '16', '4'),
(208, NULL, '2', '17', '5'),
(209, NULL, '2', '18', '5'),
(210, NULL, '2', '19', '5'),
(211, NULL, '2', '20', '5'),
(212, NULL, '4', '1', '1'),
(213, NULL, '4', '2', '1'),
(214, NULL, '4', '3', '1'),
(215, NULL, '4', '4', '1'),
(216, NULL, '4', '9', '3'),
(217, NULL, '4', '10', '3'),
(218, NULL, '4', '11', '3'),
(219, NULL, '4', '12', '3'),
(220, NULL, '4', '13', '4'),
(221, NULL, '4', '14', '4'),
(222, NULL, '4', '15', '4'),
(223, NULL, '4', '16', '4'),
(224, NULL, '4', '17', '5'),
(225, NULL, '4', '18', '5'),
(226, NULL, '4', '19', '5'),
(227, NULL, '4', '20', '5'),
(228, NULL, '5', '1', '1'),
(229, NULL, '5', '2', '1'),
(230, NULL, '5', '3', '1'),
(231, NULL, '5', '4', '1'),
(232, NULL, '5', '9', '3'),
(233, NULL, '5', '10', '3'),
(234, NULL, '5', '11', '3'),
(235, NULL, '5', '12', '3'),
(236, NULL, '5', '13', '4'),
(237, NULL, '5', '14', '4'),
(238, NULL, '5', '15', '4'),
(239, NULL, '5', '16', '4'),
(240, NULL, '5', '17', '5'),
(241, NULL, '5', '18', '5'),
(242, NULL, '5', '19', '5'),
(243, NULL, '5', '20', '5'),
(244, NULL, '6', '1', '1'),
(245, NULL, '6', '2', '1'),
(246, NULL, '6', '3', '1'),
(247, NULL, '6', '4', '1'),
(248, NULL, '6', '9', '3'),
(249, NULL, '6', '10', '3'),
(250, NULL, '6', '11', '3'),
(251, NULL, '6', '12', '3'),
(252, NULL, '6', '13', '4'),
(253, NULL, '6', '14', '4'),
(254, NULL, '6', '15', '4'),
(255, NULL, '6', '16', '4'),
(256, NULL, '6', '17', '5'),
(257, NULL, '6', '18', '5'),
(258, NULL, '6', '19', '5'),
(259, NULL, '6', '20', '5'),
(260, NULL, '7', '1', '1'),
(261, NULL, '7', '2', '1'),
(262, NULL, '7', '3', '1'),
(263, NULL, '7', '4', '1'),
(264, NULL, '7', '9', '3'),
(265, NULL, '7', '10', '3'),
(266, NULL, '7', '11', '3'),
(267, NULL, '7', '12', '3'),
(268, NULL, '7', '13', '4'),
(269, NULL, '7', '14', '4'),
(270, NULL, '7', '15', '4'),
(271, NULL, '7', '16', '4'),
(272, NULL, '7', '17', '5'),
(273, NULL, '7', '18', '5'),
(274, NULL, '7', '19', '5'),
(275, NULL, '7', '20', '5');

--
-- Triggers `takes`
--
DELIMITER $$
CREATE TRIGGER `added_takes` AFTER INSERT ON `takes` FOR EACH ROW BEGIN
        INSERT INTO lecture_attendance(id, guid, take_id, time_slot_id, attendance, active)
            SELECT null, null, new.id as take_id, ts.id AS time_slot_id, false, false
            FROM time_slot ts
        where ts.course_id = new.course_id and ts.section_id = new.section_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `time_slot`
--

CREATE TABLE `time_slot` (
  `id` int NOT NULL,
  `guid` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `start_time` time(6) DEFAULT NULL,
  `end_time` time(6) DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `section_id` varchar(255) DEFAULT NULL,
  `course_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `time_slot`
--

INSERT INTO `time_slot` (`id`, `guid`, `date`, `start_time`, `end_time`, `room`, `section_id`, `course_id`) VALUES
(1, NULL, '2022-12-19', '09:00:00.000000', '10:30:00.000000', 'A202', '13', '4'),
(2, NULL, '2022-12-19', '10:30:00.000000', '12:00:00.000000', 'A202', '14', '4'),
(3, NULL, '2022-12-19', '12:00:00.000000', '13:30:00.000000', 'A202', '15', '4'),
(4, NULL, '2022-12-19', '13:30:00.000000', '16:30:00.000000', 'A202', '16', '4'),
(5, NULL, '2022-12-20', '09:00:00.000000', '10:30:00.000000', 'A202', '13', '4'),
(6, NULL, '2022-12-20', '10:30:00.000000', '12:00:00.000000', 'A202', '14', '4'),
(7, NULL, '2022-12-20', '12:00:00.000000', '13:30:00.000000', 'A202', '15', '4'),
(8, NULL, '2022-12-20', '13:30:00.000000', '16:30:00.000000', 'A202', '16', '4'),
(9, NULL, '2022-12-21', '09:00:00.000000', '10:30:00.000000', 'A202', '13', '4'),
(10, NULL, '2022-12-21', '10:30:00.000000', '12:00:00.000000', 'A202', '14', '4'),
(11, NULL, '2022-12-21', '12:00:00.000000', '13:30:00.000000', 'A202', '15', '4'),
(12, NULL, '2022-12-21', '13:30:00.000000', '16:30:00.000000', 'A202', '16', '4'),
(13, NULL, '2022-12-22', '09:00:00.000000', '10:30:00.000000', 'A202', '13', '4'),
(14, NULL, '2022-12-22', '10:30:00.000000', '12:00:00.000000', 'A202', '14', '4'),
(15, NULL, '2022-12-22', '11:30:00.000000', '13:30:00.000000', 'A202', '15', '4'),
(16, NULL, '2022-12-22', '13:30:00.000000', '16:30:00.000000', 'A202', '16', '4'),
(17, NULL, '2022-12-23', '09:00:00.000000', '10:30:00.000000', 'A202', '13', '4'),
(18, NULL, '2022-12-23', '10:30:00.000000', '12:00:00.000000', 'A202', '14', '4'),
(19, NULL, '2022-12-23', '12:00:00.000000', '13:30:00.000000', 'A202', '15', '4'),
(20, NULL, '2022-12-23', '13:30:00.000000', '16:30:00.000000', 'A202', '16', '4'),
(21, NULL, '2022-12-19', '10:30:00.000000', '12:00:00.000000', 'A203', '1', '1'),
(22, NULL, '2022-12-19', '12:00:00.000000', '13:30:00.000000', 'A203', '2', '1'),
(23, NULL, '2022-12-19', '13:30:00.000000', '16:30:00.000000', 'A203', '3', '1'),
(24, NULL, '2022-12-19', '16:30:00.000000', '18:00:00.000000', 'A203', '4', '1'),
(25, NULL, '2022-12-20', '10:30:00.000000', '12:00:00.000000', 'A203', '1', '1'),
(26, NULL, '2022-12-20', '12:00:00.000000', '13:30:00.000000', 'A203', '2', '1'),
(27, NULL, '2022-12-20', '13:30:00.000000', '16:30:00.000000', 'A203', '3', '1'),
(28, NULL, '2022-12-20', '16:30:00.000000', '18:00:00.000000', 'A203', '4', '1'),
(29, NULL, '2022-12-21', '10:30:00.000000', '12:00:00.000000', 'A203', '1', '1'),
(30, NULL, '2022-12-21', '12:00:00.000000', '13:30:00.000000', 'A203', '2', '1'),
(31, NULL, '2022-12-21', '13:30:00.000000', '16:30:00.000000', 'A203', '3', '1'),
(32, NULL, '2022-12-21', '16:30:00.000000', '18:00:00.000000', 'A203', '4', '1'),
(33, NULL, '2022-12-22', '10:30:00.000000', '12:00:00.000000', 'A203', '1', '1'),
(34, NULL, '2022-12-22', '11:30:00.000000', '13:30:00.000000', 'A203', '2', '1'),
(35, NULL, '2022-12-22', '13:30:00.000000', '16:30:00.000000', 'A203', '3', '1'),
(36, NULL, '2022-12-22', '16:30:00.000000', '18:00:00.000000', 'A203', '4', '1'),
(37, NULL, '2022-12-23', '10:30:00.000000', '12:00:00.000000', 'A203', '1', '1'),
(38, NULL, '2022-12-23', '12:00:00.000000', '13:30:00.000000', 'A203', '2', '1'),
(39, NULL, '2022-12-23', '13:30:00.000000', '16:30:00.000000', 'A203', '3', '1'),
(40, NULL, '2022-12-23', '16:30:00.000000', '18:00:00.000000', 'A203', '4', '1'),
(41, NULL, '2022-12-19', '12:00:00.000000', '13:30:00.000000', 'B210', '5', '2'),
(42, NULL, '2022-12-20', '12:00:00.000000', '13:30:00.000000', 'B210', '5', '2'),
(43, NULL, '2022-12-21', '12:00:00.000000', '13:30:00.000000', 'B210', '5', '2'),
(44, NULL, '2022-12-22', '11:30:00.000000', '13:30:00.000000', 'B210', '5', '2'),
(45, NULL, '2022-12-23', '12:00:00.000000', '13:30:00.000000', 'B210', '5', '2'),
(46, NULL, '2022-12-24', '12:00:00.000000', '13:30:00.000000', 'B210', '5', '2'),
(47, NULL, '2022-12-19', '13:30:00.000000', '15:00:00.000000', 'B201', '9', '3'),
(48, NULL, '2022-12-19', '15:00:00.000000', '16:30:00.000000', 'B201', '10', '3'),
(49, NULL, '2022-12-19', '09:00:00.000000', '10:30:00.000000', 'B201', '11', '3'),
(50, NULL, '2022-12-19', '10:30:00.000000', '12:00:00.000000', 'B201', '12', '3'),
(51, NULL, '2022-12-20', '13:30:00.000000', '15:00:00.000000', 'B201', '9', '3'),
(52, NULL, '2022-12-20', '15:00:00.000000', '16:30:00.000000', 'B201', '10', '3'),
(53, NULL, '2022-12-20', '09:00:00.000000', '10:30:00.000000', 'B201', '11', '3'),
(54, NULL, '2022-12-20', '10:30:00.000000', '12:00:00.000000', 'B201', '12', '3'),
(55, NULL, '2022-12-21', '13:30:00.000000', '15:00:00.000000', 'B201', '9', '3'),
(56, NULL, '2022-12-21', '15:00:00.000000', '16:30:00.000000', 'B201', '10', '3'),
(57, NULL, '2022-12-21', '09:00:00.000000', '10:30:00.000000', 'B201', '11', '3'),
(58, NULL, '2022-12-21', '10:30:00.000000', '12:00:00.000000', 'B201', '12', '3'),
(59, NULL, '2022-12-22', '13:30:00.000000', '15:00:00.000000', 'B201', '9', '3'),
(60, NULL, '2022-12-22', '15:00:00.000000', '16:30:00.000000', 'B201', '10', '3'),
(61, NULL, '2022-12-22', '11:30:00.000000', '10:30:00.000000', 'B201', '11', '3'),
(62, NULL, '2022-12-22', '10:30:00.000000', '12:00:00.000000', 'B201', '12', '3'),
(63, NULL, '2022-12-23', '13:30:00.000000', '15:00:00.000000', 'B201', '9', '3'),
(64, NULL, '2022-12-23', '15:00:00.000000', '16:30:00.000000', 'B201', '10', '3'),
(65, NULL, '2022-12-23', '09:00:00.000000', '10:30:00.000000', 'B201', '11', '3'),
(66, NULL, '2022-12-23', '10:30:00.000000', '12:00:00.000000', 'B201', '12', '3'),
(67, NULL, '2022-12-24', '13:30:00.000000', '15:00:00.000000', 'B201', '9', '3'),
(68, NULL, '2022-12-24', '15:00:00.000000', '16:30:00.000000', 'B201', '10', '3'),
(69, NULL, '2022-12-24', '09:00:00.000000', '10:30:00.000000', 'B201', '11', '3'),
(70, NULL, '2022-12-24', '10:30:00.000000', '12:00:00.000000', 'B201', '12', '3'),
(71, NULL, '2022-12-19', '15:00:00.000000', '16:30:00.000000', 'B101', '17', '5'),
(72, NULL, '2022-12-19', '09:00:00.000000', '10:30:00.000000', 'B101', '18', '5'),
(73, NULL, '2022-12-19', '10:30:00.000000', '12:00:00.000000', 'B101', '19', '5'),
(74, NULL, '2022-12-19', '12:00:00.000000', '13:30:00.000000', 'B101', '20', '5'),
(75, NULL, '2022-12-20', '15:00:00.000000', '16:30:00.000000', 'B101', '17', '5'),
(76, NULL, '2022-12-20', '09:00:00.000000', '10:30:00.000000', 'B101', '18', '5'),
(77, NULL, '2022-12-20', '10:30:00.000000', '12:00:00.000000', 'B101', '19', '5'),
(78, NULL, '2022-12-20', '12:00:00.000000', '13:30:00.000000', 'B101', '20', '5'),
(79, NULL, '2022-12-21', '15:00:00.000000', '16:30:00.000000', 'B101', '17', '5'),
(80, NULL, '2022-12-21', '09:00:00.000000', '10:30:00.000000', 'B101', '18', '5'),
(81, NULL, '2022-12-21', '10:30:00.000000', '12:00:00.000000', 'B101', '19', '5'),
(82, NULL, '2022-12-21', '12:00:00.000000', '13:30:00.000000', 'B101', '20', '5'),
(83, NULL, '2022-12-22', '15:00:00.000000', '16:30:00.000000', 'B101', '17', '5'),
(84, NULL, '2022-12-22', '09:00:00.000000', '10:30:00.000000', 'B101', '18', '5'),
(85, NULL, '2022-12-22', '10:30:00.000000', '12:00:00.000000', 'B101', '19', '5'),
(86, NULL, '2022-12-22', '11:30:00.000000', '13:30:00.000000', 'B101', '20', '5'),
(87, NULL, '2022-12-23', '15:00:00.000000', '16:30:00.000000', 'B101', '17', '5'),
(88, NULL, '2022-12-23', '09:00:00.000000', '10:30:00.000000', 'B101', '18', '5'),
(89, NULL, '2022-12-23', '10:30:00.000000', '12:00:00.000000', 'B101', '19', '5'),
(90, NULL, '2022-12-23', '12:00:00.000000', '13:30:00.000000', 'B101', '20', '5');

--
-- Triggers `time_slot`
--
DELIMITER $$
CREATE TRIGGER `added_lecture` AFTER INSERT ON `time_slot` FOR EACH ROW BEGIN
        INSERT INTO lecture_attendance
            SELECT null, null, t.id as take_id, new.id AS time_slot_id, false, false
            FROM takes t
            where t.section_id = new.section_id and t.course_id = new.course_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

CREATE TABLE `university` (
  `id` varchar(255) NOT NULL,
  `guid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `university`
--

INSERT INTO `university` (`id`, `guid`, `name`) VALUES
('1', NULL, 'INHA');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` int NOT NULL,
  `professor_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `type`, `professor_id`) VALUES
('Agostini', 'root', 1, '2'),
('An', 'root', 1, '5'),
('Kang', 'root', 1, '4'),
('naseer', 'root', 1, '1'),
('purple_short', 'root', 2, '3276354'),
('Seth', 'root', 1, '3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lecture_attendance`
--
ALTER TABLE `lecture_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `takes`
--
ALTER TABLE `takes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_slot`
--
ALTER TABLE `time_slot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `university`
--
ALTER TABLE `university`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lecture_attendance`
--
ALTER TABLE `lecture_attendance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=678;

--
-- AUTO_INCREMENT for table `takes`
--
ALTER TABLE `takes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=276;

--
-- AUTO_INCREMENT for table `time_slot`
--
ALTER TABLE `time_slot`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;