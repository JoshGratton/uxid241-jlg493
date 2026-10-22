-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 22, 2026 at 03:49 PM
-- Server version: 8.0.44
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cookbook`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(2, 'Beef'),
(1, 'Chicken'),
(4, 'Fish & Seafood'),
(5, 'Pork'),
(6, 'Turkey'),
(3, 'Vegetarian');

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int NOT NULL,
  `recipe_id` int NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `quantity` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `recipe_id`, `sort_order`, `quantity`, `unit`, `name`, `full_text`) VALUES
(1, 1, 1, '¾', 'cup', 'Jasmine Rice', '¾ cup Jasmine Rice'),
(2, 1, 2, '¾', 'lb', 'Carrots', '¾ lb Carrots'),
(3, 1, 3, '2', 'cloves', 'Garlic', '2 cloves Garlic'),
(4, 1, 4, '1', 'bunch', 'Kale', '1 bunch Kale'),
(5, 1, 5, '1', NULL, 'Lime', '1 Lime'),
(6, 1, 6, '1', NULL, 'Orange', '1 Orange'),
(7, 1, 7, '2', 'Tbsps', 'Butter', '2 Tbsps Butter'),
(8, 1, 8, '4', NULL, 'Boneless, Skinless Chicken Breasts', '4 Boneless, Skinless Chicken Breasts'),
(9, 1, 9, '1', 'Tbsp', 'Ancho Chile Paste', '1 Tbsp Ancho Chile Paste'),
(10, 1, 10, '2', 'Tbsps', 'Crème Fraîche', '2 Tbsps Crème Fraîche'),
(11, 1, 11, '3', 'Tbsps', 'Golden Raisins', '3 Tbsps Golden Raisins'),
(12, 2, 1, '2', NULL, 'Beef Medallions', '2 Beef Medallions'),
(13, 2, 2, '2', 'cloves', 'Garlic', '2 cloves Garlic'),
(14, 2, 3, '1', NULL, 'Shallot', '1 Shallot'),
(15, 2, 4, '1', 'bunch', 'Kale', '1 bunch Kale'),
(16, 2, 5, '2', 'Tbsps', 'Butter', '2 Tbsps Butter'),
(17, 2, 6, '1', 'Tbsp', 'Dijon Mustard', '1 Tbsp Dijon Mustard'),
(18, 2, 7, '2', 'Tbsps', 'Verjus Blanc', '2 Tbsps Verjus Blanc'),
(19, 2, 8, '4', 'oz', 'Cremini Mushrooms', '4 oz Cremini Mushrooms'),
(20, 2, 9, '¾', 'lb', 'Yukon Gold Potatoes', '¾ lb Yukon Gold Potatoes'),
(21, 3, 1, '2', 'oz', 'Asiago Cheese', '2 oz Asiago Cheese'),
(22, 3, 2, '1', 'piece', 'Focaccia Bread', '1 Piece Focaccia Bread'),
(23, 3, 3, '1', NULL, '8-Ounce Can Tomato Sauce', '1 8-Ounce Can Tomato Sauce'),
(24, 3, 4, '½', 'lb', 'Fresh Mozzarella Cheese', '½ lb Fresh Mozzarella Cheese'),
(25, 3, 5, '2', NULL, 'Clementines', '2 Clementines'),
(26, 3, 6, '2', 'cloves', 'Garlic', '2 cloves Garlic'),
(27, 3, 7, '2', NULL, 'Romaine Lettuce Hearts', '2 Romaine Lettuce Hearts'),
(28, 3, 8, '1', 'lb', 'Broccoli', '1 lb Broccoli'),
(29, 3, 9, '1', 'oz', 'Golden Or Red Sweet Piquante Peppers', '1 oz Golden Or Red Sweet Piquante Peppers'),
(30, 3, 10, '2', 'Tbsps', 'Crème Fraîche', '2 Tbsps Crème Fraîche'),
(31, 3, 11, '1', 'Tbsp', 'Dijon Mustard', '1 Tbsp Dijon Mustard'),
(32, 3, 12, '½', 'cup', 'Basil & Cashew Pesto (Contains Pine Nuts)', '½ cup Basil & Cashew Pesto (Contains Pine Nuts)'),
(33, 3, 13, '⅓', 'cup', 'Shaved Parmesan Cheese', '⅓ cup Shaved Parmesan Cheese'),
(34, 3, 14, '1', 'Tbsp', 'Italian Seasoning (Whole Dried Basil, Sage, Oregano, Savory, Rosemary, Thyme, & Marjoram)', '1 Tbsp Italian Seasoning (Whole Dried Basil, Sage, Oregano, Savory, Rosemary, Thyme, & Marjoram)'),
(35, 4, 1, '2', 'Tbsps', 'Mayonnaise', '2 Tbsps Mayonnaise'),
(36, 4, 2, '1½', 'lbs', 'Pizza Dough', '1½ lbs Pizza Dough'),
(37, 4, 3, '3', 'cloves', 'Garlic', '3 cloves Garlic'),
(38, 4, 4, '1', NULL, 'Romaine Lettuce Heart', '1 Romaine Lettuce Heart'),
(39, 4, 5, '1', 'lb', 'Broccoli', '1 lb Broccoli'),
(40, 4, 6, '1', 'cup', 'Part-Skim Ricotta Cheese', '1 cup Part-Skim Ricotta Cheese'),
(41, 4, 7, '1', NULL, '8-Ounce Can Tomato Sauce', '1 8-Ounce Can Tomato Sauce'),
(42, 4, 8, '½', 'lb', 'Fresh Mozzarella Cheese', '½ lb Fresh Mozzarella Cheese'),
(43, 4, 9, '¼', 'cup', 'Grated Parmesan Cheese', '¼ cup Grated Parmesan Cheese'),
(44, 4, 10, '2', 'oz', 'Black Cerignola Olives', '2 oz Black Cerignola Olives'),
(45, 4, 11, '1', 'Tbsp', 'Italian Seasoning (Whole Dried Basil, Sage, Oregano, Savory, Rosemary, Thyme, & Marjoram)', '1 Tbsp Italian Seasoning (Whole Dried Basil, Sage, Oregano, Savory, Rosemary, Thyme, & Marjoram)'),
(46, 4, 12, '1', NULL, 'Lemon', '1 Lemon'),
(47, 5, 1, '6', 'oz', 'Bucatini Pasta', '6 oz Bucatini Pasta'),
(48, 5, 2, '½', 'lb', 'Broccoli', '½ lb Broccoli'),
(49, 5, 3, '2', 'cloves', 'Garlic', '2 cloves Garlic'),
(50, 5, 4, '¼', 'cup', 'Heavy Cream', '¼ cup Heavy Cream'),
(51, 5, 5, '2', 'Tbsps', 'Verjus Blanc', '2 Tbsps Verjus Blanc'),
(52, 5, 6, '2', 'Tbsps', 'Crème Fraîche', '2 Tbsps Crème Fraîche'),
(53, 5, 7, '¼', 'tsp', 'Crushed Red Pepper Flakes', '¼ tsp Crushed Red Pepper Flakes'),
(54, 5, 8, '3', 'Tbsps', 'All-Purpose Flour', '3 Tbsps All-Purpose Flour'),
(55, 5, 9, '¼', 'cup', 'Grated Pecorino Cheese', '¼ cup Grated Pecorino Cheese'),
(56, 6, 1, '6', 'oz', 'Bucatini Pasta', '6 oz Bucatini Pasta'),
(57, 6, 2, '1', NULL, '14-Ounce Can Datterini Tomatoes', '1 14-Ounce Can Datterini Tomatoes'),
(58, 6, 3, '2', 'cloves', 'Garlic', '2 cloves Garlic'),
(59, 6, 4, '2', 'Tbsps', 'Butter', '2 Tbsps Butter'),
(60, 6, 5, '1', 'Tbsp', 'Capers', '1 Tbsp Capers'),
(61, 6, 6, '1', 'lb', 'Broccoli', '1 lb Broccoli'),
(62, 6, 7, '¾', 'oz', 'Grana Padano Cheese', '¾ oz Grana Padano Cheese'),
(63, 6, 8, '1', 'oz', 'Kalamata Olives', '1 oz Kalamata Olives'),
(64, 6, 9, '¼', 'tsp', 'Crushed Red Pepper Flakes', '¼ tsp Crushed Red Pepper Flakes'),
(65, 6, 10, '1', 'Tbsp', 'Italian Seasoning (Whole Dried Basil, Sage, Oregano, Savory, Rosemary, Thyme, & Marjoram)', '1 Tbsp Italian Seasoning (Whole Dried Basil, Sage, Oregano, Savory, Rosemary, Thyme, & Marjoram)'),
(66, 7, 1, '1', 'bunch', 'Kale', '1 bunch Kale'),
(67, 7, 2, '1', NULL, 'Lime', '1 Lime'),
(68, 7, 3, '8', NULL, 'Flour Tortillas', '8 Flour Tortillas'),
(69, 7, 4, '¾', 'cup', 'Jasmine Rice', '¾ cup Jasmine Rice'),
(70, 7, 5, '1', NULL, '28-Ounce Can Whole Peeled Tomatoes', '1 28-Ounce Can Whole Peeled Tomatoes'),
(71, 7, 6, '4', 'oz', 'Cremini Mushrooms', '4 oz Cremini Mushrooms'),
(72, 7, 7, '3', 'cloves', 'Garlic', '3 cloves Garlic'),
(73, 7, 8, '1', NULL, 'Yellow Onion', '1 Yellow Onion'),
(74, 7, 9, '1', 'bunch', 'Chives', '1 bunch Chives'),
(75, 7, 10, '2', 'Tbsps', 'Ancho Chile Paste', '2 Tbsps Ancho Chile Paste'),
(76, 7, 11, '1', 'Tbsp', 'Mexican Spice Blend (Ancho Chile Powder, Sweet Paprika, Garlic Powder, Ground Cumin, & Whole Mexican Oregano)', '1 Tbsp Mexican Spice Blend (Ancho Chile Powder, Sweet Paprika, Garlic Powder, Ground Cumin, & Whole Mexican Oregano)'),
(77, 7, 12, '½', 'lb', 'White Cheddar Cheese', '½ lb White Cheddar Cheese'),
(78, 7, 13, '½', 'cup', 'Sour Cream', '½ cup Sour Cream'),
(79, 8, 1, '1½', 'lbs', 'Sweet Potatoes', '1½ lbs Sweet Potatoes'),
(80, 8, 2, '4', NULL, 'Potato Rolls', '4 Potato Rolls'),
(81, 8, 3, '¼', 'cup', 'Mayonnaise', '¼ cup Mayonnaise'),
(82, 8, 4, '21', 'oz', 'Wild Alaskan Pollock Fillets', '21 oz Wild Alaskan Pollock Fillets'),
(83, 8, 5, '2', NULL, 'Cage-Free Farm Eggs', '2 Cage-Free Farm Eggs'),
(84, 8, 6, '2', 'Tbsps', 'Sweet Pickle Relish', '2 Tbsps Sweet Pickle Relish'),
(85, 8, 7, '1', NULL, 'Romaine Lettuce Heart', '1 Romaine Lettuce Heart'),
(86, 8, 8, '1', 'Tbsp', 'Weeknight Hero Spice Blend (Garlic Powder, Onion Powder, Smoked Paprika, & Whole Dried Parsley)', '1 Tbsp Weeknight Hero Spice Blend (Garlic Powder, Onion Powder, Smoked Paprika, & Whole Dried Parsley)'),
(87, 8, 9, '1¼', 'cups', 'Panko Breadcrumbs', '1¼ cups Panko Breadcrumbs'),
(88, 8, 10, '¼', 'cup', 'Creamy Mustard Sauce', '¼ cup Creamy Mustard Sauce'),
(89, 9, 1, '10', 'oz', 'Chopped Chicken Breast', '10 oz Chopped Chicken Breast'),
(90, 9, 2, '1', 'head', 'Baby Bok Choy', '1 head Baby Bok Choy'),
(91, 9, 3, '¾', 'cup', 'Jasmine Rice', '¾ cup Jasmine Rice'),
(92, 9, 4, '2', 'cloves', 'Garlic', '2 cloves Garlic'),
(93, 9, 5, '1', 'Tbsp', 'Rice Vinegar', '1 Tbsp Rice Vinegar'),
(94, 9, 6, '1', NULL, '1-Inch Piece Ginger', '1 1-Inch Piece Ginger'),
(95, 9, 7, '1', 'tsp', 'Sriracha', '1 tsp Sriracha'),
(96, 9, 8, '1', 'Tbsp', 'Honey', '1 Tbsp Honey'),
(97, 9, 9, '1', 'Tbsp', 'Sesame Oil', '1 Tbsp Sesame Oil'),
(98, 9, 10, '¼', 'cup', 'Cornstarch', '¼ cup Cornstarch'),
(99, 9, 11, '2', 'Tbsps', 'Hoisin Sauce', '2 Tbsps Hoisin Sauce'),
(100, 10, 1, '½', 'lb', 'Green Cabbage', '½ lb Green Cabbage'),
(101, 10, 2, '1', 'Tbsp', 'Rice Vinegar', '1 Tbsp Rice Vinegar'),
(102, 10, 3, '4', NULL, 'Boneless, Center-Cut Pork Chops', '4 Boneless, Center-Cut Pork Chops'),
(103, 10, 4, '2', NULL, 'Carrots', '2 Carrots'),
(104, 10, 5, '1', 'bunch', 'Chives', '1 bunch Chives'),
(105, 10, 6, '2', 'Tbsps', 'Tahini', '2 Tbsps Tahini'),
(106, 10, 7, '2', 'Tbsps', 'Soy Sauce', '2 Tbsps Soy Sauce'),
(107, 10, 8, '¾', 'lb', 'Fresh Wonton Noodles', '¾ lb Fresh Wonton Noodles'),
(108, 10, 9, '2', 'tsps', 'Sambal Oelek', '2 tsps Sambal Oelek'),
(109, 10, 10, '1', NULL, '1-Inch Piece Ginger', '1 1-Inch Piece Ginger'),
(110, 10, 11, '¼', 'cup', 'Hoisin Sauce', '¼ cup Hoisin Sauce'),
(111, 11, 1, '4', NULL, 'Carrots', '4 Carrots'),
(112, 11, 2, '6', 'oz', 'Radishes', '6 oz Radishes'),
(113, 11, 3, '1', NULL, 'Lemon', '1 Lemon'),
(114, 11, 4, '2', 'cloves', 'Garlic', '2 cloves Garlic'),
(115, 11, 5, '1', 'bunch', 'Parsley', '1 bunch Parsley'),
(116, 11, 6, '2', 'Tbsps', 'Butter', '2 Tbsps Butter'),
(117, 11, 7, '2', 'Tbsps', 'Honey', '2 Tbsps Honey'),
(118, 11, 8, '4', NULL, 'Skin-On Barramundi Fillets', '4 Skin-On Barramundi Fillets'),
(119, 11, 9, '½', 'cup', 'Plain Greek Yogurt', '½ cup Plain Greek Yogurt'),
(120, 11, 10, '1⅛', 'lbs', 'Yukon Gold Potatoes', '1⅛ lbs Yukon Gold Potatoes'),
(121, 11, 11, '1', 'Tbsp', 'Za\'atar Seasoning (Ground Sumac, Sesame Seeds, Salt, Ground Thyme, Whole Dried Oregano, & Crushed Aleppo Pepper)', '1 Tbsp Za\'atar Seasoning (Ground Sumac, Sesame Seeds, Salt, Ground Thyme, Whole Dried Oregano, & Crushed Aleppo Pepper)'),
(122, 12, 1, '1', NULL, 'Pie Crust (in Tin)', '1 Pie Crust (in Tin)'),
(123, 12, 2, '1', 'bunch', 'Kale', '1 bunch Kale'),
(124, 12, 3, '2', 'cloves', 'Garlic', '2 cloves Garlic'),
(125, 12, 4, '1', NULL, 'Shallot', '1 Shallot'),
(126, 12, 5, '½', 'cup', 'Heavy Cream', '½ cup Heavy Cream'),
(127, 12, 6, '1', NULL, 'Lemon', '1 Lemon'),
(128, 12, 7, '1', NULL, 'Apple', '1 Apple'),
(129, 12, 8, '4', NULL, 'Cage-Free Farm Eggs', '4 Cage-Free Farm Eggs'),
(130, 12, 9, '1', 'cup', 'Part-Skim Ricotta Cheese', '1 cup Part-Skim Ricotta Cheese'),
(131, 12, 10, '1', NULL, 'Romaine Lettuce Heart', '1 Romaine Lettuce Heart'),
(132, 12, 11, '2', 'Tbsps', 'Sliced Roasted Almonds', '2 Tbsps Sliced Roasted Almonds'),
(133, 12, 12, '1', 'Tbsp', 'Cajun Spice Blend (Smoked Paprika, Ground Yellow Mustard, Onion Powder, Garlic Powder, Whole Dried Oregano, Whole Dried ', '1 Tbsp Cajun Spice Blend (Smoked Paprika, Ground Yellow Mustard, Onion Powder, Garlic Powder, Whole Dried Oregano, Whole Dried Thyme, & Cayenne Pepper)'),
(134, 12, 13, '2', 'Tbsps', 'Crème Fraîche', '2 Tbsps Crème Fraîche'),
(135, 13, 1, '2', NULL, 'Skin-On Barramundi Fillets', '2 Skin-On Barramundi Fillets'),
(136, 13, 2, '1', NULL, 'Sweet Potato', '1 Sweet Potato'),
(137, 13, 3, '1', 'bunch', 'Kale', '1 bunch Kale'),
(138, 13, 4, '1', NULL, 'Avocado', '1 Avocado'),
(139, 13, 5, '1', NULL, 'Lime', '1 Lime'),
(140, 13, 6, '1', NULL, 'Navel Orange', '1 Navel Orange'),
(141, 13, 7, '1', 'clove', 'Garlic', '1 clove Garlic'),
(142, 13, 8, '2', 'Tbsps', 'Roasted Pepitas', '2 Tbsps Roasted Pepitas'),
(143, 13, 9, '1', 'Tbsp', 'Mexican Spice Blend (Ancho Chile Powder, Smoked Paprika, Garlic Powder, Ground Cumin, & Dried Mexican Oregano)', '1 Tbsp Mexican Spice Blend (Ancho Chile Powder, Smoked Paprika, Garlic Powder, Ground Cumin, & Dried Mexican Oregano)'),
(144, 14, 1, '4', NULL, 'Flour Tortillas', '4 Flour Tortillas'),
(145, 14, 2, '3', 'oz', 'Radishes', '3 oz Radishes'),
(146, 14, 3, '1', NULL, 'Orange', '1 Orange'),
(147, 14, 4, '¾', 'lb', 'Yukon Gold Potatoes', '¾ lb Yukon Gold Potatoes'),
(148, 14, 5, '6', 'oz', 'Cremini Mushrooms', '6 oz Cremini Mushrooms'),
(149, 14, 6, '1', NULL, 'Shallot', '1 Shallot'),
(150, 14, 7, '3', 'Tbsps', 'Roasted Peanuts', '3 Tbsps Roasted Peanuts'),
(151, 14, 8, '¼', 'cup', 'Sour Cream', '¼ cup Sour Cream'),
(152, 14, 9, '1', 'oz', 'Sliced Pickled Jalapeño Pepper', '1 oz Sliced Pickled Jalapeño Pepper'),
(153, 14, 10, '1', 'oz', 'Golden Or Red Sweet Piquante Peppers', '1 oz Golden Or Red Sweet Piquante Peppers'),
(154, 14, 11, '1', 'Tbsp', 'Spanish Spice Blend (Smoked Paprika, Ground Cumin, Ground Coriander, Dried Mexican Oregano, Cayenne Pepper, & Ground Cin', '1 Tbsp Spanish Spice Blend (Smoked Paprika, Ground Cumin, Ground Coriander, Dried Mexican Oregano, Cayenne Pepper, & Ground Cinnamon)'),
(155, 14, 12, '1', NULL, 'Romaine Lettuce Heart', '1 Romaine Lettuce Heart'),
(156, 14, 13, '2', 'Tbsps', 'Rice Vinegar', '2 Tbsps Rice Vinegar'),
(157, 15, 1, '1½', 'lbs', 'Sweet Potatoes', '1½ lbs Sweet Potatoes'),
(158, 15, 2, '1', 'lb', 'Broccoli', '1 lb Broccoli'),
(159, 15, 3, '1', NULL, 'Lemon', '1 Lemon'),
(160, 15, 4, '2', 'Tbsps', 'Butter', '2 Tbsps Butter'),
(161, 15, 5, '¼', 'cup', 'Mayonnaise', '¼ cup Mayonnaise'),
(162, 15, 6, '4', NULL, 'Boneless, Skinless Chicken Breasts', '4 Boneless, Skinless Chicken Breasts'),
(163, 15, 7, '¼', 'cup', 'All-Purpose Flour', '¼ cup All-Purpose Flour'),
(164, 15, 8, '½', 'cup', 'Grated Parmesan Cheese', '½ cup Grated Parmesan Cheese'),
(165, 15, 9, '1', 'Tbsp', 'Weeknight Hero Spice Blend (Garlic Powder, Onion Powder, Smoked Paprika, & Whole Dried Parsley)', '1 Tbsp Weeknight Hero Spice Blend (Garlic Powder, Onion Powder, Smoked Paprika, & Whole Dried Parsley)'),
(166, 16, 1, '10', 'oz', 'Ground Beef', '10 oz Ground Beef'),
(167, 16, 2, '2', NULL, 'Potato Buns', '2 Potato Buns'),
(168, 16, 3, '1', NULL, 'Sweet Potato', '1 Sweet Potato'),
(169, 16, 4, '2', 'oz', 'Cheddar Cheese', '2 oz Cheddar Cheese'),
(170, 16, 5, '1', 'oz', 'Sweet Piquante Peppers', '1 oz Sweet Piquante Peppers'),
(171, 16, 6, '2', 'Tbsps', 'Mayonnaise', '2 Tbsps Mayonnaise'),
(172, 16, 7, '1', 'tsp', 'Pimento Cheese Spice Blend (Garlic Powder, Ground Yellow Mustard, & Sugar)', '1 tsp Pimento Cheese Spice Blend (Garlic Powder, Ground Yellow Mustard, & Sugar)'),
(173, 17, 1, '6', NULL, 'Flour Tortillas', '6 Flour Tortillas'),
(174, 17, 2, '½', 'lb', 'Green Cabbage', '½ lb Green Cabbage'),
(175, 17, 3, '1', NULL, 'Orange', '1 Orange'),
(176, 17, 4, '1', NULL, 'Lime', '1 Lime'),
(177, 17, 5, '3', 'oz', 'Radishes', '3 oz Radishes'),
(178, 17, 6, '1', 'clove', 'Garlic', '1 clove Garlic'),
(179, 17, 7, '¾', 'lb', 'Yukon Gold Potatoes', '¾ lb Yukon Gold Potatoes'),
(180, 17, 8, '10', 'oz', 'Ground Pork Chorizo', '10 oz Ground Pork Chorizo'),
(181, 17, 9, '2', 'Tbsps', 'Crème Fraîche', '2 Tbsps Crème Fraîche'),
(182, 17, 10, '2', 'Tbsps', 'Grated Cotija Cheese', '2 Tbsps Grated Cotija Cheese'),
(183, 18, 1, '2', NULL, 'Cage-Free Farm Eggs', '2 Cage-Free Farm Eggs'),
(184, 18, 2, '½', 'cup', 'Fregola Sarda Pasta', '½ cup Fregola Sarda Pasta'),
(185, 18, 3, '1', 'clove', 'Garlic', '1 clove Garlic'),
(186, 18, 4, '1', 'lb', 'Broccoli', '1 lb Broccoli'),
(187, 18, 5, '1', NULL, 'Red Onion', '1 Red Onion'),
(188, 18, 6, '1', 'bunch', 'Mint', '1 bunch Mint'),
(189, 18, 7, '2', 'Tbsps', 'Tahini', '2 Tbsps Tahini'),
(190, 18, 8, '1', 'oz', 'Pecorino Romano Cheese', '1 oz Pecorino Romano Cheese'),
(191, 18, 9, '1', 'Tbsp', 'Za\'atar Seasoning (Ground Sumac, Sesame Seeds, Salt, Ground Thyme, Whole Dried Oregano, & Crushed Aleppo Pepper)', '1 Tbsp Za\'atar Seasoning (Ground Sumac, Sesame Seeds, Salt, Ground Thyme, Whole Dried Oregano, & Crushed Aleppo Pepper)'),
(192, 18, 10, '3', 'Tbsps', 'Roasted Almonds', '3 Tbsps Roasted Almonds'),
(193, 18, 11, '1', NULL, 'Lemon', '1 Lemon'),
(194, 19, 1, '⅔', 'cup', 'Cracked Freekeh', '⅔ cup Cracked Freekeh'),
(195, 19, 2, '½', 'cup', 'Sheep\'s Milk Yogurt', '½ cup Sheep\'s Milk Yogurt'),
(196, 19, 3, '2', NULL, 'Carrots', '2 Carrots'),
(197, 19, 4, '2', 'cloves', 'Garlic', '2 cloves Garlic'),
(198, 19, 5, '1', NULL, 'Lemon', '1 Lemon'),
(199, 19, 6, '1', 'bunch', 'Mint', '1 bunch Mint'),
(200, 19, 7, '2', NULL, 'Dried Medjool Dates', '2 Dried Medjool Dates'),
(201, 19, 8, '2', 'Tbsps', 'Pickled Peruvian Peppers', '2 Tbsps Pickled Peruvian Peppers'),
(202, 19, 9, '1¾', 'oz', 'Barrel-Aged Feta Cheese', '1¾ oz Barrel-Aged Feta Cheese'),
(203, 19, 10, '2', 'Tbsps', 'Roasted Almonds', '2 Tbsps Roasted Almonds'),
(204, 19, 11, '¼', 'tsp', 'Crushed Red Pepper Flakes', '¼ tsp Crushed Red Pepper Flakes'),
(205, 19, 12, '¾', 'lb', 'Brussels Sprouts', '¾ lb Brussels Sprouts'),
(206, 20, 1, '1', 'bunch', 'Kale', '1 bunch Kale'),
(207, 20, 2, '2', NULL, 'Cage-Free Farm Eggs', '2 Cage-Free Farm Eggs'),
(208, 20, 3, '2', 'cloves', 'Garlic', '2 cloves Garlic'),
(209, 20, 4, '1', 'head', 'Cauliflower', '1 head Cauliflower'),
(210, 20, 5, '1', NULL, 'Lemon', '1 Lemon'),
(211, 20, 6, '2', 'Tbsps', 'Butter', '2 Tbsps Butter'),
(212, 20, 7, '1', NULL, 'Shallot', '1 Shallot'),
(213, 20, 8, '1', 'Tbsp', 'Capers', '1 Tbsp Capers'),
(214, 20, 9, '3', 'Tbsps', 'Panko Breadcrumbs', '3 Tbsps Panko Breadcrumbs'),
(215, 20, 10, '¼', 'cup', 'Grated Parmesan Cheese', '¼ cup Grated Parmesan Cheese'),
(216, 21, 1, '2', NULL, 'Half Chickens', '2 Half Chickens'),
(217, 21, 2, '1', 'lb', 'Sweet Potatoes', '1 lb Sweet Potatoes'),
(218, 21, 3, '4', 'oz', 'Cranberries', '4 oz Cranberries'),
(219, 21, 4, '½', 'lb', 'Brussels Sprouts', '½ lb Brussels Sprouts'),
(220, 21, 5, '2', 'Tbsps', 'Apple Cider Vinegar', '2 Tbsps Apple Cider Vinegar'),
(221, 21, 6, '2', 'Tbsps', 'Sugar', '2 Tbsps Sugar'),
(222, 21, 7, '1', NULL, '1-Inch Piece Ginger', '1 1-Inch Piece Ginger'),
(223, 21, 8, '¼', 'cup', 'Roasted Walnuts', '¼ cup Roasted Walnuts'),
(224, 21, 9, '1', 'Tbsp', 'Weeknight Hero Spice Blend (Garlic Powder, Onion Powder, Smoked Paprika, & Whole Dried Parsley)', '1 Tbsp Weeknight Hero Spice Blend (Garlic Powder, Onion Powder, Smoked Paprika, & Whole Dried Parsley)'),
(225, 22, 1, '1', NULL, 'Pork Tenderloin', '1 Pork Tenderloin'),
(226, 22, 2, '½', 'lb', 'Broccoli', '½ lb Broccoli'),
(227, 22, 3, '2', 'cloves', 'Garlic', '2 cloves Garlic'),
(228, 22, 4, '1', NULL, 'Apple', '1 Apple'),
(229, 22, 5, '2', 'oz', 'Fontina Cheese', '2 oz Fontina Cheese'),
(230, 22, 6, '¼', 'cup', 'Milk', '¼ cup Milk'),
(231, 22, 7, '3', 'Tbsps', 'Panko Breadcrumbs', '3 Tbsps Panko Breadcrumbs'),
(232, 22, 8, '2', 'Tbsps', 'All-Purpose Flour', '2 Tbsps All-Purpose Flour'),
(233, 22, 9, '1', 'Tbsp', 'Apple Cider Vinegar', '1 Tbsp Apple Cider Vinegar'),
(234, 22, 10, '1', 'Tbsp', 'Southern Spice Blend (Onion Powder, Garlic Powder, Ground Yellow Mustard, Smoked Paprika, & Cayenne Pepper)', '1 Tbsp Southern Spice Blend (Onion Powder, Garlic Powder, Ground Yellow Mustard, Smoked Paprika, & Cayenne Pepper)'),
(235, 23, 1, '½', 'lb', 'Broccoli', '½ lb Broccoli'),
(236, 23, 2, '1', NULL, 'Lemon', '1 Lemon'),
(237, 23, 3, '2', 'cloves', 'Garlic', '2 cloves Garlic'),
(238, 23, 4, '1', 'Tbsp', 'Capers', '1 Tbsp Capers'),
(239, 23, 5, '1', 'Tbsp', 'Tomato Paste', '1 Tbsp Tomato Paste'),
(240, 23, 6, '¼', 'cup', 'Heavy Cream', '¼ cup Heavy Cream'),
(241, 23, 7, '1', 'Tbsp', 'Butter', '1 Tbsp Butter'),
(242, 23, 8, '6', 'oz', 'Whole Grain Pipe Rigate Pasta', '6 oz Whole Grain Pipe Rigate Pasta'),
(243, 23, 9, '2', 'oz', 'Roasted Piquillo Peppers', '2 oz Roasted Piquillo Peppers'),
(244, 23, 10, '2', 'Tbsps', 'Grated Parmesan Cheese', '2 Tbsps Grated Parmesan Cheese'),
(245, 23, 11, '2', 'Tbsps', 'Sliced Roasted Almonds', '2 Tbsps Sliced Roasted Almonds'),
(246, 23, 12, '1½', 'tsps', 'Calabrian Chile Paste', '1½ tsps Calabrian Chile Paste'),
(247, 24, 1, '1', NULL, 'Spaghetti Squash', '1 Spaghetti Squash'),
(248, 24, 2, '1', NULL, 'Lime Leaf', '1 Lime Leaf'),
(249, 24, 3, '½', 'cup', 'Jasmine Rice', '½ cup Jasmine Rice'),
(250, 24, 4, '1¾', 'cups', 'Light Coconut Milk', '1¾ cups Light Coconut Milk'),
(251, 24, 5, '1', NULL, 'Lime', '1 Lime'),
(252, 24, 6, '1', NULL, 'Yellow Onion', '1 Yellow Onion'),
(253, 24, 7, '1', 'bunch', 'Mint', '1 bunch Mint'),
(254, 24, 8, '2', 'Tbsps', 'Dried Mung Beans', '2 Tbsps Dried Mung Beans'),
(255, 24, 9, '1½', 'Tbsps', 'Yellow Curry Paste', '1½ Tbsps Yellow Curry Paste'),
(256, 24, 10, '1', NULL, '1-Inch Piece Ginger', '1 1-Inch Piece Ginger'),
(257, 24, 11, '1', 'Tbsp', 'Sugar', '1 Tbsp Sugar'),
(258, 24, 12, '½', 'lb', 'Baby Bok Choy', '½ lb Baby Bok Choy'),
(259, 25, 1, '1', NULL, 'Turkey Breast Roast', '1 Turkey Breast Roast'),
(260, 25, 2, '⅔', 'cup', 'Semi-Pearled Farro', '⅔ cup Semi-Pearled Farro'),
(261, 25, 3, '1', NULL, 'Apple', '1 Apple'),
(262, 25, 4, '1', NULL, 'Lemon', '1 Lemon'),
(263, 25, 5, '1', NULL, 'Endive', '1 Endive'),
(264, 25, 6, '1', 'bunch', 'Chives', '1 bunch Chives'),
(265, 25, 7, '2', 'Tbsps', 'Butter', '2 Tbsps Butter'),
(266, 25, 8, '1', NULL, 'Shallot', '1 Shallot'),
(267, 25, 9, '1', 'Tbsp', 'Honey', '1 Tbsp Honey'),
(268, 25, 10, '1', 'Tbsp', 'Whole Grain Dijon Mustard', '1 Tbsp Whole Grain Dijon Mustard'),
(269, 26, 1, '1', 'bunch', 'Mint', '1 bunch Mint'),
(270, 26, 2, '2', NULL, 'Skin-On Salmon Fillets', '2 Skin-On Salmon Fillets'),
(271, 26, 3, '2', 'cloves', 'Garlic', '2 cloves Garlic'),
(272, 26, 4, '6', 'oz', 'Carrots', '6 oz Carrots'),
(273, 26, 5, '1', NULL, 'Lemon', '1 Lemon'),
(274, 26, 6, '¾', 'lb', 'Yukon Gold Potatoes', '¾ lb Yukon Gold Potatoes'),
(275, 26, 7, '1', 'pinch', 'Saffron', '1 Pinch Saffron'),
(276, 26, 8, '1', 'Tbsp', 'Honey', '1 Tbsp Honey'),
(277, 26, 9, '½', 'cup', 'Plain Greek Yogurt', '½ cup Plain Greek Yogurt'),
(278, 26, 10, '½', 'tsp', 'Crushed Aleppo Pepper', '½ tsp Crushed Aleppo Pepper'),
(279, 26, 11, '½', 'tsp', 'Ground Cumin', '½ tsp Ground Cumin'),
(280, 27, 1, '½', 'lb', 'Carrots', '½ lb Carrots'),
(281, 27, 2, '2', 'Tbsps', 'Maple Syrup', '2 Tbsps Maple Syrup'),
(282, 27, 3, '1', 'Tbsp', 'Butter', '1 Tbsp Butter'),
(283, 27, 4, '2', NULL, 'Boneless, Skinless Chicken Breasts', '2 Boneless, Skinless Chicken Breasts'),
(284, 27, 5, '¾', 'lb', 'Yukon Gold Potatoes', '¾ lb Yukon Gold Potatoes'),
(285, 27, 6, '2', 'Tbsps', 'Crème Fraîche', '2 Tbsps Crème Fraîche'),
(286, 27, 7, '1', 'Tbsp', 'Sherry Vinegar', '1 Tbsp Sherry Vinegar'),
(287, 28, 1, '2', NULL, 'Strip Steaks', '2 Strip Steaks'),
(288, 28, 2, '1', 'head', 'Butter Lettuce', '1 head Butter Lettuce'),
(289, 28, 3, '2', 'cloves', 'Garlic', '2 cloves Garlic'),
(290, 28, 4, '2', NULL, 'Russet Potatoes', '2 Russet Potatoes'),
(291, 28, 5, '1', 'bunch', 'Chives', '1 bunch Chives'),
(292, 28, 6, '3', 'Tbsps', 'Creamy Mustard Sauce', '3 Tbsps Creamy Mustard Sauce'),
(293, 28, 7, '2', 'Tbsps', 'Butter', '2 Tbsps Butter'),
(294, 28, 8, '1', 'Tbsp', 'Red Wine Vinegar', '1 Tbsp Red Wine Vinegar'),
(295, 29, 1, '1¼', 'lbs', 'Ground Beef', '1¼ lbs Ground Beef'),
(296, 29, 2, '4', NULL, 'Potato Buns', '4 Potato Buns'),
(297, 29, 3, '2', 'cloves', 'Garlic', '2 cloves Garlic'),
(298, 29, 4, '2', NULL, 'Scallions', '2 Scallions'),
(299, 29, 5, '2', NULL, 'Sweet Potatoes', '2 Sweet Potatoes'),
(300, 29, 6, '½', 'lb', 'Baby Bok Choy', '½ lb Baby Bok Choy'),
(301, 29, 7, '2', 'Tbsps', 'Hoisin Sauce', '2 Tbsps Hoisin Sauce'),
(302, 29, 8, '2', 'Tbsps', 'Sweet White Miso Paste', '2 Tbsps Sweet White Miso Paste'),
(303, 29, 9, '½', 'oz', 'Dried Shiitake Mushrooms', '½ oz Dried Shiitake Mushrooms'),
(304, 29, 10, '¼', 'cup', 'Mayonnaise', '¼ cup Mayonnaise'),
(305, 30, 1, '10', 'oz', 'Peeled & Deveined Shrimp', '10 oz Peeled & Deveined Shrimp'),
(306, 30, 2, '½', 'lb', 'Green Cabbage', '½ lb Green Cabbage'),
(307, 30, 3, '6', 'oz', 'Lumaca Rigata Pasta', '6 oz Lumaca Rigata Pasta'),
(308, 30, 4, '2', 'cloves', 'Garlic', '2 cloves Garlic'),
(309, 30, 5, '1', NULL, '8-Ounce Can Tomato Sauce', '1 8-Ounce Can Tomato Sauce'),
(310, 30, 6, '1½', 'tsps', 'Calabrian Chile Paste', '1½ tsps Calabrian Chile Paste'),
(311, 30, 7, '2', 'Tbsps', 'Crème Fraîche', '2 Tbsps Crème Fraîche'),
(312, 30, 8, '2', 'Tbsps', 'Sliced Roasted Almonds', '2 Tbsps Sliced Roasted Almonds'),
(313, 30, 9, '2', 'Tbsps', 'Verjus Blanc', '2 Tbsps Verjus Blanc'),
(314, 31, 1, '1', 'bunch', 'Kale', '1 bunch Kale'),
(315, 31, 2, '1', NULL, 'Endive', '1 Endive'),
(316, 31, 3, '2', 'cloves', 'Garlic', '2 cloves Garlic'),
(317, 31, 4, '2', 'oz', 'Smoked Gouda Cheese', '2 oz Smoked Gouda Cheese'),
(318, 31, 5, '2', 'oz', 'Fontina Or Aged Alpine Cheese', '2 oz Fontina Or Aged Alpine Cheese'),
(319, 31, 6, '1', NULL, 'Red Onion', '1 Red Onion'),
(320, 31, 7, '¾', 'lb', 'Pizza Dough', '¾ lb Pizza Dough'),
(321, 31, 8, '4', 'oz', 'Cremini Mushrooms', '4 oz Cremini Mushrooms'),
(322, 31, 9, '1', NULL, 'Apple', '1 Apple'),
(323, 31, 10, '1', 'Tbsp', 'Honey', '1 Tbsp Honey'),
(324, 31, 11, '1', 'Tbsp', 'Apple Cider Vinegar', '1 Tbsp Apple Cider Vinegar'),
(325, 32, 1, '2', NULL, 'Boneless, Skinless Chicken Breasts', '2 Boneless, Skinless Chicken Breasts'),
(326, 32, 2, '4', NULL, 'Flour Tortillas', '4 Flour Tortillas'),
(327, 32, 3, '2', NULL, 'Scallions', '2 Scallions'),
(328, 32, 4, '6', 'oz', 'Chioggia Beet', '6 oz Chioggia Beet'),
(329, 32, 5, '1', NULL, 'Jalapeño Pepper', '1 Jalapeño Pepper'),
(330, 32, 6, '1', NULL, 'Lime', '1 Lime'),
(331, 32, 7, '1', NULL, 'Navel Orange', '1 Navel Orange'),
(332, 32, 8, '3', 'Tbsps', 'Roasted Peanuts', '3 Tbsps Roasted Peanuts'),
(333, 32, 9, '2', 'oz', 'White Cheddar Cheese', '2 oz White Cheddar Cheese'),
(334, 32, 10, '¼', 'cup', 'Mexican Crema', '¼ cup Mexican Crema'),
(335, 32, 11, '1', 'Tbsp', 'Mexican Spice Blend (Ancho Chile Powder, Smoked Paprika, Garlic Powder, Ground Cumin, & Dried Mexican Oregano)', '1 Tbsp Mexican Spice Blend (Ancho Chile Powder, Smoked Paprika, Garlic Powder, Ground Cumin, & Dried Mexican Oregano)'),
(336, 33, 1, '1', 'lb', 'Ground Pork', '1 lb Ground Pork'),
(337, 33, 2, '1', 'lb', 'Korean Rice Cakes', '1 lb Korean Rice Cakes'),
(338, 33, 3, '2', 'cloves', 'Garlic', '2 cloves Garlic'),
(339, 33, 4, '2', 'heads', 'Baby Bok Choy', '2 heads Baby Bok Choy'),
(340, 33, 5, '2', 'Tbsps', 'Soy Glaze', '2 Tbsps Soy Glaze'),
(341, 33, 6, '1½', 'Tbsps', 'Gochujang', '1½ Tbsps Gochujang'),
(342, 33, 7, '1', NULL, '1-Inch Piece Ginger', '1 1-Inch Piece Ginger'),
(343, 33, 8, '¼', 'cup', 'Black Bean Sauce', '¼ cup Black Bean Sauce'),
(344, 33, 9, '¼', 'cup', 'Crème Fraîche', '¼ cup Crème Fraîche'),
(345, 33, 10, '1', 'bunch', 'Chives', '1 bunch Chives'),
(346, 34, 1, '¾', 'cup', 'Jasmine Rice', '¾ cup Jasmine Rice'),
(347, 34, 2, '2', NULL, 'Carrots', '2 Carrots'),
(348, 34, 3, '2', 'stalks', 'Celery', '2 stalks Celery'),
(349, 34, 4, '1', 'head', 'Baby Bok Choy', '1 head Baby Bok Choy'),
(350, 34, 5, '1', NULL, 'Orange', '1 Orange'),
(351, 34, 6, '1', NULL, 'Lemon', '1 Lemon'),
(352, 34, 7, '2', 'cloves', 'Garlic', '2 cloves Garlic'),
(353, 34, 8, '3', 'oz', 'Radishes', '3 oz Radishes'),
(354, 34, 9, '1', 'Tbsp', 'Sesame Oil', '1 Tbsp Sesame Oil'),
(355, 34, 10, '2', 'Tbsps', 'Soy Glaze', '2 Tbsps Soy Glaze'),
(356, 34, 11, '2', NULL, 'Cage-Free Farm Eggs', '2 Cage-Free Farm Eggs'),
(357, 34, 12, '1', NULL, '1-Inch Piece Ginger', '1 1-Inch Piece Ginger'),
(358, 34, 13, '1½', 'Tbsps', 'Soy Marinade', '1½ Tbsps Soy Marinade'),
(359, 34, 14, '2', 'Tbsps', 'Roasted Peanuts', '2 Tbsps Roasted Peanuts'),
(360, 35, 1, '¾', 'cup', 'Jasmine Rice', '¾ cup Jasmine Rice'),
(361, 35, 2, '10', 'oz', 'Chopped Chicken Breast', '10 oz Chopped Chicken Breast'),
(362, 35, 3, '1¾', 'cups', 'Light Coconut Milk', '1¾ cups Light Coconut Milk'),
(363, 35, 4, '3', NULL, 'Carrots', '3 Carrots'),
(364, 35, 5, '1', NULL, 'Lime', '1 Lime'),
(365, 35, 6, '1', 'head', 'Baby Bok Choy', '1 head Baby Bok Choy'),
(366, 35, 7, '½', 'cup', 'Dried Shiitake Mushrooms', '½ cup Dried Shiitake Mushrooms'),
(367, 35, 8, '2', 'tsps', 'Golden Mountain Sauce', '2 tsps Golden Mountain Sauce'),
(368, 35, 9, '1½', 'Tbsps', 'Yellow Curry Paste', '1½ Tbsps Yellow Curry Paste'),
(369, 36, 1, '2', NULL, 'Tilapia Fillets', '2 Tilapia Fillets'),
(370, 36, 2, '½', 'cup', 'Black Beluga Lentils', '½ cup Black Beluga Lentils'),
(371, 36, 3, '2', 'cloves', 'Garlic', '2 cloves Garlic'),
(372, 36, 4, '1', NULL, 'Lemon', '1 Lemon'),
(373, 36, 5, '½', 'lb', 'Broccoli', '½ lb Broccoli'),
(374, 36, 6, '1', 'bunch', 'Parsley', '1 bunch Parsley'),
(375, 36, 7, '2', 'Tbsps', 'Butter', '2 Tbsps Butter'),
(376, 36, 8, '1', 'oz', 'Golden Or Red Sweet Piquante Peppers', '1 oz Golden Or Red Sweet Piquante Peppers'),
(377, 36, 9, '1', 'Tbsp', 'Capers', '1 Tbsp Capers'),
(378, 37, 1, '10', 'oz', 'Ground Chicken', '10 oz Ground Chicken'),
(379, 37, 2, '1', 'head', 'Butter Lettuce', '1 head Butter Lettuce'),
(380, 37, 3, '1', NULL, 'Navel Orange', '1 Navel Orange'),
(381, 37, 4, '3', 'oz', 'Radishes', '3 oz Radishes'),
(382, 37, 5, '2', NULL, 'Scallions', '2 Scallions'),
(383, 37, 6, '1', NULL, '1-Inch Piece Ginger', '1 1-Inch Piece Ginger'),
(384, 37, 7, '2', 'cloves', 'Garlic', '2 cloves Garlic'),
(385, 37, 8, '2', 'Tbsps', 'Coconut Aminos', '2 Tbsps Coconut Aminos'),
(386, 37, 9, '1', 'Tbsp', 'Rice Vinegar', '1 Tbsp Rice Vinegar'),
(387, 37, 10, '2', 'Tbsps', 'Roasted Cashews', '2 Tbsps Roasted Cashews'),
(388, 37, 11, '1', 'tsp', 'Togarashi Seasoning (Chile Pepper, Orange Peel, Sesame Seeds, Ginger, & Seaweed)', '1 tsp Togarashi Seasoning (Chile Pepper, Orange Peel, Sesame Seeds, Ginger, & Seaweed)'),
(389, 37, 12, '4', 'oz', 'Cremini Mushrooms', '4 oz Cremini Mushrooms'),
(390, 37, 13, '1', NULL, 'Red Onion', '1 Red Onion'),
(391, 37, 14, '1', NULL, 'Carrot', '1 Carrot'),
(392, 37, 15, '1', NULL, 'Lime', '1 Lime'),
(393, 38, 1, '2', NULL, 'Grassfed Strip Steaks', '2 Grassfed Strip Steaks'),
(394, 38, 2, '¾', 'cup', 'Jasmine Rice', '¾ cup Jasmine Rice'),
(395, 38, 3, '1', NULL, '1-Inch Piece Ginger', '1 1-Inch Piece Ginger'),
(396, 38, 4, '2', 'cloves', 'Garlic', '2 cloves Garlic'),
(397, 38, 5, '2', 'Tbsps', 'Ponzu Sauce', '2 Tbsps Ponzu Sauce'),
(398, 38, 6, '2', 'Tbsps', 'Soy Sauce', '2 Tbsps Soy Sauce'),
(399, 38, 7, '1', 'tsp', 'Sugar', '1 tsp Sugar'),
(400, 38, 8, '4', 'oz', 'Snow Peas', '4 oz Snow Peas'),
(401, 38, 9, '2', NULL, 'Carrots', '2 Carrots'),
(402, 38, 10, '1', 'head', 'Baby Bok Choy', '1 head Baby Bok Choy'),
(403, 38, 11, '2', NULL, 'Scallions', '2 Scallions'),
(404, 38, 12, '1', 'Tbsp', 'Butter', '1 Tbsp Butter'),
(405, 39, 1, '¾', 'cup', 'Jasmine Rice', '¾ cup Jasmine Rice'),
(406, 39, 2, '1', NULL, 'Shallot', '1 Shallot'),
(407, 39, 3, '2', 'heads', 'Baby Bok Choy', '2 heads Baby Bok Choy'),
(408, 39, 4, '1', NULL, 'Lime', '1 Lime'),
(409, 39, 5, '6', 'oz', 'Radishes', '6 oz Radishes'),
(410, 39, 6, '2', 'Tbsps', 'Ponzu Sauce', '2 Tbsps Ponzu Sauce'),
(411, 39, 7, '1', 'Tbsp', 'Soy Marinade', '1 Tbsp Soy Marinade'),
(412, 39, 8, '1', 'Tbsp', 'Sugar', '1 Tbsp Sugar'),
(413, 39, 9, '2', NULL, 'Grassfed Strip Steaks', '2 Grassfed Strip Steaks'),
(414, 39, 10, '4', 'oz', 'Cremini Mushrooms', '4 oz Cremini Mushrooms'),
(415, 39, 11, '1', NULL, '1-Inch Piece Ginger', '1 1-Inch Piece Ginger'),
(416, 39, 12, '2', 'Tbsps', 'Sweet Chili Sauce', '2 Tbsps Sweet Chili Sauce'),
(417, 40, 1, '2', NULL, 'Boneless, Skinless Chicken Breasts', '2 Boneless, Skinless Chicken Breasts'),
(418, 40, 2, '2', NULL, 'Carrots', '2 Carrots'),
(419, 40, 3, '1', NULL, 'Red Onion', '1 Red Onion'),
(420, 40, 4, '2', 'cloves', 'Garlic', '2 cloves Garlic'),
(421, 40, 5, '½', 'cup', 'French Green Lentils', '½ cup French Green Lentils'),
(422, 40, 6, '1', 'bunch', 'Collard Greens', '1 bunch Collard Greens'),
(423, 40, 7, '2', 'Tbsps', 'Tomato Paste', '2 Tbsps Tomato Paste'),
(424, 40, 8, '¼', 'tsp', 'Crushed Red Pepper Flakes', '¼ tsp Crushed Red Pepper Flakes'),
(425, 40, 9, '1', 'Tbsp', 'Capers', '1 Tbsp Capers'),
(426, 40, 10, '1', 'Tbsp', 'Apple Cider Vinegar', '1 Tbsp Apple Cider Vinegar'),
(427, 40, 11, '2', 'Tbsps', 'Crumbled Goat Cheese', '2 Tbsps Crumbled Goat Cheese'),
(428, 40, 12, '1', 'Tbsp', 'Tuscan Spice Blend (Ground Fennel Seeds, Whole Fennel Seeds, Ground Rosemary, & Ground Sage)', '1 Tbsp Tuscan Spice Blend (Ground Fennel Seeds, Whole Fennel Seeds, Ground Rosemary, & Ground Sage)');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` int NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `servings` int DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `main_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ingredients_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_folder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `slug`, `title`, `subtitle`, `category_id`, `servings`, `description`, `main_image`, `ingredients_image`, `image_folder`, `created_at`) VALUES
(1, 'ancho-orange-chicken', 'Ancho-Orange Chicken', 'with Kale Rice & Roasted Carrots', 1, 4, 'We\'re amping up chicken breasts with a glaze of smoky ancho chile paste and fresh orange juice in this recipe. On the side, roasted carrots and lightly creamy, golden raisin-studded rice perfectly accent the sweetness of the glaze.', 'images/ancho-orange-chicken/dish.jpg', 'images/ancho-orange-chicken/ingredients.png', 'images/ancho-orange-chicken', '2026-10-18 22:27:26'),
(2, 'beef-medallions-mushroom-sauce', 'Beef Medallions & Mushroom Sauce', 'with Mashed Potatoes', 2, 2, 'In this easy recipe, inspired by steak Diane (an American restaurant classic), we\'re searing beef medallions, then using the fond in the pan to make a rich, bright mushroom sauce for spooning on top. Garlic mashed potatoes and sautéed kale make for delicious, simple sides.', 'images/beef-medallions-mushroom-sauce/dish.jpg', 'images/beef-medallions-mushroom-sauce/ingredients.png', 'images/beef-medallions-mushroom-sauce', '2026-10-18 22:27:26'),
(3, 'broccoli-basil-pesto-sandwiches', 'Broccoli & Basil Pesto Sandwiches', 'with Romaine & Citrus Salad', 3, 4, 'These Italian focaccia sandwiches are layered with broccoli, three cheeses, and a savory basil, cashew, and pine nut pesto, then baked in the oven to meld all the bright, aromatic flavors. On the side, we\'re serving a refreshing salad of romaine and seasonal clementine, dressed in a creamy dressing made with fresh clementine juice.', 'images/broccoli-basil-pesto-sandwiches/dish.jpg', 'images/broccoli-basil-pesto-sandwiches/ingredients.png', 'images/broccoli-basil-pesto-sandwiches', '2026-10-18 22:27:26'),
(4, 'broccoli-mozzarella-calzones', 'Broccoli & Mozzarella Calzones', 'with Caesar Salad', 3, 4, 'These calzones are loaded with melty fresh mozzarella, creamy ricotta, and tender broccoli—balanced by a tangy tomato dipping sauce. For a refreshing side, we\'re tossing crunchy romaine and briny black olives in our take on Caesar dressing.', 'images/broccoli-mozzarella-calzones/dish.jpg', 'images/broccoli-mozzarella-calzones/ingredients.png', 'images/broccoli-mozzarella-calzones', '2026-10-18 22:27:26'),
(5, 'bucatini-alfredo', 'Bucatini Alfredo', 'with Broccoli', 3, 2, 'This quick-cooking recipe captures all the deliciously creamy, rich flavor of the classic Italian-American sauce—with the welcome addition of quick-braised broccoli. A dusting of pecorino cheese completes each bowl with a touch of sharpness.', 'images/bucatini-alfredo/dish.jpg', 'images/bucatini-alfredo/ingredients.png', 'images/bucatini-alfredo', '2026-10-18 22:27:26'),
(6, 'bucatini-tomato-sauce', 'Bucatini & Tomato Sauce', 'with Roasted Broccoli', 3, 2, 'Made with petite datterini tomatoes, the sauce for tonight\'s bucatini highlights briny olives and capers, hot red pepper flakes, and savory Grana Padano cheese. We\'re mixing in roasted broccoli for contrasting texture and nutty-sweet flavor.', 'images/bucatini-tomato-sauce/dish.jpg', 'images/bucatini-tomato-sauce/ingredients.png', 'images/bucatini-tomato-sauce', '2026-10-18 22:27:26'),
(7, 'cheesy-enchiladas-rojas', 'Cheesy Enchiladas Rojas', 'with Mushrooms & Kale', 3, 4, 'Our hearty vegetarian enchiladas are filled with a combination of fragrant, Mexican-spiced rice and sautéed mushrooms and kale. For even more flavor, we\'re baking them under a smoky-sweet tomato sauce flavored with ancho chile paste and a layer of melty white cheddar. A dollop of lime-seasoned sour cream adds creamy, cooling balance. (You may receive green curly, dark green lacinato, or red kale.)', 'images/cheesy-enchiladas-rojas/dish.jpg', 'images/cheesy-enchiladas-rojas/ingredients.png', 'images/cheesy-enchiladas-rojas', '2026-10-18 22:27:26'),
(8, 'crispy-fish-sandwiches', 'Crispy Fish Sandwiches', 'with Tartar Sauce & Roasted Sweet Potato Wedges', 4, 4, 'These sandwiches highlight wild Alaskan pollock—flavored with aromatic seasonings, coated with panko breadcrumbs, and pan-fried for a golden-brown crust. In classic fashion, a tangy, mayo-based tartar sauce perfectly balances the fish.', 'images/crispy-fish-sandwiches/dish.jpg', 'images/crispy-fish-sandwiches/ingredients.png', 'images/crispy-fish-sandwiches', '2026-10-18 22:27:26'),
(9, 'general-tsos-chicken', 'General Tso\'s Chicken', 'with Bok Choy & Jasmine Rice', 1, 2, 'In this quick-cooking spin on a takeout favorite, hoisin sauce, honey, sriracha, and sesame oil lend our chicken the sweet, spicy, and nutty flavors General Tso\'s is known for. A light dusting of cornstarch on the chicken just before it hits the pan creates a delicately crispy exterior (and helps it soak up the irresistible sauce later).', 'images/general-tsos-chicken/dish.jpg', 'images/general-tsos-chicken/ingredients.png', 'images/general-tsos-chicken', '2026-10-18 22:27:26'),
(10, 'hoisin-glazed-pork-chops', 'Hoisin-Glazed Pork Chops', 'with Stir-Fried Vegetables & Wonton Noodles', 5, 4, 'Delightfully chewy wonton noodles tossed in a nutty, savory sauce are a delicious accompaniment to these pork chops. For depth of flavor, we\'re pan-searing the pork chops, then glazing them with barbecue-like hoisin, whose sweetness perfectly matches bites of sautéed carrots in the noodles.', 'images/hoisin-glazed-pork-chops/dish.jpg', 'images/hoisin-glazed-pork-chops/ingredients.png', 'images/hoisin-glazed-pork-chops', '2026-10-18 22:27:26'),
(11, 'honey-butter-barramundi', 'Honey-Butter Barramundi', 'with Za\'atar Roasted Vegetables', 4, 4, 'This Middle Eastern recipe pairs crispy barramundi—served in a family-friendly pan sauce of honey and butter—with a medley of winter vegetables. For savory, herby flavor, we\'re seasoning the vegetables with za\'atar before roasting them.', 'images/honey-butter-barramundi/dish.jpg', 'images/honey-butter-barramundi/ingredients.png', 'images/honey-butter-barramundi', '2026-10-18 22:27:26'),
(12, 'kale-ricotta-quiche', 'Kale & Ricotta Quiche', 'with Romaine, Apple, & Almond Salad', 3, 4, 'This crowd-pleasing quiche showcases a rich, eggy filling made with ricotta and cream —balanced by hearty sautéed kale. On the side, we\'re serving a refreshing salad of crisp romaine and apple, wrapped in a creamy lemon dressing.', 'images/kale-ricotta-quiche/dish.jpg', 'images/kale-ricotta-quiche/ingredients.png', 'images/kale-ricotta-quiche', '2026-10-18 22:27:26'),
(13, 'mexican-spiced-barramundi', 'Mexican-Spiced Barramundi', 'with Kale, Sweet Potato, & Avocado Salad', 4, 2, 'This recipe has been approved by Whole30®. To learn more about their guidelines, visit Whole30.com. We\'re partnering with Whole30® to bring you the first of eight weeks of delicious recipes. Zesty spiced barramundi is the perfect partner for a salad of roasted sweet potato and kale, marinated in a creamy avocado and citrus dressing to soften the leaves.', 'images/mexican-spiced-barramundi/dish.jpg', 'images/mexican-spiced-barramundi/ingredients.png', 'images/mexican-spiced-barramundi', '2026-10-18 22:27:26'),
(14, 'mushroom-potato-tacos', 'Mushroom & Potato Tacos', 'with Romaine & Orange Salad', 3, 2, 'For this hearty vegetarian meal, we\'re filling soft flour tortillas with mushrooms and potato—seasoned with a zesty, chorizo-inspired blend, then roasted. A pickled pepper relish lends bright flavor to the tacos, all tied together with a creamy sauce seasoned with the same spices. Our side salad of juicy orange and crunchy romaine rounds out the dish.', 'images/mushroom-potato-tacos/dish.jpg', 'images/mushroom-potato-tacos/ingredients.png', 'images/mushroom-potato-tacos', '2026-10-18 22:27:26'),
(15, 'parmesan-crusted-chicken', 'Parmesan-Crusted Chicken', 'with Mashed Sweet Potatoes & Roasted Broccoli', 1, 4, 'In this simple, seasonal recipe, you\'ll coat chicken in a combination of flour, parmesan cheese, and savory spices before pan-searing it. We\'re adding more of the same spices to a bright, creamy sauce, perfect for spooning over the chicken and broccoli.', 'images/parmesan-crusted-chicken/dish.jpg', 'images/parmesan-crusted-chicken/ingredients.png', 'images/parmesan-crusted-chicken', '2026-10-18 22:27:26'),
(16, 'pimento-cheeseburgers', 'Pimento Cheeseburgers', 'with Sweet Potato Oven Fries', 2, 2, 'Tonight, the classic cheeseburger gets an easy, Southern-style lift from pimento cheese —a zesty spread made with cheddar, mayo, pickled peppers, and spices. We\'re serving our burgers with sweet potato oven fries for a flavorful, seasonal twist on the usual side.', 'images/pimento-cheeseburgers/dish.jpg', 'images/pimento-cheeseburgers/ingredients.png', 'images/pimento-cheeseburgers', '2026-10-18 22:27:26'),
(17, 'pork-chorizo-tacos', 'Pork Chorizo Tacos', 'with Cheesy Roasted Potatoes', 5, 2, 'These tacos get plenty of bold flavor from ground chorizo (a type of spiced pork sausage), cooked into a delightfully saucy filling with cabbage and fresh citrus juices. On the side, we\'re livening up roasted potatoes with garlic and Cotija cheese.', 'images/pork-chorizo-tacos/dish.jpg', 'images/pork-chorizo-tacos/ingredients.png', 'images/pork-chorizo-tacos', '2026-10-18 22:27:26'),
(18, 'roasted-broccoli-fregola-sarda-salad', 'Roasted Broccoli & Fregola Sarda Salad', 'with Hard-Boiled Eggs & Tahini Dressing', 3, 2, 'This Middle Eastern-inspired recipe is brimming with varied flavors and textures. Toasty pearls of pasta, roasted vegetables (seasoned with savory, herby za\'atar), crumbled cheese, and chopped almonds all come together in a smooth, nutty dressing.', 'images/roasted-broccoli-fregola-sarda-salad/dish.jpg', 'images/roasted-broccoli-fregola-sarda-salad/ingredients.png', 'images/roasted-broccoli-fregola-sarda-salad', '2026-10-18 22:27:26'),
(19, 'roasted-brussels-sprout-freekeh-salad', 'Roasted Brussels Sprout & Freekeh Salad', 'with Lemon Yogurt & Barrel-Aged Feta', 3, 2, 'This Mediterranean-inspired grain salad is brimming with varied, vibrant flavors. Nutty freekeh and roasted Brussels sprouts get pops of sweetness from pickled peppers and dates, balanced by briny crumbled Feta. To dollop on top, we\'re serving lemon-seasoned yogurt for extra brightness.', 'images/roasted-brussels-sprout-freekeh-salad/dish.jpg', 'images/roasted-brussels-sprout-freekeh-salad/ingredients.png', 'images/roasted-brussels-sprout-freekeh-salad', '2026-10-18 22:27:26'),
(20, 'roasted-cauliflower-salad', 'Roasted Cauliflower Salad', 'with Caper Brown Butter & Parmesan Breadcrumbs', 3, 2, 'Seasonal salads don\'t get much more satisfying than this. We\'re bringing roasted cauliflower and sautéed kale together with cheesy toasted breadcrumbs and a briny caper-studded dressing. Served on top, soft-boiled eggs add extra richness.', 'images/roasted-cauliflower-salad/dish.jpg', 'images/roasted-cauliflower-salad/ingredients.png', 'images/roasted-cauliflower-salad', '2026-10-18 22:27:26'),
(21, 'roasted-chicken-fall-vegetables', 'Roasted Chicken & Fall Vegetables', 'with Cranberry & Ginger Compote', 1, 4, 'For this comforting autumn dinner, we\'re seasoning half chickens with the classic flavors of garlic, onion, and smoked paprika, then roasting them along with sweet potatoes and Brussels sprouts. The rich chicken finds delicious contrast in a tart-sweet compote, made simply by cooking fresh cranberries and ginger with a bit of sugar and water.', 'images/roasted-chicken-fall-vegetables/dish.jpg', 'images/roasted-chicken-fall-vegetables/ingredients.png', 'images/roasted-chicken-fall-vegetables', '2026-10-18 22:27:26'),
(22, 'roasted-pork-broccoli', 'Roasted Pork & Broccoli', 'with Apple, Cheese Sauce, & Garlic Breadcrumbs', 5, 2, 'To elevate the classic savory-sweet pairing, we\'re topping roasted pork with sautéed apple in this crowd-pleasing recipe. The pork and a side of broccoli, roasted on the same sheet pan, come together with a rich, warming fontina cheese sauce.', 'images/roasted-pork-broccoli/dish.jpg', 'images/roasted-pork-broccoli/ingredients.png', 'images/roasted-pork-broccoli', '2026-10-18 22:27:26'),
(23, 'roasted-red-pepper-pasta', 'Roasted Red Pepper Pasta', 'with Lemon-Parmesan Broccoli', 3, 2, 'In this quick-cooking recipe, whole grain pipe rigate gets pops of flavor from sweet roasted piquillo peppers and briny capers—plus a layer of exciting crunch from almonds. It all comes together in a creamy, mildly spicy sauce.', 'images/roasted-red-pepper-pasta/dish.jpg', 'images/roasted-red-pepper-pasta/ingredients.png', 'images/roasted-red-pepper-pasta', '2026-10-18 22:27:26'),
(24, 'roasted-squash-curry', 'Roasted Squash Curry', 'with Crispy Mung Beans & Jasmine Rice', 3, 2, 'In this recipe, veggie curry gets a unique lift from spaghetti squash—oven-roasted, then broken into pasta-like strands with a fork. We\'re finishing our squash and bok choy in a sauce made with fresh aromatics and two well-balanced pantry ingredients: spicy yellow curry paste and cooling coconut milk. A garnish of dried mung beans brings it all together with exciting crunch.', 'images/roasted-squash-curry/dish.jpg', 'images/roasted-squash-curry/ingredients.png', 'images/roasted-squash-curry', '2026-10-18 22:27:26'),
(25, 'roasted-turkey-breast-farro-endive-salad', 'Roasted Turkey Breast & Farro-Endive Salad', 'with Brown Butter Apple Compote', 6, 2, 'Fall comfort food gets a delicious lift in this recipe. A sweet, toasty compote (simply apple and shallot cooked in brown butter) balances our savory roasted turkey breast. On the side, we\'re tossing warm grains with endive—first cooked with a bit of honey and lemon to brighten its mildly bitter flavor.', 'images/roasted-turkey-breast-farro-endive-salad/dish.jpg', 'images/roasted-turkey-breast-farro-endive-salad/ingredients.png', 'images/roasted-turkey-breast-farro-endive-salad', '2026-10-18 22:27:26'),
(26, 'salmon-honey-glazed-carrots', 'Salmon & Honey-Glazed Carrots', 'with Lemon-Saffron Yogurt Sauce', 4, 2, 'This elegant dish gets unique flavor from a prized spice, saffron, used two ways: added to the water used to boil the potatoes and stirred into a creamy yogurt sauce. The bright sauce is delicious spooned over rich salmon, potatoes, and carrots—which get another flavor-packed lift from a glaze of honey and fragrant cumin. Aleppo pepper adds just a hint of spice throughout the dish, balanced by cooling fresh mint.', 'images/salmon-honey-glazed-carrots/dish.jpg', 'images/salmon-honey-glazed-carrots/ingredients.png', 'images/salmon-honey-glazed-carrots', '2026-10-18 22:27:26'),
(27, 'seared-chicken-mashed-potatoes', 'Seared Chicken & Mashed Potatoes', 'with Maple-Glazed Carrots', 1, 2, 'We\'re giving seared chicken a lift with a rich pan sauce, made with sweet maple syrup and tangy sherry vinegar. It\'s the perfect accompaniment for creamy mashed potatoes and roasted carrots, dressed with a bit more maple syrup.', 'images/seared-chicken-mashed-potatoes/dish.jpg', 'images/seared-chicken-mashed-potatoes/ingredients.png', 'images/seared-chicken-mashed-potatoes', '2026-10-18 22:27:26'),
(28, 'seared-steaks-garlic-butter', 'Seared Steaks & Garlic Butter', 'with Oven Fries', 2, 4, '\"Steak frites,\" or steak with french fries, is classic French bistro fare. Tonight\'s steaks get another layer of rich flavor from garlic butter, spooned over them as they cook. Creamy mustard sauce is a perfect match for the rich steaks and hearty oven-roasted fries, while a simple salad adds refreshing contrast. (You may receive crisp romaine or tender butter lettuce.)', 'images/seared-steaks-garlic-butter/dish.jpg', 'images/seared-steaks-garlic-butter/ingredients.png', 'images/seared-steaks-garlic-butter', '2026-10-18 22:27:26'),
(29, 'shiitake-hoisin-beef-burgers', 'Shiitake & Hoisin Beef Burgers', 'with Miso Mayonnaise & Roasted Sweet Potatoes', 2, 4, 'These Asian-inspired burgers get their irresistible umami flavor from chopped shiitake mushrooms (mixed right into the beef) and a miso-mayo spread. Piled on top, crisp ribbons of bok choy round out the burgers, served with a side of roasted sweet potato wedges.', 'images/shiitake-hoisin-beef-burgers/dish.jpg', 'images/shiitake-hoisin-beef-burgers/ingredients.png', 'images/shiitake-hoisin-beef-burgers', '2026-10-18 22:27:26'),
(30, 'shrimp-fra-diavolo', 'Shrimp Fra Diavolo', 'with Lumaca Rigata Pasta', 4, 2, 'Tonight\'s variation on the beloved Italian-American dish gets its \"devilish\" heat from Calabrian chile paste, mixed into a tangy-sweet tomato sauce. It perfectly coats shrimp, cabbage, and lumaca rigata pasta. A garnish of sliced almonds finishes the dish with contrasting crunch.', 'images/shrimp-fra-diavolo/dish.jpg', 'images/shrimp-fra-diavolo/ingredients.png', 'images/shrimp-fra-diavolo', '2026-10-18 22:27:26'),
(31, 'smoked-gouda-mushroom-flatbread', 'Smoked Gouda & Mushroom Flatbread', 'with Endive & Apple Salad', 3, 2, 'For this rustic seasonal meal, we\'re topping flatbread—made by rolling out pizza dough until extra-thin—with two kinds of cheeses, including nutty smoked Gouda. Cremini mushrooms add even more irresistibly savory flavor to the flatbread, balanced by a bright, crisp endive and apple salad.', 'images/smoked-gouda-mushroom-flatbread/dish.jpg', 'images/smoked-gouda-mushroom-flatbread/ingredients.png', 'images/smoked-gouda-mushroom-flatbread', '2026-10-18 22:27:26'),
(32, 'spicy-chicken-quesadillas', 'Spicy Chicken Quesadillas', 'with Beet & Orange Salad', 1, 2, 'A seasonal salad of striped Chioggia beet, juicy orange, and peanuts is a fresh pairing for these zesty quesadillas. We\'re seasoning the chicken filling with both jalapeño pepper and Mexican spices—balanced by a layer of melty white cheddar. Mexican crema brightened up with lime juice is perfect for dipping.', 'images/spicy-chicken-quesadillas/dish.jpg', 'images/spicy-chicken-quesadillas/ingredients.png', 'images/spicy-chicken-quesadillas', '2026-10-18 22:27:26'),
(33, 'spicy-pork-korean-rice-cakes', 'Spicy Pork & Korean Rice Cakes', 'with Bok Choy', 5, 4, 'In this crowd-pleasing recipe, a savory and spicy sauce (balanced by a touch of cooling crème fraîche) brings together ground pork, bok choy, and aromatics. We\'re mixing in delightfully chewy tteok, or rice cakes—a staple of Korean cuisine.', 'images/spicy-pork-korean-rice-cakes/dish.jpg', 'images/spicy-pork-korean-rice-cakes/ingredients.png', 'images/spicy-pork-korean-rice-cakes', '2026-10-18 22:27:26'),
(34, 'sweet-sour-vegetable-stir-fry', 'Sweet & Sour Vegetable Stir-Fry', 'with Fried Eggs & Peanuts', 3, 2, 'Two kinds of citrus—seasonal orange and lemon—give the sauce for our stir-fried vegetables its irresistible sweet-sour balance. The carrots, celery, and bok choy perfectly contrast a rich fried egg and fluffy, radish-studded white rice.', 'images/sweet-sour-vegetable-stir-fry/dish.jpg', 'images/sweet-sour-vegetable-stir-fry/ingredients.png', 'images/sweet-sour-vegetable-stir-fry', '2026-10-18 22:27:26'),
(35, 'thai-curry-chicken', 'Thai Curry Chicken', 'with Carrots & Bok Choy', 1, 2, 'In tonight\'s dish, the spicy and aromatic flavors of yellow curry paste—a Thai staple— shine through a lightly sweet coconut milk broth. Sautéed chicken, carrots, and bok choy give the curry plenty of hearty texture, while fluffy rice eagerly soaks up all the complex flavors. (Chefs, this curry paste packs a punch of heat, so be sure to use only as much as you\'d like!)', 'images/thai-curry-chicken/dish.jpg', 'images/thai-curry-chicken/ingredients.png', 'images/thai-curry-chicken', '2026-10-18 22:27:26'),
(36, 'tilapia-black-lentil-salad', 'Tilapia & Black Lentil Salad', 'with Lemon Pan Sauce', 4, 2, 'In this dish, we\'re putting a twist on Italian gremolata: adding pickled peppers to the classic parsley, garlic, and lemon condiment. The bright, tangy flavors perk up a hearty salad of black lentils and roasted broccoli. We\'re also using lemon juice as the base for an easy pan sauce to serve over our seared tilapia.', 'images/tilapia-black-lentil-salad/dish.jpg', 'images/tilapia-black-lentil-salad/ingredients.png', 'images/tilapia-black-lentil-salad', '2026-10-18 22:27:26'),
(37, 'togarashi-chicken-lettuce-cups', 'Togarashi Chicken Lettuce Cups', 'with Orange & Radishes', 1, 2, 'This recipe has been approved by Whole30®. To learn more about their guidelines, visit Whole30.com. We\'re partnering with Whole30® to bring you the first of eight weeks of delicious recipes. These chicken lettuce cups get their dynamic flavor from togarashi seasoning—a staple of Japanese cuisine. Juicy bites of orange add more bright flavor and color.', 'images/togarashi-chicken-lettuce-cups/dish.jpg', 'images/togarashi-chicken-lettuce-cups/ingredients.png', 'images/togarashi-chicken-lettuce-cups', '2026-10-18 22:27:26'),
(38, 'top-chef-ginger-marinated-grassfed-steaks', 'Top Chef Ginger-Marinated Grassfed Steaks', 'with Stir-Fried Vegetables & Jasmine Rice', 2, 2, 'In this recipe—inspired by our Quickfire Challenge from Top Chef Season 15 on Bravo—we\'re marinating grassfed steaks in fresh ginger, soy sauce, and citrusy ponzu sauce. The extra marinade transforms into an easy pan sauce, which adds punchy flavor to the steaks and a side of jasmine rice.', 'images/top-chef-ginger-marinated-grassfed-steaks/dish.jpg', 'images/top-chef-ginger-marinated-grassfed-steaks/ingredients.png', 'images/top-chef-ginger-marinated-grassfed-steaks', '2026-10-18 22:27:26'),
(39, 'top-chef-seared-grassfed-steaks', 'Top Chef Seared Grassfed Steaks', 'with Sweet Chili-Glazed Vegetables', 2, 4, 'In this recipe, inspired by our Quickfire Challenge from Top Chef Season 15 on Bravo, simple grassfed steaks and rice get a sweet, tart, and spicy lift from glazed mushrooms and bok choy. Sliced radishes, softened a bit with lime juice, finish the dish off with subtle crunch.', 'images/top-chef-seared-grassfed-steaks/dish.jpg', 'images/top-chef-seared-grassfed-steaks/ingredients.png', 'images/top-chef-seared-grassfed-steaks', '2026-10-18 22:27:26'),
(40, 'tuscan-chicken-green-lentil-stew', 'Tuscan Chicken & Green Lentil Stew', 'with Goat Cheese', 1, 2, 'In this comforting cold-weather recipe, we\'re serving Tuscan-spiced chicken over tender green lentils and vegetables cooked in a light, savory tomato broth. Capers and crushed red pepper add briny flavor and a touch of heat to cut through the rich, earthy stew. (Chefs, rinsing the lentils after cooking removes excess starch, resulting in a more delicate flavor.)', 'images/tuscan-chicken-green-lentil-stew/dish.jpg', 'images/tuscan-chicken-green-lentil-stew/ingredients.png', 'images/tuscan-chicken-green-lentil-stew', '2026-10-18 22:27:26');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_tools`
--

CREATE TABLE `recipe_tools` (
  `recipe_id` int NOT NULL,
  `tool_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipe_tools`
--

INSERT INTO `recipe_tools` (`recipe_id`, `tool_id`) VALUES
(1, 1),
(2, 2),
(8, 2),
(16, 2),
(3, 3),
(11, 3),
(12, 3),
(13, 3),
(15, 3),
(18, 3),
(22, 3),
(23, 3),
(26, 3),
(27, 3),
(33, 3),
(34, 3),
(37, 3),
(38, 3),
(39, 3),
(4, 4),
(9, 4),
(31, 4),
(35, 4),
(5, 5),
(6, 5),
(10, 5),
(19, 5),
(25, 5),
(30, 5),
(32, 5),
(36, 5),
(40, 5),
(7, 6),
(14, 7),
(17, 7),
(21, 7),
(20, 8),
(24, 8),
(28, 9),
(29, 10);

-- --------------------------------------------------------

--
-- Table structure for table `steps`
--

CREATE TABLE `steps` (
  `id` int NOT NULL,
  `recipe_id` int NOT NULL,
  `step_number` int NOT NULL,
  `step_title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `steps`
--

INSERT INTO `steps` (`id`, `recipe_id`, `step_number`, `step_title`, `instructions`, `image`) VALUES
(1, 1, 1, 'Cook the rice', 'Place an oven rack in the center of the oven, then preheat to 450°F. In a medium pot, combine the rice, a big pinch of salt, and 1 1/2 cups of water. Heat to boiling on high. Once boiling, cover and reduce the heat to low. Cook 12 to 14 minutes, or until the water has been absorbed and the rice is tender. Turn off the heat and fluff with a fork. Cover to keep warm.', 'images/ancho-orange-chicken/step-1.jpg'),
(2, 1, 2, 'Prepare the ingredients & make the glaze', 'While the rice cooks, wash and dry the fresh produce. Peel the carrots; quarter lengthwise, then halve crosswise. Peel and roughly chop the garlic. Remove and discard the stems of the kale; finely chop the leaves. Using a peeler, remove the lime rind, avoiding the white pith; mince to get 2 teaspoons of zest (or use a zester). Halve the lime crosswise. Halve the orange; squeeze the juice into a bowl, straining out any seeds. Whisk in the chile paste and 2 tablespoons of water until smooth.', 'images/ancho-orange-chicken/step-2.jpg'),
(3, 1, 3, 'Roast the carrots', 'Place the sliced carrots on a sheet pan. Drizzle with olive oil and season with salt and pepper; toss to coat. Arrange in an even layer. Roast 15 to 17 minutes, or until tender when pierced with a fork. Remove from the oven.', 'images/ancho-orange-chicken/step-3.jpg'),
(4, 1, 4, 'Cook the kale & finish the rice', 'While the carrots roast, in a large pan (nonstick, if you have one), heat 2 teaspoons of olive oil on medium-high until hot. Add the chopped garlic and cook, stirring constantly, 30 seconds to 1 minute, or until fragrant. Add the chopped kale; season with salt and pepper. Cook, stirring occasionally, 3 to 4 minutes, or until slightly wilted. Add 1/3 cup of water; season with salt and pepper. Cook, stirring occasionally, 3 to 4 minutes, or until the kale has wilted and the water has cooked off. Transfer to the pot of cooked rice. Stir to combine; season with salt and pepper to taste. Cover to keep warm. Wipe out the pan.', 'images/ancho-orange-chicken/step-4.jpg'),
(5, 1, 5, 'Cook & glaze the chicken', 'While the carrots continue to roast, pat the chicken dry with paper towels; season with salt and pepper on both sides. In the same pan, heat 2 teaspoons of olive oil on medium-high until hot. Add the seasoned chicken and cook 4 to 6 minutes on the first side, or until browned. Flip and cook 2 to 3 minutes, or until lightly browned. Add the glaze and cook, frequently spooning the glaze over the chicken, 2 to 3 minutes, or until the chicken is coated and cooked through. Turn off the heat; stir the butter and the juice of 1 lime half into the glaze until the butter has melted. Season with salt and pepper to taste.', 'images/ancho-orange-chicken/step-5.jpg'),
(6, 1, 6, 'Finish the rice & serve your dish', 'To the pot of cooked rice and kale, add the lime zest, crème fraîche, raisins, and the juice of the remaining lime half. Stir to combine; season with salt and pepper to taste. Serve the glazed chicken with the finished rice and roasted carrots. Top the chicken with the remaining glaze from the pan. Enjoy!', 'images/ancho-orange-chicken/step-6.jpg'),
(7, 2, 1, 'Prepare the ingredients', 'Heat a medium pot of salted water to boiling on high. Wash and dry the fresh produce. Large dice the potatoes. Peel the garlic. Using the flat side of your knife, smash 1 clove to flatten. Roughly chop the remaining clove. Peel and thinly slice the shallot. Remove and discard the stems of the kale; roughly chop the leaves. Thinly slice the mushrooms.', 'images/beef-medallions-mushroom-sauce/step-1.jpg'),
(8, 2, 2, 'Cook & mash the potatoes', 'Add the diced potatoes and smashed garlic to the pot of boiling water and cook 13 to 15 minutes, or until tender when pierced with a fork. Turn off the heat. Drain thoroughly and return to the pot. Add half the butter and a drizzle of olive oil. Using a fork, mash to your desired consistency. Season with salt and pepper to taste. Cover to keep warm.', 'images/beef-medallions-mushroom-sauce/step-2.jpg'),
(9, 2, 3, 'Cook the kale', 'While the potatoes cook, in a large pan, heat 2 teaspoons of olive oil on medium-high until hot. Add the sliced shallot; season with salt and pepper. Cook, stirring occasionally, 1 to 2 minutes, or until softened. Add the chopped kale and 1/4 cup of water; season with salt and pepper. Cook, stirring frequently, 3 to 4 minutes, or until the kale has wilted and the water has cooked off. Transfer to a bowl and season with salt and pepper to taste. Cover with aluminum foil to keep warm. Rinse and wipe out the pan.', 'images/beef-medallions-mushroom-sauce/step-3.jpg'),
(10, 2, 4, 'Cook the beef', 'While the potatoes continue to cook, pat the beef dry with paper towels. Season with salt and pepper on both sides. In the same pan, heat 1 tablespoon of olive oil on medium-high until hot. Add the seasoned beef and cook 2 to 3 minutes per side for medium-rare, or until browned and cooked to your desired degree of doneness. Leaving any browned bits (or fond) in the pan, transfer to a plate and let rest for at least 5 minutes.', 'images/beef-medallions-mushroom-sauce/step-4.jpg'),
(11, 2, 5, 'Make the mushroom sauce', 'While the beef rests, add a drizzle of olive oil to the pan of reserved fond and heat on medium-high until hot. Add the sliced mushrooms in an even layer. Cook, without stirring, 2 to 3 minutes, or until browned. Add the chopped garlic; season with salt and pepper. Cook, stirring frequently, 1 to 2 minutes, or until softened and fragrant. Add the mustard, verjus, and 2 tablespoons of water (be careful, as the liquid may splatter); season with salt and pepper. Cook, stirring frequently and scraping up any fond, 30 seconds to 1 minute, or until thoroughly combined. Turn off the heat and stir in the remaining butter until melted. (If the sauce seems too thick, gradually add up to 2 tablespoons of water to achieve your desired consistency.) Season with salt and pepper to taste.', 'images/beef-medallions-mushroom-sauce/step-5.jpg'),
(12, 2, 6, 'Serve your dish', 'Serve the rested beef with the mashed potatoes and cooked kale. Top the beef and potatoes with the mushroom sauce. Enjoy!', 'images/beef-medallions-mushroom-sauce/step-6.jpg'),
(13, 3, 1, 'Prepare the ingredients & season the tomato sauce', 'Place an oven rack in the center of the oven, then preheat to 475°F. Wash and dry the fresh produce. Cut off and discard the bottom 1/2 inch of the broccoli stem; cut the broccoli into small pieces, keeping the florets intact. Peel and roughly chop the garlic. Halve the focaccia. Grate the asiago cheese on the large side of a box grater. Tear the mozzarella cheese into small pieces. In a bowl, combine the tomato sauce and Italian seasoning; season with salt and pepper to taste.', 'images/broccoli-basil-pesto-sandwiches/step-1.jpg'),
(14, 3, 2, 'Cook the broccoli', 'In a large pan (nonstick, if you have one), heat 2 teaspoons of olive oil on medium-high until hot. Add the broccoli pieces; season with salt and pepper. Cook, stirring occasionally, 3 to 4 minutes, or until slightly softened. Add the chopped garlic; cook, stirring frequently, 1 to 2 minutes, or until slightly softened and fragrant. Add 1/2 cup of water; season with salt and pepper. Cook, stirring occasionally, 4 to 5 minutes, or until the broccoli has softened and the water has cooked off. Turn off the heat.', 'images/broccoli-basil-pesto-sandwiches/step-2.jpg'),
(15, 3, 3, 'Top & bake the focaccia', 'Line a sheet pan with foil. Place the halved focaccia on the foil, cut side up; drizzle with olive oil. Top with the seasoned tomato sauce. Top the focaccia bottom with the grated asiago cheese, half the mozzarella cheese, and the cooked broccoli. Evenly top the broccoli with the remaining mozzarella cheese and pesto (stirring before adding). Season both focaccia halves with salt and pepper. Bake, rotating the sheet pan halfway through, 11 to 13 minutes, or until lightly browned and the cheese has melted. Remove from the oven; let stand for at least 2 minutes. Transfer to a cutting board.', 'images/broccoli-basil-pesto-sandwiches/step-3.jpg'),
(16, 3, 4, 'Prepare the remaining ingredients', 'While the focaccia bakes, cut off and discard the root end of the lettuce; roughly chop the leaves. Place in a large bowl. Roughly chop the peppers. Halve 1 clementine crosswise; squeeze the juice into a bowl, straining out any seeds. Peel the remaining clementine; separate into segments. To make the dressing, add the crème fraîche, mustard, and 1 tablespoon of water to the bowl of clementine juice. Slowly whisk in a drizzle of olive oil until combined; season with salt and pepper to taste.', 'images/broccoli-basil-pesto-sandwiches/step-4.jpg'),
(17, 3, 5, 'Make the salad', 'Just before serving, add the clementine segments, chopped peppers, and dressing to the bowl of chopped lettuce. Toss to thoroughly coat. Season with salt and pepper to taste.', 'images/broccoli-basil-pesto-sandwiches/step-5.jpg'),
(18, 3, 6, 'Assemble the sandwich & serve your dish', 'Evenly top the baked focaccia bottom with the parmesan cheese. Complete with the focaccia top. Using a serrated knife, cut the finished sandwich into 4 equal-sized pieces. Serve with the salad on the side. Enjoy!', 'images/broccoli-basil-pesto-sandwiches/step-6.jpg'),
(19, 4, 1, 'Prepare the ingredients', 'Remove the dough from the refrigerator to bring to room temperature. Place an oven rack in the center of the oven, then preheat to 475°F. Wash and dry the fresh produce. Cut off and discard the bottom 1/2 inch of the broccoli stem, then roughly chop the broccoli. Peel and roughly chop the garlic. Tear the mozzarella cheese into small pieces. Quarter and deseed the lemon.', 'images/broccoli-mozzarella-calzones/step-1.jpg'),
(20, 4, 2, 'Cook the broccoli & make the filling', 'In a large pan (nonstick, if you have one), heat 2 teaspoons of olive oil on medium-high until hot. Add the chopped broccoli; season with salt and pepper. Cook, stirring occasionally, 4 to 6 minutes, or until lightly browned. Add 2/3 of the chopped garlic. Cook, stirring constantly, 30 seconds to 1 minute, or until fragrant. Add 1/4 cup of water; season with salt and pepper. Cook, stirring occasionally, 2 to 3 minutes, or until the broccoli has softened and the water has cooked off. Transfer to a large bowl. Add the mozzarella cheese, ricotta cheese, half the Italian seasoning, and the juice of 1 lemon wedge; stir to combine. Season with salt and pepper. Wipe out the pan.', 'images/broccoli-mozzarella-calzones/step-2.jpg'),
(21, 4, 3, 'Assemble & bake the calzones', 'Lightly oil a sheet pan. Divide the dough into 2 equal-sized portions; using your hands and a rolling pin (or wine bottle), gently stretch and roll the portions into ¼-inch-thick rounds. (If the dough is resistant, let rest for 5 minutes.) Divide the filling between the centers of the rounds; fold each round in half over the filling. Using a fork, crimp the edges of the dough to seal. Transfer to the sheet pan. Using a fork, poke a few holes across the tops of the calzones to vent. Lightly drizzle the calzones with olive oil. Bake 16 to 18 minutes, or until golden brown. Transfer to a cutting board and let stand for at least 2 minutes.', 'images/broccoli-mozzarella-calzones/step-3.jpg'),
(22, 4, 4, 'Prepare the remaining ingredients', 'While the calzones bake, using the flat side of your knife, smash the olives; remove and discard the pits, then roughly chop. Cut off and discard the root end of the lettuce; roughly chop the leaves. To make the dressing, in a large bowl, combine the mayonnaise, half the parmesan cheese, the juice of the remaining lemon wedges, and a drizzle of olive oil. Season with salt and pepper to taste.', 'images/broccoli-mozzarella-calzones/step-4.jpg'),
(23, 4, 5, 'Make the tomato sauce', 'While the calzones continue to bake, in the pan used to cook the broccoli, heat 2 teaspoons of olive oil on medium-high until hot. Add the remaining chopped garlic; cook, stirring constantly, 30 seconds to 1 minute, or until fragrant. Add the tomato sauce and remaining Italian seasoning. Cook, stirring frequently, 2 to 3 minutes, or until slightly thickened. Turn off the heat and season with salt and pepper to taste.', 'images/broccoli-mozzarella-calzones/step-5.jpg'),
(24, 4, 6, 'Make the salad & serve your dish', 'Just before serving, add the chopped olives and lettuce to the bowl of dressing. Toss to coat; season with salt and pepper to taste. Cut the baked calzones in half. Serve with the sauce and salad on the side. Garnish with the remaining parmesan cheese. Enjoy!', 'images/broccoli-mozzarella-calzones/step-6.jpg'),
(25, 5, 1, 'Prepare the ingredients', 'Heat a large pot of salted water to boiling on high. Wash and dry the fresh produce. Cut off and discard the bottom 1/2 inch of the broccoli stem; cut the broccoli into small pieces, keeping the florets intact. Peel and finely chop the garlic.', 'images/bucatini-alfredo/step-1.jpg'),
(26, 5, 2, 'Cook the broccoli', 'In a large pan, heat 2 teaspoons of olive oil on medium-high until hot. Add the broccoli pieces; season with salt and pepper. Cook, stirring occasionally, 4 to 5 minutes, or until slightly softened. Add 1/2 cup of water; season with salt and pepper. Cover the pan with aluminum foil and cook 3 to 4 minutes, or until the broccoli has softened and the water has cooked off. Transfer to a bowl. Wipe out the pan.', 'images/bucatini-alfredo/step-2.jpg'),
(27, 5, 3, 'Cook the pasta', 'While the broccoli cooks, add the pasta to the pot of boiling water and cook 8 to 10 minutes, or until al dente (still slightly firm to the bite). Reserving ½ cup of the pasta cooking water, drain thoroughly.', 'images/bucatini-alfredo/step-3.jpg'),
(28, 5, 4, 'Make the sauce', 'In the same pan, heat 1 1/2 tablespoons of olive oil on medium-high until hot. Add the chopped garlic; season with salt and pepper. Cook, stirring constantly, 30 seconds to 1 minute, or until fragrant. Add the flour and as much of the red pepper flakes as you\'d like, depending on how spicy you\'d like the dish to be. Cook, stirring constantly, 30 seconds to 1 minute, or until thoroughly combined. Add the heavy cream (shaking the bottle just before opening), verjus, and 1 1/4 cups of water; season with salt and pepper. Cook, whisking frequently, 2 to 3 minutes, or until thickened; season with salt and pepper to taste.', 'images/bucatini-alfredo/step-4.jpg'),
(29, 5, 5, 'Finish & serve your dish', 'Add the cooked pasta, cooked broccoli, crème fraîche, and half the reserved pasta cooking water to the pan. Cook, stirring vigorously, 30 seconds to 1 minute, or until the pasta is thoroughly coated. (If the sauce seems dry, gradually add the remaining pasta cooking water to achieve your desired consistency.) Turn off the heat and season with salt and pepper to taste. Garnish the finished pasta with the cheese; season with pepper. Enjoy!', 'images/bucatini-alfredo/step-5.jpg'),
(30, 6, 1, 'Prepare & roast the broccoli', 'Place an oven rack in the center of the oven, then preheat to 450°F. Heat a large pot of salted water to boiling on high. Wash and dry the fresh produce. Cut off and discard the bottom 1/2 inch of the broccoli stem; cut the broccoli into small pieces. Place on a sheet pan. Drizzle with olive oil and season with salt, pepper, and up to half the Italian seasoning (you will have extra); toss to coat. Arrange in an even layer. Roast 22 to 24 minutes, or until browned and tender when pierced with a fork. Remove from the oven.', 'images/bucatini-tomato-sauce/step-1.jpg'),
(31, 6, 2, 'Prepare the remaining ingredients', 'While the broccoli roasts, peel and roughly chop the garlic. Using the flat side of your knife, smash the olives; remove and discard the pits, then roughly chop. Grate the cheese on the small side of a box grater.', 'images/bucatini-tomato-sauce/step-2.jpg'),
(32, 6, 3, 'Cook the pasta', 'While the broccoli continues to roast, add the pasta to the pot of boiling water and cook 8 to 10 minutes, or until al dente (still slightly firm to the bite). Turn off the heat. Reserving 1/2 cup of the pasta cooking water, drain thoroughly and return to the pot.', 'images/bucatini-tomato-sauce/step-3.jpg'),
(33, 6, 4, 'Make the sauce', 'While the pasta cooks, in a medium pan, heat 2 teaspoons of olive oil on medium-high until hot. Add the chopped garlic, capers, and as much of the red pepper flakes as you\'d like, depending on how spicy you\'d like the dish to be; season with salt and pepper. Cook, stirring constantly, 30 seconds to 1 minute, or until fragrant. Add the tomatoes and chopped olives; season with salt and pepper. Cook, stirring occasionally and gently crushing the tomatoes with the back of a spoon, 6 to 7 minutes, or until thickened. Turn off the heat and season with salt and pepper to taste.', 'images/bucatini-tomato-sauce/step-4.jpg'),
(34, 6, 5, 'Finish & serve your dish', 'To the pot of cooked pasta, add the roasted broccoli, sauce, butter, half the grated cheese, and half the reserved pasta cooking water; season with salt and pepper. Cook on medium-high, stirring vigorously, 1 to 2 minutes, or until the pasta is thoroughly coated. (If the sauce seems dry, gradually add the remaining pasta cooking water to achieve your desired consistency.) Turn off the heat and season with salt and pepper to taste. Garnish the finished pasta with the remaining grated cheese. Enjoy!', 'images/bucatini-tomato-sauce/step-5.jpg'),
(35, 7, 1, 'Cook the rice', 'Place an oven rack in the center of the oven, then preheat to 450°F. In a medium pot, combine the rice, half the spice blend, a big pinch of salt, and 1 1/2 cups of water. Heat to boiling on high. Once boiling, cover and reduce the heat to low. Cook 12 to 14 minutes, or until the water has been absorbed and the rice is tender. Turn off the heat and fluff with a fork. Transfer to a large bowl and set aside in a warm place.', 'images/cheesy-enchiladas-rojas/step-1.jpg'),
(36, 7, 2, 'Prepare the ingredients & make the lime sour cream', 'While the rice cooks, wash and dry the fresh produce. Thinly slice the mushrooms. Remove and discard the stems of the kale; roughly chop the leaves. Peel and roughly chop the garlic. Peel and thinly slice the onion. Place the tomatoes in a bowl; gently break apart with your hands. Grate the cheese on the large side of a box grater. Thinly slice the chives. Halve the lime crosswise. In a bowl, combine the sour cream, the juice of 1 lime half, and a drizzle of olive oil; season with salt and pepper to taste.', 'images/cheesy-enchiladas-rojas/step-2.jpg'),
(37, 7, 3, 'Cook the vegetables & start the filling', 'In a large pan, heat 2 teaspoons of olive oil on medium-high until hot. Add the sliced mushrooms in an even layer. Cook, without stirring, 2 to 3 minutes, or until lightly browned. Add the chopped kale and 1/2 cup of water; season with salt and pepper. Cook, stirring frequently, 4 to 5 minutes, or until the kale has wilted and the water has cooked off. Transfer to the bowl of cooked rice; stir to combine. Wipe out the pan.', 'images/cheesy-enchiladas-rojas/step-3.jpg'),
(38, 7, 4, 'Make the sauce', 'In the same pan, heat 2 teaspoons of olive oil on medium-high until hot. Add the chopped garlic and sliced onion; season with salt and pepper. Cook, stirring frequently, 4 to 5 minutes, or until softened. Add the chile paste and remaining spice blend; cook, stirring constantly, 30 seconds to 1 minute, or until dark red and fragrant. Add the tomatoes; season with salt and pepper. Cook, stirring frequently, 6 to 7 minutes, or until thickened. Turn off the heat. Season with salt and pepper to taste.', 'images/cheesy-enchiladas-rojas/step-4.jpg'),
(39, 7, 5, 'Finish the filling & assemble the enchiladas', 'Add half the cheese and the juice of the remaining lime half to the bowl of filling. Stir to combine; season with salt and pepper to taste. Place the tortillas on a work surface. Spread about half the sauce into the bottom of a baking dish. Divide the finished filling among the tortillas; tightly roll up each tortilla around the filling. Transfer to the baking dish in a single layer, seam side down. Evenly top with the remaining sauce and remaining cheese.', 'images/cheesy-enchiladas-rojas/step-5.jpg'),
(40, 7, 6, 'Bake the enchiladas & serve your dish', 'Bake the enchiladas 10 to 12 minutes, or until the cheese has melted. Remove from the oven and let stand for at least 2 minutes. Garnish with the sliced chives. Serve with the lime sour cream. Enjoy!', 'images/cheesy-enchiladas-rojas/step-6.jpg'),
(41, 8, 1, 'Prepare & roast the sweet potatoes', 'Place an oven rack in the center of the oven, then preheat to 450°F. Wash and dry the fresh produce. Cut the sweet potatoes lengthwise into 1-inch-wide wedges. Place on a sheet pan. Drizzle with olive oil and season with salt and pepper; toss to coat. Arrange in an even layer, skin side down. Roast 27 to 29 minutes, or until browned and tender when pierced with a fork. Reserving the sheet pan, transfer to a plate and set aside in a warm place.', 'images/crispy-fish-sandwiches/step-1.jpg'),
(42, 8, 2, 'Prepare the remaining ingredients & make the sauce', 'While the sweet potatoes roast, cut off and discard the root end of the lettuce; thinly slice the leaves. Halve the rolls. In a bowl, combine the mayonnaise, creamy mustard sauce, and sweet pickle relish. Season with salt and pepper to taste. Pat the fish fillets dry with paper towels. Halve crosswise.', 'images/crispy-fish-sandwiches/step-2.jpg'),
(43, 8, 3, 'Bread the fish', 'While the sweet potatoes continue to roast, season the halved fish fillets on both sides with salt, pepper, and the spice blend. Crack the eggs into a bowl; season with salt and pepper. Beat until smooth. Place the breadcrumbs on a plate; season with salt and pepper. Working one piece at a time, thoroughly coat the seasoned fillets in the beaten eggs (letting any excess drip off), then in the breadcrumbs (pressing to adhere). Transfer to a separate plate.', 'images/crispy-fish-sandwiches/step-3.jpg'),
(44, 8, 4, 'Cook the fish', 'While the sweet potatoes continue to roast, in a large pan (nonstick, if you have one), heat a thin layer of oil on medium-high until hot. Once the oil is hot enough that a pinch of breadcrumbs sizzles immediately when added, working in batches if necessary, add the breaded fish fillets. Cook 2 to 3 minutes per side, or until browned and cooked through. (If the pan seems dry, add 1 teaspoon of olive oil before flipping.) Transfer to a paper towel-lined plate; immediately season with salt and pepper.', 'images/crispy-fish-sandwiches/step-4.jpg'),
(45, 8, 5, 'Toast the rolls', 'While the fish cooks, place the rolls on the same sheet pan, cut side up. Drizzle with olive oil. Toast in the oven 4 to 5 minutes, or until lightly browned. Transfer to a clean work surface.', 'images/crispy-fish-sandwiches/step-5.jpg'),
(46, 8, 6, 'Assemble the sandwiches & serve your dish', 'Divide the sauce, cooked fish fillets, and sliced lettuce among the toasted rolls. Serve the sandwiches with the roasted sweet potatoes on the side. Enjoy!', 'images/crispy-fish-sandwiches/step-6.jpg'),
(47, 9, 1, 'Cook the rice', 'Remove the honey from the refrigerator to bring to room temperature. In a medium saucepan, combine the rice, a big pinch of salt, and 1 1/2 cups of water; heat to boiling on high. Once boiling, cover and reduce the heat to low. Cook 12 to 14 minutes, or until the water has been absorbed and the rice is tender. Turn off the heat and fluff with a fork. Cover to keep warm.', 'images/general-tsos-chicken/step-1.jpg'),
(48, 9, 2, 'Coat & cook the chicken', 'While the rice cooks, pat the chicken dry with paper towels. Place in a large bowl and season with salt and pepper. Add the cornstarch; toss to thoroughly coat. In a medium pan, heat a thin layer of oil on medium-high until hot. Once the oil is hot enough that a piece of chicken sizzles immediately when added to the pan, add the coated chicken in an even layer (tapping off any excess cornstarch before adding). Cook, without stirring, 3 to 4 minutes, or until lightly browned. Continue to cook, stirring occasionally, 3 to 4 minutes, or until browned and cooked through. Leaving any browned bits (or fond) in the pan, transfer to a plate. Set aside in a warm place.', 'images/general-tsos-chicken/step-2.jpg'),
(49, 9, 3, 'Prepare the ingredients & make the sauce', 'While the chicken cooks, wash and dry the fresh produce. Cut off and discard the root end of the bok choy; roughly chop. Peel and finely chop the ginger. Peel and roughly chop the garlic. In a bowl, combine the hoisin sauce, vinegar, honey (kneading the packet before opening), sesame oil, 1 tablespoon of water, and as much of the sriracha as you\'d like, depending on how spicy you\'d like the dish to be.', 'images/general-tsos-chicken/step-3.jpg'),
(50, 9, 4, 'Cook the vegetables & add the sauce', 'Add the chopped bok choy, ginger, and garlic to the pan of reserved fond; season with salt and pepper. (If the pan seems dry, add 1 tablespoon of olive oil.) Cook on medium-high, stirring frequently, 2 to 3 minutes, or until softened and fragrant. Add the sauce and cook, stirring constantly and scraping up any fond, 30 seconds to 1 minute, or until thoroughly combined.', 'images/general-tsos-chicken/step-4.jpg'),
(51, 9, 5, 'Finish & serve your dish', 'Turn off the heat and add the cooked chicken to the pan; stir to thoroughly coat. Season with salt and pepper to taste. Serve the finished chicken and bok choy with the cooked rice. Enjoy!', 'images/general-tsos-chicken/step-5.jpg'),
(52, 10, 1, 'Prepare the ingredients', 'Fill a medium pot with water; add a pinch of salt. Heat to boiling on high. Wash and dry the fresh produce. Peel and finely chop the ginger. Cut out and discard the core of the cabbage; thinly slice the leaves. Peel the carrots and thinly slice into rounds. Thinly slice the chives.', 'images/hoisin-glazed-pork-chops/step-1.jpg'),
(53, 10, 2, 'Cook the vegetables', 'In a large pan, heat 2 teaspoons of olive oil on medium-high until hot. Add the chopped ginger, sliced cabbage, and sliced carrots; season with salt and pepper. Cook, stirring occasionally, 4 to 5 minutes, or until softened and fragrant. Transfer to a bowl and cover with aluminum foil to keep warm. Rinse and wipe out the pan.', 'images/hoisin-glazed-pork-chops/step-2.jpg'),
(54, 10, 3, 'Cook & glaze the pork chops', 'Pat the pork chops dry with paper towels; season with salt and pepper on both sides. In the same pan, heat 1 tablespoon of olive oil on medium-high until hot. Add the seasoned pork chops and cook 3 to 5 minutes on the first side, or until browned. Flip and cook 2 to 3 minutes, or until lightly browned. Add the hoisin sauce and 1/4 cup of water. Cook, frequently spooning the glaze over the pork, 2 to 3 minutes, or until the pork chops are coated and cooked through. Turn off the heat.', 'images/hoisin-glazed-pork-chops/step-3.jpg'),
(55, 10, 4, 'Make the sauce', 'While the pork chops cook, in a bowl, whisk together the soy sauce, tahini, vinegar, and as much of the sambal oelek as you\'d like, depending on how spicy you\'d like the dish to be. Season with salt and pepper to taste.', 'images/hoisin-glazed-pork-chops/step-4.jpg'),
(56, 10, 5, 'Cook the noodles', 'While the pork chops continue to cook, using your hands, carefully separate the noodles and add to the pot of boiling water; cook, stirring occasionally, 2 to 4 minutes, or until tender. Turn off the heat. Drain thoroughly and return to the pot.', 'images/hoisin-glazed-pork-chops/step-5.jpg'),
(57, 10, 6, 'Finish the noodles & serve your dish', 'Add the cooked vegetables, sauce, and ¼ cup of water to the pot of cooked noodles. Cook on medium-high, stirring constantly, 30 seconds to 1 minute, or until thoroughly combined. Turn off the heat. Season with salt and pepper to taste. Serve the finished noodles topped with the glazed pork chops (including any glaze from the pan). Garnish with the sliced chives. Enjoy!', 'images/hoisin-glazed-pork-chops/step-6.jpg'),
(58, 11, 1, 'Prepare the ingredients', 'Remove the honey from the refrigerator to bring to room temperature. Place an oven rack in the center of the oven, then preheat to 450°F. Wash and dry the fresh produce. Halve the potatoes lengthwise; cut crosswise into 1/4-inch pieces. Peel the carrots; halve lengthwise, then cut crosswise into 1/2-inch pieces. Cut off and discard the ends of the radishes; quarter lengthwise, then halve crosswise. Quarter and deseed the lemon. Peel and finely chop the garlic; using the flat side of your knife, smash until it resembles a paste (or use a zester). Roughly chop the parsley leaves and stems.', 'images/honey-butter-barramundi/step-1.jpg'),
(59, 11, 2, 'Roast the vegetables', 'Place the sliced potatoes and carrot pieces on a sheet pan. Drizzle with 1 tablespoon of olive oil; season with salt, pepper, and the za\'atar seasoning. Toss to coat. Arrange in an even layer on one side of the sheet pan. Roast 12 to 14 minutes, or until lightly browned. Leaving the oven on, remove from the oven. Place the radish pieces in a bowl. Drizzle with olive oil and season with salt and pepper; toss to coat. Carefully arrange on the other side of the sheet pan. Roast 10 to 12 minutes, or until tender when pierced with a fork. Remove from the oven. Evenly top with the juice of 2 lemon wedges.', 'images/honey-butter-barramundi/step-2.jpg'),
(60, 11, 3, 'Make the yogurt sauce', 'While the vegetables roast, in a bowl, combine the yogurt, the juice of the remaining lemon wedges, 1 tablespoon of olive oil, and as much of the garlic paste as you\'d like. Drizzle with olive oil and season with salt and pepper to taste.', 'images/honey-butter-barramundi/step-3.jpg'),
(61, 11, 4, 'Cook the fish', 'Once the vegetables have roasted for about 10 minutes, pat the fish fillets dry with paper towels; season with salt and pepper on both sides. In a large pan (nonstick, if you have one), heat 1 tablespoon of olive oil on medium-high until hot. Add the seasoned fillets, skin side down. Cook 4 to 6 minutes on the first side, or until lightly browned. Flip and add the butter. Cook, frequently spooning the butter over the fillets, 2 to 3 minutes, or until the fish is cooked through. Leaving the melted butter and any browned bits (or fond) in the pan, transfer the cooked fillets to a plate.', 'images/honey-butter-barramundi/step-4.jpg'),
(62, 11, 5, 'Make the pan sauce', 'Add the honey (kneading the packet before opening) and 2 tablespoons of water to the pan of melted butter (be careful, as the liquid may splatter). Cook on medium-high, stirring frequently and scraping up any fond, 30 seconds to 1 minute, or until slightly thickened. Turn off the heat and season with salt and pepper to taste.', 'images/honey-butter-barramundi/step-5.jpg'),
(63, 11, 6, 'Serve your dish', 'Serve the cooked fish fillets and roasted vegetables with the yogurt sauce on the side. Top the fish with the pan sauce. Garnish with the chopped parsley. Enjoy!', 'images/honey-butter-barramundi/step-6.jpg'),
(64, 12, 1, 'Prepare the ingredients', 'Preheat the oven to 425°F. Wash and dry the fresh produce. Peel and roughly chop the garlic. Peel and thinly slice the shallot. Remove and discard the stems of the kale; roughly chop the leaves. Quarter and deseed the lemon.', 'images/kale-ricotta-quiche/step-1.jpg'),
(65, 12, 2, 'Cook the kale', 'In a large pan, heat 2 teaspoons of olive oil on medium-high until hot. Add the chopped garlic and sliced shallot; season with salt and pepper. Cook, stirring occasionally, 1 to 2 minutes, or until softened and fragrant. Add the chopped kale, heavy cream (shaking the bottle just before opening), and 1/4 cup of water; season with salt and pepper. Cook, stirring occasionally, 4 to 5 minutes, or until the kale has wilted and most of the liquid has cooked off. Turn off the heat. Season with salt and pepper to taste.', 'images/kale-ricotta-quiche/step-2.jpg'),
(66, 12, 3, 'Make the filling', 'Crack the eggs into a large bowl. Add the ricotta cheese, the juice of 1 lemon wedge, and the spice blend; season with salt and pepper. Whisk to thoroughly combine. Stir in the cooked kale.', 'images/kale-ricotta-quiche/step-3.jpg'),
(67, 12, 4, 'Assemble & bake the quiche', 'Place the pie crust on a sheet pan, leaving it in its tin. Carefully pour the filling into the crust; season with salt and pepper. Bake 24 to 26 minutes, or until the crust is browned and the filling is set and cooked through. Remove from the oven. Let stand for at least 5 minutes before serving.', 'images/kale-ricotta-quiche/step-4.jpg'),
(68, 12, 5, 'Prepare the remaining ingredients', 'While the quiche bakes, quarter and core the apple; thinly slice lengthwise. Place in a bowl and top with the juice of 1 lemon wedge to prevent browning. Cut off and discard the root end of the lettuce; roughly chop the leaves. To make the dressing, in a large bowl, combine the crème fraîche, the juice of the remaining lemon wedges, and a drizzle of olive oil. Season with salt and pepper to taste.', 'images/kale-ricotta-quiche/step-5.jpg'),
(69, 12, 6, 'Make the salad & serve your dish', 'Just before serving, add the sliced apple and chopped lettuce to the bowl of dressing. Toss to combine; season with salt and pepper to taste. Serve the baked quiche with the salad on the side. Garnish the salad with the almonds. Enjoy!', 'images/kale-ricotta-quiche/step-6.jpg'),
(70, 13, 1, 'Prepare & roast the sweet potato', 'Place an oven rack in the center of the oven, then preheat to 450°F. Wash and dry the fresh produce. Medium dice the sweet potato. Place on a sheet pan. Drizzle with olive oil and season with salt and pepper; toss to coat. Arrange in an even layer. Roast 20 to 22 minutes, or until browned and tender when pierced with a fork. Remove from the oven.', 'images/mexican-spiced-barramundi/step-1.jpg'),
(71, 13, 2, 'Prepare the remaining ingredients', 'While the sweet potato roasts, remove and discard the stems of the kale; finely chop the leaves and place in a large bowl. Using a peeler, remove the green rind of the lime, avoiding the white pith; mince to get 1 teaspoon of zest (or use a zester). Quarter the lime. Halve the orange; squeeze the juice into a bowl, straining out any seeds. Peel and finely chop the garlic; using the flat side of your knife, smash until it resembles a paste (or use a zester). Halve and pit the avocado.', 'images/mexican-spiced-barramundi/step-2.jpg'),
(72, 13, 3, 'Make the dressing & marinate the kale', 'Scoop the flesh of half the avocado into the bowl of orange juice. Add the lime zest, the juice of 2 lime wedges, as much of the garlic paste as you\'d like, and 1 tablespoon of olive oil. Mash and whisk until smooth; season with salt and pepper. Add the dressing to the bowl of chopped kale. Using your hands, massage the dressing into the kale for 1 to 2 minutes, or until the leaves have softened slightly. Set aside to marinate, stirring occasionally, for at least 10 minutes.', 'images/mexican-spiced-barramundi/step-3.jpg'),
(73, 13, 4, 'Toast the pepitas', 'While the kale marinates, heat a large pan (nonstick, if you have one) on medium-high until hot. Add the pepitas and toast, stirring frequently, 1 to 2 minutes, or until lightly browned and fragrant. Transfer to a plate. Wipe out the pan.', 'images/mexican-spiced-barramundi/step-4.jpg'),
(74, 13, 5, 'Season & cook the fish', 'Pat the fish fillets dry with paper towels. Season on both sides with salt, pepper, and the spice blend. In the same pan, heat 2 teaspoons of olive oil on medium-high until hot. Add the seasoned fillets, skin side down. Cook 4 to 6 minutes on the first side, or until the skin is crispy. Flip and cook 1 to 3 minutes, or until cooked through. Transfer to a plate.', 'images/mexican-spiced-barramundi/step-5.jpg'),
(75, 13, 6, 'Finish the salad & serve your dish', 'Medium dice the remaining avocado half. Add the roasted sweet potato, diced avocado, and toasted pepitas to the bowl of marinated kale. Gently toss to combine; season with salt and pepper to taste. Serve the cooked fish over the finished salad, with the remaining lime wedges on the side. Enjoy!', 'images/mexican-spiced-barramundi/step-6.jpg'),
(76, 14, 1, 'Prepare & roast the vegetables', 'Preheat the oven to 450°F. Wash and dry the fresh produce. Quarter the mushrooms. Quarter the potatoes lengthwise, then cut crosswise into 1/2-inch pieces. Place the vegetables on a sheet pan. Drizzle with olive oil and season with salt, pepper, and 3/4 of the spice blend; toss to coat. Arrange in an even layer. Roast 21 to 23 minutes, or until browned and tender when pierced with a fork. Remove from the oven.', 'images/mushroom-potato-tacos/step-1.jpg'),
(77, 14, 2, 'Prepare the remaining ingredients', 'While the vegetables roast, roughly chop the piquante peppers. Peel and small dice the shallot. Cut off and discard the root end of the lettuce; roughly chop the leaves. Peel and medium dice the orange. Cut off and discard the ends of the radishes; halve lengthwise, then thinly slice crosswise. Roughly chop the jalapeño pepper; thoroughly wash your hands and cutting board immediately after handling. In a bowl, combine the sour cream, a drizzle of olive oil, and as much of the remaining spice blend as you\'d like (you may have extra). Season with salt and pepper to taste.', 'images/mushroom-potato-tacos/step-2.jpg'),
(78, 14, 3, 'Warm the tortillas', 'While the vegetables continue to roast, place the tortillas on a large piece of aluminum foil. Tightly wrap to seal. Place directly onto the oven rack and warm 5 to 7 minutes, or until heated through and pliable. Transfer to a work surface and carefully unwrap.', 'images/mushroom-potato-tacos/step-3.jpg'),
(79, 14, 4, 'Make the pepper relish', 'While the tortillas warm, in a medium bowl, combine the chopped piquante peppers, diced shallot, half the vinegar, and as much of the chopped jalapeño pepper as you\'d like, depending on how spicy you\'d like the dish to be. Drizzle with olive oil and season with salt and pepper to taste.', 'images/mushroom-potato-tacos/step-4.jpg'),
(80, 14, 5, 'Make the salad', 'While the tortillas continue to warm, in a medium bowl, combine the chopped lettuce, diced orange, sliced radishes, peanuts, and remaining vinegar. Drizzle with olive oil and season with salt and pepper to taste.', 'images/mushroom-potato-tacos/step-5.jpg'),
(81, 14, 6, 'Assemble the tacos & serve your dish', 'Spread a layer of the seasoned sour cream onto the warmed tortillas. Top with the roasted vegetables and pepper relish. Serve the tacos with the salad on the side. Enjoy!', 'images/mushroom-potato-tacos/step-6.jpg'),
(82, 15, 1, 'Prepare the ingredients', 'Place an oven rack in the center of the oven, then preheat to 450°F. Heat a medium pot of salted water to boiling on high. Wash and dry the fresh produce. Cut off and discard the bottom 1/2 inch of the broccoli stem; cut the broccoli into small pieces, keeping the florets intact. Quarter and deseed the lemon. Peel and medium dice the sweet potatoes.', 'images/parmesan-crusted-chicken/step-1.jpg'),
(83, 15, 2, 'Roast the broccoli', 'Place the broccoli pieces on a sheet pan. Drizzle with olive oil and season with salt and pepper; toss to coat. Arrange in an even layer. Roast 16 to 18 minutes, or until browned and tender when pierced with a fork. Remove from the oven. Evenly top with the juice of 2 lemon wedges.', 'images/parmesan-crusted-chicken/step-2.jpg'),
(84, 15, 3, 'Cook & mash the sweet potatoes', 'While the broccoli roasts, add the diced sweet potatoes to the pot of boiling water. Cook 14 to 16 minutes, or until tender when pierced with a fork. Turn off the heat. Drain thoroughly and return to the pot. Add the butter and a drizzle of olive oil. Using a fork, mash to your desired consistency; season with salt and pepper to taste. Cover to keep warm.', 'images/parmesan-crusted-chicken/step-3.jpg'),
(85, 15, 4, 'Coat the chicken', 'While the sweet potatoes cook, on a large plate, combine the flour, half the cheese, and all but a pinch of the spice blend; season with salt and pepper. Pat the chicken dry with paper towels; season with salt and pepper on both sides. Working one piece at a time, thoroughly coat the seasoned chicken in the flour mixture (tapping off any excess). Transfer to a separate plate.', 'images/parmesan-crusted-chicken/step-4.jpg'),
(86, 15, 5, 'Cook the chicken', 'While the sweet potatoes continue to cook, in a large pan (nonstick, if you have one), heat 2 teaspoons of olive oil on medium-high until hot. Add the coated chicken and cook 5 to 7 minutes per side, or until golden brown and cooked through. Turn off the heat.', 'images/parmesan-crusted-chicken/step-5.jpg'),
(87, 15, 6, 'Make the sauce & serve your dish', 'While the chicken cooks, in a bowl, combine the mayonnaise, remaining spice blend, and the juice of the remaining lemon wedges; season with salt and pepper to taste. Serve the cooked chicken, roasted broccoli, and mashed sweet potatoes with the sauce on the side. Garnish the chicken with the remaining cheese. Enjoy!', 'images/parmesan-crusted-chicken/step-6.jpg'),
(88, 16, 1, 'Prepare & roast the sweet potato', 'Place an oven rack in the center of the oven, then preheat to 450°F. Wash and dry the fresh produce. Cut the sweet potato lengthwise into 1-inch wedges. Transfer to a sheet pan. Drizzle with olive oil and season with salt and pepper; toss to coat. Arrange in an even layer, skin side down. Roast 21 to 23 minutes, or until browned and tender when pierced with a fork. Set aside in a warm place.', 'images/pimento-cheeseburgers/step-1.jpg'),
(89, 16, 2, 'Prepare the remaining ingredients', 'While the sweet potato roasts, grate the cheese on the large side of a box grater. Place in a medium bowl. Finely chop the peppers. Halve the buns.', 'images/pimento-cheeseburgers/step-2.jpg'),
(90, 16, 3, 'Make the pimento cheese', 'While the sweet potato continues to roast, add the mayonnaise, spice blend, and peppers to the bowl of cheese. Stir to thoroughly combine; season with salt and pepper to taste.', 'images/pimento-cheeseburgers/step-3.jpg'),
(91, 16, 4, 'Form & cook the patties', 'While the sweet potato continues to roast, place the ground beef in a bowl; season with salt and pepper. Gently mix to incorporate. Using your hands, form the mixture into two ¾-inch-thick patties; transfer to a plate. In a medium pan (nonstick, if you have one), heat 1 teaspoon of olive oil on medium-high until hot. Add the patties and cook 3 to 4 minutes per side for medium-rare, or until browned and cooked to your desired degree of doneness. Leaving any browned bits (or fond) in the pan, transfer to a plate.', 'images/pimento-cheeseburgers/step-4.jpg'),
(92, 16, 5, 'Toast the buns', 'While the sweet potato continues to roast, add the buns, cut side down, to the pan of reserved fond. Toast on medium-high 30 seconds to 1 minute, or until lightly browned. Transfer to a work surface.', 'images/pimento-cheeseburgers/step-5.jpg'),
(93, 16, 6, 'Assemble the burgers & plate your dish', 'Divide half the pimento cheese between the bottoms of the toasted buns. Top with the cooked patties and remaining pimento cheese. Complete the burgers with the bun tops. Divide the burgers and roasted sweet potato between 2 dishes. Enjoy!', 'images/pimento-cheeseburgers/step-6.jpg'),
(94, 17, 1, 'Prepare & roast the potatoes', 'Preheat the oven to 450°F. Wash and dry the fresh produce. Halve the potatoes lengthwise, then cut crosswise into 1/4-inch pieces. Place on a sheet pan. Drizzle with olive oil and season with salt and pepper; toss to coat. Arrange in an even layer. Roast 22 to 24 minutes, or until browned and tender when pierced with a fork. Carefully transfer to a large bowl.', 'images/pork-chorizo-tacos/step-1.jpg'),
(95, 17, 2, 'Prepare the remaining ingredients', 'While the potatoes roast, cut out and discard the core of the cabbage; thinly slice the leaves. Halve the orange; squeeze the juice into a bowl, straining out any seeds. Cut off and discard the ends of the radishes; halve lengthwise, then thinly slice crosswise. Peel and finely chop the garlic; using the flat side of your knife, smash until it resembles a paste (or use a zester). Quarter the lime. In a bowl, combine the crème fraîche and the juice of 1 lime wedge. Drizzle with olive oil and season with salt and pepper to taste.', 'images/pork-chorizo-tacos/step-2.jpg'),
(96, 17, 3, 'Make the filling', 'While the potatoes continue to roast, in a medium pan, heat 2 teaspoons of olive oil on medium-high until hot. Add the ground chorizo; season with salt and pepper. Cook, frequently breaking the meat apart with a spoon, 3 to 5 minutes, or until browned. Add the sliced cabbage; season with salt and pepper. Cook, stirring occasionally, 2 to 3 minutes, or until slightly softened. Add the orange juice and 1/2 cup of water; season with salt and pepper. Cook, stirring occasionally, 6 to 7 minutes, or until the cabbage has softened and the chorizo is cooked through. Turn off the heat and stir in the juice of 2 lime wedges; season with salt and pepper to taste.', 'images/pork-chorizo-tacos/step-3.jpg'),
(97, 17, 4, 'Warm the tortillas & season the radishes', 'While the filling cooks, place the tortillas on a large piece of aluminum foil and tightly wrap to seal. Place directly onto the oven rack and warm 5 to 7 minutes, or until heated through and pliable. Transfer to a work surface and carefully unwrap. While the tortillas warm, in a bowl, combine the sliced radishes and the juice of the remaining lime wedge. Drizzle with olive oil and season with salt and pepper.', 'images/pork-chorizo-tacos/step-4.jpg'),
(98, 17, 5, 'Finish the potatoes', 'While the tortillas continue to warm, add the cheese and as much of the garlic paste as you\'d like to the bowl of roasted potatoes. Stir to coat; season with salt and pepper to taste.', 'images/pork-chorizo-tacos/step-5.jpg'),
(99, 17, 6, 'Assemble the tacos & serve your dish', 'Divide the filling, seasoned radishes, and lime crème fraîche among the warmed tortillas. Serve the tacos with the finished potatoes on the side. Enjoy!', 'images/pork-chorizo-tacos/step-6.jpg'),
(100, 18, 1, 'Prepare & roast the vegetables', 'Place an oven rack in the center of the oven, then preheat to 450°F. Heat a medium pot of salted water to boiling on high. Heat a small pot of water to boiling on high. Wash and dry the fresh produce. Cut off and discard the bottom 1/2 inch of the broccoli stem; cut the broccoli into small pieces, keeping the florets intact. Peel and thinly slice the onion. Place the vegetables on a sheet pan. Drizzle with olive oil and season with salt, pepper, and the za\'atar seasoning; toss to coat. Arrange in an even layer. Roast 20 to 22 minutes, or until browned and tender when pierced with a fork. Remove from the oven.', 'images/roasted-broccoli-fregola-sarda-salad/step-1.jpg'),
(101, 18, 2, 'Prepare the remaining ingredients', 'While the vegetables roast, quarter and deseed the lemon. Peel and finely chop the garlic; using the flat side of your knife, smash until it resembles a paste (or use a zester). Roughly chop the almonds. Using a fork, crumble the cheese into small pieces. Pick the mint leaves off the stems; discard the stems.', 'images/roasted-broccoli-fregola-sarda-salad/step-2.jpg'),
(102, 18, 3, 'Cook the pasta', 'While the vegetables continue to roast, add the pasta to the medium pot of boiling water and cook 14 to 16 minutes, or until tender. Turn off the heat. Drain thoroughly and return to the pot.', 'images/roasted-broccoli-fregola-sarda-salad/step-3.jpg'),
(103, 18, 4, 'Cook & peel the eggs', 'While the pasta cooks, carefully add the eggs to the small pot of boiling water and cook for exactly 9 minutes. Drain and rinse under cold water for 30 seconds to 1 minute to stop the cooking process. When cool enough to handle, carefully peel the cooked eggs. Transfer to a cutting board and thinly slice into rounds; season with salt and pepper.', 'images/roasted-broccoli-fregola-sarda-salad/step-4.jpg'),
(104, 18, 5, 'Make the dressing', 'While the eggs cook, in a bowl, whisk together the tahini, the juice of all 4 lemon wedges, 2 tablespoons of water, and as much of the garlic paste as you\'d like. Slowly whisk in 2 tablespoons of olive oil until well combined; season with salt and pepper to taste.', 'images/roasted-broccoli-fregola-sarda-salad/step-5.jpg'),
(105, 18, 6, 'Finish & serve your dish', 'Add the roasted vegetables, chopped almonds, crumbled cheese, dressing, and a drizzle of olive oil to the pot of cooked pasta. Stir to combine; season with salt and pepper to taste. Serve the finished salad topped with the seasoned eggs and a drizzle of olive oil. Garnish with the mint leaves (tearing just before adding). Enjoy!', 'images/roasted-broccoli-fregola-sarda-salad/step-6.jpg'),
(106, 19, 1, 'Prepare & roast the vegetables', 'Place an oven rack in the center of the oven, then preheat to 450°F. Heat a medium pot of salted water to boiling on high. Line a sheet pan with aluminum foil. Wash and dry the fresh produce. Cut off and discard the stem ends of the Brussels sprouts; halve lengthwise. Peel the carrots; halve lengthwise, then cut crosswise into 1-inch pieces. Place the vegetables on the sheet pan. Drizzle with olive oil and season with salt and pepper; toss to coat. Arrange in an even layer. Roast 14 to 16 minutes, or until browned and tender when pierced with a fork. Remove from the oven.', 'images/roasted-brussels-sprout-freekeh-salad/step-1.jpg'),
(107, 19, 2, 'Cook the freekeh', 'While the vegetables roast, peel 1 garlic clove; using the flat side of your knife, gently smash to flatten. Add the smashed garlic and freekeh to the pot of boiling water. Cook, uncovered, 20 to 22 minutes, or until tender. Turn off the heat. Drain thoroughly and return to the pot.', 'images/roasted-brussels-sprout-freekeh-salad/step-2.jpg');
INSERT INTO `steps` (`id`, `recipe_id`, `step_number`, `step_title`, `instructions`, `image`) VALUES
(108, 19, 3, 'Prepare the remaining ingredients', 'While the freekeh cooks, using a peeler, remove the yellow rind of the lemon, avoiding the white pith; mince the rind to get 2 teaspoons of zest (or use a zester). Quarter and deseed the lemon. Peel and finely chop the remaining garlic clove; using the flat side of your knife, smash until it resembles a paste (or use a zester). Roughly chop the almonds. Pit and roughly chop the dates. Pick the mint leaves off the stems; discard the stems.', 'images/roasted-brussels-sprout-freekeh-salad/step-3.jpg'),
(109, 19, 4, 'Make the lemon yogurt', 'While the freekeh continues to cook, in a bowl, combine the yogurt, lemon zest, the juice of 1 lemon wedge, and as much of the garlic paste as you\'d like. Drizzle with olive oil and season with salt and pepper to taste.', 'images/roasted-brussels-sprout-freekeh-salad/step-4.jpg'),
(110, 19, 5, 'Finish the salad', 'To the pot of cooked freekeh, add the peppers, chopped almonds and dates, roasted vegetables, the juice of the remaining lemon wedges, half the mint leaves (tearing just before adding), and as much of the red pepper flakes as you\'d like, depending on how spicy you\'d like the dish to be. Drizzle with olive oil and stir to combine. Season with salt and pepper to taste.', 'images/roasted-brussels-sprout-freekeh-salad/step-5.jpg'),
(111, 19, 6, 'Serve your dish', 'Serve the finished salad with the lemon yogurt on the side. Garnish the salad with the cheese (crumbling before adding), remaining mint leaves (tearing just before adding), and a drizzle of olive oil. Enjoy!', 'images/roasted-brussels-sprout-freekeh-salad/step-6.jpg'),
(112, 20, 1, 'Prepare & roast the cauliflower', 'Place an oven rack in the center of the oven, then preheat to 450°F. Heat a small pot of water to boiling on high. Wash and dry the fresh produce. Cut out and discard the core of the cauliflower; cut into small pieces. Place on a sheet pan. Drizzle with olive oil and season with salt and pepper; toss to coat. Arrange in an even layer. Roast 22 to 24 minutes, or until lightly browned and tender when pierced with a fork. Carefully transfer to a large bowl.', 'images/roasted-cauliflower-salad/step-1.jpg'),
(113, 20, 2, 'Prepare the remaining ingredients', 'While the cauliflower roasts, peel and thinly slice the shallot. Peel and roughly chop the garlic. Remove and discard the stems of the kale; roughly chop. Using a peeler, remove the yellow rind of the lemon, avoiding the white pith; mince the rind to get 2 teaspoons of zest (or use a zester). Quarter and deseed the lemon.', 'images/roasted-cauliflower-salad/step-2.jpg'),
(114, 20, 3, 'Cook & peel the eggs', 'While the cauliflower continues to roast, carefully add the eggs to the pot of boiling water and cook for exactly 7 minutes. Drain and rinse under cold water for 30 seconds to 1 minute to stop the cooking process. When cool enough to handle, carefully peel the cooked eggs.', 'images/roasted-cauliflower-salad/step-3.jpg'),
(115, 20, 4, 'Make the parmesan breadcrumbs', 'While the eggs cook, in a medium pan (nonstick, if you have one), heat 2 teaspoons of olive oil on medium-high until hot. Add the breadcrumbs; season with salt and pepper. Toast, stirring frequently, 2 to 4 minutes, or until lightly browned. Transfer to a bowl and stir in the cheese; season with salt and pepper to taste. Wipe out the pan.', 'images/roasted-cauliflower-salad/step-4.jpg'),
(116, 20, 5, 'Cook the kale', 'In the same pan, heat 1 tablespoon of olive oil on medium-high until hot. Add the sliced shallot and chopped garlic; season with salt and pepper. Cook, stirring frequently, 1 to 2 minutes, or until softened. Add the chopped kale and ¼ cup of water; season with salt and pepper. Cook, stirring occasionally, 3 to 4 minutes, or until the kale has wilted and the water has cooked off. Turn off the heat. Stir in the lemon zest. Transfer to the bowl of roasted cauliflower. Gently stir to combine; season with salt and pepper to taste. Wipe out the pan.', 'images/roasted-cauliflower-salad/step-5.jpg'),
(117, 20, 6, 'Make the brown butter & plate your dish', 'In the same pan, heat the butter on medium-high until melted. Cook, stirring frequently and swirling the pan, 1 to 2 minutes, or until browned and nuttily fragrant. (Be careful not to overcook, as the butter can burn easily.) Turn off the heat. Stir in the capers and the juice of all 4 lemon wedges; season with salt and pepper to taste. Top the finished cauliflower and kale with the brown butter, parmesan breadcrumbs, and peeled eggs; season the eggs with salt and pepper. Enjoy!', 'images/roasted-cauliflower-salad/step-6.jpg'),
(118, 21, 1, 'Roast the chicken', 'Preheat the oven to 450°F. Line a sheet pan with aluminum foil. Pat the chicken dry with paper towels and place on the foil. Season on both sides with salt, pepper, and the spice blend. Drizzle with olive oil and turn to coat; arrange skin side up. Roast 36 to 38 minutes, or until browned and cooked through. (An instant-read thermometer inserted into the thickest part of the thigh should register 165ºF.) Reserving any drippings on the sheet pan, transfer to a cutting board and let rest for at least 5 minutes.', 'images/roasted-chicken-fall-vegetables/step-1.jpg'),
(119, 21, 2, 'Prepare the ingredients', 'While the chicken roasts, wash and dry the fresh produce. Medium dice the sweet potatoes. Cut off and discard the ends of the Brussels sprouts; halve lengthwise.', 'images/roasted-chicken-fall-vegetables/step-2.jpg'),
(120, 21, 3, 'Roast the vegetables', 'While the chicken continues to roast, place the sweet potatoes and Brussels sprouts on a separate sheet pan. Drizzle with olive oil and season with salt and pepper; toss to coat. Arrange in an even layer. Roast, stirring halfway through, 24 to 26 minutes, or until lightly browned and tender when pierced with a fork. Remove from the oven and top with the vinegar; carefully stir to coat. Set aside in a warm place.', 'images/roasted-chicken-fall-vegetables/step-3.jpg'),
(121, 21, 4, 'Prepare the remaining ingredients', 'While the vegetables roast, peel and finely chop the ginger. Roughly chop the walnuts.', 'images/roasted-chicken-fall-vegetables/step-4.jpg'),
(122, 21, 5, 'Make the compote', 'While the vegetables continue to roast, in a small saucepan, combine the cranberries, sugar, ginger, and 1/4 cup of water; season with salt and pepper. Heat to boiling on high. Once boiling, reduce the heat to medium-high. Cook, stirring occasionally, 4 to 6 minutes, or until thickened and the cranberries are mostly broken down; season with salt and pepper to taste. Transfer to a serving dish.', 'images/roasted-chicken-fall-vegetables/step-5.jpg'),
(123, 21, 6, 'Carve the chicken & serve your dish', 'Using a sharp, sturdy knife, cut along the leg of the rested chicken to separate the thigh and breast. Cut the breast in half crosswise through the bone (keeping the wing intact). Cut through the joint connecting the drumstick to the thigh. Divide the carved chicken and finished vegetables among 4 dishes. Top with any reserved drippings. Garnish with the walnuts. Serve the compote on the side. Enjoy!', 'images/roasted-chicken-fall-vegetables/step-6.jpg'),
(124, 22, 1, 'Roast the pork & broccoli', 'Place an oven rack in the center of the oven, then preheat to 450°F. Line a sheet pan with aluminum foil. Wash and dry the fresh produce. Cut off and discard the bottom 1/2 inch of the broccoli stem; cut the broccoli into large pieces, keeping the florets intact. Place on the sheet pan. Drizzle with olive oil and season with salt and pepper; toss to coat. Arrange in an even layer on one side of the sheet pan. Pat the pork dry with paper towels; season on all sides with salt, pepper, and the spice blend. Place on the other side of the sheet pan. Drizzle with olive oil; turn to coat. Roast, rotating the sheet pan halfway through, 26 to 28 minutes, or until the broccoli is browned and the pork is cooked through. (An instant-read thermometer inserted into the pork should register 145°F.) Remove from the oven. Transfer the roasted pork to a cutting board and let rest for at least 5 minutes.', 'images/roasted-pork-broccoli/step-1.jpg'),
(125, 22, 2, 'Prepare the ingredients', 'While the pork and broccoli roast, peel and finely chop the garlic; using the side of your knife, smash until it resembles a paste (or use a zester). Core and medium dice the apple. Small dice the cheese.', 'images/roasted-pork-broccoli/step-2.jpg'),
(126, 22, 3, 'Make the garlic breadcrumbs', 'While the pork and broccoli continue to roast, in a medium pan, heat a drizzle of olive oil on medium-high until hot. Add the breadcrumbs and half the garlic paste. Cook, stirring constantly, 2 to 3 minutes, or until golden brown. Transfer to a plate; immediately season with salt and pepper. Wipe out the pan.', 'images/roasted-pork-broccoli/step-3.jpg'),
(127, 22, 4, 'Cook the apple', 'While the pork and broccoli continue to roast, in the same pan, heat a drizzle of olive oil on medium-high until hot. Add the diced apple; season with salt and pepper. Cook, stirring occasionally, 3 to 5 minutes, or until slightly softened. Add the vinegar and cook, stirring constantly, 30 seconds to 1 minute, or until the liquid has cooked off. Transfer to a bowl; season with salt and pepper to taste. Cover with aluminum foil to keep warm. Rinse and wipe out the pan.', 'images/roasted-pork-broccoli/step-4.jpg'),
(128, 22, 5, 'Make the cheese sauce', 'While the pork rests, in the same pan, heat 1 ½ tablespoons of olive oil on medium-high until hot. Add the flour and remaining garlic paste; season with salt and pepper. Cook, stirring constantly, 30 seconds to 1 minute, or until lightly browned and fragrant. Add the milk and 1/2 cup of water; season with salt and pepper. Cook, whisking frequently, 2 to 3 minutes, or until thickened. Add the diced cheese; season with salt and pepper. Cook, whisking constantly, 1 to 2 minutes, or until the cheese has melted. Turn off the heat and season with salt and pepper to taste.', 'images/roasted-pork-broccoli/step-5.jpg'),
(129, 22, 6, 'Slice the pork & serve your dish', 'Find the lines of muscle (or grain) on the rested pork; thinly slice crosswise against the grain. Serve the sliced pork with the roasted broccoli and cheese sauce. Top the pork with the cooked apple and garlic breadcrumbs. Enjoy!', 'images/roasted-pork-broccoli/step-6.jpg'),
(130, 23, 1, 'Prepare & roast the broccoli', 'Place an oven rack in the center of the oven, then preheat to 450°F. Heat a large pot of salted water to boiling on high. Wash and dry the fresh produce. Quarter and deseed the lemon. Cut off and discard the bottom 1/2 inch of the broccoli stem; cut the broccoli into small pieces, keeping the florets intact. Place on a sheet pan. Drizzle with olive oil and season with salt and pepper; toss to coat. Arrange in an even layer. Roast 16 to 18 minutes, or until browned and tender when pierced when pierced with a fork. Remove from the oven. Evenly top with the juice of 2 lemon wedges.', 'images/roasted-red-pepper-pasta/step-1.jpg'),
(131, 23, 2, 'Cook the pasta', 'While the broccoli roasts, add the pasta to the pot of boiling water and cook 8 to 10 minutes, or until al dente (still slightly firm to the bite). Reserving ½ cup of the pasta cooking water, drain thoroughly.', 'images/roasted-red-pepper-pasta/step-2.jpg'),
(132, 23, 3, 'Prepare the remaining ingredients', 'While the pasta cooks, peel and roughly chop the garlic. Finely chop the peppers.', 'images/roasted-red-pepper-pasta/step-3.jpg'),
(133, 23, 4, 'Make the sauce', 'While the pasta continues to cook, in a medium pan, heat 2 teaspoons of olive oil on medium-high until hot. Add the capers and chopped garlic and peppers; season with salt and pepper. Cook, stirring frequently, 2 to 3 minutes, or until lightly browned. Add the tomato paste and as much of the chile paste as you\'d like, depending on how spicy you\'d like the dish to be. Cook, stirring constantly, 1 to 2 minutes, or until dark red and fragrant. Turn off the heat; add the heavy cream (shaking the bottle just before opening) and 1/4 cup of water. Stir to combine; season with salt and pepper to taste.', 'images/roasted-red-pepper-pasta/step-4.jpg'),
(134, 23, 5, 'Finish the pasta & serve your dish', 'To the pan of sauce, add the cooked pasta, butter, and half the reserved pasta cooking water. Cook on medium-high, stirring vigorously, 30 seconds to 1 minute, or until the pasta is thoroughly coated. (If the sauce seems dry, gradually add the remaining pasta cooking water to achieve your desired consistency.) Turn off the heat and season with salt and pepper to taste. Serve the finished pasta with the roasted broccoli and remaining lemon wedges on the side. Garnish the pasta with the almonds and half the cheese. Garnish the broccoli with the remaining cheese. Enjoy!', 'images/roasted-red-pepper-pasta/step-5.jpg'),
(135, 24, 1, 'Prepare & roast the squash', 'Place an oven rack in the center of the oven, then preheat to 450°F. Wash and dry the fresh produce. Using a sharp, sturdy knife, carefully halve the squash lengthwise; using a spoon, scoop out and discard the pulp and seeds. Place in a baking dish, cut side up. Drizzle with olive oil and season with salt and pepper; arrange cut side down. Fill the dish with 1/4 inch of water. Roast 32 to 35 minutes, or until the cut side of the squash is tender when pierced with a fork. Remove from the oven.', 'images/roasted-squash-curry/step-1.jpg'),
(136, 24, 2, 'Cook the rice', 'While the squash roasts, in a small saucepan, combine the rice, lime leaf, a big pinch of salt, and 1 cup of water. Heat to boiling on high. Once boiling, cover and reduce the heat to low. Cook 12 to 14 minutes, or until the water has been absorbed and the rice is tender. Turn off the heat. Carefully remove and discard the lime leaf. Fluff the cooked rice with a fork. Cover and set aside in a warm place.', 'images/roasted-squash-curry/step-2.jpg'),
(137, 24, 3, 'Prepare the remaining ingredients', 'While the rice cooks, peel and thinly slice the onion. Peel and finely chop the ginger. Quarter the lime. Cut off and discard the root end of the bok choy; thinly slice crosswise. Pick the mint leaves off the stems; discard the stems.', 'images/roasted-squash-curry/step-3.jpg'),
(138, 24, 4, 'Cook the aromatics', 'While the rice continues to cook, in a large pan (nonstick, if you have one), heat 2 teaspoons of olive oil on medium-high until hot. Add the sliced onion; season with salt and pepper. Cook, stirring occasionally, 3 to 4 minutes, or until slightly softened. Add the chopped ginger; season with salt and pepper. Cook, stirring frequently, 1 to 2 minutes, or until lightly browned and fragrant.', 'images/roasted-squash-curry/step-4.jpg'),
(139, 24, 5, 'Make the curry sauce', 'To the pan, add the coconut milk (shaking the can just before opening), sugar, and as much of the curry paste as you\'d like, depending on how spicy you\'d like the dish to be; season with salt and pepper. Cook, stirring occasionally, 3 to 4 minutes, or until slightly thickened. Turn off the heat and season with salt and pepper to taste.', 'images/roasted-squash-curry/step-5.jpg'),
(140, 24, 6, 'Finish the curry & serve your dish', 'When cool enough to handle, using a fork, scrape the flesh of the roasted squash into a bowl; separate any clumps. (The result should resemble cooked spaghetti.) Discard the skins. Add the squash and sliced bok choy to the pan of curry. Cook on medium-high, stirring frequently, 2 to 3 minutes, or until thoroughly combined. Turn off the heat. Stir in the juice of 2 lime wedges; season with salt and pepper to taste. Top the cooked rice with the finished curry. Garnish with the mung beans and mint leaves (tearing just before adding). Serve with the remaining lime wedges on the side. Enjoy!', 'images/roasted-squash-curry/step-6.jpg'),
(141, 25, 1, 'Sear & roast the turkey', 'Remove the honey from the refrigerator to bring to room temperature. Place an oven rack in the center of the oven; preheat to 450°F. Heat a medium pot of salted water to boiling on high. Line a sheet pan with foil. Remove and discard the netting from the turkey; season with salt and pepper on both sides. In a large pan, heat 2 teaspoons of olive oil on medium-high until hot. Add the seasoned turkey, skin side down. Cook 4 to 6 minutes on the first side, or until lightly browned. Flip and cook 3 to 5 minutes, or until lightly browned. Leaving any browned bits (or fond) in the pan on the stove, transfer to the sheet pan, skin side up. Roast 15 to 17 minutes, or until cooked through. (An instant-read thermometer should register 165ºF.) Transfer to a cutting board and let rest for at least 5 minutes.', 'images/roasted-turkey-breast-farro-endive-salad/step-1.jpg'),
(142, 25, 2, 'Cook the farro', 'While the turkey roasts, add the farro to the pot of boiling water and cook, uncovered, 17 to 19 minutes, or until tender. Drain thoroughly and return to the pot. Set aside in a warm place.', 'images/roasted-turkey-breast-farro-endive-salad/step-2.jpg'),
(143, 25, 3, 'Prepare the ingredients', 'While the farro cooks, wash and dry the fresh produce. Peel and finely chop the shallot. Cut off and discard the root end of the endive; thinly slice crosswise. Quarter and deseed the lemon. Core and small dice the apple. Cut the chives into 1/2-inch pieces.', 'images/roasted-turkey-breast-farro-endive-salad/step-3.jpg'),
(144, 25, 4, 'Cook the endive', 'While the farro continues to cook, add 2 teaspoons of olive oil to the pan of reserved fond; heat on medium-high until hot. Add half the chopped shallot; season with salt and pepper. Cook, stirring constantly, 30 seconds to 1 minute, or until softened. Add the sliced endive; season with salt and pepper. Cook, stirring frequently, 1 to 2 minutes, or until softened. Add half the honey (kneading the packet before opening) and the juice of 2 lemon wedges. Cook, stirring constantly, 30 seconds to 1 minute, or until thoroughly combined. Transfer to a bowl and season with salt and pepper to taste. Rinse and wipe out the pan.', 'images/roasted-turkey-breast-farro-endive-salad/step-4.jpg'),
(145, 25, 5, 'Make the compote', 'While the farro continues to cook, in the same pan, heat the butter on medium-high until melted. Cook, stirring frequently and swirling the pan, 1 to 2 minutes, or until browned and nuttily fragrant. Add the diced apple and remaining chopped shallot; season with salt and pepper. Cook, stirring frequently, 1 to 2 minutes, or until slightly softened. Add the juice of the remaining lemon wedges and the remaining honey. Cook, stirring constantly, 30 seconds to 1 minute, or until thoroughly combined. Turn off the heat and season with salt and pepper to taste.', 'images/roasted-turkey-breast-farro-endive-salad/step-5.jpg'),
(146, 25, 6, 'Make the farro salad & serve your dish', 'Add the cooked endive, mustard, half the sliced chives, and a drizzle of olive oil to the pot of cooked farro. Stir to combine; season with salt and pepper to taste. Thinly slice the rested turkey crosswise. Serve the sliced turkey with the farro salad. Top the turkey with the compote. Garnish with the remaining sliced chives and a drizzle of olive oil. Enjoy!', 'images/roasted-turkey-breast-farro-endive-salad/step-6.jpg'),
(147, 26, 1, 'Prepare & cook the potatoes', 'Remove the honey from the refrigerator to bring to room temperature. Wash, dry, and medium dice the potatoes. In a small pot, combine the potatoes, half the saffron, and a big pinch of salt. Add enough water to cover the potatoes by ½ inch. Heat to boiling on high. Once boiling, cook 10 to 12 minutes, or until the potatoes are tender when pierced with a fork. Drain thoroughly and return to the pot. Set aside in a warm place.', 'images/salmon-honey-glazed-carrots/step-1.jpg'),
(148, 26, 2, 'Prepare the remaining ingredients', 'While the potatoes cook, wash and dry the remaining fresh produce. Peel the carrots; cut into ½-inch-thick pieces on an angle. Peel and roughly chop the garlic. Pick the mint leaves off the stems; discard the stems. Using a peeler, remove the rind of the lemon, avoiding the pith; mince to get 2 teaspoons of zest (or use a zester). Quarter and deseed the lemon. In a medium bowl, combine the remaining saffron and the juice of 1 lemon wedge.', 'images/salmon-honey-glazed-carrots/step-2.jpg'),
(149, 26, 3, 'Cook & glaze the carrots', 'In a medium pan (nonstick, if you have one), heat 2 teaspoons of olive oil on medium-high until hot. Add the carrots and garlic; season with salt and pepper. Cook, stirring occasionally, 2 to 3 minutes, or until slightly softened. Add the cumin and honey (kneading the packet before opening). Cook, stirring constantly, 30 seconds to 1 minute, or until fragrant. Add ¾ cup of water. Cook, stirring occasionally, 8 to 10 minutes, or until the carrots are softened and glazed. Transfer to a bowl. Season with salt and pepper to taste.', 'images/salmon-honey-glazed-carrots/step-3.jpg'),
(150, 26, 4, 'Make the yogurt sauce', 'While the carrots cook, to the bowl of saffron-lemon juice mixture, add the yogurt, lemon zest, a drizzle of olive oil, and up to half the Aleppo pepper. Stir to combine; season with salt and pepper to taste.', 'images/salmon-honey-glazed-carrots/step-4.jpg'),
(151, 26, 5, 'Cook the salmon', 'While the carrots continue to cook, pat the salmon fillets dry with paper towels; season with salt and pepper on both sides. Rinse and wipe out the pan used to glaze the carrots. In the same pan, heat 1 tablespoon of olive oil on medium-high until hot. Add the seasoned fillets, skinless side down. Cook 3 to 4 minutes on the first side, or until lightly browned. Flip and cook 2 to 3 minutes, or until lightly browned and cooked to your desired degree of doneness. Turn off the heat.', 'images/salmon-honey-glazed-carrots/step-5.jpg'),
(152, 26, 6, 'Finish & plate your dish', 'While the salmon cooks, add the glazed carrots, the juice of the remaining lemon wedges, half the mint (tearing the leaves just before adding), and as much of the remaining Aleppo pepper as you\'d like to the pot of cooked potatoes. Drizzle with olive oil; stir to combine. Season with salt and pepper to taste. Divide between 2 dishes. Top each with a cooked salmon fillet and a spoonful of the yogurt sauce. Garnish with the remaining mint (tearing the leaves just before adding). Serve with the remaining yogurt sauce on the side. Enjoy!', 'images/salmon-honey-glazed-carrots/step-6.jpg'),
(153, 27, 1, 'Prepare the ingredients', 'Place an oven rack in the center of the oven, then preheat to 450°F. Heat a medium pot of salted water to boiling on high. Wash and dry the fresh produce. Peel the carrots; quarter lengthwise, then halve crosswise. Large dice the potatoes.', 'images/seared-chicken-mashed-potatoes/step-1.jpg'),
(154, 27, 2, 'Roast & glaze the carrots', 'Place the sliced carrots on a sheet pan. Drizzle with olive oil and season with salt and pepper; toss to coat. Arrange in an even layer. Roast 15 to 17 minutes, or until lightly browned and tender when pierced with a fork. Carefully transfer to a large bowl. Add half the maple syrup; stir to coat. Season with salt and pepper to taste. Loosely cover with aluminum foil to keep warm.', 'images/seared-chicken-mashed-potatoes/step-2.jpg'),
(155, 27, 3, 'Cook & mash the potatoes', 'While the carrots roast, add the diced potatoes to the pot of boiling water; cook 14 to 16 minutes, or until tender when pierced with a fork. Turn off the heat. Drain thoroughly and return to the pot. Add the crème fraîche and 1 tablespoon of olive oil. Using a fork, mash to your desired consistency. Season with salt and pepper to taste. Cover to keep warm.', 'images/seared-chicken-mashed-potatoes/step-3.jpg'),
(156, 27, 4, 'Cook the chicken', 'While the potatoes cook, pat the chicken dry with paper towels; season with salt and pepper on both sides. In a medium pan, heat 2 teaspoons of olive oil on medium-high until hot. Add the seasoned chicken and cook 5 to 7 minutes per side, or until browned and cooked through. Leaving any browned bits (or fond) in the pan, transfer to a cutting board.', 'images/seared-chicken-mashed-potatoes/step-4.jpg'),
(157, 27, 5, 'Make the pan sauce', 'Add the vinegar and remaining maple syrup to the pan of reserved fond (be careful, as the liquid may splatter). Cook on medium-high, stirring constantly and scraping up any fond, 30 seconds to 1 minute, or until thoroughly combined. Turn off the heat. Stir in the butter until thoroughly combined. Season with salt and pepper to taste.', 'images/seared-chicken-mashed-potatoes/step-5.jpg'),
(158, 27, 6, 'Slice the chicken & serve your dish', 'Slice the cooked chicken crosswise. Serve the sliced chicken with the mashed potatoes and glazed carrots. Top the chicken with the pan sauce. Enjoy!', 'images/seared-chicken-mashed-potatoes/step-6.jpg'),
(159, 28, 1, 'Prepare & roast the potatoes', 'Place an oven rack in the center of the oven, then preheat to 450°F. Wash and dry the fresh produce. Cut the potatoes lengthwise into 1/2-inch-thick sticks. Place on a sheet pan. Drizzle with olive oil and season with salt and pepper; toss to coat. Arrange in an even layer. Roast, flipping halfway through, 22 to 24 minutes, or until lightly browned and tender when pierced with a fork. Remove from the oven.', 'images/seared-steaks-garlic-butter/step-1.jpg'),
(160, 28, 2, 'Prepare the remaining ingredients', 'While the potatoes roast, peel and finely chop the garlic. Cut off and discard the root end of the lettuce; roughly chop the leaves. Thinly slice the chives.', 'images/seared-steaks-garlic-butter/step-2.jpg'),
(161, 28, 3, 'Make the vinaigrette', 'While the potatoes continue to roast, in a bowl, combine the vinegar and 1/4 of the creamy mustard sauce. Slowly whisk in 2 teaspoons of olive oil until well combined. Season with salt and pepper to taste.', 'images/seared-steaks-garlic-butter/step-3.jpg'),
(162, 28, 4, 'Cook the steaks & make the garlic butter', 'While the potatoes continue to roast, pat the steaks dry with paper towels. Season with salt and pepper on both sides. In a large pan, heat 1 tablespoon of olive oil on medium-high until hot. Add the seasoned steaks and cook 4 to 5 minutes on the first side, or until lightly browned. Flip and cook 2 to 3 minutes, or until lightly browned. Add the chopped garlic and butter. Cook, frequently spooning the butter over the steaks, 1 to 2 minutes for medium-rare, or until the steaks are browned and cooked to your desired degree of doneness. Transfer the cooked steaks to a cutting board. Let rest for at least 5 minutes. Transfer the garlic butter to a bowl.', 'images/seared-steaks-garlic-butter/step-4.jpg'),
(163, 28, 5, 'Make the salad', 'While the steaks rest, place the chopped lettuce in a large bowl. Add enough of the vinaigrette to coat the lettuce (you may have extra vinaigrette). Toss to coat; season with salt and pepper to taste.', 'images/seared-steaks-garlic-butter/step-5.jpg'),
(164, 28, 6, 'Slice the steaks & serve your dish', 'Find the lines of muscle (or grain) on the rested steaks; thinly slice crosswise against the grain. Serve the sliced steaks with the roasted potatoes and salad. Drizzle the steaks and potatoes with the garlic butter. Garnish the salad with the sliced chives. Serve with the remaining creamy mustard sauce on the side. Enjoy!', 'images/seared-steaks-garlic-butter/step-6.jpg'),
(165, 29, 1, 'Prepare & roast the sweet potatoes', 'Place an oven rack in the center of the oven, then preheat to 450°F. Wash and dry the sweet potatoes; cut lengthwise into 1-inch wedges. Place on a sheet pan. Drizzle with olive oil and season with salt and pepper; toss to coat. Arrange in an even layer, skin side down. Roast 22 to 24 minutes, or until browned and tender when pierced with a fork. Remove from the oven.', 'images/shiitake-hoisin-beef-burgers/step-1.jpg'),
(166, 29, 2, 'Prepare the remaining ingredients', 'While the sweet potatoes roast, wash and dry the remaining fresh produce. In a bowl, combine the mushrooms and 1 cup of hot water; let stand for at least 10 minutes to rehydrate. Peel and finely chop the garlic; using the flat side of your knife, smash until it resembles a paste (or use a zester). Cut off and discard the root ends of the scallions; thinly slice, separating the white bottoms and green tops. Cut off and discard the root end of the bok choy; thinly slice. Place in a bowl. Drizzle with olive oil and season with salt and pepper; toss to coat. Halve the buns. In a bowl, combine the miso paste and mayonnaise; season with salt and pepper to taste.', 'images/shiitake-hoisin-beef-burgers/step-2.jpg'),
(167, 29, 3, 'Form the patties', 'While the sweet potatoes continue to roast, drain the rehydrated mushrooms. Transfer to a cutting board; finely chop. In a large bowl, combine the chopped mushrooms, ground beef, garlic paste, sliced white bottoms of the scallions, and hoisin sauce; season with salt and pepper. Gently mix to combine. Using your hands, form into four ½-inch-thick patties. Transfer to a plate.', 'images/shiitake-hoisin-beef-burgers/step-3.jpg'),
(168, 29, 4, 'Cook the patties', 'While the sweet potatoes continue to roast, in a large pan (nonstick, if you have one), heat 2 teaspoons of olive oil on medium-high until hot. Add the patties and cook 3 to 4 minutes per side, or until browned and cooked to your desired degree of doneness. Leaving any browned bits (or fond) in the pan, transfer to a plate.', 'images/shiitake-hoisin-beef-burgers/step-4.jpg'),
(169, 29, 5, 'Toast the buns', 'Working in batches if necessary, add the buns, cut side down, to the pan of reserved fond. (If the pan seems dry, add a drizzle of olive oil.) Toast on medium-high 30 seconds to 1 minute, or until lightly browned. Transfer to a work surface.', 'images/shiitake-hoisin-beef-burgers/step-5.jpg'),
(170, 29, 6, 'Assemble the burgers & serve your dish', 'Divide the miso mayonnaise, cooked patties, and seasoned bok choy among the toasted buns. Serve the burgers with the roasted sweet potatoes. Garnish the sweet potatoes with the sliced green tops of the scallions. Enjoy!', 'images/shiitake-hoisin-beef-burgers/step-6.jpg'),
(171, 30, 1, 'Prepare the ingredients', 'Fill a medium pot with water; add a big pinch of salt and heat to boiling on high. Wash and dry the fresh produce. Cut out and discard the core of the cabbage; thinly slice the leaves. Peel and roughly chop the garlic.', 'images/shrimp-fra-diavolo/step-1.jpg'),
(172, 30, 2, 'Cook the shrimp', 'Pat the shrimp dry with paper towels; season with salt and pepper. In a medium pan, heat a drizzle of olive oil on medium-high until hot. Add the seasoned shrimp; cook, stirring occasionally, 3 to 4 minutes, or until opaque and cooked through. Leaving any browned bits (or fond) in the pan, transfer to a plate. Set aside in a warm place.', 'images/shrimp-fra-diavolo/step-2.jpg'),
(173, 30, 3, 'Cook the cabbage', 'Add the sliced cabbage to the pan of reserved fond; season with salt and pepper. (If the pan seems dry, add a drizzle of olive oil.) Cook on medium-high, stirring occasionally, 2 to 3 minutes, or until slightly softened. Add the verjus and 1/4 cup of water; season with salt and pepper. Cook, stirring occasionally and scraping up any fond, 3 to 5 minutes, or until the cabbage has softened and the water has cooked off. Transfer to the plate of cooked shrimp. Wipe out the pan.', 'images/shrimp-fra-diavolo/step-3.jpg'),
(174, 30, 4, 'Cook the pasta', 'While the cabbage cooks, add the pasta to the pot of boiling water. Cook, stirring occasionally, 9 to 11 minutes, or until al dente (still slightly firm to the bite). Reserving 1/2 cup of the pasta cooking water, drain thoroughly.', 'images/shrimp-fra-diavolo/step-4.jpg'),
(175, 30, 5, 'Make the sauce', 'While the pasta cooks, in the same pan, heat 2 teaspoons of olive oil on medium-high until hot. Add the chopped garlic; season with salt and pepper. Cook, stirring constantly, 30 seconds to 1 minute, or until softened and fragrant. Add the tomato sauce, 1/3 cup of water, and as much of the chile paste as you\'d like, depending on how spicy you\'d like the dish to be; season with salt and pepper. Cook, stirring occasionally, 4 to 5 minutes, or until thickened. Season with salt and pepper to taste.', 'images/shrimp-fra-diavolo/step-5.jpg'),
(176, 30, 6, 'Finish & serve your dish', 'Add the cooked pasta, cooked shrimp and cabbage, and half the reserved pasta cooking water to the pan. Cook, stirring vigorously, 1 to 2 minutes, or until coated. (If the sauce seems dry, gradually add the remaining pasta cooking water to achieve your desired consistency.) Turn off the heat; stir in the crème fraîche until thoroughly combined. Season with salt and pepper to taste. Top the finished pasta with the almonds and a drizzle of olive oil. Enjoy!', 'images/shrimp-fra-diavolo/step-6.jpg'),
(177, 31, 1, 'Prepare the ingredients', 'Remove the dough and honey from the refrigerator to bring to room temperature. Place an oven rack in the center of the oven, then preheat to 475°F. Wash and dry the fresh produce. Thinly slice the mushrooms. Peel and roughly chop the garlic. Peel and thinly slice the onion. Remove and discard the stems of the kale; roughly chop the leaves. Grate both cheeses on the large side of a box grater (discarding any rind). Combine in a bowl.', 'images/smoked-gouda-mushroom-flatbread/step-1.jpg'),
(178, 31, 2, 'Start the vegetables', 'In a large pan (nonstick, if you have one), heat a drizzle of olive oil on medium-high until hot. Add the sliced mushrooms in an even layer. Cook, without stirring, 2 to 3 minutes, or until lightly browned. Add the chopped garlic and sliced onion; season with salt and pepper. Cook, stirring occasionally, 2 to 3 minutes, or until lightly browned and fragrant.', 'images/smoked-gouda-mushroom-flatbread/step-2.jpg'),
(179, 31, 3, 'Finish the vegetables', 'Add the chopped kale to the pan; season with salt and pepper. Cook, stirring frequently, 1 to 2 minutes, or until slightly wilted. Add 1/4 cup of water; season with salt and pepper. Cook, stirring occasionally, 3 to 4 minutes, or until the kale has wilted and the water has cooked off. Turn off the heat. Season with salt and pepper to taste.', 'images/smoked-gouda-mushroom-flatbread/step-3.jpg'),
(180, 31, 4, 'Assemble & bake the flatbread', 'Lightly oil a sheet pan. On a work surface, using your hands and a rolling pin (or a wine bottle), gently stretch and roll the dough to a 1/8-inch thickness. (If the dough is resistant, let rest for 5 minutes.) Carefully transfer the dough to the sheet pan; rub the dough into the pan to coat the bottom in oil. Leaving a 1-inch border around the edges, evenly top the prepared dough with the finished vegetables, grated cheeses, and a drizzle of olive oil. Season with salt and pepper. Bake, rotating the sheet pan halfway through, 14 to 16 minutes, or until the crust has browned and the cheese has melted. Remove from the oven and let stand for at least 2 minutes.', 'images/smoked-gouda-mushroom-flatbread/step-4.jpg'),
(181, 31, 5, 'Prepare the remaining ingredients', 'While the flatbread bakes, cut off and discard the root end of the endive; roughly chop the leaves. Core, quarter, and thinly slice the apple. To make the dressing, in a large bowl, whisk together the vinegar, honey (kneading the packet before opening), and 1 tablespoon of olive oil until thoroughly combined. Season with salt and pepper to taste.', 'images/smoked-gouda-mushroom-flatbread/step-5.jpg'),
(182, 31, 6, 'Make the salad & serve your dish', 'Just before serving, add the chopped endive and sliced apple to the bowl of dressing. Toss to combine; season with salt and pepper to taste. Serve the baked flatbread with the salad on the side. Enjoy!', 'images/smoked-gouda-mushroom-flatbread/step-6.jpg'),
(183, 32, 1, 'Prepare & cook the beet', 'Heat a small pot of salted water to boiling on high. Wash and dry the fresh produce. Peel the beet and cut lengthwise into 1/4-inch wedges. Once the pot of water is boiling, add the beet wedges and cook, uncovered, 22 to 24 minutes, or until tender when pierced with a fork. Drain and rinse under cold water for 30 seconds to 1 minute to stop the cooking process. Pat dry with paper towels and transfer to a large bowl.', 'images/spicy-chicken-quesadillas/step-1.jpg'),
(184, 32, 2, 'Prepare the remaining ingredients', 'While the beet cooks, cut off and discard the root ends of the scallions; thinly slice, separating the white bottoms and green tops. Using a peeler, remove the green rind of the lime, avoiding the white pith; mince to get 2 teaspoons of zest (or use a zester). Quarter the lime. Grate the cheese on the large side of a box grater. Peel the orange; halve lengthwise, then thinly slice crosswise. To make the lime crema, in a bowl, combine the crema and the juice of 2 lime wedges; season with salt and pepper to taste. Cut out and discard the stem, ribs, and seeds of the pepper; finely chop. Thoroughly wash your hands, knife, and cutting board immediately after handling the pepper.', 'images/spicy-chicken-quesadillas/step-2.jpg'),
(185, 32, 3, 'Cook & chop the chicken', 'While the beet continues to cook, pat the chicken dry with paper towels; season on both sides with salt, pepper, and the spice blend. In a large pan (nonstick, if you have one), heat 2 teaspoons of olive oil on medium-high until hot. Add the seasoned chicken; cook 3 to 4 minutes per side, or until browned and cooked through. Transfer to a cutting board; when cool enough to handle, roughly chop. Transfer to a medium bowl. Rinse and wipe out the pan.', 'images/spicy-chicken-quesadillas/step-3.jpg'),
(186, 32, 4, 'Make the filling & assemble the quesadillas', 'To the bowl of chopped chicken, add the sliced white bottoms of the scallions, lime zest, the juice of 1 lime wedge, a drizzle of olive oil, and as much of the chopped pepper as you\'d like, depending on how spicy you\'d like the dish to be. Stir to combine; season with salt and pepper to taste. Place the tortillas on a work surface. Sprinkle the grated cheese onto 1 side of each tortilla. Evenly top with the filling. Fold each tortilla in half over the filling.', 'images/spicy-chicken-quesadillas/step-4.jpg'),
(187, 32, 5, 'Cook the quesadillas', 'In the same pan, heat 2 teaspoons of olive oil on medium until hot. Add the quesadillas; cook 2 to 3 minutes per side, or until the tortillas are browned and the cheese has melted. (If the pan seems dry, add a drizzle of olive oil before flipping.) Transfer to a cutting board; immediately season with salt and pepper.', 'images/spicy-chicken-quesadillas/step-5.jpg'),
(188, 32, 6, 'Make the salad & serve your dish', 'While the quesadillas cook, add the sliced orange, peanuts, the juice of the remaining lime wedge, and a drizzle of olive oil to the bowl of cooked beet. Stir to combine; season with salt and pepper to taste. Cut the cooked quesadillas in half. Garnish the quesadillas and salad with the sliced green tops of the scallions. Serve with the lime crema on the side. Enjoy!', 'images/spicy-chicken-quesadillas/step-6.jpg'),
(189, 33, 1, 'Prepare the ingredients', 'Heat a large pot of salted water to boiling on high. Wash and dry the fresh produce. Peel and finely chop the ginger. Peel and roughly chop the garlic. Cut off and discard the root end of the bok choy; roughly chop the leaves and stems, keeping them separate. Thinly slice the chives.', 'images/spicy-pork-korean-rice-cakes/step-1.jpg'),
(190, 33, 2, 'Cook the pork', 'In a large pan, heat 2 teaspoons of olive oil on medium until hot. Add the ground pork (removing and discarding the paper lining from the bottom); season with salt and pepper. Cook, frequently breaking the meat apart with a spoon, 4 to 6 minutes, or until lightly browned.', 'images/spicy-pork-korean-rice-cakes/step-2.jpg'),
(191, 33, 3, 'Add the aromatics', 'Add the chopped ginger and garlic to the pan; season with salt and pepper. Cook, stirring occasionally, 2 to 3 minutes, or until softened and the pork is cooked through.', 'images/spicy-pork-korean-rice-cakes/step-3.jpg'),
(192, 33, 4, 'Make the sauce', 'To the pan, add the chopped bok choy stems, soy glaze, black bean sauce, ½ cup of water, and as much of the gochujang as you\'d like, depending on how spicy you\'d like the dish to be. Cook, stirring occasionally, 3 to 4 minutes, or until the bok choy stems have softened and the liquid has thickened. Turn off the heat. Season with salt and pepper to taste.', 'images/spicy-pork-korean-rice-cakes/step-4.jpg'),
(193, 33, 5, 'Cook the rice cakes', 'While the sauce cooks, add the rice cakes to the pot of boiling water and cook 2 to 3 minutes, or until tender. Drain thoroughly.', 'images/spicy-pork-korean-rice-cakes/step-5.jpg'),
(194, 33, 6, 'Finish & serve your dish', 'Add the cooked rice cakes and chopped bok choy leaves to the pan of cooked pork and sauce; season with salt and pepper. Cook on medium-high, stirring frequently, 1 to 2 minutes, or until the rice cakes are thoroughly coated and the bok choy leaves are slightly wilted. Turn off the heat; stir in the crème fraîche and half the sliced chives. Season with salt and pepper to taste. Garnish the finished pork and rice cakes with the remaining sliced chives. Enjoy!', 'images/spicy-pork-korean-rice-cakes/step-6.jpg'),
(195, 34, 1, 'Prepare the ingredients & marinate the radish', 'Wash and dry the fresh produce. Peel the carrots; thinly slice on an angle. Slice the celery on an angle into 1/2-inch-thick pieces. Halve the orange; squeeze the juice into a medium bowl, straining out any seeds. Peel and roughly chop the garlic. Peel and finely chop the ginger. Cut off and discard the root end of the bok choy; roughly chop. Quarter and deseed the lemon. Cut off and discard the ends of the radishes; small dice. Place in a bowl and top with the juice of 1 lemon wedge and half the sesame oil. Season with salt and pepper. Set aside to marinate, stirring occasionally, for at least 10 minutes. Season with salt and pepper to taste.', 'images/sweet-sour-vegetable-stir-fry/step-1.jpg'),
(196, 34, 2, 'Cook the rice', 'While the radishes marinate, in a medium saucepan, combine the rice, a big pinch of salt, and 1 1/2 cups of water; heat to boiling on high. Once boiling, cover and reduce the heat to low. Cook 12 to 14 minutes, or until the water has been absorbed and the rice is tender. Turn off the heat and fluff with a fork. Cover to keep warm.', 'images/sweet-sour-vegetable-stir-fry/step-2.jpg'),
(197, 34, 3, 'Start the stir-fry', 'While the rice cooks, in a large pan (nonstick, if you have one), heat 2 teaspoons of olive oil on medium-high until hot. Add the sliced carrots and celery; season with salt and pepper. Cook, stirring occasionally, 6 to 7 minutes, or until slightly softened.', 'images/sweet-sour-vegetable-stir-fry/step-3.jpg'),
(198, 34, 4, 'Make the sauce', 'While the vegetables cook, to the bowl of orange juice, add the soy glaze, soy marinade, and the juice of the remaining lemon wedges. Stir to combine; season with salt and pepper to taste.', 'images/sweet-sour-vegetable-stir-fry/step-4.jpg'),
(199, 34, 5, 'Finish the stir-fry', 'To the pan of vegetables, add the chopped garlic and ginger and remaining sesame oil. Cook, stirring constantly, 30 seconds to 1 minute, or until fragrant. Add the sauce and chopped bok choy; cook, stirring constantly, 1 to 2 minutes, or until the bok choy leaves have wilted. Transfer to a bowl and season with salt and pepper to taste. Rinse and wipe out the pan.', 'images/sweet-sour-vegetable-stir-fry/step-5.jpg'),
(200, 34, 6, 'Fry the eggs & serve your dish', 'In the same pan, heat 2 teaspoons of olive oil on medium-high until hot. Keeping them separate, crack the eggs into the pan; season with salt and pepper. Cook 4 to 5 minutes, or until the whites are set and the yolks are cooked to your desired degree of doneness. Turn off the heat. Stir the marinated radishes (including any marinating liquid) into the saucepan of cooked rice. Serve the finished rice with the finished stir-fry. Top with the fried eggs and peanuts. Enjoy!', 'images/sweet-sour-vegetable-stir-fry/step-6.jpg'),
(201, 35, 1, 'Prepare the ingredients & rehydrate the mushrooms', 'Wash and dry the fresh produce. In a bowl, combine the mushrooms and 1 cup of warm water. Let stand for at least 10 minutes. Peel the carrots; thinly slice into rounds. Cut off and discard the root end of the bok choy; thinly slice the stems and roughly chop the leaves, keeping them separate. Quarter the lime.', 'images/thai-curry-chicken/step-1.jpg'),
(202, 35, 2, 'Cook the rice', 'In a small saucepan, combine the rice, a big pinch of salt, and 1 1/2 cups of water; heat to boiling on high. Once boiling, cover and reduce the heat to low. Cook 12 to 14 minutes, or until the water has been absorbed and the rice is tender. Turn off the heat and fluff with a fork. Cover and set aside in a warm place.', 'images/thai-curry-chicken/step-2.jpg'),
(203, 35, 3, 'Brown the chicken', 'While the rice cooks, pat the chicken dry with paper towels; season with salt and pepper. In a large pan, heat 1 tablespoon of olive oil on medium-high until hot. Add the seasoned chicken; cook, stirring occasionally, 3 to 4 minutes, or until lightly browned. Leaving any browned bits (or fond) in the pan, transfer to a plate.', 'images/thai-curry-chicken/step-3.jpg'),
(204, 35, 4, 'Chop the mushrooms & start the curry', 'While the chicken browns, drain the rehydrated mushrooms. Transfer to a cutting board and roughly chop. Add 2 teaspoons of olive oil to the pan of reserved fond; heat on medium-high until hot. Add the sliced carrots and as much of the curry paste as you\'d like, depending on how spicy you\'d like the dish to be; season with salt and pepper. Cook, stirring frequently, 1 to 2 minutes, or until slightly softened and fragrant.', 'images/thai-curry-chicken/step-4.jpg'),
(205, 35, 5, 'Finish the curry & serve your dish', 'To the pan, add the browned chicken, sliced bok choy stems, Golden Mountain sauce, chopped mushrooms, and coconut milk (shaking the can just before opening); season with salt and pepper. Heat to boiling on high. Once boiling, reduce the heat to medium-high and cook, stirring occasionally, 4 to 5 minutes, or until the liquid is slightly reduced in volume. Add the chopped bok choy leaves. Cook, stirring occasionally, 2 to 3 minutes, or until the liquid is slightly thickened and the chicken is cooked through. Turn off the heat and stir in the juice of 2 lime wedges. Season with salt and pepper to taste. Serve the finished curry and cooked rice with the remaining lime wedges on the side. Enjoy!', 'images/thai-curry-chicken/step-5.jpg'),
(206, 36, 1, 'Cook the lentils', 'Place an oven rack in the center of the oven, then preheat to 450°F. Heat a medium saucepan of salted water to boiling on high. Once boiling, add the lentils and cook, uncovered, 24 to 26 minutes, or until tender. Turn off the heat. Drain thoroughly and rinse under warm water; return to the pot. Cover to keep warm.', 'images/tilapia-black-lentil-salad/step-1.jpg'),
(207, 36, 2, 'Prepare & roast the broccoli', 'While the lentils cook, wash and dry the fresh produce. Cut off and discard the bottom 1/2 inch of the broccoli stem; cut the broccoli into small pieces, keeping the florets intact. Place on a sheet pan. Drizzle with olive oil and season with salt and pepper; toss to coat. Arrange in an even layer. Roast 15 to 17 minutes, or until browned and tender when pierced with a fork. Remove from the oven.', 'images/tilapia-black-lentil-salad/step-2.jpg'),
(208, 36, 3, 'Prepare the remaining ingredients', 'While the broccoli roasts, peel the garlic. Roughly chop 1 clove. Finely chop the remaining clove; using the flat side of your knife, smash until it resembles a paste (or use a zester). Using a peeler, remove the yellow rind of the lemon, avoiding the white pith; mince the rind to get 2 teaspoons of zest (or use a zester). Quarter and deseed the lemon. Roughly chop the peppers. Finely chop the parsley leaves and stems. To make the gremolata, in a bowl, combine the lemon zest, chopped peppers, half the chopped parsley, the juice of 2 lemon wedges, 1 tablespoon of olive oil, and as much of the garlic paste as you\'d like. Season with salt and pepper to taste.', 'images/tilapia-black-lentil-salad/step-3.jpg'),
(209, 36, 4, 'Cook the fish', 'Pat the fish fillets dry with paper towels; season with salt and pepper on both sides. In a large pan (nonstick, if you have one), heat 2 teaspoons of olive oil on medium-high until hot. Add the seasoned fillets and cook 2 to 3 minutes per side, or until lightly browned and cooked through. Leaving any browned bits (or fond) in the pan, transfer to a plate.', 'images/tilapia-black-lentil-salad/step-4.jpg'),
(210, 36, 5, 'Make the pan sauce', 'Add the capers, chopped garlic, butter, and 1 tablespoon of olive oil to the pan of reserved fond; season with salt and pepper. Cook on medium-high, stirring constantly and scraping up any fond, 1 to 2 minutes, or until browned and fragrant. Turn off the heat; stir in the juice of the remaining lemon wedges (be careful, as the liquid may splatter). Season with salt and pepper to taste.', 'images/tilapia-black-lentil-salad/step-5.jpg'),
(211, 36, 6, 'Finish the lentils & serve your dish', 'To the saucepan of cooked lentils, add the roasted broccoli and gremolata. Stir to combine; season with salt and pepper to taste. Serve the finished lentils with the cooked fish fillets. Top the fish with the pan sauce. Garnish with the remaining chopped parsley. Enjoy!', 'images/tilapia-black-lentil-salad/step-6.jpg');
INSERT INTO `steps` (`id`, `recipe_id`, `step_number`, `step_title`, `instructions`, `image`) VALUES
(212, 37, 1, 'Prepare the ingredients', 'Wash and dry the fresh produce. Cut off and discard the root end of the lettuce; separate 8 large leaves. Peel and thinly slice the red onion. Thinly slice the mushrooms. Peel the carrot and grate on the large side of a box grater. Cut off and discard the ends of the radishes; thinly slice into rounds. Peel and finely chop the garlic and ginger. Thinly slice the scallions. Quarter the lime. Peel the orange; cut into bite-sized pieces.', 'images/togarashi-chicken-lettuce-cups/step-1.jpg'),
(213, 37, 2, 'Cook the vegetables', 'In a large pan, heat 2 teaspoons of olive oil on medium-high until hot. Add the sliced onion and mushrooms; season with salt and pepper. Cook, stirring occasionally, 4 to 6 minutes, or until softened and browned. Transfer to a large bowl.', 'images/togarashi-chicken-lettuce-cups/step-2.jpg'),
(214, 37, 3, 'Cook the chicken', 'In the same pan, heat 2 teaspoons of olive oil on medium-high until hot. Add the ground chicken, chopped garlic and ginger, and the togarashi seasoning; season with salt and pepper. Cook, frequently breaking the meat apart with a spoon, 4 to 6 minutes, or until browned and cooked through. Add the coconut aminos and vinegar; cook, stirring, 1 minute, or until coated. Turn off the heat.', 'images/togarashi-chicken-lettuce-cups/step-3.jpg'),
(215, 37, 4, 'Make the filling', 'Add the cooked chicken, grated carrot, sliced radishes, half the scallions, and the juice of 2 lime wedges to the bowl of cooked vegetables. Stir to combine; season with salt and pepper to taste.', 'images/togarashi-chicken-lettuce-cups/step-4.jpg'),
(216, 37, 5, 'Assemble the lettuce cups & serve your dish', 'Divide the filling among the lettuce leaves. Top with the orange pieces, the cashews, and the remaining scallions. Serve with the remaining lime wedges on the side. Enjoy!', 'images/togarashi-chicken-lettuce-cups/step-5.jpg'),
(217, 38, 1, 'Marinate the steaks', 'Wash and dry the fresh produce. Peel and finely chop the ginger and garlic. In a large bowl, whisk together the ponzu sauce, soy sauce, sugar, half the chopped ginger, and half the chopped garlic. Pat the steaks dry with paper towels and add to the bowl; turn to coat. Set aside to marinate for at least 10 minutes, turning occasionally.', 'images/top-chef-ginger-marinated-grassfed-steaks/step-1.jpg'),
(218, 38, 2, 'Cook the rice', 'While the steaks marinate, in a medium pot, combine the rice, a big pinch of salt, and 1 1/2 cups of water; heat to boiling on high. Once boiling, cover and reduce the heat to low. Cook 12 to 14 minutes, or until the water has been absorbed and the rice is tender. Turn off the heat and fluff with a fork. Cover to keep warm.', 'images/top-chef-ginger-marinated-grassfed-steaks/step-2.jpg'),
(219, 38, 3, 'Prepare the vegetables', 'While the rice cooks, peel the carrots; thinly slice on an angle. Snap off and discard the stem ends of the snow peas; remove the strings. Cut off and discard the root end of the bok choy; roughly chop. Cut off and discard the root ends of the scallions; thinly slice, separating the white bottoms and green tops.', 'images/top-chef-ginger-marinated-grassfed-steaks/step-3.jpg'),
(220, 38, 4, 'Cook the steaks', 'Reserving the marinade, transfer the steaks to a plate; season with salt and pepper on both sides. In a large pan, heat 2 teaspoons of olive oil on medium-high until hot. Add the steaks and cook 4 to 5 minutes per side for medium-rare, or until browned and cooked to your desired degree of doneness. Transfer to a cutting board and let rest for at least 5 minutes. Wipe out the pan.', 'images/top-chef-ginger-marinated-grassfed-steaks/step-4.jpg'),
(221, 38, 5, 'Stir-fry the vegetables', 'In the same pan, heat 2 teaspoons of olive oil on medium-high until hot. Add the sliced carrots and white bottoms of the scallions; season with salt and pepper. Cook, stirring frequently, 2 to 3 minutes, or until slightly softened. Add the snow peas, chopped bok choy, and the remaining ginger and garlic. Cook, stirring frequently, 2 to 3 minutes, or until the vegetables are tender-crisp. Transfer to a bowl; season with salt and pepper to taste.', 'images/top-chef-ginger-marinated-grassfed-steaks/step-5.jpg'),
(222, 38, 6, 'Make the pan sauce & serve your dish', 'Add the reserved marinade and 2 tablespoons of water to the same pan. Cook on medium-high, stirring frequently, 1 to 2 minutes, or until slightly reduced. Turn off the heat and stir in the butter until melted. Thinly slice the rested steaks against the grain. Serve the sliced steaks with the cooked rice and stir-fried vegetables. Top the steaks and rice with the pan sauce. Garnish with the sliced green tops of the scallions. Enjoy!', 'images/top-chef-ginger-marinated-grassfed-steaks/step-6.jpg'),
(223, 39, 1, 'Prepare the ingredients & make the glaze', 'Wash and dry the fresh produce. Quarter the mushrooms. Peel and thinly slice the shallot. Peel and finely chop the ginger. Cut off and discard the root end of the bok choy; roughly chop. Quarter the lime. Cut off and discard the ends of the radishes; thinly slice into rounds. Place in a bowl and top with the juice of 1 lime wedge and a drizzle of olive oil; season with salt and pepper. Stir to coat. In a bowl, combine the ponzu sauce, sweet chili sauce, sugar, 1/4 cup of water, and as much of the soy marinade as you\'d like.', 'images/top-chef-seared-grassfed-steaks/step-1.jpg'),
(224, 39, 2, 'Cook the rice', 'In a medium pot, combine the rice, a big pinch of salt, and 1 1/2 cups of water; heat to boiling on high. Once boiling, cover and reduce the heat to low. Cook 12 to 14 minutes, or until the water has been absorbed and the rice is tender. Turn off the heat and fluff with a fork. Cover to keep warm.', 'images/top-chef-seared-grassfed-steaks/step-2.jpg'),
(225, 39, 3, 'Cook the steaks', 'While the rice cooks, pat the steaks dry with paper towels; season with salt and pepper on both sides. In a large pan, heat 2 tablespoons of olive oil on medium-high until hot. Add the seasoned steaks and cook 4 to 5 minutes per side for medium-rare, or until browned and cooked to your desired degree of doneness. Leaving any browned bits (or fond) in the pan, transfer to a cutting board and let rest for at least 5 minutes.', 'images/top-chef-seared-grassfed-steaks/step-3.jpg'),
(226, 39, 4, 'Cook the vegetables', 'While the steaks rest, add 1 tablespoon of olive oil to the pan of reserved fond; heat on medium-high until hot. Add the quartered mushrooms in an even layer. Cook, without stirring, 3 to 4 minutes, or until lightly browned and slightly softened. Add the sliced shallot and chopped ginger; season with salt and pepper. Cook, stirring constantly, 30 seconds to 1 minute, or until fragrant.', 'images/top-chef-seared-grassfed-steaks/step-4.jpg'),
(227, 39, 5, 'Glaze the vegetables', 'Add the glaze and chopped bok choy to the pan; season with salt and pepper. Cook, stirring occasionally, 4 to 5 minutes, or until the glaze is slightly thickened and the vegetables have softened. Turn off the heat and stir in the juice of the remaining lime wedges. Season with salt and pepper to taste.', 'images/top-chef-seared-grassfed-steaks/step-5.jpg'),
(228, 39, 6, 'Slice the steaks & serve your dish', 'Find the lines of muscle (or grain) on the rested steaks; thinly slice crosswise against the grain. Serve the sliced steaks with the cooked rice and glazed vegetables. Garnish with the marinated radishes (draining before adding). Enjoy!', 'images/top-chef-seared-grassfed-steaks/step-6.jpg'),
(229, 40, 1, 'Cook the lentils', 'Heat a medium pot of salted water to boiling on high. Once boiling, add the lentils and cook, uncovered, 27 to 29 minutes, or until tender. Drain thoroughly and rinse under warm water 30 seconds to 1 minute, or until the water runs clear.', 'images/tuscan-chicken-green-lentil-stew/step-1.jpg'),
(230, 40, 2, 'Prepare the ingredients', 'While the lentils cook, wash and dry the fresh produce. Peel and thinly slice the onion. Peel and roughly chop the garlic. Peel and medium dice the carrots. Roughly chop the capers. Remove and discard the stems of the collard greens; roughly chop the leaves.', 'images/tuscan-chicken-green-lentil-stew/step-2.jpg'),
(231, 40, 3, 'Cook the chicken', 'While the lentils continue to cook, pat the chicken dry with paper towels; season on both sides with salt, pepper, and half the spice blend. In a large pan, heat 2 teaspoons of olive oil on medium-high until hot. Add the seasoned chicken and cook 5 to 7 minutes per side, or until browned and cooked through. Leaving any browned bits (or fond) in the pan, transfer to a cutting board.', 'images/tuscan-chicken-green-lentil-stew/step-3.jpg'),
(232, 40, 4, 'Cook the vegetables', 'Add the sliced onion, chopped garlic, and diced carrots to pan of reserved fond; season with salt and pepper. (If the pan seems dry, add 2 teaspoons of olive oil.) Cook on medium-high, stirring frequently, 4 to 5 minutes, or until softened and fragrant. Add the tomato paste, chopped capers, remaining spice blend, and as much of the red pepper flakes as you\'d like, depending on how spicy you\'d like the dish to be. Cook, stirring constantly, 30 seconds to 1 minute, or until dark red and fragrant. Add the chopped collard greens and 2 cups of water; season with salt and pepper. Cook, stirring occasionally and scraping up any fond, 8 to 9 minutes, or until the collard greens have wilted and the liquid has thickened. Turn off the heat.', 'images/tuscan-chicken-green-lentil-stew/step-4.jpg'),
(233, 40, 5, 'Warm the chicken in the stew', 'Return the cooked chicken (and any juices from the cutting board) to the pan of cooked vegetables, nestling it into the stew. Cook on medium, covered, 2 to 3 minutes, or until the chicken is warmed through. Transfer the chicken back to the cutting board.', NULL),
(234, 40, 6, 'Slice the chicken & serve your dish', 'Slice the cooked chicken crosswise. Add the cooked lentils and vinegar to the pan of cooked vegetables. Stir to combine. Season with salt and pepper to taste. Serve the finished lentils and vegetables topped with the sliced chicken. Garnish with the cheese. Enjoy!', 'images/tuscan-chicken-green-lentil-stew/step-6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tips`
--

CREATE TABLE `tips` (
  `id` int NOT NULL,
  `recipe_id` int NOT NULL,
  `tip_title` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tip_text` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tip_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tips`
--

INSERT INTO `tips` (`id`, `recipe_id`, `tip_title`, `tip_text`, `image`, `tip_type`) VALUES
(1, 3, 'Peel Garlic', 'If you\'re cooking with us, you\'re using garlic in virtually every recipe. Don\'t waste any more time trying to peel it! Check out the video for a quick tip.', 'images/broccoli-basil-pesto-sandwiches/tip.jpg', 'how_to'),
(2, 4, 'Roll Pizza Dough', 'Rolling out pizza dough may seem tricky—but with a few simple steps (and enough time for the dough to rest), you can achieve perfect results at home. Watch this short video to see how our chef does it.', 'images/broccoli-mozzarella-calzones/tip.jpg', 'how_to'),
(3, 6, 'Make Sure Your Pasta is Al Dente', 'Nothing beats perfectly cooked, al dente pasta. But how do you know if it\'s done? There are numerous ways to test the doneness of your noodles when they\'re cooking. Some folk wisdom says to throw a piece of pasta against the wall; if it sticks, it\'s done. As much fun as we had experimenting with this method, we found the best way to test the pasta was, shockingly, by tasting it. In Italian, \"al dente\" means \"to the tooth,\" meaning that it\'s still slightly firm to the bite. As your pasta cooks, periodically (and carefully) taste a piece of it. If it\'s still too firm, let it cook a little longer. In some of our recipes, we specify to remove the pasta from the pot when it\'s \"just shy of al dente.\" This is because, later, the pasta will be cooked in a sauce. Removing the pasta from the water just before it\'s al dente will ensure that the final product isn\'t overcooked.', 'images/bucatini-tomato-sauce/tip.jpg', 'how_to'),
(4, 7, 'Separate Leafy Greens from the Stems', 'Check out this simple trick for separating the stems and leaves of one of our favorite ingredients: kale. You won\'t even need a knife!', 'images/cheesy-enchiladas-rojas/tip.jpg', 'how_to'),
(5, 9, 'Peel Garlic', 'If you\'re cooking with us, you\'re using garlic in virtually every recipe. Don\'t waste any more time trying to peel it! Check out the video for a quick tip.', 'images/general-tsos-chicken/tip.jpg', 'how_to'),
(6, 10, 'Peel a Carrot', 'Make quick work of this deliciously sweet root vegetable. Check out the video to see how it\'s done.', 'images/hoisin-glazed-pork-chops/tip.png', 'how_to'),
(7, 14, 'Hold a Chef\'s Knife', 'At the core of many knife skills in holding the knife properly. This simple grip gives you all the power and freedom you\'ll need to prep whatever\'s on your cutting board. So get a grip and watch this short video to see how it\'s done!', 'images/mushroom-potato-tacos/tip.png', 'how_to'),
(8, 18, 'Quarter and Deseed a Lemon', 'Lemons are indispensable to cooking. Their tart juice brightens other flavors and can tie a dish together. We\'ve come up with an easy way to get the juice out of the lemon (without having to deal with the pesky seeds). Watch this short video to see how it\'s done.', 'images/roasted-broccoli-fregola-sarda-salad/tip.png', 'how_to'),
(9, 19, 'Get Perfect Citrus Zest', 'Zest is one of the best ways to brighten up a dish. It translates the essential oils of the citrus into flavor for all kinds of meals. See how it\'s done here!', 'images/roasted-brussels-sprout-freekeh-salad/tip.jpg', 'how_to'),
(10, 20, 'Prep Cauliflower Florets', 'Cauliflower is one of our favorite cool-weather vegetables. In certain recipes, we specify to cut the head into small florets. Check out this short video to learn the simple technique that will make prepping cauliflower a snap!', 'images/roasted-cauliflower-salad/tip.jpg', 'how_to'),
(11, 21, 'Peel & Mince Ginger', 'Ginger is a common, aromatic ingredient popular in cuisines throughout the world. Because of its knobby shape, prepping ginger can seem tricky. But simply follow the instructions in this video and you\'ll be prepping like a pro.', 'images/roasted-chicken-fall-vegetables/tip.jpg', 'how_to'),
(12, 24, 'Peel & Mince Ginger', 'Ginger is a common, aromatic ingredient popular in cuisines throughout the world. Because of its knobby shape, prepping ginger can seem tricky. But simply follow the instructions in this video and you\'ll be prepping like a pro.', 'images/roasted-squash-curry/tip.jpg', 'how_to'),
(13, 25, 'Cook Your Grains \"Pasta\" Style', 'In some of our recipes, we have you measure out water to cook your grains in. In others, we only specify to heat a pot of boiling water and add the grains to it. For the grain in this recipe, an exact ratio of water to grain isn\'t necessary. You just need enough boiling water to give the grain some room and let it dance: a few quarts will do. We chose this method because it\'s more streamlined and easier for hearty grains (like farro, spelt and wild rice). Just think: cook it like pasta!', 'images/roasted-turkey-breast-farro-endive-salad/tip.jpg', 'how_to'),
(14, 26, 'Get Perfect Citrus Zest', 'Zest is one of the best ways to brighten up a dish. It translates the essential oils of the citrus into flavor for all kinds of meals. See how it\'s done here!', 'images/salmon-honey-glazed-carrots/tip.jpg', 'how_to'),
(15, 28, 'Slice Steak', 'Properly sliced steak isn\'t just beautiful to look at. It also ensures that the meat stays tender. You\'ve probably heard the expression \"slice the steak against the grain.\" But what does that mean? Check out this short video to find out!', 'images/seared-steaks-garlic-butter/tip.jpg', 'how_to'),
(16, 29, 'Chop Scallions', 'Scallions, or green onions, are one of our favorite aromatic vegetables. There are two parts of the vegetable: the white bottom and the green top. They\'re used a little differently in cooking—the white bottoms are similar in use to regular onions and are usually cooked; the green tops are often used raw as a garnish. In our recipes, we specify to separate them. Check out this video to see how we do it.', 'images/shiitake-hoisin-beef-burgers/tip.jpg', 'how_to'),
(17, 30, 'Make Sure Your Pasta is Al Dente', 'Nothing beats perfectly cooked, al dente pasta. But how do you know if it\'s done? There are numerous ways to test the doneness of your noodles when they\'re cooking. Some folk wisdom says to throw a piece of pasta against the wall; if it sticks, it\'s done. As much fun as we had experimenting with this method, we found the best way to test the pasta was, shockingly, by tasting it. In Italian, \"al dente\" means \"to the tooth,\" meaning that it\'s still slightly firm to the bite. As your pasta cooks, periodically (and carefully) taste a piece of it. If it\'s still too firm, let it cook a little longer. In some of our recipes, we specify to remove the pasta from the pot when it\'s \"just shy of al dente.\" This is because, later, the pasta will be cooked in a sauce. Removing the pasta from the water just before it\'s al dente will ensure that the final product isn\'t overcooked.', 'images/shrimp-fra-diavolo/tip.jpg', 'how_to'),
(18, 31, 'Roll Pizza Dough', 'Rolling out pizza dough may seem tricky—but with a few simple steps (and enough time for the dough to rest), you can achieve perfect results at home. Watch this short video to see how our chef does it.', 'images/smoked-gouda-mushroom-flatbread/tip.jpg', 'how_to'),
(19, 32, 'Chop Scallions', 'Scallions, or green onions, are one of our favorite aromatic vegetables. There are two parts of the vegetable: the white bottom and the green top. They\'re used a little differently in cooking—the white bottoms are similar in use to regular onions and are usually cooked; the green tops are often used raw as a garnish. In our recipes, we specify to separate them. Check out this video to see how we do it.', 'images/spicy-chicken-quesadillas/tip.jpg', 'how_to'),
(20, 33, 'Peel Garlic', 'If you\'re cooking with us, you\'re using garlic in virtually every recipe. Don\'t waste any more time trying to peel it! Check out the video for a quick tip.', 'images/spicy-pork-korean-rice-cakes/tip.jpg', 'how_to'),
(21, 35, 'Peel a Carrot', 'Make quick work of this deliciously sweet root vegetable. Check out the video to see how it\'s done.', 'images/thai-curry-chicken/tip.png', 'how_to'),
(22, 36, 'Peel Garlic', 'If you\'re cooking with us, you\'re using garlic in virtually every recipe. Don\'t waste any more time trying to peel it! Check out the video for a quick tip.', 'images/tilapia-black-lentil-salad/tip.jpg', 'how_to'),
(23, 40, 'Separate Leafy Greens from the Stems', 'Check out this simple trick for separating the stems and leaves of one of our favorite ingredients: kale. You won\'t even need a knife!', 'images/tuscan-chicken-green-lentil-stew/tip.jpg', 'how_to'),
(24, 16, 'Sweet Potato', 'Despite its name, the sweet potato is not related to the group of vegetables we know as \"potatoes\"—rather, the sweet potato is actually a member of the morning glory family. Columbus brought the tropical root crop back to Europe from the Americas. It was eagerly adopted by Europeans and given the title of \"potato\" (from the indigenous Taino name, \"batata\"). Years later, in 1537, when the white potato first arrived in Europe, locals began referring to both vegetables as \"potatoes,\" creating a confusion that persists today. Sweet potatoes are enjoyed in both regular and \"baby\" varieties—smaller versions of the vegetable that are renowned for their sweet flavor and tender flesh.', 'images/pimento-cheeseburgers/tip.jpg', 'ingredient_spotlight');

-- --------------------------------------------------------

--
-- Table structure for table `tools`
--

CREATE TABLE `tools` (
  `id` int NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tools`
--

INSERT INTO `tools` (`id`, `name`, `brand`, `description`, `image`, `image_2`, `image_3`) VALUES
(1, 'Garlic Press', 'Harold Import Company', 'Slicing garlic has never been simpler. This two-sided essential is designed to do two jobs in one: crush garlic and slice it. Made by Harold Import Company, a family-owned American business with over 50 years of experience, this easy-to-use press owes its incredible durability to its heavyweight, stainless steel construction. To use it, simply place the clove in the hopper and press downward for freshly pressed garlic, or flip it over to get uniform slices of garlic. And to ensure minimal mess, it includes a handy cleaning tool for removing leftover pressed garlic after use.', 'images/tools/garlic-press-1.jpg', 'images/tools/garlic-press-2.jpg', NULL),
(2, 'Slotted Spatula', NULL, 'Master your flipping skills with this commercial-grade slotted turner. This spatula is designed for delicate fish, but we use this versatile tool for anything that requires a deft hand for tricky flipping, such as over-easy eggs, paper-thin crepes or even a burger. With its low-angled beveled edge and flexible blade, this turner slips easily between the pan and your dinner, ensuring even the most delicate meal remains in picture-perfect condition.', 'images/tools/slotted-spatula-1.jpg', NULL, NULL),
(3, 'Large Maple Cutting Board', 'John Boos & Co. for Blue Apron', 'Built to last, this chopping board is prized by professional chefs and so gorgeous we never want to take it off the counter. Crafted with hardy American maple, this exclusive collaboration between Blue Apron and John Boos & Co. is equal parts beautiful and handy. Its durable surface won\'t warp and is resistant to scoring; magically, it also helps keep your blades sharper than other materials. You\'ll find these boards in our test kitchen—as well as professional kitchens around the world.', 'images/tools/large-maple-cutting-board-1.jpg', 'images/tools/large-maple-cutting-board-2.jpg', NULL),
(4, 'Olive Wood Spoon', 'Eddington', 'Stir some old-world charm into your next meal with this sturdy spoon made from Italian-grown olive wood. For home cooks and professional chefs alike, this multi-purpose 14\" blunt-end spoon is a must-have item. Stain and odor resistant, this spoon will not scratch porcelain, ceramic, glass, or enamel surfaces, and won\'t heat up while you stir. Each unique olive wood spoon brings a sense of quality and professionalism to even the simplest tasks, like stirring sauce or deglazing a pan.', 'images/tools/olive-wood-spoon-1.jpg', 'images/tools/olive-wood-spoon-2.jpg', 'images/tools/olive-wood-spoon-3.jpg'),
(5, 'Stainless Steel Strainer', NULL, 'A stainless steel strainer is a handy tool for quinoa. It\'s great for draining grains and pastas (not to mention small fruits and vegetables after washing) and straining stocks and gravy. Lightweight and sturdy, it\'s constructed with a double-fine mesh.', 'images/tools/stainless-steel-strainer-1.jpg', 'images/tools/stainless-steel-strainer-2.jpg', NULL),
(6, 'Box Grater', NULL, 'This sturdy tool offers four grater sizes, a comfortable grip, and a design that\'s easy to clean. Whether carrots or cheddar, rutabaga or gouda, this box grater shreds everything from root veggies to cheese with ease. Simple and sturdy, the stainless steel grater features four precision-cut surfaces that yield coarse, medium, fine, and super fine textures; there\'s also a slicing edge. Its easy-grip handle allows for efficient, comfortable work and its straight-edged base won\'t collect stray bits, making for quicker clean up.', 'images/tools/box-grater-1.jpg', 'images/tools/box-grater-2.jpg', NULL),
(7, 'Quarter-Sheet Pan', 'Nordic Ware', 'Whether you\'re flying solo or making dinner for two, this delightfully durable pan is about to become your next kitchen essential. This smaller version of the classic sheet pan is ideal for toasting up bread or whipping up a small batch of roasted vegetables for a single meal. Easy to store, its raised lip catches and contains juices while minimizing mess inside the oven. Rustproof and even-heating, this pan has a galvanized steel reinforcement around the rim, which adds to its strength.', 'images/tools/quarter-sheet-pan-1.jpg', 'images/tools/quarter-sheet-pan-2.jpg', NULL),
(8, '11\" PFOA-Free CTX Nonstick Pan', 'Scanpan', 'A true stovetop trifecta: nonstick, heavy duty, and environmentally sound. When meal prep requires a delicate touch—think eggs over easy or a seared salmon fillet—our culinary team grabs this even-heating, toxin-free pan. The patented ceramic titanium coating stands up to utensils (yes, even metal!), and best of all, it\'s easy to clean.', 'images/tools/11-pfoa-free-ctx-nonstick-pan-1.jpg', 'images/tools/11-pfoa-free-ctx-nonstick-pan-2.jpg', NULL),
(9, 'Salad Spinner, Family Plan', 'Zyliss', 'Cut down on prep time with this Swiss-designed salad spinner. Why we love this: Because every Blue Apron recipe starts with \"wash and dry the fresh produce\". Shortcut this step with the award-winning Zyliss salad spinner. With just one pump of the lever, your greens will spin dry and be ready for step two.', 'images/tools/salad-spinner-family-plan-1.jpg', 'images/tools/salad-spinner-family-plan-2.jpg', NULL),
(10, '12.5\" PFOA-Free CTX Nonstick Pan', 'Scanpan', 'This customer favorite is a true stovetop trifecta: nonstick, heavy duty, and environmentally sound. When meal prep requires a delicate touch—think eggs over easy or a seared salmon fillet—our culinary team grabs this even-heating, toxicant-free pan. The patented ceramic titanium coating stands up to utensils (yes, even metal!), and best of all, it\'s easy to clean.', 'images/tools/12-5-pfoa-free-ctx-nonstick-pan-1.jpg', 'images/tools/12-5-pfoa-free-ctx-nonstick-pan-2.jpg', 'images/tools/12-5-pfoa-free-ctx-nonstick-pan-3.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `recipe_tools`
--
ALTER TABLE `recipe_tools`
  ADD PRIMARY KEY (`recipe_id`,`tool_id`),
  ADD KEY `tool_id` (`tool_id`);

--
-- Indexes for table `steps`
--
ALTER TABLE `steps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `tips`
--
ALTER TABLE `tips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `tools`
--
ALTER TABLE `tools`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=429;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `steps`
--
ALTER TABLE `steps`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=235;

--
-- AUTO_INCREMENT for table `tips`
--
ALTER TABLE `tips`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tools`
--
ALTER TABLE `tools`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`);

--
-- Constraints for table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `recipe_tools`
--
ALTER TABLE `recipe_tools`
  ADD CONSTRAINT `recipe_tools_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`),
  ADD CONSTRAINT `recipe_tools_ibfk_2` FOREIGN KEY (`tool_id`) REFERENCES `tools` (`id`);

--
-- Constraints for table `steps`
--
ALTER TABLE `steps`
  ADD CONSTRAINT `steps_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`);

--
-- Constraints for table `tips`
--
ALTER TABLE `tips`
  ADD CONSTRAINT `tips_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
