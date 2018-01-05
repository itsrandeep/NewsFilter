-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 10, 2017 at 08:13 AM
-- Server version: 5.7.20-0ubuntu0.17.10.1
-- PHP Version: 7.1.8-1ubuntu1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `try1`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cid` int(12) NOT NULL,
  `category_name` varchar(17) NOT NULL,
  `rss_from` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cid`, `category_name`, `rss_from`) VALUES
(1, 'India', 'toi'),
(2, 'World', 'toi'),
(28, 'Business', 'toi'),
(29, 'Cricket', 'toi'),
(30, 'Sports', 'toi'),
(31, 'Health', 'toi'),
(32, 'Science', 'toi'),
(33, 'Tech', 'toi'),
(34, 'Education', 'toi'),
(35, 'Entertainment', 'toi'),
(36, 'Books', 'n18'),
(37, 'World', 'n18'),
(38, 'Football', 'n18'),
(39, 'Hockey', 'n18'),
(40, 'Politics', 'n18'),
(41, 'Movies', 'n18'),
(42, 'Tech', 'n18');

-- --------------------------------------------------------

--
-- Table structure for table `sources`
--

CREATE TABLE `sources` (
  `sourceid` int(30) NOT NULL,
  `source_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sources`
--

INSERT INTO `sources` (`sourceid`, `source_name`) VALUES
(1, 'the-new-york-times'),
(2, 'bbc-news '),
(3, 'buzzfeed'),
(4, 'cnn'),
(5, 'engadget'),
(7, 'independent'),
(8, 'the-times-of-india'),
(9, 'reddit-r-all'),
(10, 'the-hindu'),
(11, 'mtv-news'),
(12, 'mashable'),
(13, 'techcrunch'),
(14, 'techradar');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `topicid` int(50) NOT NULL,
  `topic_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`topicid`, `topic_name`) VALUES
(1, 'Rahul Dravid'),
(2, 'Linux'),
(3, 'Rohit Sharma'),
(4, 'Louis Tomlinson'),
(5, 'Taylor Swift');

-- --------------------------------------------------------

--
-- Table structure for table `ucategories`
--

CREATE TABLE `ucategories` (
  `uid` int(25) NOT NULL,
  `cid` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ucategories`
--

INSERT INTO `ucategories` (`uid`, `cid`) VALUES
(3, 1),
(3, 31),
(3, 32),
(3, 33),
(3, 40),
(4, 2),
(4, 35);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(200) NOT NULL,
  `fname` varchar(10) NOT NULL,
  `lname` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `username` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `fname`, `lname`, `email`, `password`, `username`) VALUES
(1, 'First', 'User', 'firstuser@project.com', '23b431acfeb41e15d466d75de822307c', 'firstuser'),
(2, 'Rohit', 'Sharma', 'rohits@gmail.com', 'f69c2579d2bd4fb4944264a41bf21648', 'rohits'),
(3, 'Rahul', 'Dravid', 'rahuldravid@gmail.com', '75373e64b314c407874226fe8288bf1b', 'dravid'),
(4, 'Bebe', 'Rexha', 'beberexha@gmail.com', 'c7f73f26e20c9e1abd19899341e92cb1', 'beberexha'),
(5, 'Jatin', 'Panwar', 'adads@afsdkj.com', '3dbe00a167653a1aaee01d93e77e730e', 'jatin');

-- --------------------------------------------------------

--
-- Table structure for table `usources`
--

CREATE TABLE `usources` (
  `uid` int(11) NOT NULL,
  `sourceid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usources`
--

INSERT INTO `usources` (`uid`, `sourceid`) VALUES
(4, 11),
(3, 8),
(3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `utopics`
--

CREATE TABLE `utopics` (
  `uid` int(50) NOT NULL,
  `topicid` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utopics`
--

INSERT INTO `utopics` (`uid`, `topicid`) VALUES
(3, 1),
(4, 2),
(2, 3),
(2, 2),
(2, 1),
(4, 4),
(4, 4),
(2, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `sources`
--
ALTER TABLE `sources`
  ADD PRIMARY KEY (`sourceid`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`topicid`);

--
-- Indexes for table `ucategories`
--
ALTER TABLE `ucategories`
  ADD KEY `categorymap` (`cid`),
  ADD KEY `umap` (`uid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `usources`
--
ALTER TABLE `usources`
  ADD KEY `usermap` (`uid`),
  ADD KEY `sourcemap` (`sourceid`);

--
-- Indexes for table `utopics`
--
ALTER TABLE `utopics`
  ADD KEY `topic_mapping` (`topicid`),
  ADD KEY `user_mapping` (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cid` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `sources`
--
ALTER TABLE `sources`
  MODIFY `sourceid` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `topicid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ucategories`
--
ALTER TABLE `ucategories`
  ADD CONSTRAINT `categorymap` FOREIGN KEY (`cid`) REFERENCES `categories` (`cid`),
  ADD CONSTRAINT `umap` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`);

--
-- Constraints for table `usources`
--
ALTER TABLE `usources`
  ADD CONSTRAINT `sourcemap` FOREIGN KEY (`sourceid`) REFERENCES `sources` (`sourceid`),
  ADD CONSTRAINT `usermap` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`);

--
-- Constraints for table `utopics`
--
ALTER TABLE `utopics`
  ADD CONSTRAINT `topic_mapping` FOREIGN KEY (`topicid`) REFERENCES `topics` (`topicid`),
  ADD CONSTRAINT `user_mapping` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
