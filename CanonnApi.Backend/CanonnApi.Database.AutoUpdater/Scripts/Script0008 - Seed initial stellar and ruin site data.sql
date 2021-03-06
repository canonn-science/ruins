-- due to a bug in DbUp, 'delimiter' may not start at the very first character in a line...
 delimiter $$

DROP PROCEDURE IF EXISTS `up`$$

CREATE PROCEDURE up()
BEGIN

SET @version := (
	SELECT `value`
	FROM `canonndb_metadata`
	WHERE `name` = 'version'
);

SET @newVersion = 8;

IF @version < @newVersion THEN
	-- START MIGRATION SCRIPT

INSERT INTO `system` (`id`, `name`, `edsm_ext_id`, `eddb_ext_id`) VALUES
	(1, 'SYNUEFE XR-H D11-102', 6379187, 3524806),
	(2, 'IC 2391 SECTOR GW-V B2-4', 6785168, 3954820),
	(3, 'IC 2391 SECTOR ZE-A D101', 9084820, 6259569),
	(4, 'SYNUEFE XO-P C22-17', 9084912, 6259676),
	(5, 'SYNUEFE ZL-J D10-119', 8850999, 6024386),
	(6, 'COL 173 SECTOR KY-Q D5-47', 6400807, null),
	(7, 'HIP 39768', 5681536, null),
	(8, 'SYNUEFE TP-F B44-0', 9629387, null),
	(9, 'SYNUEFE NL-N C23-4', null, null),
	(10, 'SYNUEFE LY-I B42-2', null, null),
	(11, 'COL 173 SECTOR AV-N B23-5', null, null),
	(12, 'COL 173 SECTOR LY-Q D5-13', null, null),
	(13, 'COL 173 SECTOR XG-J C10-17', null, null),
	(14, 'COL 173 SECTOR LY-Q D5-59', null, null),
	(15, 'COL 173 SECTOR CG-M B24-8', null, null),
	(16, 'COL 173 SECTOR OT-Q D5-18', null, null),
	(17, 'SYNUEFE CE-R C21-6', null, null),
	(18, 'SYNUEFE ZR-I B43-10', null, null),
	(19, 'IC 2391 SECTOR FL-X B1-7', null, null),
	(20, 'VELA DARK REGION RC-V B2-5', null, null),
	(21, 'VELA DARK REGION KR-W C1-24', null, null),
	(22, 'VELA DARK REGION EL-Y D32', null, null),
	(23, 'COL 173 SECTOR AP-Q B21-2', null, null),
	(24, 'COL 173 SECTOR OE-P D6-11', null, null),
	(25, 'SKAUDAI AM-B D14-138', null, null),
	(26, 'COL 173 SECTOR WF-N D7-52', null, null),
	(27, 'COL 173 SECTOR DH-K B25-2', null, null),
	(28, 'COL 173 SECTOR WN-B B29-1', null, null),
	(29, 'COL 173 SECTOR UU-O D6-42', null, null),
	(30, 'COL 173 SECTOR PV-B C14-1', null, null),
	(31, 'VELA DARK REGION HB-X C1-28', null, null),
	(32, 'SYNUEFE ZL-J D10-109', null, null),
	(33, 'COL 173 SECTOR KN-J B25-5', null, null),
	(34, 'COL 173 SECTOR EC-L D8-54', null, null),
	(35, 'COL 173 SECTOR FC-L D8-28', null, null),
	(36, 'COL 173 SECTOR YV-M D7-23', null, null),
	(37, 'COL 173 SECTOR OG-Z C15-35', null, null);

INSERT INTO `body` (`id`, `system_id`, `name`, `edsm_ext_id`, `eddb_ext_id`) VALUES
	(1, 1, '1 B', 34490, 27389),
	(2, 2, 'B 1', 1710216, 2157572),
	(3, 3, 'C 3', 1709320, 2156001),
	(4, 4, 'C 1', 1710043, 2157363),
	(5, 5, '9 B', 1709644, 2156383),
	(6, 6, '8 C', null, null),
	(7, 7, 'A 14 F', null, null),
	(8, 8, 'C D 1', null, null),
	(9, 6, '9 A', null, null),
	(10, 9, 'B 3', null, null),
	(11, 10, 'C 2', null, null),
	(12, 11, 'A 2', null, null),
	(13, 6, '9 D', null, null),
	(14, 12, 'AB 9 A', null, null),
	(15, 12, 'AB 9 B', null, null),
	(16, 13, 'A 2', null, null),
	(17, 14, '8 A', null, null),
	(18, 15, 'A 4', null, null),
	(19, 15, 'A 5', null, null),
	(20, 14, '8 B', null, null),
	(21, 16, 'D 2', null, null),
	(22, 13, 'B 4', null, null),
	(23, 17, 'C 1', null, null),
	(24, 18, 'D 2', null, null),
	(25, 19, 'A 2', null, null),
	(26, 20, 'C 3', null, null),
	(27, 21, '7 C', null, null),
	(28, 21, '7 A', null, null),
	(29, 20, 'C 4', null, null),
	(30, 22, 'B 1', null, null),
	(31, 23, 'A 8', null, null),
	(32, 23, 'B 4', null, null),
	(33, 24, 'C 2', null, null),
	(34, 24, 'B 3', null, null),	
	(35, 25, 'AB 7 A', null, null),	
	(36, 26, 'B 2', null, null),
	(37, 27, 'A 5', null, null),
	(38, 27, 'A 7', null, null),
	(39, 28, 'D 1', null, null),
	(40, 29, 'A 1 C', null, null),
	(41, 30, 'D 2', null, null),
	(42, 31, 'E 2', null, null),
	(43, 31, 'E 3', null, null),
	(44, 32, 'E 3', null, null),
	(45, 33, 'C 3', null, null),
	(46, 34, '1 C', null, null),
	(47, 35, '14 C', null, null),
	(48, 36, 'A 7 A', null, null),
	(49, 37, 'B 1', null, null);

INSERT INTO `ruin_site` (`id`, `body_id`, `latitude`, `longitude`, `ruintype_id`) VALUES
	(1, 1, -31.7347, -128.9212, 2),
	(2, 2, -29.1664, -30.5041, 2),
	(3, 3, 29.4200, -59.5400, 1),
	(4, 4, 19.5300, -141.7600, 2),
	(5, 5, -23.3821, 178.9094, 1),
	(6, 6, 16.2701, 18.1282, 2),
	(7, 6, 46.0700, -171.3300, 1),
	(8, 7, 7.0924, 170.2272, 2),
	(9, 8, 59.3300, 15.1000, 3),
	(10, 8, 31.9600, -99.9700, 2),
	(11, 8, 31.8800, -100.0500, 1),
	(12, 9, -15.0842, -102.9397, 1),
	(13, 10, -30.5400, -24.2000, 1),
	(14, 9, -37.5256, 84.2501, 3),
	(15, 11, -10.0700, 114.5000, 3),
	(16, 11, -37.3100, 106.4200, 3),
	(17, 11, 9.0200, 48.7700, 2),
	(18, 12, 42.8343, -175.6545, 2),
	(19, 12, 33.2757, -175.5038, 2),
	(20, 12, -18.7380, -135.5687, 3),
	(21, 13, -10.8195, -89.8905, 2),
	(22, 10, 0.6600, -36.9200, 1),
	(23, 14, 65.9181, -128.5455, 1),
	(24, 14, 71.3187, -112.4353, 2),
	(25, 7, -0.0129, -149.4705, 2),
	(26, 14, 39.7396, 48.2240, 2),
	(27, 15, 21.9117, 154.1760, 3),
	(28, 16, -17.0000, 44.2400, 2),
	(29, 17, -20.3200, -133.6400, 1),
	(30, 18, -42.7780, 130.3500, 3),
	(31, 18, -15.8330, -172.5550, 3),
	(32, 19, 19.0369, 155.2710, 3),
	(33, 17, 1.5200, -116.6500, 2),
	(34, 17, -5.0000, -175.2100, 3),
	(35, 20, -6.3400, 130.6700, 1),
	(36, 21, -20.9600, 82.6100, 3),
	(37, 21, -3.8000, 84.5200, 1),
	(38, 21, -31.6400, 150.7600, 1),
	(39, 22, 15.9200, 23.8100, 2),
	(40, 22, -77.1000, 127.4500, 2),
	(41, 23, -27.2200, -7.3600, 2),
	(42, 23, -27.1500, -7.2900, 1),
	(43, 23, -18.2300, 0.2700, 1),
	(44, 24, 28.8065, -51.8289, 1),
	(45, 24, 13.8800, -0.5478, 2),
	(46, 24, -32.7100, -34.0391, 1),
	(47, 25, 9.2000, -130.0600, 1),
	(48, 26,	-31.4700, -44.5200, 1),
	(49, 27,	-22.4296, 126.94660, 2),
	(50, 26,	-19.5500, -1.9400, 1),
	(51, 26,	-36.7800, 20.0200, 1),
	(52, 28,	-18.4224, 65.5005, 1),
	(53, 29,	36.8100, 132.8800, 2),
	(54, 28,	-17.0825, -54.7755, 1),
	(55, 30,	41.1500, 129.2600, 1),
	(56, 30,	10.4600, 130.2400, 2),
	(57, 30,	7.9000, -86.4600, 3),
	(58, 31,	-33.1039, -32.2718, 2),
	(59, 32,	13.3300, -61.5500, 3),
	(60, 32,	19.0100, -100.9600, 1),
	(61, 32,	-35.3193, -73.9108, 2),
	(62, 33,	2.4000, 132.0500, 3),
	(63, 33,	-18.9000, 105.0700, 1),
	(64, 10, 48.1800, -48.3600, 3),
	(65, 34, 44.5700, -20.0600, 1),
	(66, 34, -30.5000, -13.6000, 1),
	(67, 34, 2.0000, -10.6700, 2),
	(68, 34, 2-37.8122, 10.4804, 2),
	(69, 34, -49.6706, -69.6161, 3),
	(70, 36, 21.3466, 68.6129, 2),
	(71, 36, 21.3906, 68.6436, 3),
	(72, 36, 21.1877, 70.8749, 3),
	(73, 37, 10.1834, 69.4547, 1),
	(74, 37, 25.5372, 115.6490, 2),
	(75, 38, 48.7466, 179.7078, 2),
	(76, 39, -21.2500, -24.9300, 3),
	(77, 39, -17.5000, 43.1700, 2),
	(78, 39, 31.8000, 65.4400, 2),
	(79, 40, -12.0051, -99.3617, 2),
	(80, 40, 19.2700, -96.1461, 3),
	(81, 40, 10.1154, -21.0965, 3),
	(82, 41, -46.2479, -114.4967, 3),
	(83, 41, -15.0791, -130.6873, 3),
	(84, 41, 29.1155, -91.8998, 3),
	(85, 42, -4.5000, -176.3000, 3),
	(86, 42, 11.3000, -154.2000, 1),
	(87, 43, 16.0000, -176.1000, 3),
	(88, 43, -28.9000, 163.1600, 1),
	(89, 44, -26.6530, -148.4250, 2),
	(90, 44, -26.7190, -148.3720, 1),
	(91, 44, 39.9240, -109.1930, 2),
	(92, 35, -37.8226, 10.4979, 3),
	(93, 45, 47.4754, 32.6829, 3),
	(94, 45, 8.5207, 72.4930, 2),
	(95, 45, -18.6814, 61.8930, 2),
	(96, 46, 52.4700, 39.8400, 2),
	(97, 46, -14.1000, 42.5400, 1),
	(98, 46, -2.7700, -39.3600, 1),
	(99, 47, -54.5807, 17.0799, 2),
	(100, 47, -21.6772, 4.0535, 2),
	(101, 47, -41.8041, -43.9197, 1),
	(102, 48, -49.0267, 5.4129, 2),
	(103, 48, -28.4965, -72.4370, 1),
	(104, 49, -49.9900, -129.9900, 1),
	(105, 49, -5.8800, -119.6600, 3),
	(106, 49, -15.4300, -175.0800, 1);

	-- END MIGRATION SCRIPT

	-- update version and add metadata	
	INSERT INTO `canonndb_metadata` (`name`, `value`) VALUES
		(CONCAT('update_v', @newVersion), DATE_FORMAT(UTC_TIMESTAMP(), '%Y-%m-%dT%TZ'));
	UPDATE `canonndb_metadata` SET `value` = @newVersion WHERE `name` = 'version';

END IF;

END$$ -- PROCUDURE up()

 delimiter ;

CALL up();

DROP PROCEDURE `up`;
