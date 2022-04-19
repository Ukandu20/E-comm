-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2022 at 04:16 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `sessionId` varchar(100) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `Name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `line1` varchar(50) DEFAULT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cart_item`
--

CREATE TABLE `cart_item` (
  `id` bigint(20) NOT NULL,
  `productId` bigint(20) NOT NULL,
  `cartId` bigint(20) NOT NULL,
  `sku` varchar(100) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `quantity` smallint(6) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` bigint(20) NOT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  `prod_cat` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `parentId`, `prod_cat`) VALUES
(1, 1, 'MENS'),
(2, 1, 'WOMENS');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` bigint(20) NOT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `sessionId` varchar(100) NOT NULL,
  `token` varchar(100) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `subTotal` float NOT NULL DEFAULT 0,
  `itemDiscount` float NOT NULL DEFAULT 0,
  `tax` float NOT NULL DEFAULT 0,
  `shipping` float NOT NULL DEFAULT 0,
  `total` float NOT NULL DEFAULT 0,
  `promo` varchar(50) DEFAULT NULL,
  `discount` float NOT NULL DEFAULT 0,
  `grandTotal` float NOT NULL DEFAULT 0,
  `firstName` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `line1` varchar(50) DEFAULT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `id` bigint(20) NOT NULL,
  `productId` bigint(20) NOT NULL,
  `orderId` bigint(20) NOT NULL,
  `sku` varchar(100) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `quantity` smallint(6) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `title` varchar(75) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT 0,
  `sku` varchar(100) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `quantity` smallint(6) NOT NULL DEFAULT 0,
  `shop` tinyint(1) NOT NULL DEFAULT 0,
  `startsAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `endsAt` datetime DEFAULT NULL,
  `image` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `userId`, `title`, `type`, `sku`, `price`, `discount`, `quantity`, `shop`, `startsAt`, `endsAt`, `image`) VALUES
(1, 1, 'Mens Gold watch', 0, '1234567ABC', 200, 5, 250, 0, NULL, NULL, ''),
(3, 5, 'womens watch', 0, '1234567ABD', 200, 10, 32767, 0, '2022-04-17 22:28:23', NULL, ''),
(4, 7, 'Womens Silver Watch', 0, '1234567AB3', 200, 10, 10000, 0, '2022-04-18 09:39:25', NULL, ''),
(5, 13, 'Silver Watch', 0, '1234566ABD', 85, 0, 10000, 0, '2022-04-18 11:28:41', NULL, ''),
(6, 15, 'Blue Sea ', 0, '1234363ABC', 85, 0, 10000, 0, '2022-04-18 22:15:29', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `orderId` bigint(20) NOT NULL,
  `code` varchar(100) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT 0,
  `mode` smallint(6) NOT NULL DEFAULT 0,
  `status` smallint(6) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `user_type` varchar(255) NOT NULL DEFAULT 'user',
  `createdAt` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `Name`, `email`, `password`, `user_type`, `createdAt`) VALUES
(1, 'Okek', 'okechiukandu@gmail.com', 'ff1ccf57e98c817df1efcd9fe44a8aeb', 'user', '2022-04-18'),
(2, 'dan', 'we@abc.com', '7d8ca47bbe17ba692ed007c859ba51b1', 'user', '2022-04-18'),
(5, 'dan', 'ukandu@uwindsor.ca', 'd8578edf8458ce06fbc5bb76a58c5ca4', 'user', '2022-04-18'),
(7, 'James Greg', 'Jgreg@gmail.com', 'ff1ccf57e98c817df1efcd9fe44a8aeb', 'user\r\n', '2022-04-18'),
(8, 'gr', 'wer@gmail.com', 'ff1ccf57e98c817df1efcd9fe44a8aeb', 'user', '2022-04-18'),
(9, 'gr', 'dan@gmail.com', 'd692bc40d83423d24d3a37582f58468c', 'user', '2022-04-18'),
(10, 'me', 'too@hotmail.com', 'ab86a1e1ef70dff97959067b723c5c24', 'user', '2022-04-18'),
(11, 'qe', 'okechiukandu62@gmail.com', '4d6e7051b02397d7733ea9a222fdb8e0', 'user', '2022-04-18'),
(12, 'Walter White', 'wwhite@gmail.com', 'a0a43335f4f4cf78c1ed515864da1f8c', 'user', '2022-04-18'),
(13, 'admin01', 'admin01@gmail.com', '18c6d818ae35a3e8279b5330eda01498', 'admin', '2022-04-18'),
(14, 'James Tuna', 'Tuna@gmail.com', 'Tuna', 'user', '2022-04-18'),
(15, 'Caroline Denvers', 'Denvers@hotmail.com', 'Denvers32', 'user', '2022-04-18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cart_user` (`userId`);

--
-- Indexes for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cart_item_product` (`productId`),
  ADD KEY `idx_cart_item_cart` (`cartId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `idx_category_parent` (`parentId`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_order_user` (`userId`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_order_item_product` (`productId`),
  ADD KEY `idx_order_item_order` (`orderId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_product_user` (`userId`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_transaction_user` (`userId`),
  ADD KEY `idx_transaction_order` (`orderId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `fk_cart_item_cart` FOREIGN KEY (`cartId`) REFERENCES `cart` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cart_item_product` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `fk_category_parent` FOREIGN KEY (`parentId`) REFERENCES `category` (`cat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_order_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `fk_order_item_order` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_item_product` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `fk_transaction_order` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_transaction_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;
