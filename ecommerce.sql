/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100421
 Source Host           : localhost:3306
 Source Schema         : ecommerce

 Target Server Type    : MySQL
 Target Server Version : 100421
 File Encoding         : 65001

 Date: 06/02/2023 07:18:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `customer_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('Paijo', 'Jl. kutilang berkicau 12, Jakarta Barat', 1);
INSERT INTO `customer` VALUES ('x', 'x', 2);

-- ----------------------------
-- Table structure for mutasi_stock
-- ----------------------------
DROP TABLE IF EXISTS `mutasi_stock`;
CREATE TABLE `mutasi_stock`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tgl_mutasi` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  `pcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type_mutasi` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jumlah` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mutasi_stock
-- ----------------------------
INSERT INTO `mutasi_stock` VALUES (50, '2023-02-05 21:07:36.000000', '0100001', 'INV/07/2020/12565', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (51, '2023-02-05 21:07:43.000000', '0100001', 'INV/07/2020/12565', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (52, '2023-02-05 21:08:36.000000', '0100001', 'INV/07/2020/12565', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (53, '2023-02-05 21:36:58.000000', '0100001', 'INV/07/2020/12565', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (54, '2023-02-05 21:37:48.000000', '0100001', 'INV/07/2020/12565', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (55, '2023-02-05 21:38:27.000000', '0100002', 'INV/07/2020/14746', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (56, '2023-02-05 21:41:47.000000', '0100002', 'INV/07/2020/14746', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (57, '2023-02-05 21:42:47.000000', '0100002', 'INV/07/2020/14746', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (58, '2023-02-05 21:46:13.000000', '0100002', 'INV/07/2020/14746', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (59, '2023-02-05 21:48:13.000000', '0100002', 'INV/07/2020/14746', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (60, '2023-02-05 21:49:25.000000', '0100002', 'INV/07/2020/14746', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (61, '2023-02-05 21:52:21.000000', '0100002', 'INV/07/2020/14746', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (62, '2023-02-05 21:55:48.000000', '0100002', 'INV/07/2020/14746', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (63, '2023-02-05 21:56:38.000000', '0100002', 'INV/07/2020/14746', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (64, '2023-02-06 00:20:54.000000', '0100002', 'INV/07/2020/14746', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (65, '2023-02-06 00:38:27.000000', '0100002', 'INV/07/2020/14746', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (66, '2023-02-06 00:40:22.000000', '0100002', 'INV/07/2020/14746', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (67, '2023-02-06 00:42:18.000000', '0100002', 'INV/07/2020/14746', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (68, '2023-02-06 00:43:01.000000', '0100002', 'INV/07/2020/14746', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (69, '2023-02-06 00:43:25.000000', '0100002', 'INV/07/2020/14746', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (70, '2023-02-06 00:44:38.000000', '0100002', 'INV/07/2020/14746', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (71, '2023-02-06 00:44:45.000000', '0100002', 'INV/07/2020/14746', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (72, '2023-02-06 00:46:21.000000', '0100002', 'INV/07/2020/14746', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (73, '2023-02-06 00:46:38.000000', '0100002', 'INV/07/2020/4469', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (74, '2023-02-06 00:46:57.000000', '0100002', 'INV/07/2020/4469', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (75, '2023-02-06 00:48:17.000000', '0100002', 'INV/07/2020/4469', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (76, '2023-02-06 00:48:46.000000', '0100002', 'INV/07/2020/4469', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (77, '2023-02-06 00:49:23.000000', '0100002', 'INV/07/2020/4469', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (78, '2023-02-06 00:50:47.000000', '0100002', 'INV/07/2020/4469', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (79, '2023-02-06 00:52:12.000000', '0100002', 'INV/07/2020/4469', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (80, '2023-02-06 00:52:58.000000', '0100002', 'INV/07/2020/4469', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (81, '2023-02-06 00:55:49.000000', '0100002', 'INV/07/2020/4469', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (82, '2023-02-06 00:56:06.000000', '0100002', 'INV/07/2020/4469', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (83, '2023-02-06 00:56:35.000000', '0100002', 'INV/07/2020/4469', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (84, '2023-02-06 00:58:24.000000', '0100002', 'INV/07/2020/4469', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (85, '2023-02-06 00:58:43.000000', '0100002', 'INV/07/2020/4469', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (86, '2023-02-06 00:59:04.000000', '0100002', 'INV/07/2020/4469', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (87, '2023-02-06 00:59:31.000000', '0100002', 'INV/07/2020/4469', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (88, '2023-02-06 00:59:45.000000', '0100002', 'INV/07/2020/4469', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (89, '2023-02-06 01:00:07.000000', '010003', 'INV/07/2020/756', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (90, '2023-02-06 01:00:23.000000', '010003', 'INV/07/2020/756', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (91, '2023-02-06 01:00:38.000000', '010003', 'INV/07/2020/756', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (92, '2023-02-06 01:01:03.000000', '010003', 'INV/07/2020/756', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (93, '2023-02-06 01:01:14.000000', '010003', 'INV/07/2020/756', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (94, '2023-02-06 01:01:26.000000', '010003', 'INV/07/2020/756', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (95, '2023-02-06 01:01:35.000000', '010003', 'INV/07/2020/756', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (96, '2023-02-06 01:01:55.000000', '010003', 'INV/07/2020/756', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (97, '2023-02-06 01:02:23.000000', '010003', 'INV/07/2020/756', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (98, '2023-02-06 01:02:58.000000', '010003', 'INV/07/2020/756', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (99, '2023-02-06 01:03:17.000000', '010003', 'INV/07/2020/756', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (100, '2023-02-06 01:03:29.000000', '010003', 'INV/07/2020/756', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (101, '2023-02-06 01:04:11.000000', '010003', 'INV/07/2020/756', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (102, '2023-02-06 01:04:27.000000', '010003', 'INV/07/2020/756', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (103, '2023-02-06 01:05:17.000000', '010003', 'INV/07/2020/756', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (104, '2023-02-06 01:05:28.000000', '010003', 'INV/07/2020/756', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (105, '2023-02-06 01:05:45.000000', '010003', 'INV/07/2020/756', 'O', 1);
INSERT INTO `mutasi_stock` VALUES (106, '2023-02-06 01:08:40.000000', '010002', 'INV/07/2020/11475', 'O', 2);
INSERT INTO `mutasi_stock` VALUES (107, '2023-02-06 01:08:40.000000', '010003', 'INV/07/2020/11475', 'O', 1);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `order_detail_id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pcode` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `qty` int NOT NULL DEFAULT 0,
  `price` int NOT NULL DEFAULT 0,
  `subtotal` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`order_detail_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (1, 'INV/07/2020/4469', '0100002', 1, 20000, 20000);
INSERT INTO `order_detail` VALUES (2, 'INV/07/2020/4469', '0100002', 1, 20000, 20000);
INSERT INTO `order_detail` VALUES (3, 'INV/07/2020/4469', '0100002', 1, 20000, 20000);
INSERT INTO `order_detail` VALUES (4, 'INV/07/2020/4469', '0100002', 1, 20000, 20000);
INSERT INTO `order_detail` VALUES (5, 'INV/07/2020/4469', '0100002', 1, 20000, 20000);
INSERT INTO `order_detail` VALUES (6, 'INV/07/2020/4469', '0100002', 1, 20000, 20000);
INSERT INTO `order_detail` VALUES (7, 'INV/07/2020/4469', '0100002', 1, 20000, 20000);
INSERT INTO `order_detail` VALUES (8, 'INV/07/2020/4469', '0100002', 1, 20000, 20000);
INSERT INTO `order_detail` VALUES (9, 'INV/07/2020/4469', '0100002', 1, 20000, 20000);
INSERT INTO `order_detail` VALUES (10, 'INV/07/2020/756', '010003', 1, 50000, 50000);
INSERT INTO `order_detail` VALUES (11, 'INV/07/2020/756', '010003', 1, 50000, 50000);
INSERT INTO `order_detail` VALUES (12, 'INV/07/2020/756', '010003', 1, 50000, 50000);
INSERT INTO `order_detail` VALUES (13, 'INV/07/2020/756', '010003', 1, 50000, 50000);
INSERT INTO `order_detail` VALUES (14, 'INV/07/2020/756', '010003', 1, 50000, 50000);
INSERT INTO `order_detail` VALUES (15, 'INV/07/2020/756', '010003', 1, 50000, 50000);
INSERT INTO `order_detail` VALUES (16, 'INV/07/2020/756', '010003', 1, 50000, 50000);
INSERT INTO `order_detail` VALUES (17, 'INV/07/2020/756', '010003', 1, 50000, 50000);
INSERT INTO `order_detail` VALUES (18, 'INV/07/2020/756', '010003', 1, 50000, 50000);
INSERT INTO `order_detail` VALUES (19, 'INV/07/2020/756', '010003', 1, 50000, 50000);
INSERT INTO `order_detail` VALUES (20, 'INV/07/2020/756', '010003', 1, 50000, 50000);
INSERT INTO `order_detail` VALUES (21, 'INV/07/2020/756', '010003', 1, 50000, 50000);
INSERT INTO `order_detail` VALUES (22, 'INV/07/2020/756', '010003', 1, 50000, 50000);
INSERT INTO `order_detail` VALUES (23, 'INV/07/2020/756', '010003', 1, 50000, 50000);
INSERT INTO `order_detail` VALUES (24, 'INV/07/2020/756', '010003', 1, 50000, 50000);
INSERT INTO `order_detail` VALUES (25, 'INV/07/2020/756', '010003', 1, 50000, 50000);
INSERT INTO `order_detail` VALUES (26, 'INV/07/2020/756', '010003', 1, 50000, 50000);
INSERT INTO `order_detail` VALUES (27, 'INV/07/2020/11475', '010002', 2, 20000, 20000);
INSERT INTO `order_detail` VALUES (28, 'INV/07/2020/11475', '010003', 1, 50000, 50000);

-- ----------------------------
-- Table structure for order_header
-- ----------------------------
DROP TABLE IF EXISTS `order_header`;
CREATE TABLE `order_header`  (
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `order_date` datetime NULL DEFAULT NULL,
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `promo_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `amount_discount` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `net` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `ppn` int NOT NULL DEFAULT 0,
  `total` int NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_header
-- ----------------------------
INSERT INTO `order_header` VALUES ('INV/07/2020/14746', '2023-02-06 00:40:22', '202302-880', '1', '1000', '20000', 2000, 21000);
INSERT INTO `order_header` VALUES ('INV/07/2020/14746', '2023-02-06 00:42:18', '202302-1157', '1', '1000', '20000', 2000, 21000);
INSERT INTO `order_header` VALUES ('INV/07/2020/14746', '2023-02-06 00:43:01', '202302-1625', '1', '1000', '20000', 2000, 21000);
INSERT INTO `order_header` VALUES ('INV/07/2020/14746', '2023-02-06 00:43:25', '202302-165', '1', '1000', '20000', 2000, 21000);
INSERT INTO `order_header` VALUES ('INV/07/2020/14746', '2023-02-06 00:44:38', '202302-473', '1', '1000', '20000', 2000, 21000);
INSERT INTO `order_header` VALUES ('INV/07/2020/14746', '2023-02-06 00:44:45', '202302-317', '1', '1000', '20000', 2000, 21000);
INSERT INTO `order_header` VALUES ('INV/07/2020/14746', '2023-02-06 00:46:21', '202302-1740', '1', '1000', '20000', 2000, 21000);
INSERT INTO `order_header` VALUES ('INV/07/2020/4469', '2023-02-06 00:46:38', '202302-333', '1', '1000', '20000', 2000, 21000);
INSERT INTO `order_header` VALUES ('INV/07/2020/4469', '2023-02-06 00:46:57', '202302-927', '1', '1000', '20000', 2000, 21000);
INSERT INTO `order_header` VALUES ('INV/07/2020/4469', '2023-02-06 00:48:17', '202302-323', '1', '1000', '20000', 2000, 21000);
INSERT INTO `order_header` VALUES ('INV/07/2020/4469', '2023-02-06 00:48:46', '202302-232', '1', '1000', '20000', 2000, 21000);
INSERT INTO `order_header` VALUES ('INV/07/2020/4469', '2023-02-06 00:49:23', '202302-1601', '1', '1000', '20000', 2000, 21000);
INSERT INTO `order_header` VALUES ('INV/07/2020/4469', '2023-02-06 00:50:47', '202302-292', '1', '1000', '20000', 2000, 21000);
INSERT INTO `order_header` VALUES ('INV/07/2020/4469', '2023-02-06 00:52:12', '202302-1972', '1', '1000', '20000', 2000, 21000);
INSERT INTO `order_header` VALUES ('INV/07/2020/4469', '2023-02-06 00:52:58', '202302-1619', '1', '1000', '20000', 2000, 21000);
INSERT INTO `order_header` VALUES ('INV/07/2020/4469', '2023-02-06 00:55:49', '202302-1859', '1', '1000', '20000', 2000, 21000);
INSERT INTO `order_header` VALUES ('INV/07/2020/4469', '2023-02-06 00:56:06', '202302-141', '1', '1000', '20000', 2000, 21000);
INSERT INTO `order_header` VALUES ('INV/07/2020/4469', '2023-02-06 00:56:35', '202302-664', '1', '1000', '20000', 2000, 21000);
INSERT INTO `order_header` VALUES ('INV/07/2020/4469', '2023-02-06 00:58:24', '202302-1582', '1', '1000', '20000', 2000, 21000);
INSERT INTO `order_header` VALUES ('INV/07/2020/4469', '2023-02-06 00:58:43', '202302-523', '1', '1000', '20000', 2000, 21000);
INSERT INTO `order_header` VALUES ('INV/07/2020/4469', '2023-02-06 00:59:04', '202302-822', '1', '1000', '20000', 2000, 21000);
INSERT INTO `order_header` VALUES ('INV/07/2020/4469', '2023-02-06 00:59:31', '202302-867', '1', '1000', '20000', 2000, 21000);
INSERT INTO `order_header` VALUES ('INV/07/2020/4469', '2023-02-06 00:59:45', '202302-700', '1', '1000', '20000', 2000, 21000);
INSERT INTO `order_header` VALUES ('INV/07/2020/756', '2023-02-06 01:00:07', '202302-1127', '1', '1000', '50000', 5000, 54000);
INSERT INTO `order_header` VALUES ('INV/07/2020/756', '2023-02-06 01:00:23', '202302-1599', '1', '1000', '50000', 5000, 54000);
INSERT INTO `order_header` VALUES ('INV/07/2020/756', '2023-02-06 01:00:38', '202302-1877', '1', '1000', '50000', 5000, 54000);
INSERT INTO `order_header` VALUES ('INV/07/2020/756', '2023-02-06 01:01:03', '202302-1257', '1', '1000', '50000', 5000, 54000);
INSERT INTO `order_header` VALUES ('INV/07/2020/756', '2023-02-06 01:01:14', '202302-1899', '1', '1000', '50000', 5000, 54000);
INSERT INTO `order_header` VALUES ('INV/07/2020/756', '2023-02-06 01:01:26', '202302-1518', '1', '1000', '50000', 5000, 54000);
INSERT INTO `order_header` VALUES ('INV/07/2020/756', '2023-02-06 01:01:35', '202302-52', '1', '1000', '50000', 5000, 54000);
INSERT INTO `order_header` VALUES ('INV/07/2020/756', '2023-02-06 01:01:55', '202302-2052', '1', '1000', '50000', 5000, 54000);
INSERT INTO `order_header` VALUES ('INV/07/2020/756', '2023-02-06 01:02:23', '202302-190', '1', '1000', '50000', 5000, 54000);
INSERT INTO `order_header` VALUES ('INV/07/2020/756', '2023-02-06 01:02:58', '202302-841', '1', '1000', '50000', 5000, 54000);
INSERT INTO `order_header` VALUES ('INV/07/2020/756', '2023-02-06 01:03:17', '202302-29', '1', '1000', '50000', 5000, 54000);
INSERT INTO `order_header` VALUES ('INV/07/2020/756', '2023-02-06 01:03:29', '202302-1689', '1', '1000', '50000', 5000, 54000);
INSERT INTO `order_header` VALUES ('INV/07/2020/756', '2023-02-06 01:04:11', '202302-1577', '1', '1000', '50000', 5000, 54000);
INSERT INTO `order_header` VALUES ('INV/07/2020/756', '2023-02-06 01:04:27', '202302-1745', '1', '1000', '50000', 5000, 54000);
INSERT INTO `order_header` VALUES ('INV/07/2020/756', '2023-02-06 01:05:17', '202302-1812', '1', '1000', '50000', 5000, 54000);
INSERT INTO `order_header` VALUES ('INV/07/2020/756', '2023-02-06 01:05:28', '202302-1147', '1', '1000', '50000', 5000, 54000);
INSERT INTO `order_header` VALUES ('INV/07/2020/756', '2023-02-06 01:05:45', '202302-1003', '1', '1000', '50000', 5000, 54000);
INSERT INTO `order_header` VALUES ('INV/07/2020/11475', '2023-02-06 01:08:40', '202302-1260', '1', '1000', '90000', 9000, 98000);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `pcode` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `price` int NULL DEFAULT NULL,
  PRIMARY KEY (`pcode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('010001', 'MIRANDA H.C N.BLACK 30 MC1', 10000);
INSERT INTO `product` VALUES ('010002', 'MIRANDA H.C N.BLACK 30 MC1 - B', 20000);
INSERT INTO `product` VALUES ('010003', 'MIRANDA H.C N.BLACK 30 MC1 -C', 50000);

-- ----------------------------
-- Table structure for promo
-- ----------------------------
DROP TABLE IF EXISTS `promo`;
CREATE TABLE `promo`  (
  `promo_code` int NOT NULL AUTO_INCREMENT,
  `promo_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`promo_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of promo
-- ----------------------------
INSERT INTO `promo` VALUES (1, 'Setiap pembelian MIRANDA H.C N.BLACK 30.MC1, mendapat porongan 1000');

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock`  (
  `pcode` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `jumlah` int NULL DEFAULT 0,
  PRIMARY KEY (`pcode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES ('01000', 200);
INSERT INTO `stock` VALUES ('010002', 98);
INSERT INTO `stock` VALUES ('010003', 298);

SET FOREIGN_KEY_CHECKS = 1;
