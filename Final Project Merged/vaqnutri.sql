/*
Navicat MySQL Data Transfer

Source Server         : phpmyadmin
Source Server Version : 100121
Source Host           : localhost:3306
Source Database       : vaqnutri

Target Server Type    : MYSQL
Target Server Version : 100121
File Encoding         : 65001

Date: 2017-12-12 13:04:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for allergy
-- ----------------------------
DROP TABLE IF EXISTS `allergy`;
CREATE TABLE `allergy` (
  `ID` int(11) NOT NULL,
  `foodCatID` int(11) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `aFoodCatID_idx` (`foodCatID`),
  CONSTRAINT `aFoodCatID` FOREIGN KEY (`foodCatID`) REFERENCES `foodcat` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of allergy
-- ----------------------------
INSERT INTO `allergy` VALUES ('1', '1', 'Dairy', 'Dairy');
INSERT INTO `allergy` VALUES ('2', '2', 'Soy', 'Soy');
INSERT INTO `allergy` VALUES ('3', '3', 'Egg', 'Egg');
INSERT INTO `allergy` VALUES ('4', '4', 'Peanut', 'Peanut');
INSERT INTO `allergy` VALUES ('5', '5', 'Fish', 'Fish');
INSERT INTO `allergy` VALUES ('6', '6', 'Wheat', 'Wheat');
INSERT INTO `allergy` VALUES ('7', '7', 'Fructans', 'Fructans');
INSERT INTO `allergy` VALUES ('8', '8', 'Sesame', 'Sesame');
INSERT INTO `allergy` VALUES ('9', '9', 'Gluten', 'Gluten');
INSERT INTO `allergy` VALUES ('10', '10', 'Lactose', 'Lactose');
INSERT INTO `allergy` VALUES ('11', '11', 'Fructose', 'Fructose');
INSERT INTO `allergy` VALUES ('12', '12', 'Sulfites', 'Sulfites');
INSERT INTO `allergy` VALUES ('13', '13', 'Histamines', 'Histamines');
INSERT INTO `allergy` VALUES ('14', '14', 'Nitrites', 'Nitrites');
INSERT INTO `allergy` VALUES ('15', '15', 'Night Shades', 'Night Shades');

-- ----------------------------
-- Table structure for badexercisefordisease
-- ----------------------------
DROP TABLE IF EXISTS `badexercisefordisease`;
CREATE TABLE `badexercisefordisease` (
  `diseaseID` int(11) NOT NULL,
  `exerciseID` int(11) DEFAULT NULL,
  PRIMARY KEY (`diseaseID`),
  KEY `befdExerciseID_idx` (`exerciseID`),
  CONSTRAINT `befdDiseaseID` FOREIGN KEY (`diseaseID`) REFERENCES `disease` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `befdExerciseID` FOREIGN KEY (`exerciseID`) REFERENCES `exercise` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of badexercisefordisease
-- ----------------------------

-- ----------------------------
-- Table structure for badfoodfordisease
-- ----------------------------
DROP TABLE IF EXISTS `badfoodfordisease`;
CREATE TABLE `badfoodfordisease` (
  `diseaseID` int(11) NOT NULL,
  `foodCatID` int(11) DEFAULT NULL,
  PRIMARY KEY (`diseaseID`),
  KEY `foodCatID1_idx` (`foodCatID`),
  CONSTRAINT `diseaseID2` FOREIGN KEY (`diseaseID`) REFERENCES `disease` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `foodCatID2` FOREIGN KEY (`foodCatID`) REFERENCES `foodcat` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of badfoodfordisease
-- ----------------------------

-- ----------------------------
-- Table structure for currentweeklyroutine
-- ----------------------------
DROP TABLE IF EXISTS `currentweeklyroutine`;
CREATE TABLE `currentweeklyroutine` (
  `userID` int(11) NOT NULL,
  `weeklyRoutineID` int(11) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  KEY `weeklyRFK_idx` (`weeklyRoutineID`),
  CONSTRAINT `cwrUserFK` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `weeklyRFK` FOREIGN KEY (`weeklyRoutineID`) REFERENCES `weeklyroutine` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of currentweeklyroutine
-- ----------------------------

-- ----------------------------
-- Table structure for disease
-- ----------------------------
DROP TABLE IF EXISTS `disease`;
CREATE TABLE `disease` (
  `ID` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of disease
-- ----------------------------
INSERT INTO `disease` VALUES ('1', 'Diabetes', 'Diabetes is a disease that affects your body\'s ability to produce or use insulin. Insulin is a hormone. When your body turns the food you eat into energy (also called sugar or glucose), insulin is released to help transport this energy to the cells. Insulin acts as a “key.”');
INSERT INTO `disease` VALUES ('2', 'Celiac', 'Celiac disease is a serious genetic autoimmune disease. It is triggered by consuming a protein called gluten, which is found in wheat, barley and rye. When people with celiac disease eat foods containing gluten, their immune system responds by damaging the finger-like villi of the small intestine.');
INSERT INTO `disease` VALUES ('3', 'High Cholesterol', 'Cholesterol is a waxy substance that\'s found in the fats (lipids) in your blood. While your body needs cholesterol to continue building healthy cells, having high cholesterol can increase your risk of heart disease. When you have high cholesterol, you may develop fatty deposits in your blood vessels.');
INSERT INTO `disease` VALUES ('4', 'Chronic Kidney', 'Chronic kidney disease, also called chronic kidney failure, describes the gradual loss of kidney function. Your kidneys filter wastes and excess fluids from your blood, which are then excreted in your urine.');
INSERT INTO `disease` VALUES ('5', 'Gout', 'Gout is characterized by sudden, severe attacks of pain, redness and tenderness in joints, often the joint at the base of the big toe. Gout — a complex form of arthritis — can affect anyone. Men are more likely to get gout, but women become increasingly susceptible to gout after menopause.');
INSERT INTO `disease` VALUES ('6', 'High Blood Pressure', 'Blood pressure is the force of blood pushing against the walls of the arteries as the heart pumps blood. High blood pressure, sometimes called hypertension, happens when this force is too high. Health care workers check blood pressure readings the same way for children, teens, and adults.');

-- ----------------------------
-- Table structure for equipment
-- ----------------------------
DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment` (
  `Id` int(11) NOT NULL,
  `Name` mediumtext NOT NULL,
  `Exercise Type` varchar(45) NOT NULL,
  `Primary Muscle` varchar(45) NOT NULL,
  `Secondary Muscle` varchar(45) DEFAULT NULL,
  `Description` longtext NOT NULL,
  `Image` blob,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of equipment
-- ----------------------------

-- ----------------------------
-- Table structure for exercise
-- ----------------------------
DROP TABLE IF EXISTS `exercise`;
CREATE TABLE `exercise` (
  `ID` int(11) NOT NULL,
  `name` mediumtext NOT NULL,
  `description` longtext NOT NULL,
  `difficulty` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `met` double DEFAULT '0',
  `equipmentID` varchar(45) DEFAULT NULL,
  `image` blob,
  `primaryMuscle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exercise
-- ----------------------------

-- ----------------------------
-- Table structure for exerciseroutine
-- ----------------------------
DROP TABLE IF EXISTS `exerciseroutine`;
CREATE TABLE `exerciseroutine` (
  `ID` int(11) NOT NULL,
  `ExerciseID` int(11) DEFAULT NULL,
  `workOutTime` double DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `erExerciseFK_idx` (`ExerciseID`),
  CONSTRAINT `erExerciseFK` FOREIGN KEY (`ExerciseID`) REFERENCES `exercise` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exerciseroutine
-- ----------------------------
INSERT INTO `exerciseroutine` VALUES ('1', '1', '60');
INSERT INTO `exerciseroutine` VALUES ('2', '2', '2');
INSERT INTO `exerciseroutine` VALUES ('3', '11', '30');

-- ----------------------------
-- Table structure for exercisetype
-- ----------------------------
DROP TABLE IF EXISTS `exercisetype`;
CREATE TABLE `exercisetype` (
  `ID` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exercisetype
-- ----------------------------
INSERT INTO `exercisetype` VALUES ('1', 'CARDIO');

-- ----------------------------
-- Table structure for foodcat
-- ----------------------------
DROP TABLE IF EXISTS `foodcat`;
CREATE TABLE `foodcat` (
  `ID` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `discription` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of foodcat
-- ----------------------------
INSERT INTO `foodcat` VALUES ('1', 'Dairy', null);
INSERT INTO `foodcat` VALUES ('2', 'Soy', null);
INSERT INTO `foodcat` VALUES ('3', 'Eggs', null);
INSERT INTO `foodcat` VALUES ('4', 'Peanuts', null);
INSERT INTO `foodcat` VALUES ('5', 'Fish', null);
INSERT INTO `foodcat` VALUES ('6', 'Wheat', null);
INSERT INTO `foodcat` VALUES ('7', 'Fructans', null);
INSERT INTO `foodcat` VALUES ('8', 'Sesame', null);
INSERT INTO `foodcat` VALUES ('9', 'Gluten', null);
INSERT INTO `foodcat` VALUES ('10', 'Lactose', null);
INSERT INTO `foodcat` VALUES ('11', 'Fructose', null);
INSERT INTO `foodcat` VALUES ('12', 'Sulfites', null);
INSERT INTO `foodcat` VALUES ('13', 'Histamines', null);
INSERT INTO `foodcat` VALUES ('14', 'Nitrites', null);
INSERT INTO `foodcat` VALUES ('15', 'Night Shades', null);

-- ----------------------------
-- Table structure for foods
-- ----------------------------
DROP TABLE IF EXISTS `foods`;
CREATE TABLE `foods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `groupId` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `calories` double NOT NULL,
  `fats` double NOT NULL,
  `cholesterol` double NOT NULL,
  `sodium` double NOT NULL,
  `potassium` double NOT NULL,
  `carbohydrates` double NOT NULL,
  `proteins` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of foods
-- ----------------------------
INSERT INTO `foods` VALUES ('1', 'Apple', '1', 'apple.jpg', '198', '0.3', '0', '0.002', '0.1915', '24.7', '191.5');
INSERT INTO `foods` VALUES ('2', 'Avocado', '1', 'avocado.jpg', '145', '234', '21.4', '0', '0.01', '0.708', '12.5');
INSERT INTO `foods` VALUES ('3', 'Banana', '1', 'banana.jpg', '108', '105', '0.2', '0', '0.001', '0.194', '12.4');
INSERT INTO `foods` VALUES ('4', 'Broccoli', '1', 'broccoli.jpg', '88', '30', '0.3', '0', '0.029', '0.278', '5.8');
INSERT INTO `foods` VALUES ('5', 'Cabbage', '1', 'cabbage.jpg', '71', '17', '0', '0', '0', '0.013', '0.172');
INSERT INTO `foods` VALUES ('6', 'Carrot', '1', 'carrot.jpg', '110', '45', '0.3', '0', '0.076', '0.352', '10.5');
INSERT INTO `foods` VALUES ('7', 'Cucumber', '1', 'cucumber.png', '104', '16', '0', '0', '0.002', '0.152', '3.8');
INSERT INTO `foods` VALUES ('8', 'Eggplant', '1', 'eggplant.jpg', '82', '20', '0.2', '0', '0.002', '0.188', '4.7');
INSERT INTO `foods` VALUES ('9', 'Grapefruit', '1', 'grapefruit.jpg', '400', '64', '0.2', '0', '0', '0.278', '16.2');
INSERT INTO `foods` VALUES ('10', 'Grapes', '1', 'grapes.jpg', '150', '104', '0.2', '0', '3', '0.288', '27.3');
INSERT INTO `foods` VALUES ('11', 'Lettuce', '1', 'lettuce.jpg', '54', '8', '0', '0', '0.006', '0.0776', '1.6');
INSERT INTO `foods` VALUES ('12', 'Mango', '1', 'mango.jpg', '107', '57', '0.2', '0', '0.001', '0.117', '15.1');
INSERT INTO `foods` VALUES ('13', 'Orange', '1', 'orange.jpg', '178', '62', '0.2', '0', '0', '0.2371', '15.4');
INSERT INTO `foods` VALUES ('14', 'Papaya', '1', 'papaya.jpg', '138', '55', '0.2', '0', '0.004', '0.4', '13.7');
INSERT INTO `foods` VALUES ('15', 'Pineapple', '1', 'pineapple.jpg', '57', '28', '0.1', '0', '0.001', '0.061', '7.3');
INSERT INTO `foods` VALUES ('16', 'potato', '1', 'potato.png', '150', '116', '0.1', '0', '0.009', '0.009', '0.631');
INSERT INTO `foods` VALUES ('17', 'spinach', '1', 'spinach.jpg', '31', '7', '0.1', '0', '0.024', '0.167', '1.1');
INSERT INTO `foods` VALUES ('18', 'strawberry', '1', 'strawberry.jpg', '153', '49', '0.5', '0', '0.002', '0.232', '11.7');
INSERT INTO `foods` VALUES ('19', 'tomato', '1', 'tomato.jpg', '150', '27', '0.3', '0', '0.007', '0.353', '5.8');
INSERT INTO `foods` VALUES ('20', 'watermelon', '1', 'watermelon.jpg', '153', '46', '0.2', '0', '0.002', '170.2', '11.5');
INSERT INTO `foods` VALUES ('21', 'Cheerios', '2', 'cheerios.png', '28', '100', '2', '0', '0.14', '0.18', '20');
INSERT INTO `foods` VALUES ('22', 'Fiber One Cereal Original', '2', 'FiberOne_Cereal_Original.png', '30', '60', '1', '0', '0.11', '0.11', '25');
INSERT INTO `foods` VALUES ('23', 'Fiber One 100% Whole Wheat Bread', '2', 'fiberone-bread-wholewheat.png', '48', '15', '1.5', '0', '0.17', '0', '23');
INSERT INTO `foods` VALUES ('24', 'Fiber One Multigrain Bread', '2', 'FiberOne_Bread_Multigrain-1.png', '48', '110', '1.5', '0', '0.135', '0', '25');
INSERT INTO `foods` VALUES ('25', 'Fiber One 9 Grain Bread', '2', 'FiberOne_Bread_9Grain.png', '48', '110', '1.5', '0', '0.135', '0', '25');
INSERT INTO `foods` VALUES ('26', 'Honey Bunches of Oats Honey Roasted', '2', 'HBO-Honey-Roasted.png', '30', '120', '1.5', '0', '0.135', '0.055', '25');
INSERT INTO `foods` VALUES ('27', 'Riceland Extral Long Grain Brown Rice', '2', 'riceland-brown-rice.jpg', '42', '150', '1', '0', '0', '0.1', '32');
INSERT INTO `foods` VALUES ('28', 'Great Value Brown Rice', '2', 'Great_Value_Brown_Rice.jpg', '45', '160', '1.5', '0', '0', '0.1', '35');
INSERT INTO `foods` VALUES ('29', 'Great Value 100% Whole Wheat Bread', '2', 'Great_Value_100-Whole-Wheat-Bread.jpg', '28', '60', '1', '0', '0.12', '0.06', '12');
INSERT INTO `foods` VALUES ('30', 'Great Value Multi-Grain Bread', '2', 'Great_Value_Multi-Grain-Bread.jpg', '45', '120', '1.5', '0', '0.19', '0.095', '24');
INSERT INTO `foods` VALUES ('31', 'HEB 100% Whole Grain Brown Rice', '2', 'h-e-b_brown_rice.jpg', '42', '150', '1', '0', '0', '0', '32');
INSERT INTO `foods` VALUES ('32', 'HEB Bake Shop 100% Whole Wheat Bread', '2', 'h-e-b-bake-shop-100-whole-wheat-bread.jpg', '28', '60', '1', '0', '0.085', '0.09', '11');
INSERT INTO `foods` VALUES ('33', 'HEB Essential Grains 12 Grain Bread', '2', 'h-e-b-essential-grains-12-grain-bread.jpg', '45', '120', '2', '0', '0.19', '0', '22');
INSERT INTO `foods` VALUES ('34', 'Skinny Pop Original Popped Popcorn', '2', 'SkinnyPop_Popcorn.jpg', '28', '150', '10', '0', '0.075', '0', '15');
INSERT INTO `foods` VALUES ('35', 'Orville Redenbacher\'s Naturals Simply Salted', '2', 'OrvilleRedenbachers-naturals-simply-salted.png', '35', '170', '11', '0', '0.4', '0.065', '17');
INSERT INTO `foods` VALUES ('36', 'Honey Bunches of Oats Protein Granola with Dark Chocolate', '2', 'HBO-Granola-Dark-Chocolate.png', '50', '220', '7', '0', '0.095', '0.16', '32');
INSERT INTO `foods` VALUES ('37', 'Natural Valley Baked Oat Bites Cereal', '2', 'NatureValley_BoxedCereal_BakedOatBites.png', '24', '210', '6', '0', '0.16', '0.105', '34');
INSERT INTO `foods` VALUES ('38', 'Natural Valley Protein Oatmeal Maple Pecan Crunch', '2', 'NatureValley_OatmealCups_MaplePecanCrunch.png', '48', '290', '8', '0', '0.15', '0.21', '47');
INSERT INTO `foods` VALUES ('39', 'Natural Valley Oats \'N Honey Crunchy Granola Bars', '2', 'NatureValley_CrunchyBar_OatsnHoney.png', '16', '190', '7', '0', '0.18', '0', '29');
INSERT INTO `foods` VALUES ('40', 'Erin Baker\'s Granola Oatmeal Rasin', '2', 'ErinBakers-Granola-Oatmeal-Raisin.jpg', '55', '250', '9', '0', '0.01', '0', '38');
INSERT INTO `foods` VALUES ('41', 'Great Value Reduced Fat 2% Milk', '3', '2percentmilk.jpg', '240', '150', '8', '0.035', '0.12', '0.38', '12');
INSERT INTO `foods` VALUES ('42', 'Great Value Low Fat 1% Milk', '3', '1percentmilk.jpg', '240', '150', '8', '0.035', '0.12', '0.38', '12');
INSERT INTO `foods` VALUES ('43', 'Oak Farms Vitamin D Whole Milk', '3', 'wholemilk.jpg', '240', '150', '8', '0.035', '0.12', '0.38', '12');
INSERT INTO `foods` VALUES ('44', 'Blue Diamond Almonds Almond Breeze Unsweetened Original Almondmilk', '3', 'almondmilk.jpg', '240', '30', '2.5', '0', '0.15', '0.16', '1');
INSERT INTO `foods` VALUES ('45', 'Borden Sweetened Condensed Eagle Brand Milk', '3', 'condensedmilk.jpg', '39', '130', '3', '0.01', '0.04', '0', '23');
INSERT INTO `foods` VALUES ('46', 'Silk Vanilla Soymilk', '3', 'silksoymilk.jpg', '240', '30', '3.5', '0', '0.1', '0.3', '9');
INSERT INTO `foods` VALUES ('47', 'Soy Slender Chocolate Soy Milk', '3', 'chocolatesoymilk.jpg', '240', '70', '3', '0', '0.125', '0.29', '5');
INSERT INTO `foods` VALUES ('48', 'Great Value Vanilla Light Nonfat Yogurt', '3', 'vanillayogurt.jpg', '240', '110', '0', '0.005', '0.105', '0.32', '20');
INSERT INTO `foods` VALUES ('49', 'Yoplait Creamy Strawberry Grande Yogurt', '3', 'strawberryyogurt.jpg', '225', '200', '1.5', '0.01', '0.1', '0.3', '39');
INSERT INTO `foods` VALUES ('50', 'Chobani Blueberry on the Bottom Non-Fat Greek Yogurt', '3', 'chobaniblueberry_greekyogurt.jpg', '150', '120', '0', '0.005', '0.06', '0.22', '18');
INSERT INTO `foods` VALUES ('51', 'Dannon Plain All Natural Nonfat Yogurt', '3', 'plainyogurt.jpg', '225', '120', '0', '0.005', '0.15', '0.51', '18');
INSERT INTO `foods` VALUES ('52', 'La Yogurt Probiotic Banana Blended Lowfat Yogurt', '3', 'probioticbananayogurt.jpg', '240', '240', '2.5', '0.01', '0.13', '0.42', '45');
INSERT INTO `foods` VALUES ('53', 'Chobani Vanilla Blended Non-Fat Greek Yogurt', '3', 'chobanivanillayogurt.jpg', '170', '0', '0.01', '0.095', '0.36', '23', '20');
INSERT INTO `foods` VALUES ('54', 'Yoplait Light Banana Cream Pie Yogurt', '3', 'bananacreampie_yogurt.jpg', '170', '90', '0', '0.005', '0.08', '0', '16');
INSERT INTO `foods` VALUES ('55', 'Kraft Velveeta Slices 16 ct Cheese', '3', 'velveetacheese.jpg', '21', '40', '2', '0.001', '0.32', '0', '3');
INSERT INTO `foods` VALUES ('56', 'Kraft 100% Real Parmesan Grated Cheese', '3', 'parmesangratedcheese.jpg', '30', '20', '1.5', '0.005', '0.085', '0', '0');
INSERT INTO `foods` VALUES ('57', 'Kraft Singles American Slices 16 ct Cheese', '3', 'americancheese.jpg', '21', '70', '5', '0.02', '0.27', '0', '2');
INSERT INTO `foods` VALUES ('58', 'Kraft Deli Deluxe American Cheese Slices', '3', 'delideluxe_americancheese.jpg', '19', '60', '4.5', '0.015', '0.3', '0', '1');
INSERT INTO `foods` VALUES ('59', 'Great Value Shredded Mozzarella Cheese', '3', 'mozzarellacheese.jpg', '28', '80', '5', '0.015', '0.2', '0.025', '1');
INSERT INTO `foods` VALUES ('60', 'Borden American Singles Cheese', '3', 'bordencheese.jpg', '21', '45', '5', '0.015', '0.29', '0', '3');
INSERT INTO `foods` VALUES ('61', 'Lean/27 Fat, Ground Beef Roll, 5', '4', 'ground_beefroll.jpg', '112', '340', '30', '0.085', '0.075', '0', '0');
INSERT INTO `foods` VALUES ('62', 'Butterball Ground Turkey 93%Lean, 3lbs.', '4', 'ground_turkey.jpg', '112', '150', '8', '0.08', '0.095', '0', '0');
INSERT INTO `foods` VALUES ('63', '80Lean/20 Fat Great Value Beef Burgers, 3 Lbs', '4', 'beef_burger.jpg', '113', '290', '23', '0.09', '0.085', '0.31', '0');
INSERT INTO `foods` VALUES ('64', 'SPAM Classic 12 oz. Can', '4', 'spam.jpg', '56', '180', '16', '0.04', '0.79', '0', '1');
INSERT INTO `foods` VALUES ('65', 'Chicken Drumsticks, 5 lbs.', '4', 'chicken_drumsticks.jpg', '112', '90', '10', '0.1', '0.16', '0', '0');
INSERT INTO `foods` VALUES ('66', 'Tyson Boneless Skinless Fresh Chicken Breasts, 1.5-2.0 lbs', '4', 'chicken_breast.jpg', '112', '20', '2.5', '0.065', '0.18', '0', '0');
INSERT INTO `foods` VALUES ('67', 'Tyson Fresh Chicken Wings, 4.0 lbs.', '4', 'chicken_wing.jpg', '112', '220', '17', '0.105', '0.19', '0', '0');
INSERT INTO `foods` VALUES ('68', 'Great Value Chunk Chicken Breast in Water, 12.5 oz, 2 Count', '4', 'chicken_breastinwater.jpg', '56', '45', '1', '0.025', '0.26', '0.14', '0');
INSERT INTO `foods` VALUES ('69', 'Great Value Chunk Light Tuna in Water, 5 oz, 4 Count', '4', 'light_tuna.jpg', '56', '45', '0.5', '0.02', '0.18', '0.11', '0');
INSERT INTO `foods` VALUES ('70', 'Frozen Tilpia Filets, 7 lbs', '4', 'tilapia_fillet.jpg', '113', '100', '1.5', '0.05', '0.025', '0', '0');
INSERT INTO `foods` VALUES ('71', 'Medium Raw Shrimp 12 oz', '4', 'shrimp_raw.jpg', '85', '50', '0.5', '0.125', '0.64', '0.22', '0');
INSERT INTO `foods` VALUES ('72', 'Great Value Large Grade A Eggs, 18 ct', '4', 'greatvalue_largeeggs.jpg', '56', '70', '5', '0.185', '0.07', '0', '0');
INSERT INTO `foods` VALUES ('73', 'Farmhouse Cage Free Grade A Large Brown Eggs, 18 ct', '4', 'farmhouse_browneggs.jpg', '50', '70', '5', '0.185', '0.07', '0', '0');
INSERT INTO `foods` VALUES ('74', 'Great Value 100% Liquid Egg Whites, 32 oz', '4', 'liquid_eggwhite.jpg', '46', '25', '0', '0', '0.075', '0.06', '1');
INSERT INTO `foods` VALUES ('75', 'Great Value Pinto Beans, 64 oz', '4', 'pinto_beans.jpg', '35', '90', '0', '0', '0.005', '0.49', '20');
INSERT INTO `foods` VALUES ('76', 'Great Value Black Beans, 32 oz', '4', 'black_beans.jpg', '35', '100', '0.5', '0', '0', '0.49', '22');
INSERT INTO `foods` VALUES ('77', 'Great Value Light Red Kidney Beans, 16 oz', '4', 'kidney_beans.jpg', '35', '100', '0', '0', '0.005', '0.48', '21');
INSERT INTO `foods` VALUES ('78', 'Fisher Chef\'s Naturals Pecans Halves, 24 oz', '4', 'fisher_pecanhalves.jpg', '28', '190', '20', '0', '0', '0', '4');
INSERT INTO `foods` VALUES ('79', 'Great Value Whole Natural Almonds, 14 oz', '4', 'wholenatural_almonds.jpg', '28', '160', '14', '0', '0', '0.21', '6');
INSERT INTO `foods` VALUES ('80', 'Wonderful® Roasted & Salted Pistachios 24 oz. Bag', '4', 'pistachios.jpg', '30', '160', '14', '0', '0.16', '0.31', '8');
INSERT INTO `foods` VALUES ('81', 'Butter', '5', 'SmartBalancebutter.png', '33', '60', '7', '0', '70', '0', '0');
INSERT INTO `foods` VALUES ('82', 'Peanutbutter', '5', 'wowbutter.jpg', '16', '200', '15', '0', '100', '300', '8');
INSERT INTO `foods` VALUES ('83', 'AlmondButter', '5', 'barneyandcoalmond.jpg', '14', '180', '15', '0', '100', '0', '8');
INSERT INTO `foods` VALUES ('84', 'Butter', '5', 'butterspray.jpg', '1700', '0', '0', '0', '0', '0', '0');
INSERT INTO `foods` VALUES ('85', 'Butter', '5', 'canolabutter.jpg', '30', '100', '11', '15', '85', '0', '0');
INSERT INTO `foods` VALUES ('86', 'Butter', '5', 'canolaolivebutter.jpg', '30', '100', '11', '15', '85', '0', '0');
INSERT INTO `foods` VALUES ('87', 'Creamcheese', '5', 'creamcheese.jpg', '7', '80', '7', '20', '125', '0', '2');
INSERT INTO `foods` VALUES ('88', 'hummus', '5', 'hummus.jpg', '10', '70', '5', '0', '130', '0', '4');
INSERT INTO `foods` VALUES ('89', 'AlmondButter', '5', 'justin\'salmond.jpg', '12', '190', '18', '0', '0', '3500', '6');
INSERT INTO `foods` VALUES ('90', 'Butter', '5', 'lightspreadbutter.jpg', '30', '40', '4', '0', '80', '3500', '0');
INSERT INTO `foods` VALUES ('91', 'AlmondButter', '5', 'maranathaalmond.jpg', '11', '190', '16', '0', '0', '3500', '7');
INSERT INTO `foods` VALUES ('92', 'AlmondButter', '5', 'nutsnmorealmond.jpg', '14', '207', '15', '1', '56', '3500', '6');
INSERT INTO `foods` VALUES ('93', 'Butter', '5', 'omegabutter.jpg', '32', '70', '8', '0', '80', '3500', '0');
INSERT INTO `foods` VALUES ('94', 'PeanutButter', '5', 'omegapeanutbutter.jpg', '30', '100', '11', '15', '85', '3500', '0');
INSERT INTO `foods` VALUES ('95', 'AlmondButter', '5', 'onceagainalmond.jpg', '15', '190', '17', '0', '0', '3500', '6');
INSERT INTO `foods` VALUES ('96', 'Oil', '5', 'bertolli.jpg', '102', '120', '14', '0', '0', '0', '0');
INSERT INTO `foods` VALUES ('97', 'ricotta', '5', 'ricotta.jpg', '30', '100', '11', '15', '85', '3500', '0');
INSERT INTO `foods` VALUES ('98', 'AlmondButter', '5', 'Sam\'sAlmondButter.jpg', '11', '190', '16', '0', '60', '65', '7');
INSERT INTO `foods` VALUES ('99', 'Butter', '5', 'wildfriendsalmond.jpg', '1', '190', '17', '0', '90', '3500', '7');
INSERT INTO `foods` VALUES ('100', 'Oil', '5', 'canolaoil.jpg', '48', '120', '14', '0', '0', '0', '0');
INSERT INTO `foods` VALUES ('101', 'laysChips', '6', 'chips.png', '28', '160', '10', '0', '170', '350', '15');
INSERT INTO `foods` VALUES ('102', 'crackers', '6', 'crackers.png', '33', '90', '5', '0', '130', '0', '9');
INSERT INTO `foods` VALUES ('103', 'cookies', '6', 'cookie.jpg', '30', '130', '5', '0', '65', '0', '20');
INSERT INTO `foods` VALUES ('104', 'popcorn', '6', 'popcorn.jpg', '39', '130', '2', '0', '190', '230', '27');
INSERT INTO `foods` VALUES ('105', 'coke', '6', 'coke.jpg', '35', '140', '0', '0', '45', '0', '39');
INSERT INTO `foods` VALUES ('106', 'cheerios', '6', 'cheerios.png', '30', '120', '2', '0', '270', '170', '20');
INSERT INTO `foods` VALUES ('107', 'ketchup', '6', 'ketchup.jpg', '15', '25', '0', '0', '200', '0', '6');
INSERT INTO `foods` VALUES ('108', 'chickenSoup', '6', 'chickenSoup.jpg', '18.9', '70', '1', '15', '750', '0', '10');
INSERT INTO `foods` VALUES ('109', 'bread', '6', 'bread.jpg', '40', '100', '1', '0', '180', '0', '20');
INSERT INTO `foods` VALUES ('110', 'tortilla', '6', 'tortilla.jpg', '49', '140', '3.5', '0', '420', '0', '24');
INSERT INTO `foods` VALUES ('111', 'hotCheetos', '6', 'hotCheetos.png', '28', '160', '11', '0', '250', '0', '13');
INSERT INTO `foods` VALUES ('112', 'pizza', '6', 'pizza.png', '175', '410', '19', '35', '660', '0', '48');
INSERT INTO `foods` VALUES ('113', 'margarine', '6', 'margarine.jpg', '85', '250', '11', '5', '350', '0', '33');
INSERT INTO `foods` VALUES ('114', 'frenchFry', '6', 'frenchFry.jpg', '114', '350', '18', '0', '220', '0', '45');
INSERT INTO `foods` VALUES ('115', 'iceCream', '6', 'iceCream.jpg', '65', '150', '9', '80', '45', '0', '15');
INSERT INTO `foods` VALUES ('116', 'candyBar', '6', 'candyBar.jpg', '78', '320', '17', '15', '220', '0', '40');
INSERT INTO `foods` VALUES ('117', 'cheese', '6', 'cheese.jpg', '28.35', '100', '10', '30', '230', '0', '0');
INSERT INTO `foods` VALUES ('118', 'soySauce', '6', 'soySauce.jpg', '6', '15', '0', '0', '125', '0', '3');
INSERT INTO `foods` VALUES ('119', 'poundCake', '6', 'poundCake.jpg', '65', '230', '10', '55', '135', '0', '34');
INSERT INTO `foods` VALUES ('120', 'bacon', '6', 'bacon.png', '32', '170', '17', '25', '220', '0', '0');

-- ----------------------------
-- Table structure for food_groups
-- ----------------------------
DROP TABLE IF EXISTS `food_groups`;
CREATE TABLE `food_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `cssid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of food_groups
-- ----------------------------
INSERT INTO `food_groups` VALUES ('1', 'Vegetables, salads, fruits', 'vegetables_category');
INSERT INTO `food_groups` VALUES ('2', 'Wholemeal cereals and breads', 'wholemeal_category');
INSERT INTO `food_groups` VALUES ('3', 'Milk, yogurt and cheese', 'dairy_category');
INSERT INTO `food_groups` VALUES ('4', 'Meat, poultry, fish, eggs', 'meat_category');
INSERT INTO `food_groups` VALUES ('5', 'Fats, spreads and oils', 'oils_category');
INSERT INTO `food_groups` VALUES ('6', 'Foods and drinks high in fat', 'junk_category');

-- ----------------------------
-- Table structure for goodexercisetypefordisease
-- ----------------------------
DROP TABLE IF EXISTS `goodexercisetypefordisease`;
CREATE TABLE `goodexercisetypefordisease` (
  `diseaseID` int(11) NOT NULL,
  `exerciseType` int(11) DEFAULT NULL,
  PRIMARY KEY (`diseaseID`),
  KEY `gefdType_idx` (`exerciseType`),
  CONSTRAINT `gefdDiseaseID` FOREIGN KEY (`diseaseID`) REFERENCES `disease` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `gefdType` FOREIGN KEY (`exerciseType`) REFERENCES `exercisetype` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodexercisetypefordisease
-- ----------------------------
INSERT INTO `goodexercisetypefordisease` VALUES ('1', '1');

-- ----------------------------
-- Table structure for goodfoodfordisease
-- ----------------------------
DROP TABLE IF EXISTS `goodfoodfordisease`;
CREATE TABLE `goodfoodfordisease` (
  `diseaseID` int(11) NOT NULL,
  `foodCatID` int(11) DEFAULT NULL,
  PRIMARY KEY (`diseaseID`),
  KEY `foodCatID1_idx` (`foodCatID`),
  CONSTRAINT `diseaseID1` FOREIGN KEY (`diseaseID`) REFERENCES `disease` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `foodCatID1` FOREIGN KEY (`foodCatID`) REFERENCES `foodcat` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodfoodfordisease
-- ----------------------------

-- ----------------------------
-- Table structure for medical
-- ----------------------------
DROP TABLE IF EXISTS `medical`;
CREATE TABLE `medical` (
  `userID` int(11) NOT NULL,
  `heightFt` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `heightInches` int(11) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of medical
-- ----------------------------
INSERT INTO `medical` VALUES ('1', '12', '12', '12');

-- ----------------------------
-- Table structure for personal
-- ----------------------------
DROP TABLE IF EXISTS `personal`;
CREATE TABLE `personal` (
  `userID` int(11) NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `zipcode` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`userID`),
  CONSTRAINT `ID` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of personal
-- ----------------------------
INSERT INTO `personal` VALUES ('1', 'Rodolfo', 'Contreras', 'Male', '2450 Shidler', 'Arizona', 'Brownsville', '12313', null, '1996-12-12');

-- ----------------------------
-- Table structure for profilepicture
-- ----------------------------
DROP TABLE IF EXISTS `profilepicture`;
CREATE TABLE `profilepicture` (
  `userID` int(11) NOT NULL,
  `image` blob,
  PRIMARY KEY (`userID`),
  CONSTRAINT `ppUSERFK` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of profilepicture
-- ----------------------------
INSERT INTO `profilepicture` VALUES ('1', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `username` varchar(256) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'B851FCBD2A56C6EEE0D1F86D1B7751DE92EFEF301E417A7F80748843EE1351A5', 'B221D9DBB083A7F33428D7C2A3C3198AE925614D70210E28716CCAA7CD4DDB79');

-- ----------------------------
-- Table structure for userallergies
-- ----------------------------
DROP TABLE IF EXISTS `userallergies`;
CREATE TABLE `userallergies` (
  `userID` int(11) NOT NULL,
  `allergyID` int(11) NOT NULL,
  PRIMARY KEY (`userID`,`allergyID`),
  KEY `allergyID_idx` (`allergyID`),
  CONSTRAINT `userID1` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userallergies
-- ----------------------------

-- ----------------------------
-- Table structure for userdiseases
-- ----------------------------
DROP TABLE IF EXISTS `userdiseases`;
CREATE TABLE `userdiseases` (
  `userID` int(11) NOT NULL,
  `diseaseID` int(11) NOT NULL,
  PRIMARY KEY (`userID`,`diseaseID`),
  KEY `ID_idx` (`diseaseID`),
  CONSTRAINT `diseaseID` FOREIGN KEY (`diseaseID`) REFERENCES `disease` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userID` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userdiseases
-- ----------------------------
INSERT INTO `userdiseases` VALUES ('1', '2');

-- ----------------------------
-- Table structure for userequipment
-- ----------------------------
DROP TABLE IF EXISTS `userequipment`;
CREATE TABLE `userequipment` (
  `userID` int(11) NOT NULL,
  `equipmentID` int(11) NOT NULL,
  PRIMARY KEY (`userID`,`equipmentID`),
  KEY `ueEqupimentFK_idx` (`equipmentID`),
  CONSTRAINT `ueEquipmentFK` FOREIGN KEY (`equipmentID`) REFERENCES `equipment` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ueUserFK` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userequipment
-- ----------------------------

-- ----------------------------
-- Table structure for userweeklyroutine
-- ----------------------------
DROP TABLE IF EXISTS `userweeklyroutine`;
CREATE TABLE `userweeklyroutine` (
  `userID` int(11) NOT NULL,
  `weeklyRoutineID` int(11) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  KEY `weeklyRoutineFK_idx` (`weeklyRoutineID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userweeklyroutine
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
