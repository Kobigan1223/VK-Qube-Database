-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2021 at 04:31 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vkqube`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_products`
--

CREATE TABLE `cart_products` (
  `cartId` varchar(20) NOT NULL,
  `productID` varchar(20) NOT NULL,
  `cartquantity` int(10) NOT NULL,
  `cartcolor` varchar(255) NOT NULL DEFAULT 'None'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_products`
--

INSERT INTO `cart_products` (`cartId`, `productID`, `cartquantity`, `cartcolor`) VALUES
('CRT001', 'PRD005', 1, 'black'),
('CRT001', 'PRD005', 4, 'red'),
('CRT001', 'PRD016', 1, 'None'),
('CRT003', 'PRD060', 1, 'None');

-- --------------------------------------------------------

--
-- Table structure for table `cart_user`
--

CREATE TABLE `cart_user` (
  `cartId` varchar(20) NOT NULL,
  `userID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_user`
--

INSERT INTO `cart_user` (`cartId`, `userID`) VALUES
('CRT004', 'CMR005'),
('CRT002', 'CMR006'),
('CRT001', 'SOW002'),
('CRT003', 'SOW004');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `orderId` varchar(20) NOT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `customerID` varchar(20) NOT NULL,
  `paymentId` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`orderId`, `orderDate`, `customerID`, `paymentId`) VALUES
('ORD001', '2021-06-28 07:39:13', 'CMR005', 'PMT001');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `orderId` varchar(20) NOT NULL,
  `productID` varchar(20) NOT NULL,
  `ordquantity` int(10) NOT NULL,
  `ordcolor` varchar(255) NOT NULL DEFAULT 'None',
  `ordstatus` varchar(30) NOT NULL DEFAULT 'Processing',
  `customerview` varchar(30) NOT NULL DEFAULT 'Show'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`orderId`, `productID`, `ordquantity`, `ordcolor`, `ordstatus`, `customerview`) VALUES
('ORD001', 'PRD081', 1, 'None', 'shipped', 'Show'),
('ORD001', 'PRD087', 2, 'None', 'Processing', 'Show');

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `paymentId` varchar(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`paymentId`, `amount`) VALUES
('PMT001', '15750.00');

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `categoryid` varchar(20) NOT NULL,
  `categoryName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`categoryid`, `categoryName`) VALUES
('CAT001', 'Drinks'),
('CAT007', 'grocery'),
('CAT003', 'Ice cream'),
('CAT004', 'Juices'),
('CAT002', 'Meals'),
('CAT005', 'Snaks');

-- --------------------------------------------------------

--
-- Table structure for table `product_color`
--

CREATE TABLE `product_color` (
  `productid` varchar(20) NOT NULL,
  `color` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `productid` varchar(20) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productPrice` decimal(20,2) NOT NULL,
  `productQty` int(11) NOT NULL,
  `productCat` varchar(20) NOT NULL,
  `productDescription` varchar(1000) NOT NULL,
  `productImage1Loc` varchar(255) DEFAULT '../images/Products/noimage.jpg',
  `productImage2Loc` varchar(255) DEFAULT '../images/Products/noimage.jpg',
  `productImage3Loc` varchar(255) DEFAULT '../images/Products/noimage.jpg',
  `productImage4Loc` varchar(255) DEFAULT '../images/Products/noimage.jpg',
  `availability` varchar(20) NOT NULL DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`productid`, `productName`, `productPrice`, `productQty`, `productCat`, `productDescription`, `productImage1Loc`, `productImage2Loc`, `productImage3Loc`, `productImage4Loc`, `availability`) VALUES
('PRD005', 'iPhone XS Max', '250000.00', 56, 'CAT001', 'Released 2020, August 21\r\n208g, 8.1mm thickness\r\nAndroid 10, One UI 2.5\r\n128GB/256GB/512GB storage,\r\nmicroSDXC', '../images/Products/PRD005/img1.jpg', '../images/Products/PRD005/img2.jpg', '../images/Products/PRD005/img3.jpg', '../images/Products/PRD005/img4.jpg', 'Available'),
('PRD016', 'Rice cookers', '5000.00', 25, 'CAT003', 'Please bear in mind that the photo may be slightly different from the actual item in terms of colour due to lighting conditions or the display used to view', '../images/Products/PRD016/img1.jpg', '../images/Products/PRD016/img2.jpg', '../images/Products/PRD016/img3.jpg', '../images/Products/PRD016/img4.jpg', 'Available'),
('PRD060', 'Tata Sampann Turmeric Powder Masala', '210.00', 5, 'CAT007', 'Tata Sampann Turmeric Powder Masala.Please bear in mind that the photo may be slightly different from the actual item in terms of colour due to lighting conditions or the display used to view', '../images/Products/PRD060/img1.jpg', '../images/Products/PRD060/img2.jpg', '../images/Products/PRD060/img3.jpg', '../images/Products/PRD060/img4.jpg', 'Available'),
('PRD081', 'Indian Family Meal', '2500.00', 9, 'CAT004', 'You can select 2 Meat/Seafood dishes and 2 Vegetable dishes each served in two portions, ideal for a family of four.\r\nPotato and Pea Samosa\r\nFish Koliwada\r\nRice Pilaf\r\nNaan, Tandoori Roti', '../images/Products/PRD081/img1.jpg', '../images/Products/PRD081/img2.jpg', '../images/Products/PRD081/img3.jpg', '../images/Products/PRD081/img4.jpg', 'Available'),
('PRD082', 'Tandoor roti', '250.00', 15, 'CAT004', 'Yoghurt marinated chicken cooked with basmati rice, served with pickle, raita and gravy', '../images/Products/PRD082/img1.jpg', '../images/Products/PRD082/img2.jpg', '../images/Products/PRD082/img3.jpg', '../images/Products/PRD082/img4.jpg', 'Available'),
('PRD083', 'Chicken Dum Biriyani Single Portion', '600.00', 25, 'CAT004', 'Chicken Dum Biriyani (Single Portion)', '../images/Products/PRD083/img1.jpg', '../images/Products/PRD083/img2.jpg', '../images/Products/PRD083/img3.jpg', '../images/Products/PRD083/img4.jpg', 'Available'),
('PRD084', 'Chapati', '250.00', 15, 'CAT004', 'Chapati', '../images/Products/PRD084/img1.jpg', '../images/Products/PRD084/img2.jpg', '../images/Products/PRD084/img3.jpg', '../images/Products/PRD084/img4.jpg', 'Available'),
('PRD085', 'Mutton Biriyani with Curry', '1000.00', 20, 'CAT004', 'Mutton Biriyani with Curry', '../images/Products/PRD085/img1.jpg', '../images/Products/PRD085/img2.jpg', '../images/Products/PRD085/img3.jpg', '../images/Products/PRD085/img4.jpg', 'Available'),
('PRD086', 'Indian Family Meal Full 5', '2500.00', 15, 'CAT004', 'Indian Family Meal', '../images/Products/PRD086/img1.jpg', '../images/Products/PRD086/img2.jpg', '../images/Products/PRD086/img3.jpg', '../images/Products/PRD086/img4.jpg', 'Available'),
('PRD087', 'Chicken Biriyani Sawan for 8', '7500.00', 13, 'CAT004', 'Chicken Biriyani Sawan for 8', '../images/Products/PRD087/img1.jpg', '../images/Products/PRD087/img2.jpg', '../images/Products/PRD087/img3.jpg', '../images/Products/PRD087/img4.jpg', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `product_keywords`
--

CREATE TABLE `product_keywords` (
  `productid` varchar(20) NOT NULL,
  `keywords` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_keywords`
--

INSERT INTO `product_keywords` (`productid`, `keywords`) VALUES
('PRD081', 'DINNER'),
('PRD081', 'FOOD'),
('PRD081', 'Indian Family .Meal'),
('PRD081', 'LUNCH'),
('PRD081', 'MEAL'),
('PRD081', 'Rice'),
('PRD082', 'breakfast'),
('PRD082', 'Dinner'),
('PRD082', 'lunch'),
('PRD082', 'roti'),
('PRD082', 'Tandoor'),
('PRD083', 'Briyani'),
('PRD083', 'Chicken Dum Biriyani'),
('PRD083', 'food'),
('PRD083', 'lunch'),
('PRD084', 'breakfast'),
('PRD084', 'Chapati'),
('PRD084', 'Roti'),
('PRD085', 'briyani'),
('PRD085', 'curry'),
('PRD085', 'Mutton Biriyani with Curry'),
('PRD086', 'Indian Family Meal'),
('PRD086', 'lunch'),
('PRD087', 'Biriyani'),
('PRD087', 'Chicken'),
('PRD087', 'Chicken Biriyani Sawan'),
('PRD087', 'Sawan');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `ratingId` int(11) NOT NULL,
  `userId` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ratingNumber` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comments` text COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = Block, 0 = Unblock'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`ratingId`, `userId`, `ratingNumber`, `title`, `comments`, `created`, `modified`, `status`) VALUES
(14, 'CMR002', 2, 'its awesome', 'It\'s awesome!!!', '2018-08-19 09:13:01', '2018-08-19 09:13:01', 1),
(15, 'CMR002', 5, 'Nice product', 'Really quality product!', '2018-08-19 09:13:37', '2018-08-19 09:13:37', 1),
(16, 'CMR003', 1, 'best buy', 'its\'s best but item.', '2018-08-19 09:14:19', '2018-08-19 09:14:19', 1),
(17, 'CMR003', 1, 'super awesome ', 'i think its supper products', '2018-08-19 09:18:00', '2018-08-19 09:18:00', 1),
(22, 'CMR003', 1, 'adada', 'daDad', '2019-01-20 17:00:58', '2019-01-20 17:00:58', 1),
(23, 'CMR002', 5, 'Nice product', 'this is nice!', '2019-01-20 17:01:37', '2019-01-20 17:01:37', 1),
(24, 'CMR004', 1, 'really nice', 'Good!', '2019-01-20 21:06:48', '2019-01-20 21:06:48', 1),
(25, 'CMR004', 5, 'hiiii', 'super', '2021-09-07 07:49:33', '2021-09-07 07:49:33', 1),
(26, 'CMR005', 5, 'kobi', 'superb', '2021-09-07 08:45:54', '2021-09-07 08:45:54', 1),
(27, 'CMR008', 5, 'tamil', 'super', '2021-09-09 13:03:46', '2021-09-09 13:03:46', 1),
(28, 'CMR010', 5, 'hoiiiiiiiiiii', 'kobigan ', '2021-09-09 16:06:02', '2021-09-09 16:06:02', 1),
(29, 'CMR010', 1, 'sollunga', 'vanga palakalam', '2021-09-09 16:06:45', '2021-09-09 16:06:45', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop_details`
--

CREATE TABLE `shop_details` (
  `shopid` varchar(20) NOT NULL,
  `shopName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shop_details`
--

INSERT INTO `shop_details` (`shopid`, `shopName`) VALUES
('SHP001', 'The Palm'),
('SHP002', 'Tech World'),
('SHP003', 'HomeNeeds'),
('SHP004', 'GroceryWorld'),
('SHP005', 'kidZone');

-- --------------------------------------------------------

--
-- Table structure for table `shop_ownership`
--

CREATE TABLE `shop_ownership` (
  `shopid` varchar(20) NOT NULL,
  `ownerid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shop_ownership`
--

INSERT INTO `shop_ownership` (`shopid`, `ownerid`) VALUES
('SHP001', 'SOW001');

-- --------------------------------------------------------

--
-- Table structure for table `shop_products`
--

CREATE TABLE `shop_products` (
  `shopid` varchar(20) NOT NULL,
  `productID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shop_products`
--

INSERT INTO `shop_products` (`shopid`, `productID`) VALUES
('SHP001', 'PRD081'),
('SHP001', 'PRD082'),
('SHP001', 'PRD083'),
('SHP001', 'PRD084'),
('SHP001', 'PRD085'),
('SHP001', 'PRD086'),
('SHP001', 'PRD087');

-- --------------------------------------------------------

--
-- Table structure for table `user_credentials`
--

CREATE TABLE `user_credentials` (
  `userId` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_credentials`
--

INSERT INTO `user_credentials` (`userId`, `email`, `password`) VALUES
('CMR002', 'henrykpape@gmail.com', 'HenryK@charlie'),
('CMR003', 'jackkirby@gmail.com', 'JackK@charlie'),
('CMR012', 'jkk@gmail.com', 'jkk@12'),
('CMR005', 'joerusso@gmail.com', 'JoeR@charlie'),
('CMR010', 'kobigan98@gmail.com', 'kobi@charlie'),
('CMR008', 'kobigan@gmail.com', '123456'),
('CMR009', 'kobigank@gmail.com', '123456'),
('SOW001', 'Michael@gmail.com', 'Michael@charlie'),
('CMR011', 'sathiyavarathan@gmail.com', 'abcdef'),
('CMR001', 'william@gmail.com', 'William@charlie');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `userId` varchar(20) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `profImgLoc` varchar(255) NOT NULL DEFAULT '../images/userprofpics/no_avatar.jpg',
  `mob_no` varchar(20) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`userId`, `userName`, `profImgLoc`, `mob_no`, `address`) VALUES
('CMR001', 'William Turner', '../images/userprofpics/CMR001.jpg', '0771234667', '177A Bleecker Street, Manhattan.'),
('CMR002', 'Henry K Pape', '../images/userprofpics/CMR002.jpg', '0212222254', '2058  Cambridge Court,Russellville'),
('CMR003', 'Jack Kirby', '../images/userprofpics/CMR003.jpg', '1452365899', '711  Long Street,Brooksville'),
('CMR004', 'Joe Russo', '../images/userprofpics/no_avatar.jpg', '5698569885', 'no address'),
('CMR005', 'Joe Russo', '../images/userprofpics/no_avatar.jpg', NULL, NULL),
('CMR006', 'Kumaran', '../images/userprofpics/no_avatar.jpg', '0751231564', 'kopay'),
('CMR007', 'addada', '../images/userprofpics/no_avatar.jpg', NULL, NULL),
('CMR008', 'kobigan', '../images/userprofpics/no_avatar.jpg', NULL, NULL),
('CMR009', 'kobigan15', '../images/userprofpics/no_avatar.jpg', NULL, NULL),
('CMR010', 'kobigan.k', '../images/userprofpics/no_avatar.jpg', NULL, NULL),
('CMR011', 'sathi', '../images/userprofpics/no_avatar.jpg', NULL, NULL),
('CMR012', 'jkk', '../images/userprofpics/no_avatar.jpg', NULL, NULL),
('SOW001', 'Michael B Jordan', '../images/userprofpics/SOW001.jpg', '0772563654', '177A Bleecker Street, Greenwich Village, Manhattan'),
('SOW002', 'Robert Downey, Jr.', '../images/userprofpics/SOW002.jpg', '0772563985', 'Malibu Point 10880, 90265,Malibu, California.'),
('SOW003', 'JK', '../images/userprofpics/SOW003.jpg', '0122545885', 'abc street.'),
('SOW004', 'john', '../images/userprofpics/SOW004.jpg', '0752255663', ''),
('SOW005', 'will smith', '../images/userprofpics/no_avatar.jpg', '0245553665', '');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_products`
--

CREATE TABLE `wishlist_products` (
  `wishlistid` varchar(20) NOT NULL,
  `productid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wishlist_products`
--

INSERT INTO `wishlist_products` (`wishlistid`, `productid`) VALUES
('WSH003', 'PRD085');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_user`
--

CREATE TABLE `wishlist_user` (
  `wishlistid` varchar(20) NOT NULL,
  `userid` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wishlist_user`
--

INSERT INTO `wishlist_user` (`wishlistid`, `userid`) VALUES
('WSH003', 'CMR005'),
('WSH001', 'CMR006'),
('WSH002', 'SOW001');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_products`
--
ALTER TABLE `cart_products`
  ADD PRIMARY KEY (`cartId`,`productID`,`cartcolor`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `cart_user`
--
ALTER TABLE `cart_user`
  ADD PRIMARY KEY (`cartId`),
  ADD UNIQUE KEY `userID` (`userID`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `paymentId` (`paymentId`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`orderId`,`productID`,`ordcolor`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`paymentId`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`categoryid`),
  ADD UNIQUE KEY `categoryName` (`categoryName`);

--
-- Indexes for table `product_color`
--
ALTER TABLE `product_color`
  ADD PRIMARY KEY (`productid`,`color`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`productid`),
  ADD KEY `productCat` (`productCat`);

--
-- Indexes for table `product_keywords`
--
ALTER TABLE `product_keywords`
  ADD PRIMARY KEY (`productid`,`keywords`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`ratingId`);

--
-- Indexes for table `shop_details`
--
ALTER TABLE `shop_details`
  ADD PRIMARY KEY (`shopid`);

--
-- Indexes for table `shop_ownership`
--
ALTER TABLE `shop_ownership`
  ADD PRIMARY KEY (`ownerid`),
  ADD KEY `shopid` (`shopid`);

--
-- Indexes for table `shop_products`
--
ALTER TABLE `shop_products`
  ADD PRIMARY KEY (`shopid`,`productID`),
  ADD UNIQUE KEY `productID` (`productID`);

--
-- Indexes for table `user_credentials`
--
ALTER TABLE `user_credentials`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `userId` (`userId`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `wishlist_products`
--
ALTER TABLE `wishlist_products`
  ADD PRIMARY KEY (`wishlistid`,`productid`),
  ADD KEY `productid` (`productid`);

--
-- Indexes for table `wishlist_user`
--
ALTER TABLE `wishlist_user`
  ADD PRIMARY KEY (`wishlistid`),
  ADD UNIQUE KEY `wishlistid` (`wishlistid`),
  ADD UNIQUE KEY `userid` (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `ratingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_products`
--
ALTER TABLE `cart_products`
  ADD CONSTRAINT `cart_products_ibfk_1` FOREIGN KEY (`cartId`) REFERENCES `cart_user` (`cartId`),
  ADD CONSTRAINT `cart_products_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product_details` (`productid`);

--
-- Constraints for table `cart_user`
--
ALTER TABLE `cart_user`
  ADD CONSTRAINT `cart_user_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user_details` (`userId`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `user_details` (`userId`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`paymentId`) REFERENCES `payment_details` (`paymentId`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `order_details` (`orderId`),
  ADD CONSTRAINT `order_products_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product_details` (`productid`);

--
-- Constraints for table `product_color`
--
ALTER TABLE `product_color`
  ADD CONSTRAINT `product_color_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `product_details` (`productid`);

--
-- Constraints for table `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `product_details_ibfk_1` FOREIGN KEY (`productCat`) REFERENCES `product_category` (`categoryid`);

--
-- Constraints for table `product_keywords`
--
ALTER TABLE `product_keywords`
  ADD CONSTRAINT `product_keywords_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `product_details` (`productid`);

--
-- Constraints for table `shop_ownership`
--
ALTER TABLE `shop_ownership`
  ADD CONSTRAINT `shop_ownership_ibfk_1` FOREIGN KEY (`shopid`) REFERENCES `shop_details` (`shopid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shop_ownership_ibfk_2` FOREIGN KEY (`ownerid`) REFERENCES `user_details` (`userId`);

--
-- Constraints for table `shop_products`
--
ALTER TABLE `shop_products`
  ADD CONSTRAINT `shop_products_ibfk_1` FOREIGN KEY (`shopid`) REFERENCES `shop_details` (`shopid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `shop_products_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product_details` (`productid`) ON UPDATE CASCADE;

--
-- Constraints for table `user_credentials`
--
ALTER TABLE `user_credentials`
  ADD CONSTRAINT `user_credentials_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user_details` (`userId`);

--
-- Constraints for table `wishlist_products`
--
ALTER TABLE `wishlist_products`
  ADD CONSTRAINT `wishlist_products_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `product_details` (`productid`),
  ADD CONSTRAINT `wishlist_products_ibfk_2` FOREIGN KEY (`wishlistid`) REFERENCES `wishlist_user` (`wishlistid`);

--
-- Constraints for table `wishlist_user`
--
ALTER TABLE `wishlist_user`
  ADD CONSTRAINT `wishlist_user_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user_details` (`userId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
