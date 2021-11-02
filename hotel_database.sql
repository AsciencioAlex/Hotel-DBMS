

--
-- Database: `hotel_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill_deatils`
--

CREATE TABLE `bill_deatils` (
  `Bill_id` int(11) NOT NULL,
  `Service_id` int(11) DEFAULT NULL,
  `Customer_id` int(11) DEFAULT NULL,
  `Amount` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Service_details` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Contact_No` int(11) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Zip_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Employee_id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Contact_No` int(11) DEFAULT NULL,
  `Hotel_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `Hotel_id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Location` varchar(50) DEFAULT NULL,
  `Phone_Number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Payment_id` int(11) NOT NULL,
  `Customer_id` int(11) DEFAULT NULL,
  `Payment_type` int(11) DEFAULT NULL,
  `Room_charge` int(11) DEFAULT NULL,
  `Payment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE `payment_type` (
  `Payment_type` int(11) NOT NULL,
  `Creadit_card_no` int(11) DEFAULT NULL,
  `Expiry_date` int(11) DEFAULT NULL,
  `Card_holder_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `Reservation_no` int(11) NOT NULL,
  `Customer_id` int(11) NOT NULL,
  `Room_id` int(11) NOT NULL,
  `Check_in_date` date NOT NULL,
  `Check_out_date` date NOT NULL,
  `Status` varchar(50) NOT NULL,
  `Period` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `Room_id` int(11) NOT NULL,
  `Room_type` int(11) DEFAULT NULL,
  `Hotel_id` int(11) DEFAULT NULL,
  `Room_image` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Room_description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `room_type`
--

CREATE TABLE `room_type` (
  `Room_type` int(11) NOT NULL,
  `Room_price` int(11) DEFAULT NULL,
  `Room_amenities` varchar(50) DEFAULT NULL,
  `Room_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `Service_id` int(11) NOT NULL,
  `Reservation_no` int(11) DEFAULT NULL,
  `Service_name` varchar(50) DEFAULT NULL,
  `Sevice_charge` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill_deatils`
--
ALTER TABLE `bill_deatils`
  ADD PRIMARY KEY (`Bill_id`),
  ADD UNIQUE KEY `Service_id` (`Service_id`,`Customer_id`),
  ADD KEY `Customer_id` (`Customer_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Employee_id`),
  ADD KEY `Hotel_id` (`Hotel_id`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`Hotel_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment_id`),
  ADD UNIQUE KEY `Customer_id` (`Customer_id`),
  ADD KEY `Payment_type` (`Payment_type`);

--
-- Indexes for table `payment_type`
--
ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`Payment_type`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`Reservation_no`) USING BTREE,
  ADD UNIQUE KEY `FOREIGN KEY` (`Customer_id`),
  ADD UNIQUE KEY `Room_id` (`Room_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`Room_id`),
  ADD UNIQUE KEY `Room_type` (`Room_type`,`Hotel_id`),
  ADD KEY `Hotel_id` (`Hotel_id`);

--
-- Indexes for table `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`Room_type`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`Service_id`),
  ADD UNIQUE KEY `Reservation_no` (`Reservation_no`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill_deatils`
--
ALTER TABLE `bill_deatils`
  ADD CONSTRAINT `bill_deatils_ibfk_1` FOREIGN KEY (`Service_id`) REFERENCES `services` (`Service_id`),
  ADD CONSTRAINT `bill_deatils_ibfk_2` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`Customer_id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Hotel_id`) REFERENCES `hotel` (`Hotel_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`Customer_id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`Payment_type`) REFERENCES `payment_type` (`Payment_type`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`Room_id`) REFERENCES `reservation` (`Reservation_no`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`Customer_id`) REFERENCES `customer` (`Customer_id`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`Room_type`) REFERENCES `room_type` (`Room_type`),
  ADD CONSTRAINT `room_ibfk_2` FOREIGN KEY (`Hotel_id`) REFERENCES `hotel` (`Hotel_id`);

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`Reservation_no`) REFERENCES `reservation` (`Reservation_no`);
COMMIT;

