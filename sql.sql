-- phpMyAdmin SQL Dump
-- version 4.4.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 28, 2015 at 09:11 PM
-- Server version: 5.5.44-MariaDB
-- PHP Version: 5.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";



--
-- Database: `transport`
--

-- --------------------------------------------------------

--
-- Table structure for table `additionalcost`
--

CREATE TABLE IF NOT EXISTS `additionalcost` (
  `Id` serial primary key,
  `PackageNumber` varchar(20) DEFAULT NULL,
  `Payer` varchar(100) DEFAULT NULL,
  `Price` decimal(15,2) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `TransportId` BIGINT UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attachment`
--

CREATE TABLE IF NOT EXISTS `attachment` (
  `Id` int(11) NOT NULL,
  `FilePath` varchar(1000) DEFAULT NULL,
  `ContentType` varchar(100) DEFAULT NULL,
  `DeliveryId` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attachment`
--

INSERT INTO `attachment` (`Id`, `FilePath`, `ContentType`, `DeliveryId`) VALUES
(15, '/TransportApp/Deliveries/7482884098915123952/tmp_Transportauftrag_BG 50 dni_15025919 (1).pdf', 'application/pdf', 19),
(16, '/TransportApp/Deliveries/-5624887873615867982/30123 OT 46.jpg', 'image/jpeg', 22),
(17, '/TransportApp/Deliveries/-8688634027273599531/19270 OT 46.doc', 'application/msword', 23),
(18, '/TransportApp/Deliveries/7640885859727197570/19270 OT 46.doc', 'application/msword', 24),
(19, '/TransportApp/Deliveries/-564852852857549990/14803.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 25),
(20, '/TransportApp/Deliveries/8782554657442712832/SOGETRA ROISSY T 47.pdf', 'application/pdf', 34),
(21, '/TransportApp/Deliveries/3085416700872312161/SOGETRA 77330 -77500.pdf', 'application/pdf', 35),
(22, '/TransportApp/Deliveries/-7817289145537444742/ACT LOGISTIC 95470  T 47.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 36),
(23, '/TransportApp/Deliveries/-1122998940792569128/PARIJ MUZIKALNI INSTRUMENTI T47.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 37),
(24, '/TransportApp/Deliveries/6975702306389968297/SOGETRA ENL 93399 T 47.pdf', 'application/pdf', 38),
(25, '/TransportApp/Deliveries/-7661127938021504402/SOGETRA 75011 T 47.pdf', 'application/pdf', 39),
(26, '/TransportApp/Deliveries/-2231807132649962061/SOGETRA 75011 T 47.pdf', 'application/pdf', 40),
(27, '/TransportApp/Deliveries/9222514328198334698/SOGETRA ENL 93300 T 47 JUST LULU.pdf', 'application/pdf', 41),
(28, '/TransportApp/Deliveries/7602624324040015961/DONAU TRANZIT T47 93600.pdf', 'application/pdf', 43),
(29, '/TransportApp/Deliveries/-4498950448400872628/DONAU TRANZIT T47 02400.pdf', 'application/pdf', 44),
(30, '/TransportApp/Deliveries/-2322342645457402550/SOGETRA T47 PARIS.pdf', 'application/pdf', 45),
(31, '/TransportApp/Deliveries/-6944904042945099282/SOGETRA  93300 T47.pdf', 'application/pdf', 46),
(34, '/TransportApp/Deliveries/7879013519664629312/DONAU TRANZIT T47 18700.pdf', 'application/pdf', 49),
(35, '/TransportApp/Deliveries/-5092512404263254531/BONBONEC 34260 T47.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 50),
(36, '/TransportApp/Deliveries/6105900983743434196/FUEGO LOGISTIQUE T47 33750.doc', 'application/msword', 51),
(37, '/TransportApp/Deliveries/4893054686408952865/RAFA BG t47 80470.pdf', 'application/pdf', 52),
(38, '/TransportApp/Deliveries/-1049150898046745540/01000 t47.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 53),
(39, '/TransportApp/Deliveries/5852389456226369997/BONBONI T 47 OT BG ZA FR 6 PAL.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 54),
(40, '/TransportApp/Deliveries/6100573353097187314/FUEGO LOGISTIC 76890 T47.doc', 'application/msword', 57),
(41, '/TransportApp/Deliveries/7702470119648284595/TRAKTREID 51530 T47.doc', 'application/msword', 58),
(42, '/TransportApp/Deliveries/3980933397965586544/ALEXANDER LOGISTIC 94564 T47.pdf', 'application/pdf', 60),
(43, '/TransportApp/Deliveries/3955823501433520615/DONAU TRANZIT 95330 93000 T47.pdf', 'application/pdf', 61),
(44, '/TransportApp/Deliveries/7590419279560919467/DONAU TRANZIT 95330 93000 T47.pdf', 'application/pdf', 62),
(45, '/TransportApp/Deliveries/9010898908228636273/DONAU TRANZIT T47 93600.pdf', 'application/pdf', 63),
(46, '/TransportApp/Deliveries/-8162039137454699593/BL 402325 KITAICI T48.pdf', 'application/pdf', 64),
(47, '/TransportApp/Deliveries/-4678116790088802/BL 402320 KITAICI T48.pdf', 'application/pdf', 65),
(48, '/TransportApp/Deliveries/-546421070309995355/BL 402320 KITAICI T48.pdf', 'application/pdf', 66),
(49, '/TransportApp/Deliveries/-546421070309995355/BL 402326 KITAICI T48.pdf', 'application/pdf', 66),
(50, '/TransportApp/Deliveries/-7479582196298661463/BL 402321 KITAICI T48.pdf', 'application/pdf', 67),
(51, '/TransportApp/Deliveries/-2242169850724069823/BL 402327 KITAICI T48.pdf', 'application/pdf', 68),
(52, '/TransportApp/Deliveries/6213320001911212450/BL 402322 KITAICI T48.pdf', 'application/pdf', 69),
(53, '/TransportApp/Deliveries/7089202773835730429/BL 402328 KITAICI T48.pdf', 'application/pdf', 70),
(54, '/TransportApp/Deliveries/-831775041725314774/BL 402323 KITAICI T48.pdf', 'application/pdf', 71),
(55, '/TransportApp/Deliveries/-831775041725314774/BL 402323 KITAICI T48.pdf', 'application/pdf', 71),
(56, '/TransportApp/Deliveries/-4348129501616976431/BL 402324 KITAICI T48.pdf', 'application/pdf', 72),
(57, '/TransportApp/Deliveries/6660074169055660891/BL 402319 KITAICI T48.pdf', 'application/pdf', 73),
(58, '/TransportApp/Deliveries/-4004365104845537228/LMAC 77330 T48.pdf', 'application/pdf', 74),
(59, '/TransportApp/Deliveries/8489223489511638441/OTHUA 78570 T48.pdf', 'application/pdf', 75),
(60, '/TransportApp/Deliveries/4067407343469412527/DELAMOD 92600.pdf', 'application/pdf', 76),
(62, '/TransportApp/Deliveries/74102736167126658/SCI SOFFIA 75013 T48.pdf', 'application/pdf', 77),
(63, '/TransportApp/Deliveries/-5942546129398316497/27100 T48.doc', 'application/msword', 80),
(64, '/TransportApp/Deliveries/5113743712418417134/RAFA 74970 t48.pdf', 'application/pdf', 81),
(65, '/TransportApp/Deliveries/-6814223311343104229/77760 T48.doc', 'application/msword', 82),
(66, '/TransportApp/Deliveries/-8259495774132678910/ARMAND 77183 T48.pdf', 'application/pdf', 83),
(67, '/TransportApp/Deliveries/-7793004987683749844/ARMAND 5.12 T48.pdf', 'application/pdf', 84),
(68, '/TransportApp/Deliveries/-6695629788709567813/95701 T48.pdf', 'application/pdf', 85),
(69, '/TransportApp/Deliveries/-8361552608521598623/DECOSEV 78750 T48.pdf', 'application/pdf', 86),
(70, '/TransportApp/Deliveries/-7893107382921639151/EXAPAQ 92230 T48.pdf', 'application/pdf', 87),
(71, '/TransportApp/Deliveries/873916667163592647/78317 T48.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 88),
(72, '/TransportApp/Deliveries/5089976076007983093/BL VERA LUCY 93300 T48.pdf', 'application/pdf', 89),
(73, '/TransportApp/Deliveries/-7447124439531566538/33450 T48.doc', 'application/msword', 91),
(74, '/TransportApp/Deliveries/-4306961075021593927/60126 T48.jpg', 'image/jpeg', 92),
(75, '/TransportApp/Deliveries/6427540619133143511/93300 T49.pdf', 'application/pdf', 93),
(76, '/TransportApp/Deliveries/-274921450098833210/95701 T49.pdf', 'application/pdf', 94),
(77, '/TransportApp/Deliveries/5297731418804997927/ELIOT JAMES T49.pdf', 'application/pdf', 95),
(78, '/TransportApp/Deliveries/-9061961501239588609/75116 T49.pdf', 'application/pdf', 96),
(79, '/TransportApp/Deliveries/7382401083564508748/93300 T49..pdf', 'application/pdf', 97),
(80, '/TransportApp/Deliveries/8698680632594285824/21200 T49.doc', 'application/msword', 98),
(81, '/TransportApp/Deliveries/-6806868699517464676/75001 T49.pdf', 'application/pdf', 99),
(82, '/TransportApp/Deliveries/8652970074106840142/13591 T49.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 100),
(83, '/TransportApp/Deliveries/6694740218554958385/32100 Т49.doc', 'application/msword', 101),
(85, '/TransportApp/Deliveries/5136102483898419599/ALOG 02100 T49.pdf', 'application/pdf', 103),
(86, '/TransportApp/Deliveries/4255856060885385728/27120 Т49.PDF', 'application/pdf', 104),
(87, '/TransportApp/Deliveries/-1313888903716388044/BONBONI RUMNIAT  49.pdf', 'application/pdf', 105),
(88, '/TransportApp/Deliveries/468542269475736852/ELI PALE OT 60126 T48.jpg', 'image/jpeg', 106),
(89, '/TransportApp/Deliveries/4255856060885385728/27120 T49.PDF', 'application/pdf', 104),
(90, '/TransportApp/Deliveries/4302791213926269897/60330 T49.pdf', 'application/pdf', 107),
(91, '/TransportApp/Deliveries/1705378443872847108/77330 T49.pdf', 'application/pdf', 108),
(92, '/TransportApp/Deliveries/-5827178357608329339/53230 T49.pdf', 'application/pdf', 109),
(93, '/TransportApp/Deliveries/3297057742201177800/33750 T49.doc', 'application/msword', 110),
(94, '/TransportApp/Deliveries/-2644263052043402675/BL ELLIOT 93320 T50.pdf', 'application/pdf', 111),
(95, '/TransportApp/Deliveries/-45368045941077322/95701 T50.pdf', 'application/pdf', 112),
(96, '/TransportApp/Deliveries/782086727922500013/ROISSY T50.pdf', 'application/pdf', 113),
(97, '/TransportApp/Deliveries/-7486395351413404626/77330 T50.pdf', 'application/pdf', 114),
(98, '/TransportApp/Deliveries/4807595924561937523/77183 T50.pdf', 'application/pdf', 115),
(99, '/TransportApp/Deliveries/-4976887837881188240/60110 T50.pdf', 'application/pdf', 116),
(100, '/TransportApp/Deliveries/2082773202103387093/93300 T50.pdf', 'application/pdf', 117),
(101, '/TransportApp/Deliveries/4121690358025242421/93500 T50.PDF', 'application/pdf', 118),
(102, '/TransportApp/Deliveries/-5548025853839064496/grifins.pdf', 'application/pdf', 119),
(103, '/TransportApp/Deliveries/-5264209750969463397/bfi61400-1 lm+27.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 120),
(104, '/TransportApp/Deliveries/-8416320929157525724/14200.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 121),
(105, '/TransportApp/Deliveries/-673730977918332970/z-ka_10_12_8067.pdf', 'application/pdf', 123),
(106, '/TransportApp/Deliveries/-686774175063719768/z-ka_10_12_8066.pdf', 'application/pdf', 124),
(107, '/TransportApp/Deliveries/4829417732254353583/z-ka_10_12_8066.pdf', 'application/pdf', 125),
(108, '/TransportApp/Deliveries/4532016625518136184/z-ka_10_12_8066.pdf', 'application/pdf', 126),
(109, '/TransportApp/Deliveries/4912541334811266707/z-ka_10_12_8066.pdf', 'application/pdf', 127),
(110, '/TransportApp/Deliveries/-6218681450882053887/z-ka_10_12_8066.pdf', 'application/pdf', 128),
(111, '/TransportApp/Deliveries/418436015813446251/77500 T50.pdf', 'application/pdf', 122),
(112, '/TransportApp/Deliveries/6384904717155779934/zaivka iznos тИФЛЕКС.doc', 'application/msword', 129),
(113, '/TransportApp/Deliveries/-6979974040587710794/78310 T50.pdf', 'application/pdf', 131),
(114, '/TransportApp/Deliveries/3496064078757381879/EXP-BG-FR-192-11.12.2014.doc', 'application/msword', 134),
(115, '/TransportApp/Deliveries/-1447624350104139396/grifins.jpg', 'image/jpeg', 135),
(116, '/TransportApp/Deliveries/2195624433405479775/95470 T50.pdf', 'application/pdf', 136),
(117, '/TransportApp/Deliveries/2039344173450872683/93600 t50.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 137),
(118, '/TransportApp/Deliveries/4109714976578818018/33750 T50.doc', 'application/msword', 138),
(119, '/TransportApp/Deliveries/290711698542904609/02400 Т50.doc', 'application/msword', 140),
(120, '/TransportApp/Deliveries/2543179811436318178/53940 T50.pdf', 'application/pdf', 141),
(121, '/TransportApp/Deliveries/8141083179763975328/650 Griffins.pdf', 'application/pdf', 142),
(122, '/TransportApp/Deliveries/-6389446218026235454/94398.pdf', 'application/pdf', 143),
(123, '/TransportApp/Deliveries/-8531744915819247948/91250 T50.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 144),
(124, '/TransportApp/Deliveries/-8411941027067248070/93120 T50.pdf', 'application/pdf', 145),
(125, '/TransportApp/Deliveries/-3527057600997799395/75008 T51.pdf', 'application/pdf', 146),
(126, '/TransportApp/Deliveries/8018108328056079040/77183 T51.pdf', 'application/pdf', 147),
(127, '/TransportApp/Deliveries/-6906819351329290896/60000 T51.pdf', 'application/pdf', 148),
(128, '/TransportApp/Deliveries/7241212164727328072/75018 T51.pdf', 'application/pdf', 149),
(129, '/TransportApp/Deliveries/-6768925606358399509/95100 T51.pdf', 'application/pdf', 150),
(130, '/TransportApp/Deliveries/-6483281767197555248/ГРИФИНС  Франция 23.12 Варна.doc', 'application/msword', 152),
(131, '/TransportApp/Deliveries/8497909547060773381/95670 Т51.pdf', 'application/pdf', 153),
(132, '/TransportApp/Deliveries/-855010592781677323/75014 T51.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 154),
(133, '/TransportApp/Deliveries/6701162704963587290/75006 T51.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 155),
(134, '/TransportApp/Deliveries/-15722226429574528/I5817629.pdf', 'application/pdf', 156),
(135, '/TransportApp/Deliveries/-1671631537504107174/77990 T1.pdf', 'application/pdf', 157),
(136, '/TransportApp/Deliveries/6981450937478106535/BL DARTY.pdf', 'application/pdf', 158),
(137, '/TransportApp/Deliveries/-4903955200852473183/95870 T1.pdf', 'application/pdf', 159),
(138, '/TransportApp/Deliveries/-5177811661174387311/77330-77500 T1.pdf', 'application/pdf', 160),
(139, '/TransportApp/Deliveries/-8188110009910476697/BL SED.pdf', 'application/pdf', 161),
(140, '/TransportApp/Deliveries/2422073894524242294/BL DAFASHION.pdf', 'application/pdf', 172),
(141, '/TransportApp/Deliveries/3058703254349564441/BL FASHION 93300 T2.pdf', 'application/pdf', 173),
(142, '/TransportApp/Deliveries/-1365821914570142762/BL JUST LULU 93300 T2.pdf', 'application/pdf', 174),
(143, '/TransportApp/Deliveries/-8814540026236220620/BL VICTORIA 93300 T2.pdf', 'application/pdf', 175),
(144, '/TransportApp/Deliveries/-6622106897883313492/77330-60330 T1.pdf', 'application/pdf', 162),
(145, '/TransportApp/Deliveries/-6622106897883313492/77330-60330 T1..pdf', 'application/pdf', 162),
(146, '/TransportApp/Deliveries/797873418674457811/75002 T1.pdf', 'application/pdf', 163),
(147, '/TransportApp/Deliveries/-2243614411747475258/93290 T1.pdf', 'application/pdf', 165),
(148, '/TransportApp/Deliveries/6635767371332272791/91250 T2.pdf', 'application/pdf', 166),
(149, '/TransportApp/Deliveries/3252807260382774054/77183 T2.pdf', 'application/pdf', 167),
(150, '/TransportApp/Deliveries/-7693955781516705630/77183 T2..pdf', 'application/pdf', 171),
(151, '/TransportApp/Deliveries/-5017438062553510862/75008 T1.pdf', 'application/pdf', 168),
(152, '/TransportApp/Deliveries/-168062002822690537/93300 T2..pdf', 'application/pdf', 169),
(153, '/TransportApp/Deliveries/-168062002822690537/93300 T2.pdf', 'application/pdf', 169),
(154, '/TransportApp/Deliveries/5726765875818873569/I5868947 93300 T2.pdf', 'application/pdf', 176),
(155, '/TransportApp/Deliveries/-6284082866749881582/I5869008 93300 T2.pdf', 'application/pdf', 177),
(156, '/TransportApp/Deliveries/-206158366850399715/I5869060 93300 T2.pdf', 'application/pdf', 178),
(157, '/TransportApp/Deliveries/-4879600748666009392/I5868757 93300 T2.pdf', 'application/pdf', 179),
(158, '/TransportApp/Deliveries/1642873626436520467/I5868821 93300 T2.pdf', 'application/pdf', 180),
(159, '/TransportApp/Deliveries/1292401890799275604/I5869911 93300 T2.pdf', 'application/pdf', 181),
(160, '/TransportApp/Deliveries/-8252896089502626891/I5870274 93300 T2.pdf', 'application/pdf', 182),
(161, '/TransportApp/Deliveries/6144653268144113192/I5870148 75002 T2.pdf', 'application/pdf', 183),
(162, '/TransportApp/Deliveries/675625198367229029/I5870835 93300 T2.pdf', 'application/pdf', 184),
(163, '/TransportApp/Deliveries/-5878940015582426530/I5869008 9330 T2.pdf', 'application/pdf', 185),
(164, '/TransportApp/Deliveries/-1881956164690229565/I5870817 93300 T2.pdf', 'application/pdf', 186),
(165, '/TransportApp/Deliveries/-8536765266892666513/I5870826 93300 T2.pdf', 'application/pdf', 187),
(166, '/TransportApp/Deliveries/1423855798695445256/I5870830 9330 T2.pdf', 'application/pdf', 188),
(167, '/TransportApp/Deliveries/-7766330300656103934/АЛОГ 34570 Т2.pdf', 'application/pdf', 189),
(168, '/TransportApp/Deliveries/-5190337734555578605/42601 Т2.pdf', 'application/pdf', 190),
(171, '/TransportApp/Deliveries/-3904670463960136432/53940 t2.pdf', 'application/pdf', 192),
(172, '/TransportApp/Deliveries/-1167076406195436669/17100 T2.jpg', 'image/jpeg', 193),
(173, '/TransportApp/Deliveries/-3898209526779917912/95500 t2.pdf', 'application/pdf', 194),
(174, '/TransportApp/Deliveries/7008425067601676604/95190-77600 t2.pdf', 'application/pdf', 195),
(175, '/TransportApp/Deliveries/4734462979387376064/95706 za BG t2.pdf', 'application/pdf', 197),
(176, '/TransportApp/Deliveries/3131579836622128456/BL MARCOL 93300 T2.pdf', 'application/pdf', 198),
(177, '/TransportApp/Deliveries/-2458577492388067551/77390 Т2.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 200),
(178, '/TransportApp/Deliveries/-5911299635219513067/93600 T2.pdf', 'application/pdf', 201),
(179, '/TransportApp/Deliveries/-4969728908386283897/93500 T2.PDF', 'application/pdf', 202),
(180, '/TransportApp/Deliveries/-2019330948185832997/93300 T3.pdf', 'application/pdf', 203),
(181, '/TransportApp/Deliveries/-3249128365894909831/92230 T3.pdf', 'application/pdf', 204),
(182, '/TransportApp/Deliveries/4505059691424075389/BL ELM 93300 T3.pdf', 'application/pdf', 205),
(183, '/TransportApp/Deliveries/-526748031888243643/94398 ORLY T3.pdf', 'application/pdf', 206),
(184, '/TransportApp/Deliveries/7240926193748296586/BL MODE EDITION.pdf', 'application/pdf', 207),
(185, '/TransportApp/Deliveries/-7500419887909418943/BL JS MILLENIUM.pdf', 'application/pdf', 208),
(186, '/TransportApp/Deliveries/3815232716303123749/ГРИФИНС ФРАНЦИЯ 17.doc', 'application/msword', 209),
(187, '/TransportApp/Deliveries/5196291515364822903/BL FINERY.pdf', 'application/pdf', 210),
(188, '/TransportApp/Deliveries/6600016338440635156/BL LANDIN.pdf', 'application/pdf', 211),
(189, '/TransportApp/Deliveries/-2112604622052438875/BL LUNBO MODE.pdf', 'application/pdf', 212),
(190, '/TransportApp/Deliveries/3231553038605634382/griffins.jpg', 'image/jpeg', 214),
(191, '/TransportApp/Deliveries/-5943571262640601419/92380 T3.pdf', 'application/pdf', 215),
(192, '/TransportApp/Deliveries/-4482316319226967365/BL SIXTH 93300 T3.pdf', 'application/pdf', 216),
(193, '/TransportApp/Deliveries/-8434650584302532005/BL GRK GALLERY 75002 T3.pdf', 'application/pdf', 217),
(194, '/TransportApp/Deliveries/-4788652103059750401/BL G3 CONCEPT.pdf', 'application/pdf', 219),
(195, '/TransportApp/Deliveries/3761242497635340020/037 Griffins.pdf', 'application/pdf', 221),
(196, '/TransportApp/Deliveries/-2553927118679293202/Grifins 93300 Т3.pdf', 'application/pdf', 222),
(197, '/TransportApp/Deliveries/-4601427893811461115/ORDER 62128 Т3.pdf', 'application/pdf', 223),
(198, '/TransportApp/Deliveries/4400593502195042952/ORDER 80350 T3.pdf', 'application/pdf', 224),
(199, '/TransportApp/Deliveries/-682223229376902745/14600 T4.pdf', 'application/pdf', 225),
(200, '/TransportApp/Deliveries/5554469215997086859/94360 T4.pdf', 'application/pdf', 226),
(201, '/TransportApp/Deliveries/7636953307573603017/80370 T4.pdf', 'application/pdf', 227),
(202, '/TransportApp/Deliveries/-3848602825705568827/93600 T3.pdf', 'application/pdf', 228),
(203, '/TransportApp/Deliveries/-5093355845796280296/BL ELLIOT JAMES.pdf', 'application/pdf', 229),
(204, '/TransportApp/Deliveries/469379273896445254/BL ALLIANCE.pdf', 'application/pdf', 230),
(205, '/TransportApp/Deliveries/5490285226412427253/BL GAILLAN.pdf', 'application/pdf', 231),
(206, '/TransportApp/Deliveries/7630906792086818493/BL INTERMARCHE.pdf', 'application/pdf', 232),
(207, '/TransportApp/Deliveries/5322254970750193392/75008 T4.pdf', 'application/pdf', 233),
(208, '/TransportApp/Deliveries/-7703279407533963619/BL COCCO 93300 T4.pdf', 'application/pdf', 234),
(209, '/TransportApp/Deliveries/3548919145725249845/BL VERY 93300 T4.pdf', 'application/pdf', 235),
(210, '/TransportApp/Deliveries/5405700853915010451/BL GANERTRANS 93290 T4.pdf', 'application/pdf', 236),
(211, '/TransportApp/Deliveries/-6375369332662842608/75016 T4.pdf', 'application/pdf', 237),
(212, '/TransportApp/Deliveries/-4656458865688555951/Scan10004.PDF', 'application/pdf', 238),
(213, '/TransportApp/Deliveries/5773248109935020344/02400 T4.pdf', 'application/pdf', 239),
(214, '/TransportApp/Deliveries/-9217004997098190193/33270 T4.pdf', 'application/pdf', 241),
(215, '/TransportApp/Deliveries/2669533183745085423/14110 T4.PDF', 'application/pdf', 242),
(216, '/TransportApp/Deliveries/491415086397148567/91790 T4.pdf', 'application/pdf', 243),
(217, '/TransportApp/Deliveries/2877939621245894758/91300 T4.pdf', 'application/pdf', 244),
(218, '/TransportApp/Deliveries/-3715160920905399498/19270 T4.doc', 'application/msword', 245),
(221, '/TransportApp/Deliveries/5193615615681185785/ZAIAVKA vnos 2.doc', 'application/msword', 247),
(222, '/TransportApp/Deliveries/5505371718219353885/ZAIAVKA vnos 2.doc', 'application/msword', 248),
(223, '/TransportApp/Deliveries/8839847436552981578/91370 T4.pdf', 'application/pdf', 249),
(224, '/TransportApp/Deliveries/3435387665694539952/80370 Т4.pdf', 'application/pdf', 250),
(225, '/TransportApp/Deliveries/-5830933003209521265/34740 T4.pdf', 'application/pdf', 251),
(226, '/TransportApp/Deliveries/-7001924901710183795/98 Grifins.pdf', 'application/pdf', 253),
(227, '/TransportApp/Deliveries/4171587981819396245/93300 BL DAFASHION T5.pdf', 'application/pdf', 254),
(228, '/TransportApp/Deliveries/-3885403327825690133/92330 T5.pdf', 'application/pdf', 255),
(229, '/TransportApp/Deliveries/7857561441730577191/93300 BL MELYA T5.pdf', 'application/pdf', 256),
(230, '/TransportApp/Deliveries/-5007641535943063097/93300 T5 BL NEW 2000.pdf', 'application/pdf', 257),
(231, '/TransportApp/Deliveries/952494999359407865/93300 T5BL NT FASHION.pdf', 'application/pdf', 258),
(232, '/TransportApp/Deliveries/9069906825196947696/93300 T5 BL SELIRIS.pdf', 'application/pdf', 259),
(233, '/TransportApp/Deliveries/4061626866497572383/Бланка Заявка Нова11.doc', 'application/msword', 260),
(234, '/TransportApp/Deliveries/-1552550923826936376/NICE.jpg', 'image/jpeg', 261),
(235, '/TransportApp/Deliveries/-1552550923826936376/NICE 2.jpg', 'image/jpeg', 261),
(236, '/TransportApp/Deliveries/-1552550923826936376/NICE 3.jpg', 'image/jpeg', 261),
(237, '/TransportApp/Deliveries/7482884098915123952/test 123.txt', 'text/plain', 19);

-- --------------------------------------------------------

--
-- Table structure for table `book`
--


CREATE TABLE IF NOT EXISTS `book` (
   `Id` serial primary key,
  `BookNumber` int(11) NOT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `Count` int(11) NOT NULL,
  `Weight` double NOT NULL,
  `WeightPerBook` double NOT NULL,
  `Discarded` bit(1) NOT NULL DEFAULT b'0',
  `PackageId` BIGINT UNSIGNED NOT NULL,
  `TransportId` BIGINT UNSIGNED NOT NULL,
  `PrintingHouseId` BIGINT UNSIGNED DEFAULT NULL,
  `DeliveryAddress` varchar(500) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`Id`, `BookNumber`, `Title`, `Count`, `Weight`, `WeightPerBook`, `Discarded`, `PackageId`, `TransportId`, `PrintingHouseId`, `DeliveryAddress`) VALUES
(2, 1, 'Au service de l''espoir ', 300, 279, 0.93, b'0', 3, 2, 10, 'Prividef 13-15 Chemin de Chilly Bâtiment C 91160 CHAMPLAN'),
(3, 2, 'Meutre avec premedication  2014 ISBN: 9782352850083', 300, 75, 0.25, b'0', 4, 2, 15, 'Daudin distribution 628, av. Du Grain d''or 41350 Vineuil'),
(4, 2, 'Meutre avec premedication  2014 ISBN: 9782352850083', 100, 25, 0.25, b'0', 5, 2, 15, 'Editions Glyphe - 85 avenue Ledru-Rollin. 75012 Paris Tél. '),
(5, 3, 'Olin paper', 1, 0.5, 0.5, b'0', 5, 2, 17, 'Editions Glyphe - 85 avenue Ledru-Rollin. 75012 Paris Tél. '),
(6, 4, 'Catalogue Lucibel Modèle FR ', 2500, 1742, 0.6968, b'0', 6, 2, 3, 'MGF/Norbert dentressangle A l’attention de Lucibel 28 route du bassin N°6 CE367 92638 Gennevilliers '),
(7, 5, 'Catalogue Lucibel Modèle EN', 250, 175, 0.7, b'0', 6, 2, 3, 'MGF/Norbert dentressangle A l’attention de Lucibel 28 route du bassin N°6 CE367 92638 Gennevilliers '),
(8, 6, 'Catalogue Lucibel Modèle ES', 200, 140, 0.7, b'0', 6, 2, 3, 'MGF/Norbert dentressangle A l’attention de Lucibel 28 route du bassin N°6 CE367 92638 Gennevilliers '),
(9, 1, 'La petite fille sous le platane- 978-2-36795-085-3', 250, 83, 0.332, b'0', 7, 3, 5, 'Volumen SITE logistique LOGLIBRIS de BALLAINVILLIERS, Rue du Bel ébat, 91160 Ballainvilliers '),
(10, 2, 'Ce qu’elle veut dire-978-2-36795-087-7', 250, 51, 0.204, b'0', 7, 3, 5, 'Volumen SITE logistique LOGLIBRIS de BALLAINVILLIERS, Rue du Bel ébat, 91160 Ballainvilliers '),
(11, 3, 'La salle de bain d’Hortense poche-978-2-36795-088-4', 250, 33, 0.132, b'0', 7, 3, 15, 'Volumen SITE logistique LOGLIBRIS de BALLAINVILLIERS, Rue du Bel ébat, 91160 Ballainvilliers '),
(12, 4, 'La petite fille sous le platane- 978-2-36795-085-3', 100, 33, 0.33, b'0', 8, 3, 5, 'Le clos de la Fontaine Bat B 65, cour Libéral Bruant rue Jacques Lemercier , 34080 Montpellier'),
(13, 5, 'Ce qu’elle veut dire-978-2-36795-087-7', 100, 20, 0.2, b'0', 8, 3, 5, 'Le clos de la Fontaine Bat B 65, cour Libéral Bruant rue Jacques Lemercier , 34080 Montpellier'),
(14, 6, 'La salle de bain d’Hortense poche-978-2-36795-088-4', 100, 14, 0.14, b'0', 8, 3, 15, 'Le clos de la Fontaine Bat B 65, cour Libéral Bruant rue Jacques Lemercier , 34080 Montpellier'),
(15, 7, 'marques-pages Chevre feuille ', 0, 1, 0, b'0', 8, 3, 15, 'Le clos de la Fontaine Bat B 65, cour Libéral Bruant rue Jacques Lemercier , 34080 Montpellier'),
(16, 8, 'La petite fille sous le platane- 978-2-36795-085-3', 50, 17, 0.34, b'0', 9, 3, 5, '5 rue Ferou 75006 Paris'),
(17, 9, 'Ce qu’elle veut dire-978-2-36795-087-7', 50, 10, 0.2, b'0', 9, 3, 5, '5 rue Ferou 75006 Paris'),
(18, 10, 'La salle de bain d’Hortense poche-978-2-36795-088-4', 50, 7, 0.14, b'0', 9, 3, 15, '5 rue Ferou 75006 Paris'),
(19, 11, 'République-978-2-917689-71-4', 1500, 556, 0.37066666666666664, b'0', 10, 3, 3, 'Harmonia Mundi, quai n° 2,Le Mas De Vert, Petite Route de St-Gilles, 13200 Arles '),
(20, 12, 'Uchronie-978-2-917689-74-5', 1500, 264, 0.176, b'0', 10, 3, 11, 'Harmonia Mundi, quai n° 2,Le Mas De Vert, Petite Route de St-Gilles, 13200 Arles '),
(21, 13, 'C''est quoi être riche ?  - 978-2-8159-1131-3', 400, 40, 0.1, b'0', 11, 3, 3, 'TéATr''éPROUVèTe L''Abbaye du Jouïr 58800-CORBIGNY '),
(22, 13, 'C''est quoi être riche ?  - 978-2-8159-1131-3', 40, 4, 0.1, b'0', 12, 3, 3, 'Le Dissez 8 rue de Sévigné, 92120 Montrouge, '),
(23, 14, 'La mer d''innocence- 978-2-8159-1087-3', 40, 18, 0.45, b'0', 12, 3, 6, 'Le Dissez 8 rue de Sévigné, 92120 Montrouge, '),
(24, 13, 'C''est quoi être riche ?  - 978-2-8159-1131-3', 3100, 306, 0.09870967741935485, b'0', 13, 3, 3, 'Harmonia Mundi, quai n° 2, Le Mas De Vert, Petite Route de St-Gilles, 13200 Arles '),
(25, 14, 'La mer d''innocence- 978-2-8159-1087-3', 2000, 893, 0.4465, b'0', 13, 3, 6, 'Harmonia Mundi, quai n° 2, Le Mas De Vert, Petite Route de St-Gilles, 13200 Arles '),
(26, 15, 'Les origines de l''amour- 978-2-8159-1124-5', 2400, 702, 0.2925, b'0', 13, 3, 15, 'Harmonia Mundi, quai n° 2, Le Mas De Vert, Petite Route de St-Gilles, 13200 Arles '),
(27, 16, ' En finir avec les banlieues ?-978-2-8159-1001-9', 500, 172, 0.344, b'0', 13, 3, 15, 'Harmonia Mundi, quai n° 2, Le Mas De Vert, Petite Route de St-Gilles, 13200 Arles '),
(28, 13, 'C''est quoi être riche ?  - 978-2-8159-1131-3', 460, 45, 0.09782608695652174, b'0', 14, 3, 3, 'Aube - Rue Amédée Giniès 84240 La Tour d''Aigues'),
(29, 14, 'La mer d''innocence- 978-2-8159-1087-3', 360, 161, 0.4472222222222222, b'0', 14, 3, 6, 'Aube - Rue Amédée Giniès 84240 La Tour d''Aigues'),
(30, 15, 'Les origines de l''amour- 978-2-8159-1124-5', 400, 117, 0.2925, b'0', 14, 3, 15, 'Aube - Rue Amédée Giniès 84240 La Tour d''Aigues'),
(31, 16, ' En finir avec les banlieues ?-978-2-8159-1001-9', 300, 103, 0.3433333333333333, b'0', 14, 3, 15, 'Aube - Rue Amédée Giniès 84240 La Tour d''Aigues'),
(32, 17, 'Plaquette Rocha', 100, 2, 0.02, b'0', 14, 3, 13, 'Aube - Rue Amédée Giniès 84240 La Tour d''Aigues'),
(33, 18, 'Livret le dernier pape - 978-2-8159-1075-0', 100, 6, 0.06, b'0', 14, 3, 15, 'Aube - Rue Amédée Giniès 84240 La Tour d''Aigues'),
(34, 16, ' En finir avec les banlieues ?-978-2-8159-1001-9', 200, 69, 0.345, b'0', 15, 3, 15, 'IHEDATE Maison des Ponts 15, Rue de la Fontaine au Roi 75127 Paris cedex 11'),
(35, 17, 'Plaquette Rocha', 400, 7, 0.0175, b'0', 16, 3, 13, 'Harmonia Mundi, Le Mas De Vert, Petite Route de St-Gilles, 13200 Arles  '),
(36, 18, 'Livret le dernier pape - 978-2-8159-1075-0', 400, 22, 0.055, b'0', 16, 3, 15, 'Harmonia Mundi, Le Mas De Vert, Petite Route de St-Gilles, 13200 Arles  '),
(37, 19, 'Le Souffle des tarares', 1000, 501, 0.501, b'0', 17, 3, 3, 'Jean Marie Desbois, 4, impasse des Costières 13310 Saint-Martin-de-Crau '),
(38, 20, 'Blanche d’Estienne de Saint-Jean, le dernier chevalier de Provence', 600, 359, 0.5983333333333334, b'0', 17, 3, 15, 'Jean Marie Desbois, 4, impasse des Costières 13310 Saint-Martin-de-Crau '),
(39, 21, 'Une nouvelle vie, c''est quelque chose qui vous met en extase....', 130, 13, 0.1, b'0', 18, 3, 7, '37,  Rue de la charité 1210 Bruxelles ; Belgique'),
(40, 22, 'Strategie du Chaos', 200, 146, 0.73, b'0', 19, 3, 5, '171 rue Saint-Denis apprt 309  93100 Montreuil ; tel 07 53 77 31 06 '),
(41, 23, 'Noel', 220, 27, 0.12272727272727274, b'0', 20, 3, 7, '34 rue du Hameau , 75015 Paris , '),
(42, 24, 'Pour votre bonheur- 9782930678504', 900, 134, 0.1488888888888889, b'0', 23, 3, 15, 'DG diffusion ZI de Bogues 31750 ESCALQUENS'),
(43, 24, 'Pour votre bonheur- 9782930678504', 600, 89, 0.14833333333333334, b'0', 24, 3, 15, 'Mr Michalon 8 bd de la Madeleine 75009 Paris '),
(44, 25, 'Le complot contre Dieu- ISBN : 978-2-8162-0279-3', 270, 210, 0.7777777777777778, b'0', 25, 3, 15, 'Livernette Johan BP 30042 83040 Toulon cedex 9 ; '),
(45, 25, 'Le complot contre Dieu- ISBN : 978-2-8162-0279-3', 100, 78, 0.78, b'0', 26, 3, 15, 'Culture pour Tous Lieu dit les Chalottières 72560 CHANGE '),
(46, 25, 'Le complot contre Dieu- ISBN : 978-2-8162-0279-3', 50, 39, 0.78, b'0', 27, 3, 15, 'Laurent Glauzy BP 25 91151 Etampes cedex'),
(47, 25, 'Le complot contre Dieu- ISBN : 978-2-8162-0279-3', 20, 16, 0.8, b'0', 28, 3, 15, 'Editions Saint-Rémi BP 80  ;  33410 Cadillac '),
(48, 25, 'Le complot contre Dieu- ISBN : 978-2-8162-0279-3', 20, 16, 0.8, b'0', 29, 3, 15, 'Editions Fiat Lux 26, boulevard Jean Labro 13016 Marseille ; '),
(49, 25, 'Le complot contre Dieu- ISBN : 978-2-8162-0279-3', 20, 16, 0.8, b'0', 30, 3, 15, 'Librairie Saint-Jacmes 55, rue Saint-James 33000 Bordeaux ; '),
(50, 25, 'Le complot contre Dieu- ISBN : 978-2-8162-0279-3', 20, 16, 0.8, b'0', 31, 3, 15, 'Editions des Tuileries 82, boulevard Masséna Tour Ancone 75013 Paris'),
(51, 26, 'Jeunes blondes- - isbn : 9782915099843', 200, 17, 0.085, b'0', 32, 3, 15, 'MAKASSAR Vincent dodivers 8 rue Pelleport 75020 PARIS '),
(52, 27, 'Monstre bistouri-- isbn : 9782915099881', 200, 15, 0.075, b'0', 32, 3, 15, 'MAKASSAR Vincent dodivers 8 rue Pelleport 75020 PARIS '),
(53, 28, 'Le livre vide- isbn : 9782915099850', 200, 13, 0.065, b'0', 32, 3, 15, 'MAKASSAR Vincent dodivers 8 rue Pelleport 75020 PARIS '),
(54, 29, 'Pensionnats sadiques- isbn : 9782915099904', 200, 200, 1, b'0', 32, 3, 15, 'MAKASSAR Vincent dodivers 8 rue Pelleport 75020 PARIS '),
(55, 30, 'Rencontres isbn : 9782915099966', 300, 65, 0.21666666666666665, b'0', 32, 3, 16, 'MAKASSAR Vincent dodivers 8 rue Pelleport 75020 PARIS '),
(56, 31, 'L’homme du Baïkal- isbn : 9782915099928', 200, 43, 0.215, b'0', 32, 3, 16, 'MAKASSAR Vincent dodivers 8 rue Pelleport 75020 PARIS '),
(57, 26, 'Jeunes blondes- - isbn : 9782915099843', 400, 34, 0.085, b'0', 33, 3, 15, 'David Demartis Editions du Murmure 9, allée des Marronniers 21800 Neuilly-les-Dijon '),
(58, 27, 'Monstre bistouri-- isbn : 9782915099881', 400, 30, 0.075, b'0', 33, 3, 15, 'David Demartis Editions du Murmure 9, allée des Marronniers 21800 Neuilly-les-Dijon '),
(59, 28, 'Le livre vide- isbn : 9782915099850', 400, 25, 0.0625, b'0', 33, 3, 15, 'David Demartis Editions du Murmure 9, allée des Marronniers 21800 Neuilly-les-Dijon '),
(60, 29, 'Pensionnats sadiques- isbn : 9782915099904', 400, 35, 0.0875, b'0', 33, 3, 15, 'David Demartis Editions du Murmure 9, allée des Marronniers 21800 Neuilly-les-Dijon '),
(61, 30, 'Rencontres isbn : 9782915099966', 300, 65, 0.21666666666666665, b'0', 33, 3, 16, 'David Demartis Editions du Murmure 9, allée des Marronniers 21800 Neuilly-les-Dijon '),
(62, 31, 'L’homme du Baïkal- isbn : 9782915099928', 400, 85, 0.2125, b'0', 33, 3, 16, 'David Demartis Editions du Murmure 9, allée des Marronniers 21800 Neuilly-les-Dijon '),
(63, 32, 'l''été de Léa-isbn : 9782848657516', 70, 7, 0.1, b'0', 34, 3, 9, 'Éditions Sarbacane 35, rue d''Hauteville  ; 75010 Paris '),
(64, 33, '100 000 canards - isbn : 9782848657578', 80, 30, 0.375, b'0', 34, 3, 9, 'Éditions Sarbacane 35, rue d''Hauteville  ; 75010 Paris '),
(65, 34, 'Le monde de Charlie- EAN : 9782848655796', 5, 1.59, 0.318, b'0', 34, 3, 9, 'Éditions Sarbacane 35, rue d''Hauteville  ; 75010 Paris '),
(66, 32, 'l''été de Léa-isbn : 9782848657516', 2930, 309, 0.10546075085324232, b'0', 35, 3, 9, 'UD - Union Distribution Entrée livres neufs  6, rue de l''Europe ; 45300 Sermaises \r\n'),
(67, 33, '100 000 canards - isbn : 9782848657578', 3420, 1282, 0.37485380116959066, b'0', 35, 3, 9, 'UD - Union Distribution Entrée livres neufs  6, rue de l''Europe ; 45300 Sermaises \r\n'),
(68, 34, 'Le monde de Charlie- EAN : 9782848655796', 4995, 1588, 0.3179179179179179, b'0', 35, 3, 9, 'UD - Union Distribution Entrée livres neufs  6, rue de l''Europe ; 45300 Sermaises \r\n'),
(69, 35, 'Petite histoire d''un chêne', 1000, 302, 0.302, b'0', 36, 3, 10, 'VIGNOBLES JL SYLVAIN CHATEAU LA PERRIERE 33570 LUSSAC '),
(70, 36, 'La magie de Saint-Pétersbourg , ISBN : 9782268074405 , Code Sodis : 9387403', 999, 920, 0.9209209209209209, b'0', 37, 3, 10, 'SODIS Distribution 128, av. Marechal de Lattre de Tassigny 77400 Lagny sur Marne'),
(71, 36, 'La magie de Saint-Pétersbourg , ISBN : 9782268074405 , Code Sodis : 9387403', 1, 1, 1, b'0', 38, 3, 10, 'Fulco-Luis DE ALMENARA- Artège Groupe – 9, espace Méditerranée, 66000 PERPIGNAN'),
(72, 37, 'L''Adieu a L''Empereur 9782363581471', 1900, 458, 0.24105263157894738, b'0', 39, 3, 15, 'Harmonia Mundi Le Mas de Vert, Ancienne Route de St-Gilles, 13200 ARLES'),
(73, 38, '"Dictionnaire du cinéma fantastique 978-2-36358-145-7"', 970, 616, 0.6350515463917524, b'0', 39, 3, 3, 'Harmonia Mundi Le Mas de Vert, Ancienne Route de St-Gilles, 13200 ARLES'),
(74, 39, '"Spielberg tome 1 isbn 978-2-36358-151-8"', 1170, 215, 0.18376068376068377, b'0', 39, 3, 3, 'Harmonia Mundi Le Mas de Vert, Ancienne Route de St-Gilles, 13200 ARLES'),
(75, 40, '"Spielberg tome 2 isbn 978-2-36358-151-8"', 1170, 215, 0.18376068376068377, b'0', 39, 3, 3, 'Harmonia Mundi Le Mas de Vert, Ancienne Route de St-Gilles, 13200 ARLES'),
(76, 41, 'coffret Spielberg', 1170, 60, 0.05128205128205128, b'0', 39, 3, 3, 'Harmonia Mundi Le Mas de Vert, Ancienne Route de St-Gilles, 13200 ARLES'),
(77, 37, 'L''Adieu a L''Empereur 9782363581471', 1000, 25, 0.025, b'0', 40, 3, 15, 'Véronique Sales Éditions Vendémiaire 155, rue de Belleville 75019 Paris'),
(78, 38, '"Dictionnaire du cinéma fantastique 978-2-36358-145-7"', 30, 20, 0.6666666666666666, b'0', 40, 3, 3, 'Véronique Sales Éditions Vendémiaire 155, rue de Belleville 75019 Paris'),
(79, 39, '"Spielberg tome 1 isbn 978-2-36358-151-8"', 30, 6, 0.2, b'0', 40, 3, 3, 'Véronique Sales Éditions Vendémiaire 155, rue de Belleville 75019 Paris'),
(80, 40, '"Spielberg tome 2 isbn 978-2-36358-151-8"', 30, 6, 0.2, b'0', 40, 3, 3, 'Véronique Sales Éditions Vendémiaire 155, rue de Belleville 75019 Paris'),
(81, 41, 'coffret Spielberg', 30, 0.2, 0.006666666666666667, b'0', 40, 3, 3, 'Véronique Sales Éditions Vendémiaire 155, rue de Belleville 75019 Paris'),
(82, 42, 'Devenir socialiste 9782356873200', 1490, 119, 0.07986577181208054, b'0', 41, 3, 3, 'Les Belles Lettres 4, route du Plan d’eau | 27600 Gaillon '),
(83, 42, 'Devenir socialiste 9782356873200', 80, 7, 0.0875, b'0', 42, 3, 3, 'Le Bord de l’eau éditions Résidence Hautefort, 18 rue du Cdt Cousteau, 33310 Lormont'),
(84, 42, 'Devenir socialiste 9782356873200', 10, 1, 0.1, b'0', 43, 3, 3, 'Interforum Benelux FOND JEAN PAQUES 6, 1348 OTTIGNIES-LOUVAIN-LA-NEUVE, BELGIQUE'),
(85, 43, 'J''ai des blancs 9782874492358', 800, 156, 0.195, b'0', 44, 3, 15, 'Harmonia Mundi Le Mas de Vert, Ancienne Route de St-Gilles, 13200 ARLES'),
(86, 43, 'J''ai des blancs 9782874492358', 200, 131, 0.655, b'0', 45, 3, 15, 'AUX IMPRESSIONS NOUVELLES 84 AVENUE ALBERT, 1190 BRUXELLES '),
(87, 44, 'Dérive Urbaine n°6 isbn 9782954565415', 300, 138, 0.46, b'0', 46, 3, 3, 'Boris Hurtel 9, rue Godillot 93400 Saint-Ouen '),
(88, 45, 'Courte autobiographie', 300, 11, 0.036666666666666674, b'0', 47, 3, 15, 'GUILLAUME BELHOMME 7, BOULEVARD GABRIEL GUIST''HAU 44000 NANTES  '),
(89, 46, 'notices chaussettes', 2000, 10, 0.005, b'0', 48, 3, 15, 'ESAT Sellerie Parisienne 16, Avenue Descartes 94450 Limeil Brévannes '),
(90, 47, 'Je l''ai vu 9782849604618; SODIS code JDB 461.7', 150, 65, 0.4333333333333334, b'0', 49, 3, 3, 'SODIS Quai Réception 128 avenue du Maréchal De Lattre de Tassigny 77400 Lagny'),
(91, 47, 'Je l''ai vu 9782849604618; SODIS code JDB 461.7', 150, 65, 0.4333333333333334, b'0', 50, 3, 3, 'Jérôme Do. Bentzinger Editeur 8, rue Roesselmann 68000 Colmar , '),
(92, 48, 'Le carré d''or (9782807000223)', 50, 12, 0.24, b'0', 51, 3, 7, 'POLLEN-LITTERAL-DIFFUSION-DISTRIBUTION 33 ZI DU BOIS IMBERT 85280 LA FERRIERE '),
(93, 49, 'À côté du sentier  (9782807000254)', 50, 11, 0.22, b'0', 51, 3, 7, 'POLLEN-LITTERAL-DIFFUSION-DISTRIBUTION 33 ZI DU BOIS IMBERT 85280 LA FERRIERE '),
(94, 50, 'Ailleurs (9782807000285)', 50, 12, 0.24, b'0', 51, 3, 7, 'POLLEN-LITTERAL-DIFFUSION-DISTRIBUTION 33 ZI DU BOIS IMBERT 85280 LA FERRIERE '),
(95, 51, 'Mémoires de l''Oubli (9782807000193)', 40, 5, 0.125, b'0', 51, 3, 7, 'POLLEN-LITTERAL-DIFFUSION-DISTRIBUTION 33 ZI DU BOIS IMBERT 85280 LA FERRIERE '),
(96, 48, 'Le carré d''or (9782807000223)', 400, 94, 0.235, b'0', 52, 3, 7, 'M.E.O. Avenue Jeanne 10 bte 5 1050 BRUXELLES '),
(97, 49, 'À côté du sentier  (9782807000254)', 400, 86, 0.215, b'0', 52, 3, 7, 'M.E.O. Avenue Jeanne 10 bte 5 1050 BRUXELLES '),
(98, 50, 'Ailleurs (9782807000285)', 400, 90, 0.225, b'0', 52, 3, 7, 'M.E.O. Avenue Jeanne 10 bte 5 1050 BRUXELLES '),
(99, 51, 'Mémoires de l''Oubli (9782807000193)', 260, 27, 0.10384615384615385, b'0', 52, 3, 7, 'M.E.O. Avenue Jeanne 10 bte 5 1050 BRUXELLES '),
(100, 52, 'En tout! (978-2-930702-88-9)', 300, 49, 0.16333333333333333, b'0', 52, 3, 7, 'M.E.O. Avenue Jeanne 10 bte 5 1050 BRUXELLES '),
(101, 53, 'Miteux et magnifiques (978-2-930702-74-2)', 300, 65, 0.21666666666666665, b'0', 52, 3, 7, 'M.E.O. Avenue Jeanne 10 bte 5 1050 BRUXELLES '),
(102, 54, 'Not like an old play', 300, 69, 0.23, b'0', 53, 3, 15, '16, rue de Chabrol, 75010 Paris '),
(103, 55, 'Le bal des ambitieux', 1000, 630, 0.63, b'0', 54, 3, 3, '32, avenue de la mer 11200 Thézan des Corbières '),
(104, 56, 'Ces aliments qui nous guérissent (978-2-3691-7007-5)', 100, 50, 0.5, b'0', 55, 3, 7, 'ADS Picardie pour ADLP partner PAE du Haut Villé Rue Bayard 60000 Beauvais  '),
(105, 57, 'Revue Gestalt 33', 450, 188, 0.4177777777777778, b'0', 56, 3, 15, 'AGA 53 rue Carnot 33130 Begles - '),
(106, 58, 'Guide des vins de Lorraine', 1000, 410, 0.41, b'0', 57, 3, 3, '10 rue Mabille 57000 Metz'),
(107, 59, 'Marques pages Guide des vins de lorraine', 1000, 2, 0.002, b'0', 57, 3, 3, '10 rue Mabille 57000 Metz'),
(108, 60, 'SID 978-2-35532-213-6', 183, 48, 0.26229508196721313, b'0', 58, 3, 10, 'Galerie GM 12 rue Jean-Jaurès 05400 Veynes '),
(109, 60, 'SID 978-2-35532-213-6', 127, 53, 0.41732283464566927, b'0', 59, 3, 10, 'Lelivredart 113 bd Richard-Lenoir 75011 Paris '),
(110, 61, 'Cahiers archéologiques 55 978-2-7084-0976-7', 140, 103, 0.7357142857142859, b'0', 60, 3, 3, 'UD - Union Distribution Entrée livres neufs 6, rue de l''Europe 45300 Sermaises '),
(111, 61, 'Cahiers archéologiques 55 978-2-7084-0976-7', 150, 110, 0.7333333333333333, b'0', 61, 3, 3, 'Céline Hallien Éditions PICARD 82, rue Bonaparte 75006 Paris '),
(112, 61, 'Cahiers archéologiques 55 978-2-7084-0976-7', 10, 8, 0.8, b'0', 61, 3, 3, 'Céline Hallien Éditions PICARD 82, rue Bonaparte 75006 Paris '),
(113, 62, 'la voile virile  978-2-35512-061-9', 3000, 1960, 0.6533333333333332, b'0', 62, 3, 9, 'Daudin distribution 628, av. Du Grain d''or 41350 Vineuil '),
(114, 63, 'Les Frères musulmans et le pouvoir 978-2-35176-356-8', 170, 70, 0.4117647058823529, b'0', 63, 3, 3, '13 passage des Cloys 75018 Paris '),
(115, 63, 'Les Frères musulmans et le pouvoir 978-2-35176-356-8', 1830, 751, 0.41038251366120215, b'0', 64, 3, 3, 'Harmonia Mundi, quai n° 2, Le Mas De Vert, Petite Route de St-Gilles, 13200 Arles '),
(116, 64, 'Ruelle', 1000, 554, 0.554, b'0', 65, 3, NULL, 'Musée de Sucy en Brie - Rue Du Temple 94370 - SUCY-EN-BRIE Téléphone filaire : 01 45 90 14 42'),
(117, 65, 'Revue Musee SSA 2015', 2000, 255, 0.1275, b'0', 66, 3, 13, 'Editions Glyphe - 85 avenue Ledru-Rollin. 75012 Paris '),
(118, 66, 'Big Brother est parmi nous 9782371530119', 50, 29, 0.58, b'0', 67, 3, 15, 'TATAMIS, 103 rue Albert 1er, 41000 Blois, France.'),
(119, 66, 'Big Brother est parmi nous 9782371530119', 100, 58, 0.58, b'0', 68, 3, 15, 'DPF, Chemin de la Caillauderie, 86190 Chiré-en-Montreuil'),
(120, 66, 'Big Brother est parmi nous 9782371530119', 1350, 777, 0.5755555555555556, b'0', 69, 3, 15, 'Daudin distribution 628, av. Du Grain d''or 41350 Vineuil '),
(121, 67, '"Eviter les émotions 978-2-916120-48-5', 80, 36, 0.45, b'0', 70, 3, 15, 'Les Editions d''Ithaque 4, rue Girard 93100 Montreuil-Sous-Bois France '),
(122, 67, '"Eviter les émotions 978-2-916120-48-5', 920, 408, 0.4434782608695652, b'0', 71, 3, 15, 'Daudin distribution 628, av. Du Grain d''or 41350 Vineuil '),
(123, 68, 'Peine capitale', 300, 74, 0.24666666666666665, b'0', 72, 3, 5, 'Editions Auteurs d''Aujourd''hui, 5, rue de Stockholm, ZAE VIA EUROPA 34350 VENDRES. '),
(124, 69, 'Psychologie spirituelle et observation du monde /9791094175026', 700, 417, 0.5957142857142859, b'0', 73, 3, 3, 'Editions Novalis,15 rue Albert Joly, 78360 MONTESSON, '),
(125, 70, '20 inconnus au destin … / 9782370310125', 750, 65, 0.08666666666666667, b'0', 74, 3, 3, 'VOLUMEN, SITE logistique LOGLIBRIS de BALLAINVILLIERS Rue du Bel ébat, 91160 Ballainvilliers  '),
(126, 70, '20 inconnus au destin … / 9782370310125', 250, 22, 0.088, b'0', 75, 3, 3, 'Bigger Boat / AAARG! 76 rue des trois frères Barthelemy 13006 Marseille '),
(127, 71, '200 CD', 200, 2, 0.01, b'0', 75, 3, 17, 'Bigger Boat / AAARG! 76 rue des trois frères Barthelemy 13006 Marseille '),
(128, 72, 'Chronique d''histoire maritime', 50, 51, 1.02, b'0', 76, 3, 7, 'Eric Ledru SPM 16, rue des Ecoles 75005 Paris '),
(129, 73, 'Mythologica', 75, 50, 0.6666666666666666, b'0', 77, 3, 7, '11 rue des buttes - 94000 Créteil. '),
(130, 74, 'Cartes de visite JV- 90х55', 500, 1, 0.002, b'0', 14, 3, 15, 'Aube - Rue Amédée Giniès 84240 La Tour d''Aigues'),
(131, 1, 'Nina sur ma route-isbn : 9782914773645', 600, 308, 0.5133333333333333, b'0', 78, 4, 16, 'Pollen 61 zone industrielle du Bois imbert 85280 La Ferrière Téléphone : 33 (0)2 51 98 33 34'),
(132, 1, 'Agriest Plaquettes', 2000, 212, 0.106, b'0', 93, 6, 4, 'AGRIEST – ZA de la Maze  70360 Scey-sur-Saône Flavie DA SILVA Tél. : 03 84 92 76 76'),
(133, 2, 'France Oreiller Boîtes', 5000, 2600, 0.52, b'0', 94, 6, NULL, 'ZI le verron 96 Rue du Fief Veillet 85200 LONGEVES Michel THOMAS 06.48.18.14.18'),
(134, 3, 'Contes de l''au de la 9782363581570', 1100, 182, 0.16545454545454547, b'0', 95, 6, 15, 'Harmonia Mundi Le Mas de Vert, Quai No.2 , Ancienne Route de St-Gilles, 13200 ARLES'),
(135, 3, 'Contes de l''au de la 9782363581570', 100, 17, 0.17, b'0', 96, 6, 15, 'Éditions Vendémiaire 155, rue de Belleville 75019 Paris'),
(136, 4, 'Madrid ne dort pas 978-2-87568-043-3', 300, 68, 0.22666666666666666, b'0', 97, 6, 15, 'Promotion des Lettres (Fédération Wallonie-Bruxelles) Rue Adolphe Lavallée 16 1080 Molenbeek  appeler Présent de 9h à 16h'),
(137, 5, 'Mémoires d''un ange 978-2-87568-007-5', 10, 18, 1.8, b'0', 97, 6, 15, 'Promotion des Lettres (Fédération Wallonie-Bruxelles) Rue Adolphe Lavallée 16 1080 Molenbeek  appeler Présent de 9h à 16h'),
(138, 4, 'Madrid ne dort pas 978-2-87568-043-3', 1080, 242, 0.22407407407407404, b'0', 98, 6, 15, 'Harmonia Mundi Le Mas de Vert, Ancienne Route de St-Gilles, 13200 ARLES'),
(139, 5, 'Mémoires d''un ange 978-2-87568-007-5', 710, 128, 0.18028169014084508, b'0', 98, 6, 15, 'Harmonia Mundi Le Mas de Vert, Ancienne Route de St-Gilles, 13200 ARLES'),
(140, 6, 'La Grande Nuit 978-2-930646-09-1', 1970, 442, 0.22436548223350253, b'0', 98, 6, 15, 'Harmonia Mundi Le Mas de Vert, Ancienne Route de St-Gilles, 13200 ARLES'),
(141, 4, 'Madrid ne dort pas 978-2-87568-043-3', 120, 27, 0.225, b'0', 99, 6, 15, 'AUX IMPRESSIONS NOUVELLES 84 AVENUE ALBERT, 1190 BRUXELLES Livraison du lundi au vendredi de 10 à 18 heures'),
(142, 5, 'Mémoires d''un ange 978-2-87568-007-5', 80, 15, 0.1875, b'0', 99, 6, 15, 'AUX IMPRESSIONS NOUVELLES 84 AVENUE ALBERT, 1190 BRUXELLES Livraison du lundi au vendredi de 10 à 18 heures'),
(143, 6, 'La Grande Nuit 978-2-930646-09-1', 30, 7, 0.23333333333333334, b'0', 99, 6, 15, 'AUX IMPRESSIONS NOUVELLES 84 AVENUE ALBERT, 1190 BRUXELLES Livraison du lundi au vendredi de 10 à 18 heures'),
(144, 7, 'Petit manuel critique 978-2-35096-100-2', 1050, 253, 0.24095238095238097, b'0', 100, 6, 15, 'Belles Lettres, 4 route du Plan d''Eau, 27600 Gaillon'),
(145, 7, 'Petit manuel critique 978-2-35096-100-2', 150, 37, 0.24666666666666665, b'0', 101, 6, 15, 'Louise Guilbaud, Les Prairies ordinaires, 1 avenue de Ségur, 75007 Paris. Code porte 34B56, interphone Claude Guilbaud, 4° étage face, tel +33 6 09 16 51 55'),
(146, 8, 'Inside story 9782844811677', 1000, 683, 0.683, b'0', 102, 6, 15, 'DILISCO - Rue du limousin – 23220 – Chéniers'),
(147, 8, 'Inside story 9782844811677', 400, 274, 0.685, b'0', 103, 6, 15, 'DIXIT - 35 rue de Châteaudun 75009 – Paris – tel.Tel : +33 1 49 70 89 96'),
(148, 9, 'ENTRETIEN PLATONICIEN 9782355261404', 1500, 150, 0.1, b'0', 104, 6, 15, 'BLDD Centre d’expédition 4, route du plan d’eau 27600 Gaillon Tel : 02.32.21.86.55'),
(149, 9, 'ENTRETIEN PLATONICIEN 9782355261404', 200, 20, 0.1, b'0', 105, 6, 15, 'Nel Sarl 90 quai Maupassant 76400 Fécamp 06 08 88 36 33'),
(150, 10, 'Revue Che vuoi No.42 - 9782355770906', 400, 127, 0.3175, b'0', 106, 6, 15, '1 Place de la Résistance 91000 Evry +33668751718 (M. Iacovella)'),
(151, 11, 'guide Rome 978-2-370950-22-2', 1270, 251, 0.19763779527559056, b'0', 107, 6, 3, 'DILISCO - Rue du limousin – 23220 – Chéniers'),
(152, 12, 'guide Corse 978-2-917537-94-7', 995, 197, 0.19798994974874373, b'0', 107, 6, 3, 'DILISCO - Rue du limousin – 23220 – Chéniers'),
(153, 13, 'guide Berlin  978-2-917537-96-1', 995, 197, 0.19798994974874373, b'0', 107, 6, 3, 'DILISCO - Rue du limousin – 23220 – Chéniers'),
(154, 11, 'guide Rome 978-2-370950-22-2', 30, 6, 0.2, b'0', 108, 6, 3, 'Editions Graine 2 49,rue de Montaigu 78240 Chambourcy Tél.: 0130064026'),
(155, 12, 'guide Corse 978-2-917537-94-7', 5, 1, 0.2, b'0', 108, 6, 3, 'Editions Graine 2 49,rue de Montaigu 78240 Chambourcy Tél.: 0130064026'),
(156, 13, 'guide Berlin  978-2-917537-96-1', 5, 1, 0.2, b'0', 108, 6, 3, 'Editions Graine 2 49,rue de Montaigu 78240 Chambourcy Tél.: 0130064026'),
(157, 14, 'Vartkes', 50, 13, 0.26, b'1', 109, 6, 7, 'Monsieur ou Madame Marderos 6 rue Charles Lory 38000 GRENOBLE tél. mobile : +33 6 75 12 79 19 fixe : +33 4 76 96 56 70'),
(158, 15, 'OPTEX CATALOGUE', 2000, 1072, 0.536, b'1', 110, 6, 13, 'Société Normand OPTEX 117 bld Eugène Thomas 62110 Hénin Beaumont Tél 03 91 83 00 81 GRYNIEWICZ Sylvain sgryniew@groupe-normand.com'),
(159, 16, 'SALOPE ! 978-2940522-21-7 Jaquette', 150, 7, 0.04666666666666667, b'0', 111, 6, 5, 'TNT Swiss Post SA route de Renens 1A 1030 Bussigny-près-Lausanne Téléphone: 0800 55 55 55'),
(160, 17, 'IL TE FAUT OCCIRE LE FACHO QUE TU AS EN TOI 978-2940522-00-2 Jaquette', 15, 7, 0.466666666666667, b'1', 111, 6, 5, 'TNT Swiss Post SA route de Renens 1A 1030 Bussigny-près-Lausanne Téléphone: 0800 55 55 55'),
(161, 18, 'REIMPRESSION SUISSE PHALLUS DEMOCRATIE MOLLE 9782940522187', 300, 29, 0.0966666666666667, b'1', 111, 6, 13, 'TNT Swiss Post SA route de Renens 1A 1030 Bussigny-près-Lausanne Téléphone: 0800 55 55 55'),
(162, 19, 'MORGARTEN+BANDEAU 9782940522248', 600, 32, 0.053333333333333295, b'1', 111, 6, 15, 'TNT Swiss Post SA route de Renens 1A 1030 Bussigny-près-Lausanne Téléphone: 0800 55 55 55'),
(163, 20, 'REIMPRESSION LE CHEMIN DE LA DAME 9782940522200+JAQUETTE', 500, 116, 0.232, b'1', 111, 6, 15, 'TNT Swiss Post SA route de Renens 1A 1030 Bussigny-près-Lausanne Téléphone: 0800 55 55 55'),
(164, 21, 'Théorème de l''assassinat 978-2-914851-23-7 + bandeau', 500, 64, 0.128, b'1', 112, 6, 7, '5 rue Férou 75006 zamdatala@hotmail.com 0033 3 20 55 26 64'),
(165, 16, 'SALOPE ! 978-2940522-21-7 Jaquette', 60, 0, 0, b'0', 111, 6, NULL, 'TNT Swiss Post SA route de Renens 1A 1030 Bussigny-près-Lausanne Téléphone: 0800 55 55 55');

-- --------------------------------------------------------

--
-- Table structure for table `bookspackage`
--

CREATE TABLE IF NOT EXISTS `bookspackage` (
  `Id` serial primary key,
  `PackageNumber` varchar(20) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `PostalCode` varchar(15) DEFAULT NULL,
  `PhoneNumber` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Merchant` varchar(30) DEFAULT NULL,
  `Client` varchar(100) DEFAULT NULL,
  `PricePerKilogram` decimal(7,2) DEFAULT '1.00',
  `Priority` varchar(30) DEFAULT NULL,
  `DeliveryDate` date DEFAULT NULL,
  `LastModification` date DEFAULT NULL,
  `DeliveryAddress` varchar(500) DEFAULT NULL,
  `RemarksSales` varchar(1000) DEFAULT NULL,
  `RemarksLogistics` varchar(1000) DEFAULT NULL,
  `PrintDeliveryDay` varchar(20) DEFAULT NULL,
  `State` varchar(50),
  `Version` int(11) DEFAULT '1',
  `TransportId`  BIGINT UNSIGNED,
  `TruckGroupId`  BIGINT UNSIGNED DEFAULT NULL,
  `LoadingDay` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;



--
-- Dumping data for table `bookspackage`
--

INSERT INTO `bookspackage` (`Id`, `PackageNumber`, `Country`, `PostalCode`, `PhoneNumber`, `Email`, `Merchant`, `Client`, `PricePerKilogram`, `Priority`, `DeliveryDate`, `DeliveryAddress`, `RemarksSales`, `RemarksLogistics`, `PrintDeliveryDay`, `Version`, `TransportId`, `TruckGroupId`, `LoadingDay`) VALUES
(3, '1-48-14', 'Франция', '91160', '0169102610', '', 'Дена', 'Prividef', '1.00', 'neutral', '2014-12-04', 'Prividef 13-15 Chemin de Chilly Bâtiment C 91160 CHAMPLAN', '', 'Кашони на европале', 'Петък', 0, 2, NULL, NULL),
(4, '2-48-14', 'Франция', '41350', '02 54 55 50 50', '', 'Дена', 'Glyphe', '1.00', 'neutral', '2014-12-04', 'Daudin distribution 628, av. Du Grain d''or 41350 Vineuil', '', 'кашони на европале\r\n', 'Петък', 0, 2, NULL, NULL),
(5, '3-48-14', 'Франция', '75012', '01 53 33 06 23', '', 'Дена', 'Editions Glyphe', '1.00', 'neutral', '2014-12-03', 'Editions Glyphe - 85 avenue Ledru-Rollin. 75012 Paris Tél. ', '', 'в кашони', 'Петък', 0, 2, NULL, NULL),
(6, '4-48-14', 'Франция', '92638', '+33 1 46 85 40 54 /+33 146 85 40 35', '', 'Дена', 'Cress conseil', '1.00', 'neutral', '2014-12-03', 'MGF/Norbert dentressangle A l’attention de Lucibel 28 route du bassin N°6 CE367 92638 Gennevilliers ', 'office! Da ne se spomenava Pulsio, BOOKPRINT, BULGARIA,specialni etiketi, bon de livraison', '', 'Петък', 0, 2, NULL, NULL),
(7, '1-49-14', 'Франция', '91160', '', '', 'Дора', 'Chevre Feuille Etoilee', '1.00', 'neutral', '2014-12-08', 'Volumen SITE logistique LOGLIBRIS de BALLAINVILLIERS, Rue du Bel ébat, 91160 Ballainvilliers ', 'OFIS - VZEMETE SRESHTA MOLIA', 'Кашони на европале', 'Петък', 2, 3, NULL, NULL),
(8, '2-49-14', 'Франция', '34080', 'Tél : 04 67 73 75 45  ; 07 70 01 45 08', '', 'Дора', 'Chevre Feuille Etoilee', '1.00', 'neutral', '2014-12-11', 'Le clos de la Fontaine Bat B 65, cour Libéral Bruant rue Jacques Lemercier , 34080 Montpellier', 'Horaires de bureau : 8h30 -14h. Prévenir la veille', 'в кашони', 'Петък', 1, 3, NULL, NULL),
(9, '3-49-14', 'Франция', '75006', '', '', 'Дора', 'Chevre feuille etoilee', '1.00', 'neutral', '2014-12-07', '5 rue Ferou 75006 Paris', '', 'в кашони', 'Петък', 0, 3, NULL, NULL),
(10, '4-49-14', 'Франция', '13200', 'Tel : 04.90.49.90.49', '', 'Дора', 'ActuSf', '1.00', 'neutral', '2014-12-08', 'Harmonia Mundi, quai n° 2,Le Mas De Vert, Petite Route de St-Gilles, 13200 Arles ', 'OFIS', 'Кашони на европале', 'Четвъртък', 0, 3, NULL, NULL),
(11, '5-49-14', 'франция', '58800', '0386200517', '', 'Дора', 'EDITIONS DE L''AUBE', '1.00', 'neutral', '2014-12-09', 'TéATr''éPROUVèTe L''Abbaye du Jouïr 58800-CORBIGNY ', '', 'в кашони', 'Четвъртък', 0, 3, NULL, NULL),
(12, '6-49-14', 'Франция', '92120', '01 46 56 18 77 ', '', 'Дора', 'EDITIONS DE L''AUBE', '1.00', 'neutral', '2014-12-08', 'Le Dissez 8 rue de Sévigné, 92120 Montrouge, ', '', 'в кашони', 'Четвъртък', 0, 3, NULL, NULL),
(13, '7-49-14', 'Франция', '13200', 'Tel : 04.90.49.90.49 ', '', 'Дора', 'EDITIONS DE L''AUBE', '1.00', 'neutral', '2014-12-08', 'Harmonia Mundi, quai n° 2, Le Mas De Vert, Petite Route de St-Gilles, 13200 Arles ', 'OFIS', 'кашони на европале\r\n', 'Четвъртък', 0, 3, NULL, NULL),
(14, '8-49-14', 'Франция', '84240', '', '', 'Дора', 'EDITIONS DE L''AUBE', '1.00', 'neutral', NULL, 'Aube - Rue Amédée Giniès 84240 La Tour d''Aigues', 'доставка макс бързо', 'кашони на европале\r\n', 'Четвъртък', 0, 3, NULL, NULL),
(15, '9-49-14', 'Франция', '75127', ' Nathalie Leroux. 01 44 58 24 40', '', 'Дора', 'EDITIONS DE L''AUBE', '1.00', 'neutral', '2014-12-09', 'IHEDATE Maison des Ponts 15, Rue de la Fontaine au Roi 75127 Paris cedex 11', '', 'в кашони', 'Четвъртък', 0, 3, NULL, NULL),
(16, '67-49-14', 'Франция', '13200', 'Tel : 04.90.49.90.49', '', 'Дора', 'EDITIONS DE L''AUBE', '1.00', 'neutral', '2014-12-08', 'Harmonia Mundi, Le Mas De Vert, Petite Route de St-Gilles, 13200 Arles  ', 'OFIS- zaradi dobaveniat otdolu text go pi6e pak . Préciser sur les cartons : à l''attention de Violette Tastet', 'кашони на европале', 'четвъртък', 0, 3, NULL, NULL),
(17, '12-49-14', 'Франция', '13310', 'Mon téléphone est 06 58 03 69 29 ', '', 'Дора', 'Jean Marie Desbois', '1.00', 'neutral', '2014-12-11', 'Jean Marie Desbois, 4, impasse des Costières 13310 Saint-Martin-de-Crau ', 'Je serai présent. ima sabitie', 'кашони на европале', 'Петък', 0, 3, NULL, NULL),
(18, '13-49-14', 'Белгия', '1210 - Belgique', '', '', 'Дора', 'Trames = Jérôme Poloczek', '1.00', 'neutral', '2014-12-11', '37,  Rue de la charité 1210 Bruxelles ; Belgique', '', 'в кашони', 'Петък', 0, 3, NULL, NULL),
(19, '14-49-14', 'Франция', '93100', '0753773106', '', 'Дора', 'Patrick Mbeko', '1.00', 'neutral', '2014-12-10', '171 rue Saint-Denis apprt 309  93100 Montreuil ; tel 07 53 77 31 06 ', 'ima sabitie', 'в кашони', 'Петък', 0, 3, NULL, NULL),
(20, '15-49-14', 'Франция', '75015', ' TEL - 01 83 64 28 27 - VELINA -BALGARKA*', '', 'Дора', 'Clio', '1.00', 'neutral', '2014-12-11', '34 rue du Hameau , 75015 Paris , ', 'RABOTNO VREME- entre 10h et 17h, en dehors de ces horaires il est peu probable qu''il y ait quelqu''un au rez-de-chaussée; Le transporteur peut sonner au fond du couloir au N 34 où se trouvent les bureaux de Clio ou à la boutique qui est juste à côté.', 'в кашони', 'петък', 0, 3, NULL, NULL),
(23, '16-49-14', 'Франция', '31750', 'Tel : 05 61 00 09 99', '', 'Дора', 'FORTUNA', '1.00', 'neutral', '2014-12-12', 'DG diffusion ZI de Bogues 31750 ESCALQUENS', 'ofis  - rabotno  vreme ot ponedelnik do petak ot  8H30 do12H30 i ot 14H do  17H', 'кашони на европале', 'петък', 1, 3, NULL, NULL),
(24, '17-49-14', 'Франция', '75009', '', '', 'Дора', 'FORTUNA', '1.00', 'neutral', '2014-12-12', 'Mr Michalon 8 bd de la Madeleine 75009 Paris ', '-mogat DA SE OSTAVQT NA PAZACHA', 'в кашони', 'петък', 0, 3, NULL, NULL),
(25, '18-49-14', 'Франция', '83040', 'Tél : 06 18 46 05 89 ', '', 'Дора', 'Mr Johan Livernette ', '1.00', 'neutral', '2014-12-12', 'Livernette Johan BP 30042 83040 Toulon cedex 9 ; ', '', 'кашони на европале', 'Петък', 0, 3, NULL, NULL),
(26, '19-49-14', 'Франция', '72560', '02.43.75.47.98 ou 06.76.59.36.07 ', '', 'Дора', 'Mr Johan Livernette', '1.00', 'neutral', '2014-12-12', 'Culture pour Tous Lieu dit les Chalottières 72560 CHANGE ', '', 'Horaires de livraison: de 09h00 à 12h00 du lundi au vendredi', 'Петък', 3, 3, NULL, NULL),
(27, '20-49-14', 'Франция', '91151', ' Téléphone : 01 69 92 03 62', '', 'Дора', 'Mr Johan Livernette', '1.00', 'neutral', '2014-12-12', 'Laurent Glauzy BP 25 91151 Etampes cedex', '', '', 'Петък', 1, 3, NULL, NULL),
(28, '21-49-14', 'Франция', '33410', 'tél : 05 56 76 73 38', '', 'Дора', 'Mr Johan Livernette', '1.00', 'neutral', '2014-12-12', 'Editions Saint-Rémi BP 80  ;  33410 Cadillac ', '', '', 'Петък', 0, 3, NULL, NULL),
(29, '22-49-14', 'Франция', '13016', 'Tél : 06 70 96 55 13', '', 'Дора', 'Mr Johan Livernette', '1.00', 'neutral', '2014-12-12', 'Editions Fiat Lux 26, boulevard Jean Labro 13016 Marseille ; ', '', '', 'Петък', 0, 3, NULL, NULL),
(30, '23-49-14', 'Франция', '33000', 'Tél : 06 11 04 82 59', '', 'Дора', 'Mr Johan Livernette', '1.00', 'neutral', '2014-12-12', 'Librairie Saint-Jacmes 55, rue Saint-James 33000 Bordeaux ; ', '', '', 'Петък', 0, 3, NULL, NULL),
(31, '24-49-14', 'Франция', '75013', '01 53 34 97 97', '', 'Дора', 'Mr Johan Livernette', '1.00', 'neutral', '2014-12-12', 'Editions des Tuileries 82, boulevard Masséna Tour Ancone 75013 Paris', '', '', 'Петък', 0, 3, NULL, NULL),
(32, '25-49-14', 'Франция', '75020', 'Tél : 01 40 33 69 69', '', 'Дора', 'MURMURE', '1.00', 'neutral', '2014-12-09', 'MAKASSAR Vincent dodivers 8 rue Pelleport 75020 PARIS ', 'ofis- prendre RDV', '', 'Петък', 0, 3, NULL, NULL),
(33, '26-49-14', 'Франция', '21800', 'tel : 03 80 47 06 51', 'Mél : demartis@yahoo.fr ; ', 'Дора', 'MURMURE', '1.00', 'neutral', '2014-12-11', 'David Demartis Editions du Murmure 9, allée des Marronniers 21800 Neuilly-les-Dijon ', '', '', 'Петък', 0, 3, NULL, NULL),
(34, '27-49-14', 'Франция', '75010', 'Tel : 01 42 46 24 02', '', 'Дора', 'Sarbacane ', '1.00', 'neutral', '2014-12-10', 'Éditions Sarbacane 35, rue d''Hauteville  ; 75010 Paris ', '(Téléphoner 72 HEURES AVANT LA LIVRAISON pour une prise de rendez-vous indispensable, afin de limiter l''attente des chauffeurs)', 'Horaires de livraison : 9h30 - 12h00 ; 14h30 -18h00', 'Петък', 0, 3, NULL, NULL),
(35, '28-49-14', 'Франция', '45300', 'Tel : 02 38 39 49 33 ou 02 38 39 00 43', 'Email : reception@union-distribution.fr', 'Дора', 'Sarbacane', '1.00', 'neutral', '2014-12-10', 'UD - Union Distribution Entrée livres neufs  6, rue de l''Europe ; 45300 Sermaises \r\n', '', 'Horaires de livraison : 8h00 - 12h00 ; 13h00 - 17h00', 'Петък', 0, 3, NULL, NULL),
(36, '29-49-14', 'Франция', '33570', 'TEL :  05 57 55 14 TEL Maitre de chai : 06 82 13 41 08', '', 'Дора', 'CONFLUENCES', '1.00', 'neutral', '2014-12-15', 'VIGNOBLES JL SYLVAIN CHATEAU LA PERRIERE 33570 LUSSAC ', 'maxi na 15/12/2104 do kraia na denia', '', 'Вторник', 0, 3, NULL, NULL),
(37, '30-49-14', 'Франция', '77400', '', '', 'Дора', 'Artege', '1.00', 'neutral', '2014-12-15', 'SODIS Distribution 128, av. Marechal de Lattre de Tassigny 77400 Lagny sur Marne', 'ne e ofis , no e dobre na 15/12/2014', '', 'Вторник', 0, 3, NULL, NULL),
(38, '31-49-14', 'Франция', '66000', '', '', 'Дора', 'Artege', '1.00', 'neutral', NULL, 'Fulco-Luis DE ALMENARA- Artège Groupe – 9, espace Méditerranée, 66000 PERPIGNAN', '', 'PO PO6TATA', 'Вторник', 0, 3, NULL, NULL),
(39, '32-49-14', 'Франция', '13200', '', '', 'Краси', 'Vendémiaire', '1.00', 'neutral', '2014-12-15', 'Harmonia Mundi Le Mas de Vert, Ancienne Route de St-Gilles, 13200 ARLES', '', '', 'Петък', 0, 3, NULL, NULL),
(40, '33-49-14', 'Франция', '75019', '', '', 'Краси', 'Vendémiaire', '1.00', 'neutral', '2014-12-11', 'Véronique Sales Éditions Vendémiaire 155, rue de Belleville 75019 Paris', '', '', 'Петък', 0, 3, NULL, NULL),
(41, '34-49-14', 'Франция', '27600', 'TEL : 02.32.77.47.75', '', 'Краси', 'BDL', '1.00', 'neutral', '2014-12-15', 'Les Belles Lettres 4, route du Plan d’eau | 27600 Gaillon ', 'office!', '', 'Петък', 0, 3, NULL, NULL),
(42, '35-49-14', 'Франция', '33310', '', '', 'Краси', 'BDL', '1.00', 'neutral', '2014-12-12', 'Le Bord de l’eau éditions Résidence Hautefort, 18 rue du Cdt Cousteau, 33310 Lormont', '', '', 'Петък', 0, 3, NULL, NULL),
(43, '36-49-14', 'Белгия', '1348', '', '', 'Краси', 'BDL', '1.00', 'neutral', '2014-12-12', 'Interforum Benelux FOND JEAN PAQUES 6, 1348 OTTIGNIES-LOUVAIN-LA-NEUVE, BELGIQUE', '', '', 'Петък', 0, 3, NULL, NULL),
(44, '37-49-14', 'Франция', '13200', '', '', 'Краси', 'Impressions nouvelles', '1.00', 'neutral', '2014-12-08', 'Harmonia Mundi Le Mas de Vert, Ancienne Route de St-Gilles, 13200 ARLES', 'office', '', 'Петък', 0, 3, NULL, NULL),
(45, '68-49-14', 'Белгия', '1190', '', '', 'Краси', 'Impressions nouvelles', '1.00', 'neutral', '2014-12-12', 'AUX IMPRESSIONS NOUVELLES 84 AVENUE ALBERT, 1190 BRUXELLES ', '', 'Livraison du lundi au vendredi de 10 à 18 heures', 'Петък', 0, 3, NULL, NULL),
(46, '69-49-14', 'Франция', '93400', '06 52 67 45 52', '', 'Краси', 'Une autre image', '1.00', 'neutral', '2014-12-11', 'Boris Hurtel 9, rue Godillot 93400 Saint-Ouen ', '', '', 'Петък', 0, 3, NULL, NULL),
(47, '70-49-14', 'Франция', '44000', 'tel/06 83 54 38 78', '', 'Краси', 'Guillaume Belhomme', '1.00', 'neutral', '2014-12-12', 'GUILLAUME BELHOMME 7, BOULEVARD GABRIEL GUIST''HAU 44000 NANTES  ', '', '', 'Петък', 0, 3, NULL, NULL),
(48, '38-49-14', 'Франция', '94450', '+33 6 78 81 86 28', '', 'Краси', 'Ruben Valensi /Lasso shoes', '1.00', 'neutral', '2014-12-12', 'ESAT Sellerie Parisienne 16, Avenue Descartes 94450 Limeil Brévannes ', '', '', 'Петък', 0, 3, NULL, NULL),
(49, '39-49-14', 'Франция', '77400', '', '', 'Краси', 'Jerome do Bentzinger', '1.00', 'neutral', '2014-12-09', 'SODIS Quai Réception 128 avenue du Maréchal De Lattre de Tassigny 77400 Lagny', 'ne e office', '', 'Петък', 0, 3, NULL, NULL),
(50, '40-49-14', 'Франция', '68000', 'Tél 03 89 24 19 74', '', 'Краси', 'Jerome do Bentzinger', '1.00', 'neutral', '2014-12-10', 'Jérôme Do. Bentzinger Editeur 8, rue Roesselmann 68000 Colmar , ', '', '', 'Петък', 0, 3, NULL, NULL),
(51, '41-49-14', 'Франция', '85280', '(Contact : 02 51 98 33 34)', '', 'Радо', 'MEO-éditions', '1.00', 'neutral', '2014-12-12', 'POLLEN-LITTERAL-DIFFUSION-DISTRIBUTION 33 ZI DU BOIS IMBERT 85280 LA FERRIERE ', '', '', 'Петък', 0, 3, NULL, NULL),
(52, '42-49-14', 'Белгия', '1050', 'Contact : 32 2 648 04 10)', '', 'Радо', 'MEO-éditions', '1.00', 'neutral', '2014-12-12', 'M.E.O. Avenue Jeanne 10 bte 5 1050 BRUXELLES ', '', '', 'Петък', 0, 3, NULL, NULL),
(53, '43-49-14', 'Франция', '75010', '(0611784287 / 0952918645 Johnathan Magidoff)', '', 'Радо', 'Fahrenheit', '1.00', 'neutral', '2014-12-12', '16, rue de Chabrol, 75010 Paris ', '', '', 'Петък', 0, 3, NULL, NULL),
(54, '44-49-14', 'Франция', '11200', '04 68 75 06 93', '', 'Радо', 'Sudedit', '1.00', 'neutral', '2014-12-12', '32, avenue de la mer 11200 Thézan des Corbières ', '', '', 'Петък', 1, 3, 6, NULL),
(55, '45-49-14', 'Франция', '60000', 'TÉL: 03 44 06 46 87', '', 'Радо', 'Judena', '1.00', 'neutral', '2014-12-12', 'ADS Picardie pour ADLP partner PAE du Haut Villé Rue Bayard 60000 Beauvais  ', 'Les prévenir 48 heures avant la livraison', '', 'Петък', 1, 3, 1, NULL),
(56, '46-49-14', 'Франция', '33130', 'tel. 05 56 85 23 51', '', 'Ралица', 'Torralba/ateliers graphiques de l''ardoisiere', '1.00', 'neutral', '2014-12-11', 'AGA 53 rue Carnot 33130 Begles - ', '', '', 'Петък', 1, 3, 6, NULL),
(57, '47-49-14', 'Франция', '57000', 'Sébastien Wagner - tél +33660023922', '', 'Ралица', 'Paraiges', '1.00', 'neutral', '2014-12-11', '10 rue Mabille 57000 Metz', '', '', 'Петък', 1, 3, 10, NULL),
(58, '48-49-14', 'Франция', '05400', 'Martine Garcin 06 84 01 37 09 ', '', 'Теа', 'Lelivredart', '1.00', 'neutral', '2014-12-12', 'Galerie GM 12 rue Jean-Jaurès 05400 Veynes ', 'Моля на кашоните да НЕ пише Pulsio. Може да пише само името на книгата+ISBN ', 'да се предвиди камион с падащ борд', 'Петък', 2, 3, 6, NULL),
(59, '49-49-14', 'Франция', '75011', '01 40 01 04 26', '', 'Теа', 'Lelivredart', '1.00', 'neutral', '2014-12-12', 'Lelivredart 113 bd Richard-Lenoir 75011 Paris ', ' à partir de 10h30', '', 'Петък', 1, 3, 10, NULL),
(60, '50-49-14', 'Франция', '45300', 'Tel : 02 38 39 49 33 ou 02 38 39 00 43', 'Email : reception@union-distribution.fr', 'Теа', 'Picard ed.', '1.00', 'neutral', '2014-12-10', 'UD - Union Distribution Entrée livres neufs 6, rue de l''Europe 45300 Sermaises ', '', ' rabotno vreme :  8h00 - 12h00  13h00 - 17h00', 'Петък', 1, 3, 8, NULL),
(61, '51-49-14', 'Франция', '75006', '01 43 26 95 45', '', 'Теа', 'Picard ed.', '1.00', 'neutral', '2014-12-10', 'Céline Hallien Éditions PICARD 82, rue Bonaparte 75006 Paris ', '', '', 'Петък', 1, 3, 10, NULL),
(62, '52-49-14', 'Франция', '41350', 'Tel. : 02 54 55 50 50', '', 'Теа', 'Retour au sources', '1.00', 'neutral', '2014-12-12', 'Daudin distribution 628, av. Du Grain d''or 41350 Vineuil ', '', '', 'Петък', 1, 3, 3, NULL),
(63, '53-49-14', 'Франция', '75018', 'contact: 33 1 42 23 56 02', '', 'Теа', 'Galaade', '1.00', 'neutral', '2014-12-08', '13 passage des Cloys 75018 Paris ', '', '9-12h; 13h30-18; ', 'Петък', 1, 3, 10, NULL),
(64, '54-49-14', 'Франция', '13200', 'Tel : 04.90.49.90.49', '', 'Теа', 'Galaade', '1.00', 'neutral', '2014-12-08', 'Harmonia Mundi, quai n° 2, Le Mas De Vert, Petite Route de St-Gilles, 13200 Arles ', '', '', 'Петък', 1, 3, 11, NULL),
(65, '55-49-14', 'Франция', '94370', 'Téléphone filaire : 01 45 90 14 42', '', 'Дена', 'Comexpo2A', '1.00', 'neutral', '2014-12-11', 'Musée de Sucy en Brie - Rue Du Temple 94370 - SUCY-EN-BRIE Téléphone filaire : 01 45 90 14 42', 'DA NE SE SPOMENAVA PULSIO, BG iBOOKPRINT', '', 'Петък', 1, 3, 9, NULL),
(66, '56-49-14', 'Франция', '75012', 'Tél. 01 53 33 06 23', '', 'Дена', 'Glyphe', '1.00', 'neutral', '2014-12-10', 'Editions Glyphe - 85 avenue Ledru-Rollin. 75012 Paris ', '', '', 'Петък', 1, 3, 10, NULL),
(67, '57-49-14', 'Франция', '41000', '06 37 72 42 39', '', 'Дена', 'Tatamis', '1.00', 'neutral', '2014-12-11', 'TATAMIS, 103 rue Albert 1er, 41000 Blois, France.', '', '', 'Петък', 1, 3, 3, NULL),
(68, '58-49-14', 'Франция', '86190', '05 49 51 83 04', '', 'Дена', 'Tatamis', '1.00', 'neutral', '2014-12-11', 'DPF, Chemin de la Caillauderie, 86190 Chiré-en-Montreuil', '', '', 'Петък', 1, 3, 6, NULL),
(69, '59-49-14', 'Франция', '41350', '02 54 55 50 50', '', 'Дена', 'Tatamis', '1.00', 'neutral', '2014-12-11', 'Daudin distribution 628, av. Du Grain d''or 41350 Vineuil ', '', '', 'Петък', 1, 3, 3, NULL),
(70, '60-49-14', 'Франция', '93100', 'Tél. : +33 (0)1 70 32 32 78 / Mme Ana des Staal ', 'anadestaal@ithaque-editions.fr', 'Дена', 'Ithaque', '1.00', 'neutral', '2014-12-11', 'Les Editions d''Ithaque 4, rue Girard 93100 Montreuil-Sous-Bois France ', 'obajdane predi dostavka', '', 'Петък', 1, 3, 9, NULL),
(71, '61-49-14', 'Франция', '41350', 'Tel. : 02 54 55 50 50', '', 'Дена', 'Ithaque', '1.00', 'neutral', '2014-12-11', 'Daudin distribution 628, av. Du Grain d''or 41350 Vineuil ', '', '', 'Петък', 1, 3, 3, NULL),
(72, '62-49-14', 'Франция', '34350', 'Jacques Nain, 06 41 90 27 06, ', 'editions.aa@orange.fr', 'Дена', '2A', '1.00', 'neutral', '2014-12-11', 'Editions Auteurs d''Aujourd''hui, 5, rue de Stockholm, ZAE VIA EUROPA 34350 VENDRES. ', '', '', 'Петък', 1, 3, 6, NULL),
(73, '63-49-14', 'Франция', '78360', 'Geneviève Bideau Tél. 01030712821', '', 'Марго', 'Ed Novalis', '1.00', 'neutral', '2014-12-12', 'Editions Novalis,15 rue Albert Joly, 78360 MONTESSON, ', '', '', 'Петък', 1, 3, 9, NULL),
(74, '64-49-14', 'Франция', '91160', '01 69 10 89 96', '', 'Марго', 'Aaarg', '1.00', 'neutral', '2014-12-12', 'VOLUMEN, SITE logistique LOGLIBRIS de BALLAINVILLIERS Rue du Bel ébat, 91160 Ballainvilliers  ', 'HORAIRES DE RECEPTION Du lundi au vendredi de 7 heures à 16 heures 30', '', 'Петък', 1, 3, 8, NULL),
(75, '65-49-14', 'Франция', '13006', 'Léa Guidi-Guidi 33624321197', '', 'Марго', 'Aaarg', '1.00', 'neutral', '2014-12-12', 'Bigger Boat / AAARG! 76 rue des trois frères Barthelemy 13006 Marseille ', '', '', 'Петък', 1, 3, 11, NULL),
(76, '66-49-14', 'Франция', '75005', '06 86 95 37 06', '', 'Марго', 'SPM', '1.00', 'neutral', '2014-12-12', 'Eric Ledru SPM 16, rue des Ecoles 75005 Paris ', 'escalier B fond de la deuxième cour tout droit ', '', 'Петък', 2, 3, 9, NULL),
(77, '10-49-14', 'Франция', '94000', '01 42 07 75 05', '', 'Теа', 'Mythologica', '1.00', 'neutral', '2014-12-12', '11 rue des buttes - 94000 Créteil. ', '', '', 'Петък', 1, 3, 9, NULL),
(78, '1-1-15', 'Франция', '85280', '33 (0)2 51 98 33 34', '', 'Ралица', 'Zellige', '1.00', 'neutral', '2015-01-06', 'Pollen 61 zone industrielle du Bois imbert 85280 La Ferrière Téléphone : 33 (0)2 51 98 33 34', '', 'кашони на европале\r\n', 'Петък', 0, 4, NULL, NULL),
(79, '1-3-15', 'Франция', '13200', '', '', 'Краси', 'De l''éclat ', '1.00', 'neutral', '2015-01-20', 'Harmonia Mundi Le Mas de Vert, Quai No.2 , Ancienne Route de St-Gilles, 13200 ARLES', 'predi 12h - pove4e ot office e, prepe4atka po reklamatzia!!!!', 'Кашони на европале', 'Четвъртък', 1, 5, NULL, NULL),
(80, '2-3-15', 'Франция', '27600', '02.32.77.47.75', '', 'Краси', 'La Muette', '1.00', 'neutral', '2015-01-25', 'Les Belles Lettres 4, route du Plan d’eau | 27600 Gaillon TEL : 02.32.77.47.75', '', '', 'Петък', 0, 5, NULL, NULL),
(81, '3-3-15', 'Франция', '33310', '', '', 'Краси', 'La Muette', '1.00', 'neutral', '2015-01-22', 'Le Bord de l’eau éditions Résidence Hautefort, 18 rue du Cdt Cousteau, 33310 Lormont ', '', '', 'Петък', 0, 5, NULL, NULL),
(82, '4-3-15', 'Белгия', '1190', '32 497 57 48 59', '', 'Краси', 'La Muette', '1.00', 'neutral', '2015-01-22', 'La Muette asbl – 12 avenue d’Uccle – 1190 Bruxelles  Tél. : ++32 497 57 48 59', '', '', 'Петък', 1, 5, NULL, NULL),
(83, '5-3-15', 'Белгия', '1348', '', '', 'Краси', 'La Muette', '1.00', 'neutral', '2015-01-22', 'Interforum Benelux FOND JEAN PAQUES 6, 1348 OTTIGNIES-LOUVAIN-LA-NEUVE, BELGIQUE', '', '\r\n', 'Петък', 0, 5, NULL, NULL),
(84, '6-3-15', 'Франция', '75003', '32497574859 ', '', 'Краси', 'La Muette', '1.00', 'neutral', '2015-01-23', 'DAVID BOUAZIZ - 6 rue des Francs Bourgeois 75003 Paris +32497574859 ', 'obajdane na Bruno Wajskop za dostavkata v Paris', '', 'Петък', 1, 5, NULL, NULL),
(85, '7-3-15', 'Франция', '13200', '', '', 'Краси', 'La ville brule ', '1.00', 'neutral', '2015-01-19', 'Harmonia Mundi Le Mas de Vert, Quai No.2 , Ancienne Route de St-Gilles, 13200 ARLES', 'predi 12h, office!', '', 'Четвъртък', 1, 5, NULL, NULL),
(86, '8-3-15', 'Франция', '93100', '01 42 87 29 15 06 40 75 38 18', '', 'Краси', 'La ville brule ', '1.00', 'neutral', '2015-01-20', 'éditions la ville brûle 36 rue Parmentier — 93100 Montreuil 01 42 87 29 15 06 40 75 38 18', '', '', 'Петък', 0, 5, NULL, NULL),
(87, '9-3-15', 'Франция', '75020', '01.40.33.69.69 ', '', 'Краси', 'PLG', '1.00', 'neutral', '2015-01-20', 'MAKASSAR 8 Rue Pelleport 75020 PARIS Téléphone : 01.40.33.69.69 ', '', '', 'Петък', 0, 5, NULL, NULL),
(88, '10-3-15', 'Франция', '75013', '01.53.95.33.00 ', '', 'Краси', 'PLG', '1.00', 'neutral', '2015-01-21', 'GDA Associés 28 Rue du Dessous-des-berges 75013 PARIS Téléphone : 01.53.95.33.00 ', '', '', 'Петък', 0, 5, NULL, NULL),
(89, '11-3-15', 'Франция', '13200', '', '', 'Краси', 'Vendémiaire', '1.00', 'neutral', '2015-01-19', 'Harmonia Mundi Le Mas de Vert, Quai No.2 , Ancienne Route de St-Gilles, 13200 ARLES', 'predi 12h - office\r\n', '', 'Четвъртък', 0, 5, NULL, NULL),
(90, '12-3-15', 'Франция', '75019', '', '', 'Краси', 'Vendémiaire', '1.00', 'neutral', '2015-01-21', 'Éditions Vendémiaire 155, rue de Belleville 75019 Paris', '', '', 'Петък', 0, 5, NULL, NULL),
(91, '13-3-15', 'Франция', '13200', '', '', 'Краси', 'Impressions nouvelles', '1.00', 'neutral', '2015-01-19', 'Harmonia Mundi Le Mas de Vert, Quai No.2 , Ancienne Route de St-Gilles, 13200 ARLES', 'predi 12h - office\r\n', '', 'Четвъртък', 0, 5, NULL, NULL),
(92, '14-3-15', 'Белгия', '1190', '', '', 'Краси', 'Impressions nouvelles', '1.00', 'neutral', '2015-01-22', ' IMPRESSIONS NOUVELLES 84 AVENUE ALBERT, 1190 BRUXELLES', ' Livraison du lundi au vendredi de 10 à 18 heures ', '', 'Петък', 0, 5, NULL, NULL),
(93, '1-4-15', 'Франция', '70360', '', '', 'Руми', 'AGRIEST', '1.00', 'neutral', NULL, 'AGRIEST – ZA de la Maze  70360 Scey-sur-Saône Flavie DA SILVA Tél. : 03 84 92 76 76', '', '', '', 4, 6, NULL, NULL),
(94, '2-4-15', 'Франция', '85200', '', '', 'Антония', 'FRANCE OREILLER', '1.00', 'neutral', NULL, 'ZI le verron 96 Rue du Fief Veillet 85200 LONGEVES Michel THOMAS 06.48.18.14.18', '', '', '', 1, 6, NULL, NULL),
(95, '3-4-15', 'Франция', '13200', '', '', 'Краси', 'Vendémiaire', '1.00', 'neutral', NULL, 'Harmonia Mundi Le Mas de Vert, Quai No.2 , Ancienne Route de St-Gilles, 13200 ARLES', '', '', '', 1, 6, NULL, NULL),
(96, '4-4-15', 'Франция', '75019', '', '', 'Краси', 'Vendémiaire', '1.00', 'neutral', NULL, 'Éditions Vendémiaire 155, rue de Belleville 75019 Paris', '', '', '', 1, 6, NULL, NULL),
(97, '5-4-15', 'Белгия', '1080', 'Thibault Carion (0474/60.50.69 ou 02/413.26.49 ', '', 'Краси', 'Impessions nouvelles', '1.00', 'neutral', NULL, 'Promotion des Lettres (Fédération Wallonie-Bruxelles) Rue Adolphe Lavallée 16 1080 Molenbeek  appeler Présent de 9h à 16h', 'Entrée : volet de garage bleu au carrefour de la rue Lavallée et de la rue Courtois Devant le volet,', '', '', 0, 6, NULL, NULL),
(98, '6-4-15', 'Франция', '13200', '', '', 'Краси', 'Impessions nouvelles', '1.00', 'neutral', NULL, 'Harmonia Mundi Le Mas de Vert, Ancienne Route de St-Gilles, 13200 ARLES', '', '', '', 0, 6, NULL, NULL),
(99, '7-4-15', 'Белгия', '1190', '', '', 'Краси', 'Impessions nouvelles', '1.00', 'neutral', NULL, 'AUX IMPRESSIONS NOUVELLES 84 AVENUE ALBERT, 1190 BRUXELLES Livraison du lundi au vendredi de 10 à 18 heures', '', '', '', 3, 6, NULL, NULL),
(100, '8-4-15', 'Франция', '27600', '', '', 'Краси', 'Prairies ordinaires', '1.00', 'neutral', NULL, 'Belles Lettres, 4 route du Plan d''Eau, 27600 Gaillon', '', '', '', 0, 6, NULL, NULL),
(101, '9-4-15', 'Франция', '75007', '', '', 'Краси', 'Prairies ordinaires', '1.00', 'neutral', NULL, 'Louise Guilbaud, Les Prairies ordinaires, 1 avenue de Ségur, 75007 Paris. Code porte 34B56, interphone Claude Guilbaud, 4° étage face, tel +33 6 09 16 51 55', '', '', '', 0, 6, NULL, NULL),
(102, '10-4-15', 'Франция', '23220', '', '', 'Краси', 'Dixit', '1.00', 'neutral', NULL, 'DILISCO - Rue du limousin – 23220 – Chéniers', '', '', '', 0, 6, NULL, NULL),
(103, '11-4-15', 'Франция', '75009', '', '', 'Краси', 'Dixit', '1.00', 'neutral', NULL, 'DIXIT - 35 rue de Châteaudun 75009 – Paris – tel.Tel : +33 1 49 70 89 96', '', '', '', 0, 6, NULL, NULL),
(104, '12-4-15', 'Франция', '27600', '', '', 'Краси', 'Lignes', '1.00', 'neutral', NULL, 'BLDD Centre d’expédition 4, route du plan d’eau 27600 Gaillon Tel : 02.32.21.86.55', '', '', '', 0, 6, NULL, NULL),
(105, '13-4-15', 'Франция', '76400', '', '', 'Краси', 'Lignes', '1.00', 'neutral', NULL, 'Nel Sarl 90 quai Maupassant 76400 Fécamp 06 08 88 36 33', '', '', '', 0, 6, NULL, NULL),
(106, '14-4-15', 'Франция', '91000', '', '', 'Краси', 'La rumeur libre', '1.00', 'neutral', NULL, '1 Place de la Résistance 91000 Evry +33668751718 (M. Iacovella)', 'à l''attention d''Andrea Iacovella (directeur-adjoint) Ecole Nationale Supérieure d''Informatique pour l''Industrie et l''Entreprise (ENSIIE', '', '', 0, 6, NULL, NULL),
(107, '15-4-15', 'Франция', '23220', '', '', 'Краси', 'Graines 2', '1.00', 'neutral', NULL, 'DILISCO - Rue du limousin – 23220 – Chéniers', '', '', '', 0, 6, NULL, NULL),
(108, '16-4-15', 'Франция', '78240', '', '', 'Краси', 'Graines 2', '1.00', 'neutral', NULL, 'Editions Graine 2 49,rue de Montaigu 78240 Chambourcy Tél.: 0130064026', '', '', '', 0, 6, NULL, NULL),
(109, '17-4-15', 'Франция', '38000', '', '', 'Краси', 'Thaddée', '1.00', 'neutral', NULL, 'Monsieur ou Madame Marderos 6 rue Charles Lory 38000 GRENOBLE tél. mobile : +33 6 75 12 79 19 fixe : +33 4 76 96 56 70', '', '', '', 0, 6, NULL, NULL),
(110, '18-4-15', 'Франция', '62110', '', '', 'Ралица Креси', 'GROUPE NORMAND', '1.00', 'urgent', NULL, 'Société Normand OPTEX 117 bld Eugène Thomas 62110 Hénin Beaumont Tél 03 91 83 00 81 GRYNIEWICZ Sylvain sgryniew@groupe-normand.com', '', '', '', 1, 6, NULL, ''),
(111, '19-4-15', 'Швейцария', '1030', '', '', 'Ралица Креси / Кристоф', 'HELICE HELAS', '1.00', 'very_important', NULL, 'TNT Swiss Post SA route de Renens 1A 1030 Bussigny-près-Lausanne Téléphone: 0800 55 55 55', '', '', '', 1, 6, NULL, NULL),
(112, '20-4-15', 'Франция', '75006', '', '', 'Ралица Креси', 'AMES D''ATALA', '1.00', 'neutral', '2015-05-13', '5 rue Férou 75006 zamdatala@hotmail.com 0033 3 20 55 26 64', '', '', '', 3, 6, NULL, ''),
(113, '1-27-15', 'Франция', '77400', '+33160079743', '', 'Dora', 'Artege', '1.00', 'very_important', '2015-07-06', '128, av. Marechal de Lattre de Tassigny', '', 'Sreshta ponedelnik 13:30h / Nomer na sreshtata: 28D17', '03.07.2015', 1, 7, 1, ''),
(114, '2-27-15', 'Франция', '94350', '336 82 84 95 38', 'laurence.dufour@miroirauxtroubles.fr', 'Ralitza Cressy', 'Mirroir aux troubles', '1.00', 'neutral', '2015-07-07', 'Madame Laurence Dufour ,10 bis boulevard Aristide Briand ', '', '', '07.07.2015', 2, 7, 4, ''),
(115, '3-27-15', 'Франция', '78240', '33130064026', '', '', 'Graine 2', '1.00', 'neutral', NULL, 'Editions Graine 2 49,rue de Montaigu 78240 Chambourcy ', '', '', '', 1, 7, 3, ''),
(116, '4-27-15', 'Франция', '83300', '336 33 50 34 48 ', 'fabrice.pinatel@gmail.com', 'Ralitza Cressy', 'Autour du Monde', '1.00', 'neutral', '2015-07-14', 'Fabrice Pinatel, 1315 chemin du Cas ', '', 'Dostaveno', '', 2, 7, 1, ''),
(117, '5-27-15', '', '', '', '', '', '', '1.00', 'neutral', NULL, '', '', 'DOSTAVENO\r\n', '', 0, 7, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `bookspackagehistory`
--

CREATE TABLE IF NOT EXISTS `bookspackagehistory` (
  `Id` int(11) NOT NULL,
  `LastModification` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Country` varchar(50) DEFAULT NULL,
  `PostalCode` varchar(15) DEFAULT NULL,
  `PhoneNumber` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Merchant` varchar(30) DEFAULT NULL,
  `Client` varchar(100) DEFAULT NULL,
  `PricePerKilogram` decimal(7,2) DEFAULT '1.00',
  `Priority` varchar(30) DEFAULT NULL,
  `DeliveryDate` date DEFAULT NULL,
  `DeliveryAddress` varchar(500) DEFAULT NULL,
  `RemarksSales` varchar(1000) DEFAULT NULL,
  `RemarksLogistics` varchar(1000) DEFAULT NULL,
  `PrintDeliveryDay` varchar(20) DEFAULT NULL,
  `TruckGroupName` varchar(100) DEFAULT NULL,
  `PackageId` int(11) NOT NULL,
  `LoadingDay` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bookspackagehistory`
--

INSERT INTO `bookspackagehistory` (`Id`, `LastModification`, `Country`, `PostalCode`, `PhoneNumber`, `Email`, `Merchant`, `Client`, `PricePerKilogram`, `Priority`, `DeliveryDate`, `DeliveryAddress`, `RemarksSales`, `RemarksLogistics`, `PrintDeliveryDay`, `TruckGroupName`, `PackageId`, `LoadingDay`) VALUES
(3, '2014-11-25 12:55:03', 'Франция', '91160', '0169102610', '', 'Дена', 'Prividef', '1.00', NULL, '2014-12-04', 'Prividef 13-15 Chemin de Chilly Bâtiment C 91160 CHAMPLAN', '', 'Кашони на европале', 'Петък', NULL, 3, NULL),
(4, '2014-11-25 13:00:11', 'Франция', '41350', '02 54 55 50 50', '', 'Дена', 'Glyphe', '1.00', NULL, '2014-12-04', 'Daudin distribution 628, av. Du Grain d''or 41350 Vineuil', '', 'кашони на европале\r\n', 'Петък', NULL, 4, NULL),
(5, '2014-11-28 14:23:42', 'Франция', '75012', '01 53 33 06 23', '', 'Дена', 'Editions Glyphe', '1.00', NULL, '2014-12-03', 'Editions Glyphe - 85 avenue Ledru-Rollin. 75012 Paris Tél. ', '', 'в кашони', 'Петък', NULL, 5, NULL),
(6, '2014-11-28 14:26:33', 'Франция', '92638', '+33 1 46 85 40 54 /+33 146 85 40 35', '', 'Дена', 'Cress conseil', '1.00', NULL, '2014-12-03', 'MGF/Norbert dentressangle A l’attention de Lucibel 28 route du bassin N°6 CE367 92638 Gennevilliers ', 'office! Da ne se spomenava Pulsio, BOOKPRINT, BULGARIA,specialni etiketi, bon de livraison', '', 'Петък', NULL, 6, NULL),
(7, '2014-12-02 11:49:48', 'Франция', '91160', '', '', 'Дора', 'Chevre Feuille Etoilee', '1.00', NULL, '2014-12-08', 'Volumen SITE logistique LOGLIBRIS de BALLAINVILLIERS, Rue du Bel ébat, 91160 Ballainvilliers ', 'OFIS - VZEMETE SRESHTA MOLIA', 'Кашони на европале', 'Петък', NULL, 7, NULL),
(8, '2014-12-02 12:39:46', 'Франция', '34080', '', '', 'Дора', 'Chevre Feuille Etoilee', '1.00', NULL, '2014-12-11', 'Le clos de la Fontaine Bat B 65, cour Libéral Bruant rue Jacques Lemercier , 34080 Montpellier', 'Horaires de bureau : 8h30 -14h. Prévenir la veille', 'в кашони', 'Петък', NULL, 8, NULL),
(9, '2014-12-02 12:41:16', 'Франция', '91160', 'Tél : 04 67 73 75 45  ; 07 70 01 45 08', '', 'Дора', 'Chevre Feuille Etoilee', '1.00', NULL, '2014-12-08', 'Volumen SITE logistique LOGLIBRIS de BALLAINVILLIERS, Rue du Bel ébat, 91160 Ballainvilliers ', 'OFIS - VZEMETE SRESHTA MOLIA', 'Кашони на европале', 'Петък', NULL, 7, NULL),
(10, '2014-12-02 12:42:53', 'Франция', '75006', '', '', 'Дора', 'Chevre feuille etoilee', '1.00', NULL, '2014-12-07', '5 rue Ferou 75006 Paris', '', 'в кашони', 'Петък', NULL, 9, NULL),
(11, '2014-12-02 12:43:13', 'Франция', '91160', '', '', 'Дора', 'Chevre Feuille Etoilee', '1.00', NULL, '2014-12-08', 'Volumen SITE logistique LOGLIBRIS de BALLAINVILLIERS, Rue du Bel ébat, 91160 Ballainvilliers ', 'OFIS - VZEMETE SRESHTA MOLIA', 'Кашони на европале', 'Петък', NULL, 7, NULL),
(12, '2014-12-02 12:43:34', 'Франция', '34080', 'Tél : 04 67 73 75 45  ; 07 70 01 45 08', '', 'Дора', 'Chevre Feuille Etoilee', '1.00', NULL, '2014-12-11', 'Le clos de la Fontaine Bat B 65, cour Libéral Bruant rue Jacques Lemercier , 34080 Montpellier', 'Horaires de bureau : 8h30 -14h. Prévenir la veille', 'в кашони', 'Петък', NULL, 8, NULL),
(13, '2014-12-02 12:45:07', 'Франция', '13200', 'Tel : 04.90.49.90.49', '', 'Дора', 'ActuSf', '1.00', NULL, '2014-12-08', 'Harmonia Mundi, quai n° 2,Le Mas De Vert, Petite Route de St-Gilles, 13200 Arles ', 'OFIS', 'Кашони на европале', 'Четвъртък', NULL, 10, NULL),
(14, '2014-12-02 12:46:44', 'франция', '58800', '0386200517', '', 'Дора', 'EDITIONS DE L''AUBE', '1.00', NULL, '2014-12-09', 'TéATr''éPROUVèTe L''Abbaye du Jouïr 58800-CORBIGNY ', '', 'в кашони', 'Четвъртък', NULL, 11, NULL),
(15, '2014-12-02 12:48:08', 'Франция', '92120', '01 46 56 18 77 ', '', 'Дора', 'EDITIONS DE L''AUBE', '1.00', NULL, '2014-12-08', 'Le Dissez 8 rue de Sévigné, 92120 Montrouge, ', '', 'в кашони', 'Четвъртък', NULL, 12, NULL),
(16, '2014-12-02 12:50:21', 'Франция', '13200', 'Tel : 04.90.49.90.49 ', '', 'Дора', 'EDITIONS DE L''AUBE', '1.00', NULL, '2014-12-08', 'Harmonia Mundi, quai n° 2, Le Mas De Vert, Petite Route de St-Gilles, 13200 Arles ', 'OFIS', 'кашони на европале\r\n', 'Четвъртък', NULL, 13, NULL),
(17, '2014-12-02 12:52:05', 'Франция', '84240', '', '', 'Дора', 'EDITIONS DE L''AUBE', '1.00', NULL, NULL, 'Aube - Rue Amédée Giniès 84240 La Tour d''Aigues', 'доставка макс бързо', 'кашони на европале\r\n', 'Четвъртък', NULL, 14, NULL),
(18, '2014-12-02 12:53:49', 'Франция', '75127', ' Nathalie Leroux. 01 44 58 24 40', '', 'Дора', 'EDITIONS DE L''AUBE', '1.00', NULL, '2014-12-09', 'IHEDATE Maison des Ponts 15, Rue de la Fontaine au Roi 75127 Paris cedex 11', '', 'в кашони', 'Четвъртък', NULL, 15, NULL),
(19, '2014-12-02 12:56:02', 'Франция', '13200', 'Tel : 04.90.49.90.49', '', 'Дора', 'EDITIONS DE L''AUBE', '1.00', NULL, '2014-12-08', 'Harmonia Mundi, Le Mas De Vert, Petite Route de St-Gilles, 13200 Arles  ', 'OFIS- zaradi dobaveniat otdolu text go pi6e pak . Préciser sur les cartons : à l''attention de Violette Tastet', 'кашони на европале', 'четвъртък', NULL, 16, NULL),
(20, '2014-12-02 12:57:49', 'Франция', '13310', 'Mon téléphone est 06 58 03 69 29 ', '', 'Дора', 'Jean Marie Desbois', '1.00', NULL, '2014-12-11', 'Jean Marie Desbois, 4, impasse des Costières 13310 Saint-Martin-de-Crau ', 'Je serai présent. ima sabitie', 'кашони на европале', 'Петък', NULL, 17, NULL),
(21, '2014-12-02 13:11:43', 'Белгия', '1210 - Belgique', '', '', 'Дора', 'Trames = Jérôme Poloczek', '1.00', NULL, '2014-12-11', '37,  Rue de la charité 1210 Bruxelles ; Belgique', '', 'в кашони', 'Петък', NULL, 18, NULL),
(22, '2014-12-02 13:13:27', 'Франция', '93100', '0753773106', '', 'Дора', 'Patrick Mbeko', '1.00', NULL, '2014-12-10', '171 rue Saint-Denis apprt 309  93100 Montreuil ; tel 07 53 77 31 06 ', 'ima sabitie', 'в кашони', 'Петък', NULL, 19, NULL),
(23, '2014-12-02 13:20:54', 'Франция', '75015', ' TEL - 01 83 64 28 27 - VELINA -BALGARKA*', '', 'Дора', 'Clio', '1.00', NULL, '2014-12-11', '34 rue du Hameau , 75015 Paris , ', 'RABOTNO VREME- entre 10h et 17h, en dehors de ces horaires il est peu probable qu''il y ait quelqu''un au rez-de-chaussée; Le transporteur peut sonner au fond du couloir au N 34 où se trouvent les bureaux de Clio ou à la boutique qui est juste à côté.', 'в кашони', 'петък', NULL, 20, NULL),
(26, '2014-12-02 13:44:55', 'Франция', '31750', 'Tel : 05 61 00 09 99', '', 'Дора', 'FORTUNA', '1.00', NULL, '2014-12-12', 'DG diffusion ZI de Bogues 31750 ESCALQUENS', ' - rabotno  vreme ot ponedelnik do petak ot  8H30 do12H30 i ot 14H do  17H', 'кашони на европале', 'петък', NULL, 23, NULL),
(27, '2014-12-02 13:46:14', 'Франция', '31750', 'Tel : 05 61 00 09 99', '', 'Дора', 'FORTUNA', '1.00', NULL, '2014-12-12', 'DG diffusion ZI de Bogues 31750 ESCALQUENS', 'ofis  - rabotno  vreme ot ponedelnik do petak ot  8H30 do12H30 i ot 14H do  17H', 'кашони на европале', 'петък', NULL, 23, NULL),
(28, '2014-12-02 13:46:35', 'Франция', '75009', '', '', 'Дора', 'FORTUNA', '1.00', NULL, '2014-12-12', 'Mr Michalon 8 bd de la Madeleine 75009 Paris ', '-mogat DA SE OSTAVQT NA PAZACHA', 'в кашони', 'петък', NULL, 24, NULL),
(29, '2014-12-02 13:48:04', 'Франция', '83040', 'Tél : 06 18 46 05 89 ', '', 'Дора', 'Mr Johan Livernette ', '1.00', NULL, '2014-12-12', 'Livernette Johan BP 30042 83040 Toulon cedex 9 ; ', '', 'кашони на европале', 'Петък', NULL, 25, NULL),
(30, '2014-12-04 07:08:35', 'France', '72560', '02.43.75.47.98 ou 06.76.59.36.07 ', '', 'Dora', 'Mr Johan Livernette', '1.00', NULL, '2014-12-12', 'Culture pour Tous Lieu dit les Chalottières 72560 CHANGE ', '', 'Horaires de livraison: de 09h00 à 12h00 du lundi au vendredi', 'Petyk', NULL, 26, NULL),
(31, '2014-12-04 07:10:30', 'France', '91151', ' Téléphone : 01 69 92 03 62', '', 'Дора', 'Mr Johan Livernette', '1.00', NULL, '2014-12-12', 'Laurent Glauzy BP 25 91151 Etampes cedex', '', '', 'Петък', NULL, 27, NULL),
(32, '2014-12-04 07:10:48', 'France', '72560', '02.43.75.47.98 ou 06.76.59.36.07 ', '', 'Dora', 'Mr Johan Livernette', '1.00', NULL, '2014-12-12', 'Culture pour Tous Lieu dit les Chalottières 72560 CHANGE ', '', 'Horaires de livraison: de 09h00 à 12h00 du lundi au vendredi', 'Петък', NULL, 26, NULL),
(33, '2014-12-04 07:10:59', 'France', '72560', '02.43.75.47.98 ou 06.76.59.36.07 ', '', 'Дора', 'Mr Johan Livernette', '1.00', NULL, '2014-12-12', 'Culture pour Tous Lieu dit les Chalottières 72560 CHANGE ', '', 'Horaires de livraison: de 09h00 à 12h00 du lundi au vendredi', 'Петък', NULL, 26, NULL),
(34, '2014-12-04 07:11:17', 'Франция', '72560', '02.43.75.47.98 ou 06.76.59.36.07 ', '', 'Дора', 'Mr Johan Livernette', '1.00', NULL, '2014-12-12', 'Culture pour Tous Lieu dit les Chalottières 72560 CHANGE ', '', 'Horaires de livraison: de 09h00 à 12h00 du lundi au vendredi', 'Петък', NULL, 26, NULL),
(35, '2014-12-04 07:11:32', 'Франция', '91151', ' Téléphone : 01 69 92 03 62', '', 'Дора', 'Mr Johan Livernette', '1.00', NULL, '2014-12-12', 'Laurent Glauzy BP 25 91151 Etampes cedex', '', '', 'Петък', NULL, 27, NULL),
(36, '2014-12-04 07:12:55', 'Франция', '33410', 'tél : 05 56 76 73 38', '', 'Дора', 'Mr Johan Livernette', '1.00', NULL, '2014-12-12', 'Editions Saint-Rémi BP 80  ;  33410 Cadillac ', '', '', 'Петък', NULL, 28, NULL),
(37, '2014-12-04 07:14:03', 'Франция', '13016', 'Tél : 06 70 96 55 13', '', 'Дора', 'Mr Johan Livernette', '1.00', NULL, '2014-12-12', 'Editions Fiat Lux 26, boulevard Jean Labro 13016 Marseille ; ', '', '', 'Петък', NULL, 29, NULL),
(38, '2014-12-04 07:15:00', 'Франция', '33000', 'Tél : 06 11 04 82 59', '', 'Дора', 'Mr Johan Livernette', '1.00', NULL, '2014-12-12', 'Librairie Saint-Jacmes 55, rue Saint-James 33000 Bordeaux ; ', '', '', 'Петък', NULL, 30, NULL),
(39, '2014-12-04 07:16:00', 'Франция', '75013', '01 53 34 97 97', '', 'Дора', 'Mr Johan Livernette', '1.00', NULL, '2014-12-12', 'Editions des Tuileries 82, boulevard Masséna Tour Ancone 75013 Paris', '', '', 'Петък', NULL, 31, NULL),
(40, '2014-12-04 07:17:04', 'Франция', '75020', 'Tél : 01 40 33 69 69', '', 'Дора', 'MURMURE', '1.00', NULL, '2014-12-09', 'MAKASSAR Vincent dodivers 8 rue Pelleport 75020 PARIS ', 'ofis- prendre RDV', '', 'Петък', NULL, 32, NULL),
(41, '2014-12-04 07:18:17', 'Франция', '21800', 'tel : 03 80 47 06 51', 'Mél : demartis@yahoo.fr ; ', 'Дора', 'MURMURE', '1.00', NULL, '2014-12-11', 'David Demartis Editions du Murmure 9, allée des Marronniers 21800 Neuilly-les-Dijon ', '', '', 'Петък', NULL, 33, NULL),
(42, '2014-12-04 07:19:48', 'Франция', '75010', 'Tel : 01 42 46 24 02', '', 'Дора', 'Sarbacane ', '1.00', NULL, '2014-12-10', 'Éditions Sarbacane 35, rue d''Hauteville  ; 75010 Paris ', '(Téléphoner 72 HEURES AVANT LA LIVRAISON pour une prise de rendez-vous indispensable, afin de limiter l''attente des chauffeurs)', 'Horaires de livraison : 9h30 - 12h00 ; 14h30 -18h00', 'Петък', NULL, 34, NULL),
(43, '2014-12-04 07:21:06', 'Франция', '45300', 'Tel : 02 38 39 49 33 ou 02 38 39 00 43', 'Email : reception@union-distribution.fr', 'Дора', 'Sarbacane', '1.00', NULL, '2014-12-10', 'UD - Union Distribution Entrée livres neufs  6, rue de l''Europe ; 45300 Sermaises \r\n', '', 'Horaires de livraison : 8h00 - 12h00 ; 13h00 - 17h00', 'Петък', NULL, 35, NULL),
(44, '2014-12-04 07:23:41', 'Франция', '33570', 'TEL :  05 57 55 14 TEL Maitre de chai : 06 82 13 41 08', '', 'Дора', 'CONFLUENCES', '1.00', NULL, '2014-12-15', 'VIGNOBLES JL SYLVAIN CHATEAU LA PERRIERE 33570 LUSSAC ', 'maxi na 15/12/2104 do kraia na denia', '', 'Вторник', NULL, 36, NULL),
(45, '2014-12-04 07:25:01', 'Франция', '77400', '', '', 'Дора', 'Artege', '1.00', NULL, '2014-12-15', 'SODIS Distribution 128, av. Marechal de Lattre de Tassigny 77400 Lagny sur Marne', 'ne e ofis , no e dobre na 15/12/2014', '', 'Вторник', NULL, 37, NULL),
(46, '2014-12-04 07:26:10', 'Франция', '66000', '', '', 'Дора', 'Artege', '1.00', NULL, NULL, 'Fulco-Luis DE ALMENARA- Artège Groupe – 9, espace Méditerranée, 66000 PERPIGNAN', '', 'PO PO6TATA', 'Вторник', NULL, 38, NULL),
(47, '2014-12-04 07:27:52', 'Франция', '13200', '', '', 'Краси', 'Vendémiaire', '1.00', NULL, '2014-12-15', 'Harmonia Mundi Le Mas de Vert, Ancienne Route de St-Gilles, 13200 ARLES', '', '', 'Петък', NULL, 39, NULL),
(48, '2014-12-04 07:28:51', 'Франция', '75019', '', '', 'Краси', 'Vendémiaire', '1.00', NULL, '2014-12-11', 'Véronique Sales Éditions Vendémiaire 155, rue de Belleville 75019 Paris', '', '', 'Петък', NULL, 40, NULL),
(49, '2014-12-04 07:29:57', 'Франция', '27600', 'TEL : 02.32.77.47.75', '', 'Краси', 'BDL', '1.00', NULL, '2014-12-15', 'Les Belles Lettres 4, route du Plan d’eau | 27600 Gaillon ', 'office!', '', 'Петък', NULL, 41, NULL),
(50, '2014-12-04 07:31:03', 'Франция', '33310', '', '', 'Краси', 'BDL', '1.00', NULL, '2014-12-12', 'Le Bord de l’eau éditions Résidence Hautefort, 18 rue du Cdt Cousteau, 33310 Lormont', '', '', 'Петък', NULL, 42, NULL),
(51, '2014-12-04 07:32:46', 'Белгия', '1348', '', '', 'Краси', 'BDL', '1.00', NULL, '2014-12-12', 'Interforum Benelux FOND JEAN PAQUES 6, 1348 OTTIGNIES-LOUVAIN-LA-NEUVE, BELGIQUE', '', '', 'Петък', NULL, 43, NULL),
(52, '2014-12-04 07:34:15', 'Франция', '13200', '', '', 'Краси', 'Impressions nouvelles', '1.00', NULL, '2014-12-08', 'Harmonia Mundi Le Mas de Vert, Ancienne Route de St-Gilles, 13200 ARLES', 'office', '', 'Петък', NULL, 44, NULL),
(53, '2014-12-04 07:35:08', 'Белгия', '1190', '', '', 'Краси', 'Impressions nouvelles', '1.00', NULL, '2014-12-12', 'AUX IMPRESSIONS NOUVELLES 84 AVENUE ALBERT, 1190 BRUXELLES ', '', 'Livraison du lundi au vendredi de 10 à 18 heures', 'Петък', NULL, 45, NULL),
(54, '2014-12-04 07:36:30', 'Франция', '93400', '06 52 67 45 52', '', 'Краси', 'Une autre image', '1.00', NULL, '2014-12-11', 'Boris Hurtel 9, rue Godillot 93400 Saint-Ouen ', '', '', 'Петък', NULL, 46, NULL),
(55, '2014-12-04 07:37:32', 'Франция', '44000', 'tel/06 83 54 38 78', '', 'Краси', 'Guillaume Belhomme', '1.00', NULL, '2014-12-12', 'GUILLAUME BELHOMME 7, BOULEVARD GABRIEL GUIST''HAU 44000 NANTES  ', '', '', 'Петък', NULL, 47, NULL),
(56, '2014-12-04 07:42:25', 'Франция', '94450', '+33 6 78 81 86 28', '', 'Краси', 'Ruben Valensi /Lasso shoes', '1.00', NULL, '2014-12-12', 'ESAT Sellerie Parisienne 16, Avenue Descartes 94450 Limeil Brévannes ', '', '', 'Петък', NULL, 48, NULL),
(57, '2014-12-04 07:43:35', 'Франция', '77400', '', '', 'Краси', 'Jerome do Bentzinger', '1.00', NULL, '2014-12-09', 'SODIS Quai Réception 128 avenue du Maréchal De Lattre de Tassigny 77400 Lagny', 'ne e office', '', 'Петък', NULL, 49, NULL),
(58, '2014-12-04 07:44:23', 'Франция', '68000', 'Tél 03 89 24 19 74', '', 'Краси', 'Jerome do Bentzinger', '1.00', NULL, '2014-12-10', 'Jérôme Do. Bentzinger Editeur 8, rue Roesselmann 68000 Colmar , ', '', '', 'Петък', NULL, 50, NULL),
(59, '2014-12-04 07:45:48', 'Франция', '85280', '(Contact : 02 51 98 33 34)', '', 'Радо', 'MEO-éditions', '1.00', NULL, '2014-12-12', 'POLLEN-LITTERAL-DIFFUSION-DISTRIBUTION 33 ZI DU BOIS IMBERT 85280 LA FERRIERE ', '', '', 'Петък', NULL, 51, NULL),
(60, '2014-12-04 07:46:48', 'Белгия', '1050', 'Contact : 32 2 648 04 10)', '', 'Радо', 'MEO-éditions', '1.00', NULL, '2014-12-12', 'M.E.O. Avenue Jeanne 10 bte 5 1050 BRUXELLES ', '', '', 'Петък', NULL, 52, NULL),
(61, '2014-12-04 07:47:48', 'Франция', '75010', '(0611784287 / 0952918645 Johnathan Magidoff)', '', 'Радо', 'Fahrenheit', '1.00', NULL, '2014-12-12', '16, rue de Chabrol, 75010 Paris ', '', '', 'Петък', NULL, 53, NULL),
(62, '2014-12-04 07:50:40', 'Франция', '11200', '04 68 75 06 93', '', 'Радо', 'Sudedit', '1.00', NULL, '2014-12-12', '32, avenue de la mer 11200 Thézan des Corbières ', '', '', 'Петък', NULL, 54, NULL),
(63, '2014-12-04 07:51:51', 'Франция', '60000', 'TÉL: 03 44 06 46 87', '', 'Радо', 'Judena', '1.00', NULL, '2014-12-12', 'ADS Picardie pour ADLP partner PAE du Haut Villé Rue Bayard 60000 Beauvais  ', 'Les prévenir 48 heures avant la livraison', '', 'Петък', NULL, 55, NULL),
(64, '2014-12-04 07:53:26', 'Франция', '33130', 'tel. 05 56 85 23 51', '', 'Ралица', 'Torralba/ateliers graphiques de l''ardoisiere', '1.00', NULL, '2014-12-11', 'AGA 53 rue Carnot 33130 Begles - ', '', '', 'Петък', NULL, 56, NULL),
(65, '2014-12-04 07:54:27', 'Франция', '57000', 'Sébastien Wagner - tél +33660023922', '', 'Ралица', 'Paraiges', '1.00', NULL, '2014-12-11', '10 rue Mabille 57000 Metz', '', '', 'Петък', NULL, 57, NULL),
(66, '2014-12-04 07:57:25', 'Франция', '05400', 'Martine Garcin 06 84 01 37 09 ', '', 'Теа', 'Lelivredart', '1.00', NULL, '2014-12-12', 'Galerie GM 12 rue Jean-Jaurès 05400 Veynes ', 'Моля на кашоните да НЕ пише Pulsio. Може да пише само името на книгата+ISBN ', 'Prévoir un hayon (ou de dépalettiser dans le camion)', 'Петък', NULL, 58, NULL),
(67, '2014-12-04 07:58:30', 'Франция', '75011', '01 40 01 04 26', '', 'Теа', 'Lelivredart', '1.00', NULL, '2014-12-12', 'Lelivredart 113 bd Richard-Lenoir 75011 Paris ', ' à partir de 10h30', '', 'Петък', NULL, 59, NULL),
(68, '2014-12-04 07:59:48', 'Франция', '45300', 'Tel : 02 38 39 49 33 ou 02 38 39 00 43', 'Email : reception@union-distribution.fr', 'Теа', 'Picard ed.', '1.00', NULL, '2014-12-10', 'UD - Union Distribution Entrée livres neufs 6, rue de l''Europe 45300 Sermaises ', '', ' rabotno vreme :  8h00 - 12h00  13h00 - 17h00', 'Петък', NULL, 60, NULL),
(69, '2014-12-04 08:00:37', 'Франция', '75006', '01 43 26 95 45', '', 'Теа', 'Picard ed.', '1.00', NULL, '2014-12-10', 'Céline Hallien Éditions PICARD 82, rue Bonaparte 75006 Paris ', '', '', 'Петък', NULL, 61, NULL),
(70, '2014-12-04 08:01:27', 'Франция', '41350', 'Tel. : 02 54 55 50 50', '', 'Теа', 'Retour au sources', '1.00', NULL, '2014-12-12', 'Daudin distribution 628, av. Du Grain d''or 41350 Vineuil ', '', '', 'Петък', NULL, 62, NULL),
(71, '2014-12-04 08:03:17', 'Франция', '75018', 'contact: 33 1 42 23 56 02', '', 'Теа', 'Galaade', '1.00', NULL, '2014-12-08', '13 passage des Cloys 75018 Paris ', '', '9-12h; 13h30-18; ', 'Петък', NULL, 63, NULL),
(72, '2014-12-04 08:04:34', 'Франция', '13200', 'Tel : 04.90.49.90.49', '', 'Теа', 'Galaade', '1.00', NULL, '2014-12-08', 'Harmonia Mundi, quai n° 2, Le Mas De Vert, Petite Route de St-Gilles, 13200 Arles ', '', '', 'Петък', NULL, 64, NULL),
(73, '2014-12-04 08:08:14', 'Франция', '94370', 'Téléphone filaire : 01 45 90 14 42', '', 'Дена', 'Comexpo2A', '1.00', NULL, '2014-12-11', 'Musée de Sucy en Brie - Rue Du Temple 94370 - SUCY-EN-BRIE Téléphone filaire : 01 45 90 14 42', 'DA NE SE SPOMENAVA PULSIO, BG iBOOKPRINT', '', 'Петък', NULL, 65, NULL),
(74, '2014-12-04 08:11:33', 'Франция', '75012', 'Tél. 01 53 33 06 23', '', 'Дена', 'Glyphe', '1.00', NULL, '2014-12-10', 'Editions Glyphe - 85 avenue Ledru-Rollin. 75012 Paris ', '', '', 'Петък', NULL, 66, NULL),
(75, '2014-12-04 08:12:53', 'Франция', '41000', '06 37 72 42 39', '', 'Дена', 'Tatamis', '1.00', NULL, '2014-12-11', 'TATAMIS, 103 rue Albert 1er, 41000 Blois, France.', '', '', 'Петък', NULL, 67, NULL),
(76, '2014-12-04 08:14:46', 'Франция', '86190', '05 49 51 83 04', '', 'Дена', 'Tatamis', '1.00', NULL, '2014-12-11', 'DPF, Chemin de la Caillauderie, 86190 Chiré-en-Montreuil', '', '', 'Петък', NULL, 68, NULL),
(77, '2014-12-04 08:16:28', 'Франция', '41350', '02 54 55 50 50', '', 'Дена', 'Tatamis', '1.00', NULL, '2014-12-11', 'Daudin distribution 628, av. Du Grain d''or 41350 Vineuil ', '', '', 'Петък', NULL, 69, NULL),
(78, '2014-12-04 08:18:02', 'Франция', '93100', 'Tél. : +33 (0)1 70 32 32 78 / Mme Ana des Staal ', 'anadestaal@ithaque-editions.fr', 'Дена', 'Ithaque', '1.00', NULL, '2014-12-11', 'Les Editions d''Ithaque 4, rue Girard 93100 Montreuil-Sous-Bois France ', 'obajdane predi dostavka', '', 'Петък', NULL, 70, NULL),
(79, '2014-12-04 08:19:18', 'Франция', '41350', 'Tel. : 02 54 55 50 50', '', 'Дена', 'Ithaque', '1.00', NULL, '2014-12-11', 'Daudin distribution 628, av. Du Grain d''or 41350 Vineuil ', '', '', 'Петък', NULL, 71, NULL),
(80, '2014-12-04 08:20:51', 'Франция', '34350', 'Jacques Nain, 06 41 90 27 06, ', 'editions.aa@orange.fr', 'Дена', '2A', '1.00', NULL, '2014-12-11', 'Editions Auteurs d''Aujourd''hui, 5, rue de Stockholm, ZAE VIA EUROPA 34350 VENDRES. ', '', '', 'Петък', NULL, 72, NULL),
(81, '2014-12-04 08:23:01', 'Франция', '78360', 'Geneviève Bideau Tél. 01030712821', '', 'Марго', 'Ed Novalis', '1.00', NULL, '2014-12-12', 'Editions Novalis,15 rue Albert Joly, 78360 MONTESSON, ', '', '', 'Петък', NULL, 73, NULL),
(82, '2014-12-04 08:25:07', 'Франция', '91160', '01 69 10 89 96', '', 'Марго', 'Aaarg', '1.00', NULL, '2014-12-12', 'VOLUMEN, SITE logistique LOGLIBRIS de BALLAINVILLIERS Rue du Bel ébat, 91160 Ballainvilliers  ', 'HORAIRES DE RECEPTION Du lundi au vendredi de 7 heures à 16 heures 30', '', 'Петък', NULL, 74, NULL),
(83, '2014-12-04 08:26:23', 'Франция', '13006', 'Léa Guidi-Guidi 33624321197', '', 'Марго', 'Aaarg', '1.00', NULL, '2014-12-12', 'Bigger Boat / AAARG! 76 rue des trois frères Barthelemy 13006 Marseille ', '', '', 'Петък', NULL, 75, NULL),
(84, '2014-12-04 08:27:05', 'Франция', '75005', '06 86 95 37 06', '', '', 'SPM', '1.00', NULL, NULL, 'Eric Ledru SPM 16, rue des Ecoles 75005 Paris ', 'escalier B fond de la deuxième cour tout droit ', '', '', NULL, 76, NULL),
(85, '2014-12-04 08:27:52', 'Франция', '75005', '06 86 95 37 06', '', 'Марго', 'SPM', '1.00', NULL, '2014-12-12', 'Eric Ledru SPM 16, rue des Ecoles 75005 Paris ', 'escalier B fond de la deuxième cour tout droit ', '', 'Петък', NULL, 76, NULL),
(86, '2014-12-04 14:16:11', 'Франция', '05400', 'Martine Garcin 06 84 01 37 09 ', '', 'Теа', 'Lelivredart', '1.00', NULL, '2014-12-12', 'Galerie GM 12 rue Jean-Jaurès 05400 Veynes ', 'Моля на кашоните да НЕ пише Pulsio. Може да пише само името на книгата+ISBN ', 'да се предвиди камион с падащ борд', 'Петък', NULL, 58, NULL),
(87, '2014-12-04 20:59:40', 'Франция', '94000', '01 42 07 75 05', '', 'Теа', 'Mythologica', '1.00', NULL, '2014-12-12', '11 rue des buttes - 94000 Créteil. ', '', '', 'Петък', NULL, 77, NULL),
(88, '2015-01-08 20:22:38', 'Франция', '85280', '33 (0)2 51 98 33 34', '', 'Ралица', 'Zellige', '1.00', NULL, '2015-01-06', 'Pollen 61 zone industrielle du Bois imbert 85280 La Ferrière Téléphone : 33 (0)2 51 98 33 34', '', 'кашони на европале\r\n', 'Петък', NULL, 78, NULL),
(89, '2015-01-13 18:54:55', 'Франция', '94000', '01 42 07 75 05', '', 'Теа', 'Mythologica', '1.00', NULL, '2014-12-12', '11 rue des buttes - 94000 Créteil. ', '', '', 'Петък', '9', 77, NULL),
(90, '2015-01-13 18:55:20', 'Франция', '75005', '06 86 95 37 06', '', 'Марго', 'SPM', '1.00', NULL, '2014-12-12', 'Eric Ledru SPM 16, rue des Ecoles 75005 Paris ', 'escalier B fond de la deuxième cour tout droit ', '', 'Петък', '9', 76, NULL),
(91, '2015-01-13 18:55:36', 'Франция', '13006', 'Léa Guidi-Guidi 33624321197', '', 'Марго', 'Aaarg', '1.00', NULL, '2014-12-12', 'Bigger Boat / AAARG! 76 rue des trois frères Barthelemy 13006 Marseille ', '', '', 'Петък', '11', 75, NULL),
(92, '2015-01-13 18:56:06', 'Франция', '91160', '01 69 10 89 96', '', 'Марго', 'Aaarg', '1.00', NULL, '2014-12-12', 'VOLUMEN, SITE logistique LOGLIBRIS de BALLAINVILLIERS Rue du Bel ébat, 91160 Ballainvilliers  ', 'HORAIRES DE RECEPTION Du lundi au vendredi de 7 heures à 16 heures 30', '', 'Петък', '8', 74, NULL),
(93, '2015-01-13 18:56:19', 'Франция', '78360', 'Geneviève Bideau Tél. 01030712821', '', 'Марго', 'Ed Novalis', '1.00', NULL, '2014-12-12', 'Editions Novalis,15 rue Albert Joly, 78360 MONTESSON, ', '', '', 'Петък', '9', 73, NULL),
(94, '2015-01-13 18:56:44', 'Франция', '34350', 'Jacques Nain, 06 41 90 27 06, ', 'editions.aa@orange.fr', 'Дена', '2A', '1.00', NULL, '2014-12-11', 'Editions Auteurs d''Aujourd''hui, 5, rue de Stockholm, ZAE VIA EUROPA 34350 VENDRES. ', '', '', 'Петък', '6', 72, NULL),
(95, '2015-01-13 18:57:04', 'Франция', '41350', 'Tel. : 02 54 55 50 50', '', 'Дена', 'Ithaque', '1.00', NULL, '2014-12-11', 'Daudin distribution 628, av. Du Grain d''or 41350 Vineuil ', '', '', 'Петък', '3', 71, NULL),
(96, '2015-01-13 18:57:21', 'Франция', '93100', 'Tél. : +33 (0)1 70 32 32 78 / Mme Ana des Staal ', 'anadestaal@ithaque-editions.fr', 'Дена', 'Ithaque', '1.00', NULL, '2014-12-11', 'Les Editions d''Ithaque 4, rue Girard 93100 Montreuil-Sous-Bois France ', 'obajdane predi dostavka', '', 'Петък', '9', 70, NULL),
(97, '2015-01-13 18:57:29', 'Франция', '41350', '02 54 55 50 50', '', 'Дена', 'Tatamis', '1.00', NULL, '2014-12-11', 'Daudin distribution 628, av. Du Grain d''or 41350 Vineuil ', '', '', 'Петък', '3', 69, NULL),
(98, '2015-01-13 18:57:40', 'Франция', '86190', '05 49 51 83 04', '', 'Дена', 'Tatamis', '1.00', NULL, '2014-12-11', 'DPF, Chemin de la Caillauderie, 86190 Chiré-en-Montreuil', '', '', 'Петък', '6', 68, NULL),
(99, '2015-01-13 18:57:51', 'Франция', '41000', '06 37 72 42 39', '', 'Дена', 'Tatamis', '1.00', NULL, '2014-12-11', 'TATAMIS, 103 rue Albert 1er, 41000 Blois, France.', '', '', 'Петък', '3', 67, NULL),
(100, '2015-01-13 18:58:03', 'Франция', '75012', 'Tél. 01 53 33 06 23', '', 'Дена', 'Glyphe', '1.00', NULL, '2014-12-10', 'Editions Glyphe - 85 avenue Ledru-Rollin. 75012 Paris ', '', '', 'Петък', '10', 66, NULL),
(101, '2015-01-13 18:59:57', 'Франция', '94370', 'Téléphone filaire : 01 45 90 14 42', '', 'Дена', 'Comexpo2A', '1.00', NULL, '2014-12-11', 'Musée de Sucy en Brie - Rue Du Temple 94370 - SUCY-EN-BRIE Téléphone filaire : 01 45 90 14 42', 'DA NE SE SPOMENAVA PULSIO, BG iBOOKPRINT', '', 'Петък', '9', 65, NULL),
(102, '2015-01-13 19:00:07', 'Франция', '13200', 'Tel : 04.90.49.90.49', '', 'Теа', 'Galaade', '1.00', NULL, '2014-12-08', 'Harmonia Mundi, quai n° 2, Le Mas De Vert, Petite Route de St-Gilles, 13200 Arles ', '', '', 'Петък', '11', 64, NULL),
(103, '2015-01-13 19:00:17', 'Франция', '75018', 'contact: 33 1 42 23 56 02', '', 'Теа', 'Galaade', '1.00', NULL, '2014-12-08', '13 passage des Cloys 75018 Paris ', '', '9-12h; 13h30-18; ', 'Петък', '10', 63, NULL),
(104, '2015-01-13 19:00:26', 'Франция', '41350', 'Tel. : 02 54 55 50 50', '', 'Теа', 'Retour au sources', '1.00', NULL, '2014-12-12', 'Daudin distribution 628, av. Du Grain d''or 41350 Vineuil ', '', '', 'Петък', '3', 62, NULL),
(105, '2015-01-13 19:01:03', 'Франция', '75006', '01 43 26 95 45', '', 'Теа', 'Picard ed.', '1.00', NULL, '2014-12-10', 'Céline Hallien Éditions PICARD 82, rue Bonaparte 75006 Paris ', '', '', 'Петък', '10', 61, NULL),
(106, '2015-01-13 19:01:12', 'Франция', '45300', 'Tel : 02 38 39 49 33 ou 02 38 39 00 43', 'Email : reception@union-distribution.fr', 'Теа', 'Picard ed.', '1.00', NULL, '2014-12-10', 'UD - Union Distribution Entrée livres neufs 6, rue de l''Europe 45300 Sermaises ', '', ' rabotno vreme :  8h00 - 12h00  13h00 - 17h00', 'Петък', '8', 60, NULL),
(107, '2015-01-13 19:01:22', 'Франция', '75011', '01 40 01 04 26', '', 'Теа', 'Lelivredart', '1.00', NULL, '2014-12-12', 'Lelivredart 113 bd Richard-Lenoir 75011 Paris ', ' à partir de 10h30', '', 'Петък', '10', 59, NULL),
(108, '2015-01-13 19:01:50', 'Франция', '05400', 'Martine Garcin 06 84 01 37 09 ', '', 'Теа', 'Lelivredart', '1.00', NULL, '2014-12-12', 'Galerie GM 12 rue Jean-Jaurès 05400 Veynes ', 'Моля на кашоните да НЕ пише Pulsio. Може да пише само името на книгата+ISBN ', 'да се предвиди камион с падащ борд', 'Петък', '6', 58, NULL),
(109, '2015-01-13 19:02:06', 'Франция', '57000', 'Sébastien Wagner - tél +33660023922', '', 'Ралица', 'Paraiges', '1.00', NULL, '2014-12-11', '10 rue Mabille 57000 Metz', '', '', 'Петък', '10', 57, NULL),
(110, '2015-01-13 19:02:24', 'Франция', '33130', 'tel. 05 56 85 23 51', '', 'Ралица', 'Torralba/ateliers graphiques de l''ardoisiere', '1.00', NULL, '2014-12-11', 'AGA 53 rue Carnot 33130 Begles - ', '', '', 'Петък', '6', 56, NULL),
(111, '2015-01-13 19:02:33', 'Франция', '60000', 'TÉL: 03 44 06 46 87', '', 'Радо', 'Judena', '1.00', NULL, '2014-12-12', 'ADS Picardie pour ADLP partner PAE du Haut Villé Rue Bayard 60000 Beauvais  ', 'Les prévenir 48 heures avant la livraison', '', 'Петък', '1', 55, NULL),
(112, '2015-01-13 19:02:41', 'Франция', '11200', '04 68 75 06 93', '', 'Радо', 'Sudedit', '1.00', NULL, '2014-12-12', '32, avenue de la mer 11200 Thézan des Corbières ', '', '', 'Петък', '6', 54, NULL),
(113, '2015-01-15 12:12:03', '', '13200', '', '', '', '', '1.00', NULL, NULL, 'Harmonia Mundi Le Mas de Vert, Quai No.2 , Ancienne Route de St-Gilles, 13200 ARLES', '', '', '', NULL, 79, NULL),
(114, '2015-01-15 12:13:30', 'Франция', '13200', '', '', 'Краси', 'De l''éclat ', '1.00', NULL, '2015-01-20', 'Harmonia Mundi Le Mas de Vert, Quai No.2 , Ancienne Route de St-Gilles, 13200 ARLES', 'predi 12h - pove4e ot office e, prepe4atka po reklamatzia!!!!', 'Кашони на европале', 'Четвъртък', NULL, 79, NULL),
(115, '2015-01-15 12:15:41', 'Франция', '27600', '02.32.77.47.75', '', 'Краси', 'La Muette', '1.00', NULL, '2015-01-25', 'Les Belles Lettres 4, route du Plan d’eau | 27600 Gaillon TEL : 02.32.77.47.75', '', '', 'Петък', NULL, 80, NULL),
(116, '2015-01-15 12:16:56', 'Франция', '33310', '', '', 'Краси', 'La Muette', '1.00', NULL, '2015-01-22', 'Le Bord de l’eau éditions Résidence Hautefort, 18 rue du Cdt Cousteau, 33310 Lormont ', '', '', 'Петък', NULL, 81, NULL),
(117, '2015-01-15 12:18:21', 'Belgiq', '1190', '32 497 57 48 59', '', 'Краси', 'La Muette', '1.00', NULL, '2015-01-22', 'La Muette asbl – 12 avenue d’Uccle – 1190 Bruxelles  Tél. : ++32 497 57 48 59', '', '', 'Петък', NULL, 82, NULL),
(118, '2015-01-15 12:18:53', 'Белгия', '1190', '32 497 57 48 59', '', 'Краси', 'La Muette', '1.00', NULL, '2015-01-22', 'La Muette asbl – 12 avenue d’Uccle – 1190 Bruxelles  Tél. : ++32 497 57 48 59', '', '', 'Петък', NULL, 82, NULL),
(119, '2015-01-15 12:19:54', 'Белгия', '1348', '', '', 'Краси', 'La Muette', '1.00', NULL, '2015-01-22', 'Interforum Benelux FOND JEAN PAQUES 6, 1348 OTTIGNIES-LOUVAIN-LA-NEUVE, BELGIQUE', '', '\r\n', 'Петък', NULL, 83, NULL),
(120, '2015-01-15 12:21:08', 'Франция', '75003', '32497574859 ', '', 'Краси', 'La Muette', '1.00', NULL, '2015-01-22', 'DAVID BOUAZIZ - 6 rue des Francs Bourgeois 75003 Paris +32497574859 ', 'obajdane na Bruno Wajskop za dostavkata v Paris', '', 'Петък', NULL, 84, NULL),
(121, '2015-01-15 12:21:37', 'Франция', '13200', '', '', '', 'La ville brule ', '1.00', NULL, NULL, 'Harmonia Mundi Le Mas de Vert, Quai No.2 , Ancienne Route de St-Gilles, 13200 ARLES', '', '', '', NULL, 85, NULL),
(122, '2015-01-15 12:22:46', 'Франция', '13200', '', '', 'Краси', 'La ville brule ', '1.00', NULL, '2015-01-19', 'Harmonia Mundi Le Mas de Vert, Quai No.2 , Ancienne Route de St-Gilles, 13200 ARLES', 'predi 12h, office!', '', 'Четвъртък', NULL, 85, NULL),
(123, '2015-01-15 12:23:02', 'Франция', '75003', '32497574859 ', '', 'Краси', 'La Muette', '1.00', NULL, '2015-01-23', 'DAVID BOUAZIZ - 6 rue des Francs Bourgeois 75003 Paris +32497574859 ', 'obajdane na Bruno Wajskop za dostavkata v Paris', '', 'Петък', NULL, 84, NULL),
(124, '2015-01-15 12:24:06', 'Франция', '93100', '01 42 87 29 15 06 40 75 38 18', '', 'Краси', 'La ville brule ', '1.00', NULL, '2015-01-20', 'éditions la ville brûle 36 rue Parmentier — 93100 Montreuil 01 42 87 29 15 06 40 75 38 18', '', '', 'Петък', NULL, 86, NULL),
(125, '2015-01-15 12:25:08', 'Франция', '75020', '01.40.33.69.69 ', '', 'Краси', 'PLG', '1.00', NULL, '2015-01-20', 'MAKASSAR 8 Rue Pelleport 75020 PARIS Téléphone : 01.40.33.69.69 ', '', '', 'Петък', NULL, 87, NULL),
(126, '2015-01-15 12:28:46', 'Франция', '75013', '01.53.95.33.00 ', '', 'Краси', 'PLG', '1.00', NULL, '2015-01-21', 'GDA Associés 28 Rue du Dessous-des-berges 75013 PARIS Téléphone : 01.53.95.33.00 ', '', '', 'Петък', NULL, 88, NULL),
(127, '2015-01-15 12:30:00', 'Франция', '13200', '', '', 'Краси', 'Vendémiaire', '1.00', NULL, '2015-01-19', 'Harmonia Mundi Le Mas de Vert, Quai No.2 , Ancienne Route de St-Gilles, 13200 ARLES', 'predi 12h - office\r\n', '', 'Четвъртък', NULL, 89, NULL),
(128, '2015-01-15 12:30:50', 'Франция', '75019', '', '', 'Краси', 'Vendémiaire', '1.00', NULL, '2015-01-21', 'Éditions Vendémiaire 155, rue de Belleville 75019 Paris', '', '', 'Петък', NULL, 90, NULL),
(129, '2015-01-15 12:31:24', 'Франция', '13200', '', '', 'Краси', 'Impressions nouvelles', '1.00', NULL, '2015-01-19', 'Harmonia Mundi Le Mas de Vert, Quai No.2 , Ancienne Route de St-Gilles, 13200 ARLES', 'predi 12h - office\r\n', '', 'Четвъртък', NULL, 91, NULL),
(130, '2015-01-15 12:32:28', 'Белгия', '1190', '', '', 'Краси', 'Impressions nouvelles', '1.00', NULL, '2015-01-22', ' IMPRESSIONS NOUVELLES 84 AVENUE ALBERT, 1190 BRUXELLES', ' Livraison du lundi au vendredi de 10 à 18 heures ', '', 'Петък', NULL, 92, NULL),
(131, '2015-01-22 04:54:04', 'France', '70360', '', '', '', 'AGRIEST', '1.00', NULL, NULL, '', '', '', '', NULL, 93, NULL),
(132, '2015-01-22 04:55:12', 'France', '85200', '', '', 'Antonia', 'FRANCE OREILLER', '1.00', NULL, NULL, 'ZI le verron 96 Rue du Fief Veillet 85200 LONGEVES Michel THOMAS 06.48.18.14.18', '', '', '', NULL, 94, NULL),
(133, '2015-01-22 04:55:28', 'France', '70360', '', '', '', 'AGRIEST', '1.00', NULL, NULL, 'AGRIEST – ZA de la Maze  70360 Scey-sur-Saône Flavie DA SILVA Tél. : 03 84 92 76 76', '', '', '', NULL, 93, NULL),
(134, '2015-01-22 04:56:29', 'France', '13200', '', '', 'Krasi', 'Vendémiaire', '1.00', NULL, NULL, 'Harmonia Mundi Le Mas de Vert, Quai No.2 , Ancienne Route de St-Gilles, 13200 ARLES', '', '', '', NULL, 95, NULL),
(135, '2015-01-22 04:57:17', 'France', '75019', '', '', 'Krasi', 'Vendémiaire', '1.00', NULL, NULL, 'Éditions Vendémiaire 155, rue de Belleville 75019 Paris', '', '', '', NULL, 96, NULL),
(136, '2015-01-22 04:57:37', 'France', '70360', '', '', 'Roumi', 'AGRIEST', '1.00', NULL, NULL, 'AGRIEST – ZA de la Maze  70360 Scey-sur-Saône Flavie DA SILVA Tél. : 03 84 92 76 76', '', '', '', NULL, 93, NULL),
(137, '2015-01-22 04:59:33', 'Белгия', '1080', 'Thibault Carion (0474/60.50.69 ou 02/413.26.49 ', '', 'Краси', 'Impessions nouvelles', '1.00', NULL, NULL, 'Promotion des Lettres (Fédération Wallonie-Bruxelles) Rue Adolphe Lavallée 16 1080 Molenbeek  appeler Présent de 9h à 16h', 'Entrée : volet de garage bleu au carrefour de la rue Lavallée et de la rue Courtois Devant le volet,', '', '', NULL, 97, NULL),
(138, '2015-01-22 04:59:45', 'France', '70360', '', '', 'Руми', 'AGRIEST', '1.00', NULL, NULL, 'AGRIEST – ZA de la Maze  70360 Scey-sur-Saône Flavie DA SILVA Tél. : 03 84 92 76 76', '', '', '', NULL, 93, NULL),
(139, '2015-01-22 05:00:10', 'Франция', '85200', '', '', 'Антония', 'FRANCE OREILLER', '1.00', NULL, NULL, 'ZI le verron 96 Rue du Fief Veillet 85200 LONGEVES Michel THOMAS 06.48.18.14.18', '', '', '', NULL, 94, NULL),
(140, '2015-01-22 05:00:26', 'Франция', '70360', '', '', 'Руми', 'AGRIEST', '1.00', NULL, NULL, 'AGRIEST – ZA de la Maze  70360 Scey-sur-Saône Flavie DA SILVA Tél. : 03 84 92 76 76', '', '', '', NULL, 93, NULL),
(141, '2015-01-22 05:00:48', 'Франция', '13200', '', '', 'Краси', 'Vendémiaire', '1.00', NULL, NULL, 'Harmonia Mundi Le Mas de Vert, Quai No.2 , Ancienne Route de St-Gilles, 13200 ARLES', '', '', '', NULL, 95, NULL),
(142, '2015-01-22 05:01:11', 'Франция', '75019', '', '', 'Краси', 'Vendémiaire', '1.00', NULL, NULL, 'Éditions Vendémiaire 155, rue de Belleville 75019 Paris', '', '', '', NULL, 96, NULL),
(143, '2015-01-22 05:08:48', 'Франция', '13200', '', '', 'Краси', 'Impessions nouvelles', '1.00', NULL, NULL, 'Harmonia Mundi Le Mas de Vert, Ancienne Route de St-Gilles, 13200 ARLES', '', '', '', NULL, 98, NULL),
(144, '2015-01-22 05:08:50', '', '', '', '', '', '', '1.00', NULL, NULL, '', '', '', '', NULL, 99, NULL),
(145, '2015-01-22 05:13:15', 'Беллгия', '', '', '', 'Краси', 'Impessions nouvelles', '1.00', NULL, NULL, 'AUX IMPRESSIONS NOUVELLES 84 AVENUE ALBERT, 1190 BRUXELLES Livraison du lundi au vendredi de 10 à 18 heures', '', '', '', NULL, 99, NULL),
(146, '2015-01-22 05:13:32', 'Белгия', '', '', '', 'Краси', 'Impessions nouvelles', '1.00', NULL, NULL, 'AUX IMPRESSIONS NOUVELLES 84 AVENUE ALBERT, 1190 BRUXELLES Livraison du lundi au vendredi de 10 à 18 heures', '', '', '', NULL, 99, NULL),
(147, '2015-01-22 05:14:15', 'Франция', '27600', '', '', 'Краси', 'Prairies ordinaires', '1.00', NULL, NULL, 'Belles Lettres, 4 route du Plan d''Eau, 27600 Gaillon', '', '', '', NULL, 100, NULL),
(148, '2015-01-22 05:19:34', 'Белгия', '1190', '', '', 'Краси', 'Impessions nouvelles', '1.00', NULL, NULL, 'AUX IMPRESSIONS NOUVELLES 84 AVENUE ALBERT, 1190 BRUXELLES Livraison du lundi au vendredi de 10 à 18 heures', '', '', '', NULL, 99, NULL),
(149, '2015-01-22 05:20:23', 'Франция', '75007', '', '', 'Краси', 'Prairies ordinaires', '1.00', NULL, NULL, 'Louise Guilbaud, Les Prairies ordinaires, 1 avenue de Ségur, 75007 Paris. Code porte 34B56, interphone Claude Guilbaud, 4° étage face, tel +33 6 09 16 51 55', '', '', '', NULL, 101, NULL),
(150, '2015-01-22 05:20:59', 'Франция', '23220', '', '', 'Краси', 'Dixit', '1.00', NULL, NULL, 'DILISCO - Rue du limousin – 23220 – Chéniers', '', '', '', NULL, 102, NULL),
(151, '2015-01-22 05:21:47', 'Франция', '75009', '', '', 'Краси', 'Dixit', '1.00', NULL, NULL, 'DIXIT - 35 rue de Châteaudun 75009 – Paris – tel.Tel : +33 1 49 70 89 96', '', '', '', NULL, 103, NULL),
(152, '2015-01-22 05:22:20', 'Франция', '27600', '', '', 'Краси', 'Lignes', '1.00', NULL, NULL, 'BLDD Centre d’expédition 4, route du plan d’eau 27600 Gaillon Tel : 02.32.21.86.55', '', '', '', NULL, 104, NULL),
(153, '2015-01-22 05:22:44', 'Франция', '76400', '', '', 'Краси', 'Lignes', '1.00', NULL, NULL, 'Nel Sarl 90 quai Maupassant 76400 Fécamp 06 08 88 36 33', '', '', '', NULL, 105, NULL),
(154, '2015-01-22 05:23:41', 'Франция', '91000', '', '', 'Краси', 'La rumeur libre', '1.00', NULL, NULL, '1 Place de la Résistance 91000 Evry +33668751718 (M. Iacovella)', 'à l''attention d''Andrea Iacovella (directeur-adjoint) Ecole Nationale Supérieure d''Informatique pour l''Industrie et l''Entreprise (ENSIIE', '', '', NULL, 106, NULL),
(155, '2015-01-22 05:24:11', 'Франция', '23220', '', '', 'Краси', 'Graines 2', '1.00', NULL, NULL, 'DILISCO - Rue du limousin – 23220 – Chéniers', '', '', '', NULL, 107, NULL),
(156, '2015-01-22 05:25:46', 'Франция', '78240', '', '', 'Краси', 'Graines 2', '1.00', NULL, NULL, 'Editions Graine 2 49,rue de Montaigu 78240 Chambourcy Tél.: 0130064026', '', '', '', NULL, 108, NULL),
(157, '2015-01-22 05:26:23', 'Франция', '38000', '', '', 'Краси', 'Thaddée', '1.00', NULL, NULL, 'Monsieur ou Madame Marderos 6 rue Charles Lory 38000 GRENOBLE tél. mobile : +33 6 75 12 79 19 fixe : +33 4 76 96 56 70', '', '', '', NULL, 109, NULL),
(158, '2015-01-22 05:27:15', 'Франция', '62110', '', '', 'Ралица Креси', 'GROUPE NORMAND', '1.00', NULL, NULL, 'Société Normand OPTEX 117 bld Eugène Thomas 62110 Hénin Beaumont Tél 03 91 83 00 81 GRYNIEWICZ Sylvain sgryniew@groupe-normand.com', '', '', '', NULL, 110, NULL),
(159, '2015-01-22 05:28:14', 'Швейцария', '1030', '', '', 'Ралица Креси / Кристоф', 'HELICE HELAS', '1.00', NULL, NULL, 'TNT Swiss Post SA route de Renens 1A 1030 Bussigny-près-Lausanne Téléphone: 0800 55 55 55', '', '', '', NULL, 111, NULL),
(160, '2015-01-22 05:29:03', 'Франция', '75006', '', '', 'Ралица Креси', 'AMES D''ATALA', '1.00', NULL, NULL, '5 rue Férou 75006 zamdatala@hotmail.com 0033 3 20 55 26 64', '', '', '', NULL, 112, NULL),
(161, '2015-05-14 15:13:32', 'Франция', '75006', '', '', 'Ралица Креси', 'AMES D''ATALA', '1.00', NULL, '2015-05-13', '5 rue Férou 75006 zamdatala@hotmail.com 0033 3 20 55 26 64', '', '', '', NULL, 112, NULL),
(162, '2015-07-02 06:51:20', 'Франция', '77400', '+33160079743', '', 'Dora', 'Artege', '1.00', NULL, '2015-07-06', '128, av. Marechal de Lattre de Tassigny', '', 'Sreshta ponedelnik 13:30h / Nomer na sreshtata: 28D17', '03.07.2015', NULL, 113, ''),
(163, '2015-07-02 07:00:55', 'Франция', '94350', '336 82 84 95 38', 'laurence.dufour@miroirauxtroubles.fr', 'Ralitza Cressy', 'Mirroir aux troubles', '1.00', NULL, '2015-07-07', 'Madame Laurence Dufour ,10 bis boulevard Aristide Briand ', '', '', '03.07.2015', NULL, 114, ''),
(164, '2015-07-02 07:03:02', 'Франция', '78240', '33130064026', '', '', 'Graine 2', '1.00', NULL, NULL, 'Editions Graine 2 49,rue de Montaigu 78240 Chambourcy ', '', '', '', NULL, 115, ''),
(165, '2015-07-02 07:08:05', 'Франция', '83300', '336 33 50 34 48 ', 'fabrice.pinatel@gmail.com', 'Ralitza Cressy', 'Autour du Monde', '1.00', NULL, '2015-07-14', 'Fabrice Pinatel, 1315 chemin du Cas ', '', '', '', NULL, 116, ''),
(166, '2015-07-10 21:13:00', 'Франция', '75006', '', '', 'Ралица Креси промяна', 'AMES D''ATALA', '1.00', NULL, '2015-05-13', '5 rue Férou 75006 zamdatala@hotmail.com 0033 3 20 55 26 64', '', '', '', NULL, 112, ''),
(167, '2015-07-10 21:13:11', 'Франция', '75006', '', '', 'Ралица Креси', 'AMES D''ATALA', '1.00', NULL, '2015-05-13', '5 rue Férou 75006 zamdatala@hotmail.com 0033 3 20 55 26 64', '', '', '', NULL, 112, ''),
(168, '2015-07-15 09:10:17', 'Франция', '83300', '336 33 50 34 48 ', 'fabrice.pinatel@gmail.com', 'Ralitza Cressy', 'Autour du Monde', '1.00', NULL, '2015-07-14', 'Fabrice Pinatel, 1315 chemin du Cas ', '', '', '', '1', 116, ''),
(169, '2015-07-15 09:10:44', 'Франция', '78240', '33130064026', '', '', 'Graine 2', '1.00', NULL, NULL, 'Editions Graine 2 49,rue de Montaigu 78240 Chambourcy ', '', '', '', '3', 115, ''),
(170, '2015-07-15 09:10:58', 'Франция', '94350', '336 82 84 95 38', 'laurence.dufour@miroirauxtroubles.fr', 'Ralitza Cressy', 'Mirroir aux troubles', '1.00', NULL, '2015-07-07', 'Madame Laurence Dufour ,10 bis boulevard Aristide Briand ', '', '', '03.07.2015', '4', 114, ''),
(171, '2015-07-15 09:11:18', 'Франция', '77400', '+33160079743', '', 'Dora', 'Artege', '1.00', NULL, '2015-07-06', '128, av. Marechal de Lattre de Tassigny', '', 'Sreshta ponedelnik 13:30h / Nomer na sreshtata: 28D17', '03.07.2015', '1', 113, ''),
(172, '2015-07-15 09:18:59', 'Франция', '94350', '336 82 84 95 38', 'laurence.dufour@miroirauxtroubles.fr', 'Ralitza Cressy', 'Mirroir aux troubles', '1.00', NULL, '2015-07-07', 'Madame Laurence Dufour ,10 bis boulevard Aristide Briand ', '', '', '07.07.2015', '4', 114, ''),
(173, '2015-07-20 12:13:48', '', '', '', '', '', '', '1.00', NULL, NULL, '', '', 'DOSTAVENO\r\n', '', NULL, 117, ''),
(174, '2015-07-20 12:14:52', 'Франция', '83300', '336 33 50 34 48 ', 'fabrice.pinatel@gmail.com', 'Ralitza Cressy', 'Autour du Monde', '1.00', NULL, '2015-07-14', 'Fabrice Pinatel, 1315 chemin du Cas ', '', 'Dostaveno', '', '1', 116, '');

-- --------------------------------------------------------

--
-- Table structure for table `box`
--

CREATE TABLE IF NOT EXISTS `box` (
  `Id` serial primary key,
  `BooksCount` int(11) NOT NULL,
  `BoxesCount` int(11) NOT NULL,
  `BookId` BIGINT UNSIGNED NOT NULL,
  `PackageId` BIGINT UNSIGNED NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `box`
--

INSERT INTO `box` (`Id`, `BooksCount`, `BoxesCount`, `BookId`, `PackageId`) VALUES
(1, 24, 12, 2, 3),
(2, 12, 1, 2, 3),
(3, 17, 1, 2, 3),
(4, 39, 10, 30, 14),
(5, 10, 1, 30, 14),
(6, 29, 10, 31, 14),
(7, 10, 1, 31, 14),
(8, 100, 1, 33, 14),
(11, 1, 1, 14, 8),
(12, 1, 1, 129, 77),
(13, 1, 1, 128, 76),
(14, 1, 1, 126, 75),
(15, 1, 1, 127, 75),
(16, 1, 1, 125, 74),
(17, 1, 1, 124, 73),
(18, 1, 1, 123, 72),
(19, 1, 1, 122, 71),
(20, 1, 1, 121, 70),
(21, 1, 1, 120, 69),
(22, 1, 1, 119, 68),
(23, 1, 1, 117, 66),
(24, 1, 1, 118, 67),
(25, 1, 1, 116, 65),
(26, 1, 1, 115, 64),
(27, 1, 1, 114, 63),
(28, 1, 1, 113, 62),
(29, 1, 1, 111, 61),
(30, 1, 1, 112, 61),
(31, 1, 1, 110, 60),
(32, 1, 1, 109, 59),
(33, 1, 1, 108, 58),
(34, 1, 1, 106, 57),
(35, 1, 1, 107, 57),
(36, 1, 1, 105, 56),
(37, 1, 1, 104, 55),
(38, 1, 1, 103, 54),
(39, 1, 1, 102, 53),
(40, 1, 1, 96, 52),
(41, 1, 1, 97, 52),
(42, 1, 1, 98, 52),
(43, 1, 1, 99, 52),
(44, 1, 1, 100, 52),
(45, 1, 1, 101, 52),
(46, 1, 1, 92, 51),
(47, 1, 1, 93, 51),
(48, 1, 1, 94, 51),
(49, 1, 1, 95, 51),
(50, 1, 1, 91, 50),
(51, 1, 1, 90, 49),
(52, 1, 1, 89, 48),
(53, 1, 1, 88, 47),
(54, 1, 1, 87, 46),
(55, 1, 1, 86, 45),
(56, 1, 1, 85, 44),
(57, 1, 1, 84, 43),
(58, 1, 1, 83, 42),
(59, 1, 1, 82, 41),
(60, 1, 1, 77, 40),
(61, 1, 1, 78, 40),
(62, 1, 1, 79, 40),
(63, 1, 1, 80, 40),
(64, 1, 1, 81, 40),
(65, 1, 1, 72, 39),
(66, 1, 1, 73, 39),
(67, 1, 1, 74, 39),
(68, 1, 1, 75, 39),
(69, 1, 1, 76, 39),
(70, 1, 1, 71, 38),
(71, 1, 1, 70, 37),
(72, 1, 1, 69, 36),
(73, 1, 1, 66, 35),
(74, 1, 1, 67, 35),
(75, 1, 1, 68, 35),
(76, 1, 1, 63, 34),
(77, 1, 1, 64, 34),
(78, 1, 1, 65, 34),
(79, 1, 1, 57, 33),
(80, 1, 1, 58, 33),
(81, 1, 1, 59, 33),
(82, 1, 1, 60, 33),
(83, 1, 1, 61, 33),
(84, 1, 1, 62, 33),
(85, 1, 1, 51, 32),
(86, 1, 1, 52, 32),
(87, 1, 1, 53, 32),
(88, 1, 1, 54, 32),
(89, 1, 1, 55, 32),
(90, 1, 1, 56, 32),
(91, 1, 1, 50, 31),
(92, 1, 1, 49, 30),
(93, 1, 1, 48, 29),
(94, 1, 1, 47, 28),
(95, 1, 1, 46, 27),
(96, 1, 1, 45, 26),
(97, 1, 1, 44, 25),
(98, 1, 1, 43, 24),
(99, 1, 1, 42, 23),
(100, 1, 1, 41, 20),
(101, 1, 1, 40, 19),
(102, 1, 1, 39, 18),
(103, 1, 1, 37, 17),
(104, 1, 1, 38, 17),
(105, 1, 1, 35, 16),
(106, 1, 1, 36, 16),
(107, 1, 1, 34, 15),
(108, 1, 1, 24, 13),
(109, 1, 1, 25, 13),
(110, 1, 1, 26, 13),
(111, 1, 1, 27, 13),
(112, 1, 1, 22, 12),
(113, 1, 1, 23, 12),
(114, 1, 1, 21, 11),
(115, 1, 1, 19, 10),
(116, 1, 1, 20, 10),
(117, 1, 1, 16, 9),
(118, 1, 1, 17, 9),
(119, 1, 1, 18, 9),
(120, 1, 1, 12, 8),
(121, 1, 1, 13, 8),
(123, 1, 1, 15, 8),
(124, 1, 1, 9, 7),
(125, 1, 1, 10, 7),
(126, 1, 1, 11, 7),
(127, 0, 0, 131, 78),
(128, 200, 10, 132, 93),
(129, 40, 10, 164, 112),
(130, 50, 2, 164, 112),
(131, 80, 1, 159, 111),
(132, 70, 1, 159, 111),
(133, 15, 1, 160, 111),
(134, 15, 20, 161, 111),
(135, 150, 3, 162, 111),
(136, 80, 1, 162, 111),
(137, 70, 1, 162, 111),
(138, 40, 10, 163, 111),
(139, 50, 2, 163, 111),
(140, 50, 40, 158, 110),
(141, 27, 1, 157, 109),
(142, 23, 1, 157, 109),
(143, 30, 1, 154, 108),
(144, 5, 1, 155, 108),
(145, 5, 1, 156, 108),
(146, 127, 10, 151, 107),
(147, 90, 10, 152, 107),
(148, 95, 1, 152, 107),
(149, 90, 10, 153, 107),
(150, 95, 1, 153, 107),
(151, 40, 10, 150, 106),
(152, 20, 10, 149, 105),
(153, 150, 10, 148, 104),
(154, 30, 10, 147, 103),
(155, 50, 2, 147, 103),
(156, 70, 10, 146, 102),
(157, 150, 2, 146, 102),
(158, 80, 1, 145, 101),
(159, 70, 1, 145, 101),
(160, 1000, 10, 144, 100),
(161, 50, 1, 144, 100),
(162, 60, 2, 141, 99),
(163, 50, 1, 142, 99),
(164, 30, 1, 142, 99),
(165, 30, 1, 143, 99),
(166, 100, 10, 138, 98),
(167, 40, 2, 138, 98),
(168, 250, 2, 139, 98),
(169, 100, 2, 139, 98),
(170, 10, 1, 139, 98),
(171, 197, 10, 140, 98),
(172, 500, 10, 133, 94),
(173, 150, 2, 136, 97),
(174, 10, 1, 137, 97),
(175, 50, 2, 135, 96),
(176, 100, 10, 134, 95),
(177, 50, 2, 134, 95),
(178, 60, 1, 159, 111),
(179, 50, 1, 159, 111),
(180, 20, 1, 165, 111);

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE IF NOT EXISTS `delivery` (
  `Id` int(11) NOT NULL,
  `RequestedBy` varchar(150) DEFAULT NULL,
  `DeliveryNumber` varchar(10) DEFAULT NULL,
  `PickUpDate` date DEFAULT NULL,
  `DeliveryDate` date DEFAULT NULL,
  `Uuid` varchar(20) NOT NULL,
  `State` varchar(100) DEFAULT NULL,
  `Volume` varchar(100) DEFAULT NULL,
  `Weight` decimal(7,2) DEFAULT NULL,
  `Billing` varchar(1000) DEFAULT NULL,
  `PickUpAddress` varchar(250) DEFAULT NULL,
  `DeliveryAddress` varchar(250) DEFAULT NULL,
  `Driver` varchar(100) DEFAULT NULL,
  `Executant` varchar(100) DEFAULT NULL,
  `PriceTaken` decimal(15,2) DEFAULT NULL,
  `PriceForUs` decimal(15,2) DEFAULT NULL,
  `Remarks` varchar(500) DEFAULT NULL,
  `DeliveryDirectionId` int(11) NOT NULL,
  `Version` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`Id`, `RequestedBy`, `DeliveryNumber`, `PickUpDate`, `DeliveryDate`, `Uuid`, `State`, `Volume`, `Weight`, `Billing`, `PickUpAddress`, `DeliveryAddress`, `Driver`, `Executant`, `PriceTaken`, `PriceForUs`, `Remarks`, `DeliveryDirectionId`, `Version`) VALUES
(19, 'Каргопланет', 'G-14-1-47', '2014-11-20', '2014-11-25', '7482884098915123952', 'billed', '2 парета 110/130', '800.00', '', 'F-82250', 'София', 'Марто', 'Грифинс', '600.00', NULL, '', 1, 2),
(22, 'NIKAKOM EOOD', 'G-14-2-47', '2014-11-20', '2014-11-24', '-5624887873615867982', 'billed', '2 m3', '80.00', '', '30123', 'Momin Prohod', 'Martin', 'Grifins', '300.00', NULL, '', 1, 1),
(23, 'FUEGO LOGISTIC', 'G-14-3-47', '2014-11-19', '2014-11-24', '-8688634027273599531', 'billed', '1 PAL', '210.00', '', '19270', 'SOFIA', 'Martin', 'Grifins', '400.00', NULL, '', 1, 2),
(24, 'FUEGO LOGISTIC', 'G-14-4-47', '2014-11-19', '2014-11-24', '7640885859727197570', 'billed', '2 PAL', '670.00', '', '31250', 'SOFIA', 'Martin', 'Grifins', '380.00', NULL, '', 1, 1),
(25, 'KARGOPLANET', 'G-14-5-47', '2014-11-19', '2014-11-24', '-564852852857549990', 'billed', '2 MEBELI', '30.00', '', '14803', 'SOFIA', 'Martin', 'Grifins', '400.00', NULL, '', 1, 2),
(26, 'BONBONEC', 'G-14-6-47', NULL, NULL, '4088029961219297021', 'delivered', '16 PAL', NULL, '', 'Plovdiv', '34260 ', 'Eli', '', '2700.00', NULL, '', 2, 0),
(27, 'BONBONEC', 'G-14-7-47', '2014-10-22', '2014-10-27', '-6000667382748527426', 'delivered', '18 PAL', NULL, '', 'Plovdiv', '34260 ', 'Eli', '', '3000.00', NULL, '', 2, 0),
(28, 'BONBONEC', 'G-14-8-47', '2014-11-13', '2014-10-27', '5051563057274310565', 'delivered', '6 PAL', '1850.00', '', 'Plovdiv', '34260 ', 'Eli', '', '1250.00', NULL, '', 2, 0),
(29, 'BONBONEC', 'G-14-9-47', '2014-11-21', '2014-11-24', '836806590447044198', 'lifted', '7 PAL', '1800.00', '', 'Plovdiv', '34260 ', 'Eli', '', '1400.00', NULL, '', 2, 1),
(30, 'BONBONEC', 'G-14-10-47', NULL, NULL, '-2113575328487815182', 'billed', '17 ILI 18 PAL', NULL, '', '34260 ', 'Plovdiv', 'Eli', '', '5000.00', NULL, '', 1, 1),
(31, 'BONBONEC', 'G-14-10-47', '2014-10-24', '2014-10-29', '-1126086952983246239', 'billed', '12 PAL ', '4800.00', '', '34260 ', 'Plovdiv', 'Eli', '', '2200.00', NULL, '', 1, 1),
(32, 'BONBONEC', 'G-14-10-47', '2014-11-12', '2014-11-17', '-7696644522280072875', 'billed', '5 PAL ', '900.00', '', '34260 ', 'Plovdiv', 'Eli', '', '1000.00', NULL, '', 1, 1),
(33, 'BONBONEC', 'G-14-10-47', '2014-11-18', '2014-11-23', '-396399881891004185', 'lifted', '16 PAL ', NULL, '', '', 'Plovdiv', 'Eli', '', '2300.00', NULL, '', 2, 8),
(34, 'SOGETRA', 'G-14-10-47', '2014-11-24', '2014-11-24', '8782554657442712832', 'delivered', '2 COLIS', '310.00', '', 'SOGETRA', '95724 ROISSY CDG', 'Eli', 'GRIFFINS', '39.12', NULL, 'DOSTAVKA', 3, 1),
(35, 'SOGETRA', 'G-14-10-47', '2014-11-25', '2014-11-25', '3085416700872312161', 'delivered', '1PAL', '300.00', '', '77500 CHELLES ', '77330 OZOIR LA FERRIERE ', 'Eli', 'GRIFFINS', '80.58', NULL, 'DARPANE/DOSTAVKA', 3, 1),
(36, 'ACT LOGISTIC', 'G-14-10-47', '2014-11-21', '2014-11-24', '-7817289145537444742', 'billed', '1 PAL 3.5 куб.м.', '499.00', '', '95470', 'КАЗИЧЕНЕ, ', 'Martin', 'Grifins', '450.00', NULL, 'DOSTAVKA PREDI OBED', 1, 1),
(37, 'Каргопланет', 'G-14-10-47', '2014-11-22', '2014-11-24', '-1122998940792569128', 'billed', '2 KUB ', NULL, '', 'PARIJ', '', 'Марто', 'Грифинс', '300.00', NULL, '', 1, 5),
(38, 'SOGETRA', 'G-14-10-47', '2014-11-24', '2014-11-24', '6975702306389968297', 'delivered', '11 COLIS', '176.00', '', '93300', 'SOGETRA', 'Eli', 'GRIFFINS', '54.60', NULL, 'DARPANE', 3, 1),
(39, 'SOGETRA', 'G-14-10-47', '2014-11-24', '2014-11-24', '-7661127938021504402', 'delivered', '7 COLIS', '140.00', '', '75011', 'SOGETRA', 'Eli', 'GRIFFINS', '54.41', NULL, 'DARPANE', 3, 1),
(40, 'SOGETRA', 'G-14-10-47', '2014-11-24', '2014-11-24', '-2231807132649962061', 'delivered', '12 COLIS', '330.00', '', '75011', 'SOGETRA', 'Eli', 'GRIFFINS', '71.63', NULL, 'DARPANE', 3, 1),
(41, 'SOGETRA', 'G-14-1-48', '2014-11-24', '2014-11-24', '9222514328198334698', 'delivered', '1 COLIS', '20.00', '', '93300', 'SOGETRA', 'Eli', 'GRIFFINS', '39.12', NULL, 'DARPANE', 3, 3),
(42, 'SOGETRA', 'G-14-2-48', '2014-11-24', '2014-11-24', '2628759399921304796', 'delivered', '3 COLIS', NULL, '', '93300', 'SOGETRA', 'Eli', 'GRIFFINS', NULL, NULL, 'DARPANE', 3, 0),
(43, 'DONAU TRANZIT ', 'G-14-3-48', '2014-11-25', '2014-12-01', '7602624324040015961', 'billed', '3 PAL', '5000.00', '', '93600', 'SOFIA', 'Марто', 'Грифинс', '570.00', NULL, '', 1, 2),
(44, 'DONAU TRANZIT ', 'G-14-4-48', '2014-11-26', '2014-12-04', '-4498950448400872628', 'billed', '3 PAL', '660.00', '', '02400', 'VARNA', 'Марто', 'Грифинс', '550.00', NULL, '', 1, 2),
(45, 'SOGETRA', 'G-14-5-48', '2014-11-25', '2014-11-25', '-2322342645457402550', 'delivered', '7 COLIS', '175.00', '', 'paris', 'SOGETRA', 'Eli', 'GRIFFINS', '54.37', NULL, 'DARPANE', 3, 2),
(46, 'Каргопланет', 'G-14-6-48', '2014-11-22', '2014-11-24', '-6944904042945099282', 'delivered', '1 KUB ', NULL, '', 'PARIJ', '', 'Марто', 'Грифинс', '300.00', NULL, '', 1, 1),
(49, 'Боряна', 'G-14-9-48', '2014-11-26', '2014-11-26', '7879013519664629312', 'billed', '1-2 OPAKOVKI', '20.00', '', '33100', 'SOFIA', 'Марто', 'Грифинс', NULL, NULL, '', 1, 4),
(50, 'Боряна', 'G-14-10-48', '2014-11-26', '2014-11-26', '-5092512404263254531', 'billed', '12 OPAKOVKI', '20.00', '', '24100', 'SOFIA', 'Марто', 'Грифинс', NULL, NULL, '', 1, 5),
(51, 'FUEGO LOGISTIC', 'G-14-10-48', '2014-11-26', '2014-12-02', '6105900983743434196', 'billed', '', '180.00', '', '33750', 'SOFIA', 'Марто', 'Грифинс', '370.00', NULL, '', 1, 2),
(52, 'RAFA BG', 'G-14-10-48', '2014-11-27', '2014-12-02', '4893054686408952865', 'billed', '3 PAL', '766.00', '', '80470', 'RUSE', 'Марто', 'Грифинс', '530.00', NULL, '', 1, 4),
(53, 'FUEGO LOGISTIC', 'G-14-10-48', '2014-11-26', '2014-12-02', '-1049150898046745540', 'lifted', '2 куб.м', '180.00', '', '33750', 'SOFIA', 'Марто', 'Грифинс', '370.00', NULL, '', 1, 2),
(54, 'BONBONEC', 'G-14-10-48', '2014-11-26', '2014-12-02', '5852389456226369997', 'billed', '6 PAL', '1600.00', '', '34260 ', 'Plovdiv', 'Eli', '', '1250.00', NULL, '', 1, 3),
(55, 'Макроагент', 'G-14-10-48', '2014-11-27', '2014-12-27', '-4288162246466386014', 'lifted', '1 KASHON', NULL, '', '14600', 'SOFIA', 'Марто', 'Грифинс', NULL, NULL, '', 1, 2),
(56, 'SOGETRA', 'G-14-10-48', '2014-12-02', '2014-12-02', '-6515136362864295254', 'delivered', '1 PAL', '300.00', '', '77330', '75010', 'Eli', 'GRIFFINS', '156.44', NULL, 'V 10 CHASA DARPANE/ DOSTAVKA', 3, 3),
(57, 'FUEGO LOGISTIC', 'G-14-10-48', '2014-11-28', '2014-12-02', '6100573353097187314', 'lifted', '5 PAL', '10.00', '', '76890', 'SOFIA', 'Марто', 'Грифинс', '570.00', NULL, '', 1, 2),
(58, 'FUEGO LOGISTIC', 'G-14-10-48', '2014-11-28', '2014-12-02', '7702470119648284595', 'lifted', '5 PAL', '250.00', '', '76890', 'SOFIA', 'Марто', 'Грифинс', '570.00', NULL, '', 1, 3),
(59, 'SOGETRA', 'G-14-10-48', '2014-11-28', '2014-11-28', '-3416186344250523280', 'delivered', '38 COLIS ', '360.00', '', '95701', '77183', 'Eli', 'GRIFFINS', '168.22', NULL, 'V 12 CHASA DOSTAVKA DARPANE/ DOSTAVKA', 3, 2),
(60, 'ALEXANDAR LOGISTIC', 'G-14-10-48', '2014-11-28', '2014-12-01', '3980933397965586544', 'lifted', '1 PAL ', '164.00', '', '94564', 'KAZICHANE', 'Марто', 'Грифинс', '300.00', NULL, '', 1, 1),
(61, 'DONAU TRANZIT ', 'G-14-10-48', '2014-11-28', '2014-12-05', '3955823501433520615', 'lifted', '35 ROLKI', '400.00', '', '93000', 'RUSE', 'Марто', 'Грифинс', '650.00', NULL, '', 1, 2),
(62, 'DONAU TRANZIT ', 'G-14-10-48', '2014-11-28', '2014-12-05', '7590419279560919467', 'lifted', '6 ROLKI ', '50.00', '', '95330', 'RUSE', 'Марто', 'Грифинс', '650.00', NULL, '', 1, 1),
(63, 'DONAU TRANZIT ', 'G-14-10-48', '2014-11-28', '2014-12-04', '9010898908228636273', 'delivered', '2 PAL', '400.00', '', '93600', 'RUSE', 'Марто', 'Грифинс', '450.00', NULL, '', 1, 1),
(64, 'SOGETRA', 'G-14-1-49', '2014-12-01', '2014-12-01', '-8162039137454699593', 'delivered', '9 COLIS', '30.00', '', '93300', 'SOGETRA', 'Eli', 'GRIFFINS', '38.93', NULL, '', 3, 2),
(65, 'SOGETRA', 'G-14-2-49', '2014-12-01', '2014-12-01', '-4678116790088802', 'delivered', '8 COLIS', '120.00', '', '93300', 'SOGETRA', 'Eli', 'GRIFFINS', '54.11', NULL, '', 3, 1),
(66, 'SOGETRA', 'G-14-3-49', '2014-12-01', '2014-12-01', '-546421070309995355', 'delivered', '4 COLIS', '80.00', '', '93300', 'SOGETRA', 'Eli', 'GRIFFINS', '48.07', NULL, '', 3, 2),
(67, 'SOGETRA', 'G-14-4-49', '2014-12-01', '2014-12-01', '-7479582196298661463', 'delivered', '6 COLIS', '70.00', '', '93300', 'SOGETRA', 'Eli', 'GRIFFINS', '48.07', NULL, '', 3, 1),
(68, 'SOGETRA', 'G-14-5-49', '2014-12-01', '2014-12-01', '-2242169850724069823', 'delivered', '3 COLIS', '90.00', '', '93300', 'SOGETRA', 'Eli', 'GRIFFINS', '48.07', NULL, '', 3, 1),
(69, 'SOGETRA', 'G-14-6-49', '2014-12-01', '2014-12-01', '6213320001911212450', 'delivered', '2 COLIS', '50.00', '', '93300', 'SOGETRA', 'Eli', 'GRIFFINS', '42.04', NULL, '', 3, 1),
(70, 'SOGETRA', 'G-14-7-49', '2014-12-01', '2014-12-01', '7089202773835730429', 'delivered', '10 COLIS', '300.00', '', '93300', 'SOGETRA', 'Eli', 'GRIFFINS', '60.14', NULL, '', 3, 1),
(71, 'SOGETRA', 'G-14-8-49', '2014-12-01', '2014-12-01', '-831775041725314774', 'delivered', '3 COLIS ', '60.00', '', '93300', 'SOGETRA', 'Eli', 'GRIFFINS', '48.07', NULL, '', 3, 1),
(72, 'SOGETRA', 'G-14-9-49', '2014-12-01', '2014-12-01', '-4348129501616976431', 'delivered', ' 6 COLIS ', '150.00', '', '93300', 'SOGETRA', 'Eli', 'GRIFFINS', '54.11', NULL, '', 3, 1),
(73, 'SOGETRA', 'G-14-10-49', '2014-12-01', '2014-12-01', '6660074169055660891', 'delivered', '38 COLIS ', '266.00', '', '93300', 'SOGETRA', 'Eli', 'GRIFFINS', '60.14', NULL, '', 3, 1),
(74, 'SOGETRA', 'G-14-10-49', '2014-12-05', '2014-12-05', '-4004365104845537228', 'lifted', '5 PAL', '1500.00', '', '77330', '60330', 'Eli', 'GRIFFINS', '165.44', NULL, '8-12;13:30-17H RAB.VREME', 3, 3),
(75, 'SOGETRA', 'G-14-10-49', '2014-12-02', '2014-12-05', '8489223489511638441', 'delivered', '3 PAL', '750.00', '', '78570', '78300', 'Eli', 'GRIFFINS', '108.99', NULL, '', 3, 5),
(76, 'DELAMODE', 'G-14-10-49', '2014-11-28', '2014-12-03', '4067407343469412527', 'delivered', '10 CARTONS', '70.00', '', 'SOFIA', '92600', 'Марто', 'Грифинс', '200.00', NULL, '', 2, 1),
(77, 'SOGETRA', 'G-14-10-49', '2014-12-03', '2014-12-04', '74102736167126658', 'delivered', '35 COLIS', '800.00', '', '95190', '75013', 'Eli', 'GRIFFINS', '91.48', NULL, '', 3, 2),
(80, 'Софра', 'G-14-10-49', '2014-12-04', '2014-12-08', '-5942546129398316497', 'billed', '5 COLIS', '31.00', '', '27100', 'SOFIA', 'Марто', 'Грифинс', '150.00', NULL, '', 1, 6),
(81, 'RAFA BG', 'G-14-10-49', '2014-12-03', '2014-12-10', '5113743712418417134', 'delivered', '1* 200/90/160', '190.00', '', '74970', 'YAMBOL', 'Марто', 'Грифинс', '500.00', NULL, '', 1, 2),
(82, 'СОФРА', 'G-14-10-49', '2014-12-04', '2014-12-08', '-6814223311343104229', 'billed', '1 COLIS', '28.00', '', '77760', 'SOFIA', 'Марто', 'Грифинс', '100.00', NULL, '', 1, 4),
(83, 'SOGETRA', 'G-14-10-49', '2014-12-04', '2014-12-04', '-8259495774132678910', 'lifted', '28 COLIS', '220.00', '', '95190', '77183', 'Eli', 'GRIFFINS', '80.58', NULL, '', 3, 1),
(84, 'SOGETRA', 'G-14-10-49', '2014-12-05', '2014-12-05', '-7793004987683749844', 'lifted', '72 COLIS', '565.00', '', '95190', '77183', 'Eli', 'GRIFFINS', '90.75', NULL, '', 3, 2),
(85, 'SOGETRA', 'G-14-10-49', '2014-12-04', '2014-12-04', '-6695629788709567813', 'delivered', '72 COLIS', '565.00', '', '95701', '96190', 'Eli', 'GRIFFINS', '102.87', NULL, '', 3, 1),
(86, 'SOGETRA', 'G-14-10-49', '2014-12-03', '2014-12-04', '-8361552608521598623', 'lifted', '3 COLIS ', '150.00', '', '95190', '78750', 'Eli', 'GRIFFINS', '74.51', NULL, '', 3, 1),
(87, 'СОФРА', 'G-14-10-49', '2014-12-04', '2014-12-08', '-7893107382921639151', 'billed', '5 COLIS', '31.00', '', '27100', 'SOFIA', 'Марто', 'Грифинс', '150.00', NULL, '', 1, 4),
(88, 'MAKROAGENT', 'G-14-10-49', '2014-12-04', '2014-12-12', '873916667163592647', 'lifted', '1 PAL', '165.00', '', '78317', 'BFI PERNIK ', 'Марто', 'Грифинс', '300.00', NULL, '', 1, 1),
(89, 'SOGETRA', 'G-14-10-49', '2014-12-04', '2014-12-04', '5089976076007983093', 'lifted', '3 COLIS ', '80.00', '', '93300', '95190', 'Eli', 'GRIFFINS', '48.40', NULL, '', 3, 1),
(90, 'BONBONEC', 'G-14-10-49', '2014-12-05', '2014-11-10', '6846242139163151317', 'delivered', '11 pal', '1850.00', '', 'Plovdiv', '34260 ', 'Eli', '', '2050.00', NULL, '', 2, 3),
(91, 'СОФРА', 'G-14-10-49', '2014-12-05', '2014-12-08', '-7447124439531566538', 'billed', '1 PAL', '844.00', '', '33450', 'SOFIA', 'Марто', 'Грифинс', '480.00', NULL, '', 1, 4),
(92, 'NIKAKOM ', 'G-14-10-49', '2014-12-05', '2014-12-09', '-4306961075021593927', 'billed', '1 PAL + 2 CARTONS', '350.00', '', '60126', 'SOFIA', 'Eli', 'Грифинс', '320.00', NULL, 'VDIGANE 21-23H ', 1, 2),
(93, 'SOGETRA', 'G-14-1-50', '2014-12-08', '2014-12-08', '6427540619133143511', 'lifted', '3 COLIS', '60.00', '', '93300', '95190', 'Eli', 'GRIFFINS', '48.29', NULL, '', 3, 1),
(94, 'SOGETRA', 'G-14-2-50', '2014-12-08', '2014-12-08', '-274921450098833210', 'lifted', '1 PAL', '229.00', '', '95701', '95190', 'Eli', 'GRIFFINS', '71.55', NULL, '', 3, 1),
(95, 'SOGETRA', 'G-14-3-50', '2014-12-08', '2014-12-08', '5297731418804997927', 'lifted', '31 COLIS', '372.00', '', '95701', '93320', 'Eli', 'GRIFFINS', '78.59', NULL, '', 3, 1),
(96, 'SOGETRA', 'G-14-4-50', '2014-12-08', '2014-12-09', '-9061961501239588609', 'lifted', '1 PAL ', '150.00', '', '95190', '75116', 'Eli', 'GRIFFINS', '54.38', NULL, '', 3, 1),
(97, 'SOGETRA', 'G-14-5-50', '2014-12-09', '2014-12-09', '7382401083564508748', 'lifted', '5 COLIS', '135.00', '', '93300', '95190', 'Eli', 'GRIFFINS', '54.37', NULL, '', 3, 1),
(98, 'TRAKTREID', 'G-14-6-50', '2014-12-10', '2014-12-15', '8698680632594285824', 'billed', '1 PAL', '800.00', '', '21200', 'SOFIA', 'Марто', 'Грифинс', '330.00', NULL, '', 1, 1),
(99, 'SOGETRA', 'G-14-7-50', '2014-12-10', '2014-12-10', '-6806868699517464676', 'lifted', '2 COLIS', '11.00', '', '95190', '75001', 'Eli', 'GRIFFINS', '39.11', NULL, '', 3, 0),
(100, '', 'G-14-8-50', '2014-12-11', '2014-12-15', '8652970074106840142', 'toLift', '1 PAL ', NULL, '', '13591', 'SOFIA', 'Марто', 'Грифинс', NULL, NULL, '', 1, 0),
(101, '', 'G-14-9-50', '2014-12-11', '2014-12-16', '6694740218554958385', 'toLift', '2 PAL ', '335.00', '', '32100', 'SOFIA', 'Марто', 'Грифинс', '470.00', NULL, '', 1, 0),
(103, 'ALOG', 'G-14-10-50', '2014-12-12', '2014-12-16', '5136102483898419599', 'toLift', '', '110.00', '', '02100', 'SOFIA', 'Марто', 'Грифинс', '270.00', NULL, '', 1, 0),
(104, 'А ЛОГИСТИК', 'G-14-10-50', '2014-12-12', '2014-12-15', '4255856060885385728', 'lifted', '1 PAL', '159.00', '', '27120', 'SOFIA', 'Марто', 'Грифинс', '250.00', NULL, '', 1, 1),
(105, 'BONBONEC', 'G-14-10-50', '2014-12-11', '2014-12-08', '-1313888903716388044', 'toLift', '4 pal', '886.00', '', 'RUMANIA', 'PLOVDIV', 'Eli', 'AMA TRANSPORT', '450.00', '250.00', '', 1, 3),
(106, 'NIKAKOM', 'G-14-10-50', '2014-12-04', '2014-12-08', '468542269475736852', 'billed', '1 PAL I 2 KACHONA', '886.00', '', '60126', 'SOFIA', 'Eli', 'GRIFINS', '320.00', NULL, '', 1, 1),
(107, 'SOGETRA', 'G-14-10-50', '2014-12-12', '2014-12-12', '4302791213926269897', 'delivered', '2 PAL ', '600.00', '', '77330', '60330', 'Eli', 'GRIFFINS', '102.86', NULL, '', 3, 2),
(108, 'SOGETRA', 'G-14-10-50', '2014-12-12', '2014-12-12', '1705378443872847108', 'delivered', '2 PAL', '600.00', '', '77330', '77500', 'Eli', 'GRIFFINS', '112.84', NULL, '', 3, 1),
(109, 'CARGOPLANET', 'G-14-10-50', '2014-12-12', '2014-12-16', '-5827178357608329339', 'toLift', '2 CARTONS', '50.00', '', '53230', 'SOFIA', 'Марто', 'Грифинс', '130.00', NULL, '', 1, 0),
(110, 'FUEGO LOGISTIC ', 'G-14-10-50', '2014-12-12', '2014-12-16', '3297057742201177800', 'toLift', '1 CARTON,6 CHUVALA I DR.', '120.00', '', '33750', 'SOFIA', 'Марто', 'Грифинс', NULL, NULL, '', 1, 0),
(111, 'SOGETRA', 'G-14-10-50', '2014-12-15', '2014-12-15', '-2644263052043402675', 'lifted', '75 COLIS ', '553.00', '', '95190', '93320', 'Eli', 'GRIFFINS', '84.74', NULL, '', 3, 3),
(112, 'SOGETRA', 'G-14-10-50', '2014-12-15', '2014-12-15', '-45368045941077322', 'lifted', '2 COLIS', '55.00', '', '95701', '95190', 'Eli', 'GRIFFINS', '48.34', NULL, '', 3, 1),
(113, 'SOGETRA', 'G-14-1-51', '2014-12-15', '2014-12-15', '782086727922500013', 'lifted', '1 PAL ', '222.00', '', '95701', '95190', 'Eli', 'GRIFFINS', '71.59', NULL, '', 3, 1),
(114, 'SOGETRA', 'G-14-2-51', '2014-12-15', '2014-12-15', '-7486395351413404626', 'delivered', '2 PAL', '300.00', '', '77330', '60330', 'Eli', 'GRIFFINS', '112.86', NULL, '', 3, 1),
(115, 'SOGETRA', 'G-14-3-51', '2014-12-16', '2014-12-16', '4807595924561937523', 'delivered', '45 COLIS', '337.00', '', '95190', '77183', 'Eli', 'GRIFFINS', '86.65', NULL, '', 3, 1),
(116, 'SOGETRA', 'G-14-4-51', '2014-12-16', '2014-12-16', '-4976887837881188240', 'delivered', '2 PAL ', '209.00', '', '95190', '60110', 'Eli', 'GRIFFINS', '84.70', NULL, '', 3, 1),
(117, 'SOGETRA', 'G-14-5-51', '2014-12-16', '2014-12-16', '2082773202103387093', 'delivered', '10 COLIS ', '200.00', '', '93300', '95190', 'Eli', 'GRIFFINS', '54.38', NULL, '', 3, 2),
(118, 'A LOGISTIC ', 'G-14-6-51', '2014-12-16', '2014-12-22', '4121690358025242421', 'toLift', '2 PAL ', '270.00', '', '93500', 'SOFIA', 'Марто', 'Грифинс', '300.00', NULL, '', 1, 0),
(119, 'GOPET TRANS ', 'G-14-7-51', '2014-12-16', '2014-12-22', '-5548025853839064496', 'toLift', '', '24.00', '', '94380', 'SOFIA ', 'Марто ', 'Грифинс ', '150.00', NULL, '', 1, 0),
(120, 'Макроагент', 'G-14-8-51', '2014-12-12', '2014-12-17', '-5264209750969463397', 'lifted', '2', '1100.00', '', 'София', '61400+27000', 'Мартин', 'Грифинс', '700.00', NULL, '', 2, 1),
(121, 'Макроагент', 'G-14-9-51', '2014-12-12', '2014-12-18', '-8416320929157525724', 'lifted', '6 еп', '2400.00', '', 'София', '14200', 'Мартин', 'Грифинс', '1000.00', NULL, '', 2, 1),
(122, 'SOGETRA', 'G-14-10-51', '2014-12-17', '2014-12-17', '418436015813446251', 'delivered', '3 PAL', '600.00', '', '77330', '77500', 'Eli', 'GRIFINS', '111.48', NULL, '', 3, 4),
(123, 'Рафа БГ', 'G-14-10-51', '2014-12-16', '2014-12-22', '-673730977918332970', 'delivered', '9 еп', '3300.00', '', 'Костинброд', '67038+75015', 'Мартин', 'Грифинс', '3000.00', NULL, '', 2, 1),
(124, 'Рафа БГ', 'G-14-10-51', '2014-12-12', '2014-12-17', '-686774175063719768', 'lifted', '2 еп', '1380.00', '', 'Костинброд', '91160', 'Мартин', 'Грифинс', '0.00', NULL, '', 2, 0),
(125, 'Рафа БГ', 'G-14-10-51', '2014-12-12', '2014-12-18', '4829417732254353583', 'lifted', '1 еп', '255.00', '', 'Костинброд', '30900', 'Мартин', 'Грифинс', '0.00', NULL, '', 2, 0),
(126, 'Рафа БГ', 'G-14-10-51', '2014-12-12', '2014-12-19', '4532016625518136184', 'lifted', '2 еп', '1140.00', '', 'Костинброд', '33127', 'Мартин', 'Грифинс', '0.00', NULL, '', 2, 0),
(127, 'Рафа БГ', 'G-14-10-51', '2014-12-12', '2014-12-19', '4912541334811266707', 'lifted', '1 еп', '580.00', '', 'Костинброд', '65000', 'Мартин', 'Грифинс', '0.00', NULL, '', 2, 0),
(128, 'Рафа БГ', 'G-14-10-51', '2014-12-12', '2014-12-19', '-6218681450882053887', 'lifted', '3 еп', '1860.00', '', 'Костинброд', '26320', 'Мартин', 'Грифинс', '1970.00', NULL, '', 2, 0),
(129, 'Софра', 'G-14-10-51', '2014-12-15', '2014-12-23', '6384904717155779934', 'lifted', '2 еп', '870.00', '', 'Белозем', '30290', 'Мартин', 'Грифинс', '750.00', NULL, '', 2, 0),
(130, 'Горян', 'G-14-10-51', '2014-12-12', '2014-12-16', '3278898995730074302', 'lifted', '3 еп', '1200.00', '', 'София', '95100', 'Мартин', 'Грифинс', NULL, NULL, '', 2, 0),
(131, 'SOGETRA', 'G-14-10-51', '2014-12-17', '2014-12-17', '-6979974040587710794', 'lifted', '2 PAL', '600.00', '', '95190', '78310', 'Eli', 'GRIFINS', '102.86', NULL, '', 3, 1),
(132, 'Алавойдов', 'G-14-10-51', '2014-12-12', '2014-12-16', '7437742243509653393', 'lifted', '2 еп', '1100.00', '', '', 'Париж', 'Мартин', '', NULL, NULL, '', 2, 0),
(133, 'Ролтенда', 'G-14-10-51', '2014-12-12', '2014-12-17', '-7208516230249035507', 'lifted', '1 щора', '100.00', '', 'София', 'Париж', 'Мартин', '', NULL, NULL, '', 2, 0),
(134, 'Шортман', 'G-14-10-51', '2014-12-12', '2014-12-17', '3496064078757381879', 'lifted', '10 еп', '1250.00', '', 'София, техен склад', '67100+77390', 'Мартин', '', '1600.00', NULL, '', 2, 0),
(135, 'Никаком', 'G-14-10-51', '2014-12-12', '2014-12-18', '-1447624350104139396', 'lifted', '1 еп+кашони', '180.00', '', 'София', '30123', 'Мартин', 'Грифинс', '350.00', NULL, '', 2, 0),
(136, 'SOGETRA', 'G-14-10-51', '2014-12-17', '2014-12-17', '2195624433405479775', 'delivered', '', '200.00', '', '95190', '95470', 'Eli', 'GRIFINS', '62.58', NULL, '', 3, 1),
(137, 'SOGETRA', 'G-14-10-51', '2014-12-17', '2014-12-17', '2039344173450872683', 'lifted', '19 COLIS ', '228.52', '', '93600', '95190', 'Eli', 'GRIFINS', '58.84', NULL, '', 3, 0),
(138, 'FUEGO LOGISTIC', 'G-14-10-51', '2014-12-17', '2014-12-22', '4109714976578818018', 'lifted', '', '158.00', '', '33750', 'СОФИЯ', 'Марто', 'Грифинс', '200.00', NULL, '', 1, 1),
(139, 'Айкхорн', 'G-14-10-51', '2014-12-17', '2014-12-22', '1938342007727473676', 'toLift', '3 еп', '600.00', '', 'Етрополе', '31700', 'Мартин', '', NULL, NULL, 'дадено на външна фирма', 2, 0),
(140, '', 'G-14-10-51', '2014-12-18', '2014-12-22', '290711698542904609', 'lifted', '2 PAL', '825.00', '', '02400', 'SOFIA', 'Марто', 'Грифинс', NULL, NULL, '', 1, 1),
(141, 'M M', 'G-14-10-51', '2014-12-18', '2014-12-23', '2543179811436318178', 'lifted', '1 PAL', '350.00', '', '53940', 'SOFIA', 'Eli', 'GRIFINS ', '350.00', NULL, '', 1, 1),
(142, 'DONAU TRANZIT ', 'G-14-10-51', '2014-12-19', '2014-12-23', '8141083179763975328', 'lifted', '1 PAL', '600.00', '', '76170', 'SOFIA', 'Марто', 'Грифинс', '380.00', NULL, '', 1, 1),
(143, 'SOGETRA', 'G-14-10-51', '2014-12-17', '2014-12-17', '-6389446218026235454', 'lifted', '6 PAL', '630.00', '', '75018', '94398', 'Eli', 'GRIFINS', '90.74', NULL, '', 3, 1),
(144, 'ANTALIS BULGARIA ', 'G-14-10-51', '2014-12-19', '2014-12-23', '-8531744915819247948', 'lifted', '1 PAL', '85.00', '', '91250', 'SOFIA', 'Марто', 'Грифинс', '150.00', NULL, '', 1, 1),
(145, 'CARGOPLANET', 'G-14-10-51', '2014-12-19', '2014-12-23', '-8411941027067248070', 'lifted', '6 CARTONS', '115.00', '', '93120', 'SOFIA', 'Марто', 'Грифинс ', '300.00', NULL, '', 1, 1),
(146, 'SOGETRA', 'G-14-10-51', '2014-12-22', '2014-12-22', '-3527057600997799395', 'lifted', '2 COLIS', '30.00', '', '95190', '75008', 'Eli', 'GRIFINS', '39.12', NULL, 'DOSTAVKA-11H. ', 3, 1),
(147, 'SOGETRA', 'G-14-10-51', '2014-12-22', '2014-12-22', '8018108328056079040', 'lifted', '2 PAL', '250.00', '', '75002', '77183', 'Eli', 'GRIFINS', '80.58', NULL, 'DOSTAVKA V 12H.', 3, 1),
(148, 'SOGETRA', 'G-14-10-51', '2014-12-23', '2014-12-23', '-6906819351329290896', 'lifted', '1 PAL', '300.00', '', '77330', '60000', 'Eli', 'GRIFINS', '84.69', NULL, 'DOSTAVKA V 10H. ', 3, 1),
(149, 'SOGETRA', 'G-14-10-51', '2014-12-22', '2014-12-22', '7241212164727328072', 'lifted', '1 COLIS', '50.00', '', '95190', '75018', 'Eli', 'GRIFINS', '42.25', NULL, 'DOSTAVKA SLED 12:30H', 3, 2),
(150, 'SOGETRA', 'G-14-10-51', '2014-12-22', '2014-12-22', '-6768925606358399509', 'lifted', '6 PAL', '991.00', '', '95190', '95100', 'Eli', 'GRIFINS', '113.44', NULL, '', 3, 1),
(151, 'BONBONEC', 'G-14-1-52', '2014-12-22', '2014-12-29', '5436315723817894596', 'lifted', '13 PAL ', '4200.00', '', '34260 ', 'Plovdiv', 'Eli', '', '2300.00', NULL, '', 1, 2),
(152, 'MARANATA LOGISTIC', 'G-14-2-52', '2014-12-23', '2014-12-29', '-6483281767197555248', 'lifted', '3 PAL ', '809.00', '', '02400', 'VARNA ', 'Марто', 'Грифинс', '680.00', NULL, 'CHAS NA VDIGANE-9.30h.', 1, 1),
(153, 'SPEDEX', 'G-14-3-52', '2014-12-24', '2014-12-29', '8497909547060773381', 'lifted', '5 PAL ', '830.00', '', '95670', 'SEVLIEVO', 'Марто', 'Грифинс', '800.00', NULL, '', 1, 1),
(154, 'STEFAN NIKOLAEV', 'G-14-4-52', '2014-12-26', '2014-12-29', '-855010592781677323', 'lifted', '', NULL, '', '75014', 'SOFIA', 'Марто', 'Грифинс', '130.00', NULL, '', 1, 1),
(155, 'СТЕФАН НИКОЛАЕВ', 'G-14-5-52', '2014-12-26', '2014-12-29', '6701162704963587290', 'lifted', '1 COLIS', NULL, '', '75006', 'SOFIA', 'Марто', 'Грифинс', '80.00', NULL, '', 1, 1),
(156, 'SOGETRA', 'G-14-6-52', '2014-12-26', '2014-12-26', '-15722226429574528', 'lifted', '1 PAL ', '50.00', '', '95701', '95190', 'Eli', 'GRIFINS', '46.44', NULL, '', 3, 0),
(157, 'SOGETRA ', 'G-15-1-2', '2015-01-05', '2015-01-05', '-1671631537504107174', 'lifted', '5 PAL ', '690.00', '', '95190', '77990', 'Eli', 'GRIFINS', '105.60', NULL, 'DOSTAVKA V 14H', 3, 1),
(158, 'SOGETRA', 'G-15-2-2', '2015-01-06', '2015-01-06', '6981450937478106535', 'lifted', '5 PAL ', '1500.00', '', '77330', '60330', 'Eli', 'GRIFINS', '166.25', NULL, 'DOSTAVKA V 13:30H', 3, 1),
(159, 'SOGETRA', 'G-15-3-2', '2015-01-06', '2015-01-06', '-4903955200852473183', 'lifted', '2 COLIS', '50.00', '', '95190', '95870', 'Eli', 'GRIFINS', '46.35', NULL, '', 3, 1),
(160, 'SOGETRA', 'G-15-4-2', '2015-01-07', '2015-01-07', '-5177811661174387311', 'lifted', '1 PAL ', '300.00', '', '77330', '77500', 'Eli', 'GRIFINS', '80.58', NULL, 'DOSTAVKA V 10H', 3, 1),
(161, 'SOGETRA', 'G-15-5-2', '2015-01-07', '2015-01-07', '-8188110009910476697', 'lifted', '27 COLIS', '391.00', '', '95190', '77990', 'Eli', 'GRIFINS', '86.64', NULL, 'DOSTAVKA V 13:30H', 3, 1),
(162, 'SOGETRA', 'G-15-6-2', '2015-01-09', '2015-01-09', '-6622106897883313492', 'lifted', '4 PAL ', '1200.00', '', '77330', '60330', 'Eli', 'GRIFINS', '152.57', NULL, 'DOSTAVKA V 14:30H', 3, 4),
(163, 'SOGETRA', 'G-15-7-2', '2015-01-09', '2015-01-09', '797873418674457811', 'lifted', '3 PAL ', '1790.00', '', '95190', '75002', 'Eli', 'GRIFINS', '138.88', NULL, 'DOSTAVKA V 9:30H', 3, 1),
(164, 'SOGETRA', 'G-15-8-2', '2015-01-06', '2015-01-06', '-6831274457370898965', 'lifted', '70 ROLKI', '1286.00', '', '95190', '91100', 'Eli', 'GRIFINS', '131.05', NULL, '', 3, 1),
(165, 'SOGETRA', 'G-15-9-2', '2015-01-08', '2015-01-08', '-2243614411747475258', 'lifted', '1 PAL', '340.00', '', '93290', '95190', 'Eli', 'GRIFINS', '78.63', NULL, '', 3, 1),
(166, 'SOGETRA', 'G-15-10-2', '2015-01-12', '2015-01-12', '6635767371332272791', 'lifted', '3 PAL ', '1243.00', '', '95190', '91250', 'Eli', 'GRIFINS', '131.04', NULL, 'DOSTAVKA V 11H', 3, 1),
(167, 'SOGETRA', 'G-15-10-2', '2015-01-12', '2015-01-12', '3252807260382774054', 'lifted', '59 COLIS', '325.00', '', '95190', '77183', 'Eli', 'GRIFINS', '86.64', NULL, 'DOSTAVKA V 14:30H', 3, 1),
(168, 'SOGETRA', 'G-15-10-2', '2015-01-09', '2015-01-12', '-5017438062553510862', 'delivered', '1 COLIS', '5.00', '', '95190', '75008', 'Eli', 'GRIFINS', '39.12', NULL, '', 3, 2),
(169, 'SOGETRA', 'G-15-10-2', '2015-01-12', '2015-01-12', '-168062002822690537', 'lifted', '6 COLIS', '90.00', '', '93300', '95190', 'Eli', 'GRIFINS', '48.31', NULL, 'DOSTAVKA V 14:00H', 3, 2),
(170, 'SOGETRA', 'G-15-10-2', '2015-01-12', '2015-01-12', '-3690383230478761249', 'lifted', '4 COLIS', '80.00', '', '93300', '95190', 'Eli', 'GRIFINS', '48.31', NULL, 'DOSTAVKA V 14H', 3, 1),
(171, 'SOGETRA', 'G-15-10-2', '2015-01-12', '2015-01-12', '-7693955781516705630', 'lifted', '44 COLIS ', '400.00', '', '77183', '95190', 'Eli', 'GRIFINS', '86.64', NULL, '', 3, 1),
(172, 'SOGETRA', 'G-15-1-3', '2015-01-12', '2015-01-12', '2422073894524242294', 'lifted', '17 COLIS ', '340.00', '', '93300', '95190', 'Eli', 'GRIFINS', '71.58', NULL, '', 3, 1),
(173, 'SOGETRA', 'G-15-2-3', '2015-01-12', '2015-01-12', '3058703254349564441', 'lifted', '16 COLIS ', '400.00', '', '93300', '95190', 'Eli', 'GRIFINS', '71.58', NULL, '', 3, 1),
(174, 'SOGETRA', 'G-15-3-3', '2015-01-12', '2015-01-12', '-1365821914570142762', 'lifted', '10 COLIS', '200.00', '', '93300', '95190', 'Eli', 'GRIFINS', '54.37', NULL, '', 3, 1),
(175, 'SOGETRA', 'G-15-4-3', '2015-01-12', '2015-01-12', '-8814540026236220620', 'lifted', '3 COLIS', '54.00', '', '93300', '95190', 'Eli', 'GRIFINS', '48.31', NULL, '', 3, 1),
(176, 'SOGETRA', 'G-15-5-3', '2015-01-13', '2015-01-13', '5726765875818873569', 'lifted', '42 COLIS', '300.00', '', '93300', '95190', 'Eli', 'GRIFINS', '60.43', NULL, '', 3, 1),
(177, 'SOGETRA', 'G-15-6-3', '2015-01-13', '2015-01-13', '-6284082866749881582', 'lifted', '2 COLIS', '25.00', '', '93300', '95190', 'Eli', 'GRIFINS', '39.12', NULL, '', 3, 1),
(178, 'SOGETRA', 'G-15-7-3', '2015-01-13', '2015-01-13', '-206158366850399715', 'lifted', '4 COLIS ', '94.00', '', '93300', '95190', 'Eli', 'GRIFINS', '48.31', NULL, '', 3, 1),
(179, 'SOGETRA', 'G-15-8-3', '2015-01-13', '2015-01-13', '-4879600748666009392', 'lifted', '5 COLIS ', '75.00', '', '93300', '95190', 'Eli', 'GRIFINS', '48.31', NULL, '', 3, 1),
(180, 'SOGETRA', 'G-15-9-3', '2015-01-13', '2015-01-13', '1642873626436520467', 'lifted', '24 COLIS', '120.00', '', '93300', '95190', 'Eli', 'GRIFINS', '54.37', NULL, '', 3, 1),
(181, 'SOGETRA', 'G-15-10-3', '2015-01-13', '2015-01-13', '1292401890799275604', 'lifted', '2 COLIS', '120.00', '', '93300', '95190', 'Eli', 'GRIFINS', '54.38', NULL, '', 3, 1),
(182, 'SOGETRA', 'G-15-10-3', '2015-01-13', '2015-01-13', '-8252896089502626891', 'lifted', '2 COLIS', '45.00', '', '93300', '95190', 'Eli', 'GRIFINS', '42.25', NULL, '', 3, 1),
(183, 'SOGETRA', 'G-15-10-3', '2015-01-13', '2015-01-13', '6144653268144113192', 'lifted', '44 COLIS', '400.00', '', '93300', '75002', 'Eli', 'GRIFINS', '71.59', NULL, 'DOSTAVKA V 14H', 3, 1),
(184, 'SOGETRA', 'G-15-10-3', '2015-01-13', '2015-01-13', '675625198367229029', 'lifted', '1 COLIS', '20.00', '', '93300', '95190', 'Eli', 'GRIFINS', '39.12', NULL, '', 3, 1),
(185, 'SOGETRA', 'G-15-10-3', '2015-01-13', '2015-01-13', '-5878940015582426530', 'lifted', '1 COLIS', '25.00', '', '93300', '95190', 'Eli', 'GRIFINS', '39.12', NULL, '', 3, 1),
(186, 'SOGETRA', 'G-15-10-3', '2015-01-13', '2015-01-13', '-1881956164690229565', 'lifted', '2 COLIS', '50.00', '', '93300', '95190', 'Eli', 'GRIFINS', '42.25', NULL, '', 3, 1),
(187, 'SOGETRA', 'G-15-10-3', '2015-01-13', '2015-01-13', '-8536765266892666513', 'lifted', '7 COLIS', '210.00', '', '93300', '95190', 'Eli', 'GRIFINS', '60.44', NULL, '', 3, 1),
(188, 'SOGETRA', 'G-15-10-3', '2015-01-13', '2015-01-13', '1423855798695445256', 'lifted', '2 COLIS', '50.00', '', '93300', '95190', 'Eli', 'GRIFINS', '42.25', NULL, '', 3, 2),
(189, 'ALOG ', 'G-15-10-3', '2015-01-16', '2015-01-21', '-7766330300656103934', 'lifted', '1 PAL', '550.00', '', '34570', 'KAZICHENE ', 'Марто', 'Грифинс', '600.00', NULL, '', 1, 1),
(190, 'КАРГОПЛАНЕТ', 'G-15-10-3', '2015-01-16', '2015-01-20', '-5190337734555578605', 'lifted', '', '60.00', '', '42601', 'ГОДЕЧ', 'Марто', 'Грифинс', '200.00', NULL, '', 1, 1),
(192, 'BOMAR SPED', 'G-15-10-3', '2015-01-15', '2015-01-19', '-3904670463960136432', 'lifted', '1 PAL', '516.00', '', '53940', 'SOFIA', 'Eli', 'GRIFINS', '380.00', NULL, '', 1, 1),
(193, 'NIKAKOM', 'G-15-10-3', '2015-01-16', '2015-01-19', '-1167076406195436669', 'lifted', '13 BACHVI ', '650.00', '', '17100', 'SOFIA', 'Eli', 'GRIFINS', '850.00', NULL, '', 1, 1),
(194, 'SOGETRA', 'G-15-10-3', '2015-01-15', '2015-01-15', '-3898209526779917912', 'lifted', '1 PAL ', '400.00', '', '95500', '95190', 'Eli', 'GRIFINS', '86.63', NULL, '', 3, 3),
(195, 'SOGETRA', 'G-15-10-3', '2015-01-15', '2015-01-15', '7008425067601676604', 'lifted', '1 PAL ', '400.00', '', '95190', '77600', 'Eli', 'GRIFINS', '86.63', NULL, '', 3, 2),
(196, 'BONBONEC', 'G-15-10-3', '2015-01-16', '2015-01-12', '7522127242986278233', 'toLift', '16 PAL', '5400.00', '', 'Plovdiv', '34260 ', 'Eli', '', '2700.00', '2500.00', '', 2, 0),
(197, 'SOGETRA', 'G-15-10-3', '2015-01-15', '2015-01-19', '4734462979387376064', 'lifted', '4 PAL ', '443.00', '', '95706', 'SOFIA', 'Eli', 'GRIFINS', '1955.60', NULL, '', 1, 2),
(198, 'SOGETRA', 'G-15-10-3', '2015-01-15', '2015-01-15', '3131579836622128456', 'lifted', '5 COLIS', '75.00', '', '93300', '95190', 'Eli', 'GRIFINS', '48.30', NULL, '', 3, 1),
(199, 'BONBONEC', 'G-15-10-3', '2014-12-12', '2014-12-15', '-7348525305193283062', 'delivered', '4 pal', '776.00', '', '34260', 'PLOVDIV', 'Eli', '', '1150.00', NULL, 'VECHERTA PIERRE GI DADE', 1, 3),
(200, 'Рад Пойнт', 'G-15-10-3', '2015-01-16', '2015-01-20', '-2458577492388067551', 'lifted', '1 PAL ', NULL, '', '77390', 'SOFIA', 'Марто', 'Грифинс', NULL, NULL, '', 1, 2),
(201, 'DONAU TRANZIT ', 'G-15-10-3', '2015-01-16', '2015-01-22', '-5911299635219513067', 'lifted', '3 PAL ', '670.00', '', '93600', 'SOFIA', 'Марто', 'Грифинс', '300.00', NULL, 'DURPANE SLED 12H', 1, 1),
(202, 'A LOGISTIC ', 'G-15-10-3', '2015-01-16', '2015-01-19', '-4969728908386283897', 'lifted', '1 PAL ', '150.00', '', '93500', 'SOFIA', 'Марто', 'Грифинс ', '270.00', NULL, '', 1, 1),
(203, 'SOGETRA', 'G-15-1-4', '2015-01-19', '2015-01-19', '-2019330948185832997', 'lifted', '22 COLIS', '660.00', '', '93300', '95190', 'Eli', 'GRIFINS', '88.02', NULL, '', 3, 3),
(204, 'SOGETRA', 'G-15-2-4', '2015-01-19', '2015-01-19', '-3249128365894909831', 'lifted', '3 COLIS ', '60.00', '', '95190', '92230', 'Eli', 'GRIFINS', '56.53', NULL, '', 3, 1),
(205, 'SOGETRA', 'G-15-3-4', '2015-01-20', '2015-01-20', '4505059691424075389', 'lifted', '5 COLIS', '150.00', '', '93300', '95190', 'Eli', 'GRIFINS', '54.37', NULL, '', 3, 1),
(206, 'SOGETRA', 'G-15-4-4', '2015-01-19', '2015-01-19', '-526748031888243643', 'lifted', '9 COLIS', '400.00', '', '75018', '94398', 'Eli', 'GRIFINS', '78.63', NULL, '', 3, 1),
(207, 'SOGETRA', 'G-15-5-4', '2015-01-20', '2015-01-20', '7240926193748296586', 'lifted', '60 COLIS', '180.00', '', '93120', '95190', 'Eli', 'GRIFINS', '54.38', NULL, '', 3, 1),
(208, 'SOGETRA', 'G-15-6-4', '2015-01-20', '2015-01-20', '-7500419887909418943', 'lifted', '1 COLIS', '10.00', '', '93300', '95190', 'Eli', 'GRIFINS', '39.12', NULL, 'DOSTAVKA V 14H', 3, 1),
(209, 'TIVAS SPED ', 'G-15-7-4', '2015-01-21', '2015-01-26', '3815232716303123749', 'toLift', '1 PAL', '750.00', '', '17100', 'SOFIA', 'Eli', 'Грифинс', '420.00', NULL, '', 1, 0),
(210, 'SOGETRA', 'G-15-8-4', '2015-01-20', '2015-01-20', '5196291515364822903', 'lifted', '2 COLIS', '50.00', '', '93300', '95190', 'Eli', 'GRIFINS', '42.25', NULL, '', 3, 1),
(211, 'SOGETRA', 'G-15-9-4', '2015-01-20', '2015-01-20', '6600016338440635156', 'lifted', '2 COLIS', '50.00', '', '93300', '95190', 'Eli', 'GRIFINS', '42.25', NULL, '', 3, 1),
(212, 'SOGETRA', 'G-15-10-4', '2015-01-20', '2015-01-20', '-2112604622052438875', 'lifted', '1 COLIS', '20.00', '', '93300', '95190', 'Eli', 'GRIFINS', '39.12', NULL, '', 3, 1),
(213, 'BONBONEC', 'G-15-10-4', '2015-01-22', '2015-01-28', '7473568443567853330', 'lifted', '20 PAL ', '6000.00', '', '34260 ', 'Plovdiv', 'Eli', ' 8 PALLETI NIE I 12 DRUGA FIRMA', '3600.00', NULL, '', 1, 5),
(214, 'NIKAKOM', 'G-15-10-4', '2015-01-21', '2015-01-26', '3231553038605634382', 'lifted', '4 KASHONA', '121.00', '', '33350', 'PAZARDJIK', 'Марто', 'Грифинс', '250.00', NULL, '', 1, 2),
(215, 'SOGETRA', 'G-15-10-4', '2015-01-22', '2015-01-22', '-5943571262640601419', 'lifted', '3 COLIS ', '220.00', '', '95190', '92380', 'Eli', 'GRIFINS', '110.69', NULL, '', 3, 2),
(216, 'SOGETRA', 'G-15-10-4', '2015-01-21', '2015-01-21', '-4482316319226967365', 'lifted', '10 COLIS ', '80.00', '', '93300', '95190', 'Eli', 'GRIFINS', '48.31', NULL, '', 3, 1),
(217, 'SOGETRA', 'G-15-10-4', '2015-01-22', '2015-01-22', '-8434650584302532005', 'lifted', '2 PAL ', '1500.00', '', '95190', '75002', 'Eli', 'GRIFINS', '125.17', NULL, '', 3, 1),
(218, 'BONBONEC', 'G-15-10-4', '2015-01-23', '2015-01-26', '5039234140682078342', 'toLift', '4 PAL', '1300.00', '', 'Plovdiv', '34260 ', 'Eli', '', '850.00', NULL, '', 2, 1),
(219, 'SOGETRA', 'G-15-10-4', '2015-01-23', '2015-01-23', '-4788652103059750401', 'lifted', '2 PAL ', '600.00', '', '77330', '77500', 'Eli', 'GRIFINS', '102.87', NULL, 'DOSTAVKA V 10H', 3, 1),
(220, 'BONBONEC', 'G-15-10-4', '2014-12-18', '2014-12-23', '-1203565672425959611', 'toLift', '16 PAL', NULL, '', 'Plovdiv', '34260 ', 'Eli', '', '3000.00', NULL, '', 2, 0),
(221, 'INTEREXPRESS', 'G-15-10-4', '2015-01-23', '2015-01-28', '3761242497635340020', 'lifted', '20 ROLKI', '200.00', '', '95330', 'RUSE', 'Марто', 'Грифинс', '250.00', NULL, 'DURPANE V 13H', 1, 1),
(222, 'FLEX LOGISTIC', 'G-15-10-4', '2015-01-23', '2015-01-29', '-2553927118679293202', 'lifted', '1 PAL ', '185.00', '', '93000', 'SHUMEN', 'Марто', 'Грифинс', '300.00', NULL, '', 1, 1),
(223, 'GOPET ROMANIA ', 'G-15-10-4', '2015-01-22', '2015-01-29', '-4601427893811461115', 'lifted', '5 PAL ', '1412.00', '', '62128', 'SOFIA', 'Марто', 'Грифинс', '800.00', NULL, '', 1, 1),
(224, 'GOPET TRANS ', 'G-15-10-4', '2015-01-23', '2015-01-27', '4400593502195042952', 'lifted', '1 PAL ', '400.00', '', '80350', 'SOFIA', 'Eli', 'GRIFINS ', '350.00', NULL, 'DURPANE DO 15H', 1, 1),
(225, 'NEW SPED BULGARIA ', 'G-15-10-4', '2015-01-28', '2015-02-03', '-682223229376902745', 'lifted', '2 PAL ', '600.00', '', '14600', 'SOFIA', 'Eli', 'GRIFINS ', '680.00', NULL, '', 1, 1),
(226, 'SOGETRA ', 'G-15-10-4', '2015-01-26', '2015-01-26', '5554469215997086859', 'lifted', '1 PAL ', '500.00', '', '94360', '95190', 'ElI', 'GRIFINS', '84.69', NULL, 'OT 9 DO 12H DURPANE', 3, 3),
(227, 'RAFA BG ', 'G-15-10-4', '2015-01-23', '2015-01-26', '7636953307573603017', 'lifted', '2 PAL ', '400.00', '', '80370', 'SOFIA ', 'Марто', 'Грифинс', '550.00', NULL, '', 1, 1),
(228, 'AVENIR TELEKOM ', 'G-15-10-4', '2015-01-23', '2015-01-28', '-3848602825705568827', 'lifted', '1 PAL ', '200.00', '', '93600', 'SOFIA', 'Марто', 'Грифинс', '300.00', NULL, '', 1, 1),
(229, 'SOGETRA ', 'G-15-10-4', '2015-01-23', '2015-01-23', '-5093355845796280296', 'lifted', '17 COLIS', '135.00', '', '95190', '93320', 'Eli ', 'GRIFINS', '54.37', NULL, '', 3, 1),
(230, 'SOGETRA ', 'G-15-10-4', '2015-01-26', '2015-01-26', '469379273896445254', 'lifted', '1 PAL ', '487.00', '', '95190', '91070', 'Eli', 'GRIFINS', '94.86', NULL, '', 3, 1),
(231, 'SOGETRA', 'G-15-10-4', '2015-01-26', '2015-01-26', '5490285226412427253', 'lifted', '44 COLIS', '274.00', '', '95190', '91300', 'Eli', 'GRIFINS', '80.58', NULL, '', 3, 1),
(232, 'SOGETRA', 'G-15-10-4', '2015-01-27', '2015-01-27', '7630906792086818493', 'lifted', '161 COLIS ', '261.00', '', '95190', '77240', 'Eli', 'GRIFINS', '80.58', NULL, 'DOSTAVKA V 12H', 3, 1),
(233, 'SOGETRA ', 'G-15-1-5', '2015-01-27', '2015-01-27', '5322254970750193392', 'lifted', '1 COLIS', '5.00', '', '95190', '75008', 'Eli', 'GRIFINS ', '39.11', NULL, '', 3, 1),
(234, 'SOGETRA ', 'G-15-2-5', '2015-01-26', '2015-01-26', '-7703279407533963619', 'lifted', '6 COLIS', '120.00', '', '93300', '95190', 'Eli', 'GRIFINS', '54.37', NULL, '', 3, 1),
(235, 'SOGETRA', 'G-15-3-5', '2015-01-26', '2015-01-26', '3548919145725249845', 'lifted', '3 COLIS ', '66.00', '', '93300', '95190', 'Eli', 'GRIFINS', '48.31', NULL, '', 3, 1),
(236, 'SOGETRA', 'G-15-4-5', '2015-01-26', '2015-01-26', '5405700853915010451', 'lifted', '1 PAL ', '436.00', '', '93290', '95190', 'Eli', 'GRIFINS', '84.68', NULL, '', 3, 1),
(237, 'SOGETRA ', 'G-15-5-5', '2015-01-27', '2015-01-27', '-6375369332662842608', 'lifted', '1 COLIS ', '20.00', '', '75016', '95190', 'Eli', 'GRIFINS', '39.12', NULL, '', 3, 1),
(238, 'EM G L ', 'G-15-6-5', '2015-01-30', '2015-02-03', '-4656458865688555951', 'toLift', '1 PAL ', '500.00', '', '06510', 'HASKOVO ', 'Eli', 'Грифинс', '420.00', NULL, '', 1, 0),
(239, 'DONAU TRANZIT ', 'G-15-7-5', '2015-01-29', '2015-02-05', '5773248109935020344', 'toLift', '4 PAL ', '800.00', '', '02400', 'VARNA ', 'Марто', 'Грифинс', '600.00', NULL, '', 1, 0),
(240, 'BONBONEC', 'G-15-8-5', '2015-01-29', '2015-02-02', '-6887941560444763088', 'toLift', '8 PAL', '2700.00', '', 'Plovdiv', '34260 ', 'Eli', '', NULL, NULL, '', 2, 0),
(241, 'INTERLOGIC', 'G-15-9-5', '2015-01-28', '2015-02-05', '-9217004997098190193', 'toLift', '1 PAL ', '140.00', '', '33270', 'PLOVDIV', 'Eli', 'Грифинс', '300.00', NULL, '', 1, 0),
(242, 'A LOGISTIC ', 'G-15-10-5', '2015-01-29', '2015-02-02', '2669533183745085423', 'lifted', '6 COLIS ', '300.00', '', '14110', 'SOFIA', 'Марто', 'Грифинс', '300.00', NULL, '', 1, 1),
(243, 'SOGETRA', 'G-15-10-5', '2015-01-27', '2015-01-27', '491415086397148567', 'lifted', '3 PAL ', '510.00', '', '95190', '91790', 'Eli', 'GRIFINS', '102.88', NULL, '', 3, 1),
(244, 'SOGETRA', 'G-15-10-5', '2015-01-27', '2015-01-27', '2877939621245894758', 'lifted', '1 PAL ', '158.00', '', '95190', '91300', 'Eli', 'GRIFINS', '74.52', NULL, '', 3, 4),
(245, 'FUEGO LOGISTIC ', 'G-15-10-5', '2015-01-29', '2015-02-02', '-3715160920905399498', 'toLift', '1 PAL', '185.00', '', '19270', 'SOFIA', 'Марто', 'Грифинс', '350.00', NULL, '', 1, 0),
(247, '', 'G-15-10-5', '2015-01-29', '2015-02-03', '5193615615681185785', 'toLift', '3 PAL', '869.00', '', '04100', 'SOFIA', 'Марто', 'Грифинс', NULL, NULL, '', 1, 0),
(248, '', 'G-15-10-5', '2015-01-29', '2015-02-03', '5505371718219353885', 'toLift', '1 PAL ', '76.00', '', '84200', 'SOFIA', 'Марто', 'Грифинс', NULL, NULL, '', 1, 0),
(249, 'STBIZ', 'G-15-10-5', '2015-01-29', '2015-02-04', '8839847436552981578', 'toLift', '48 COLIS', '700.00', '', '91370', 'BLQGOEVGRAD', 'Eli', 'Грифинс', '300.00', NULL, '', 1, 0),
(250, 'RAFA BG', 'G-15-10-5', '2015-01-30', '2015-02-02', '3435387665694539952', 'toLift', '2 PAL ', '400.00', '', '80370', 'KOSTINBROD', 'Марто', 'Грифинс', '550.00', NULL, '', 1, 0),
(251, 'DELAMODE', 'G-15-10-5', '2015-01-29', '2015-02-03', '-5830933003209521265', 'toLift', '1 PAL', '175.00', '', '34740', 'SOFIA', 'Marto', 'Грифинс', '400.00', NULL, '', 1, 0),
(253, 'DONAU TRANZIT ', 'G-15-10-5', '2015-01-30', '2015-02-05', '-7001924901710183795', 'toLift', '2 PAL ', '330.00', '', '93600', 'SOFIA', 'Марто', 'Грифинс', '450.00', NULL, '', 1, 0),
(254, 'SOGETRA ', 'G-15-1-6', '2015-02-02', '2015-02-02', '4171587981819396245', 'toLift', '17 COLIS', '340.00', '', '93300', '95190', 'Eli', 'GRIFINS', '71.59', NULL, '', 3, 0),
(255, 'SOGETRA', 'G-15-2-6', '2015-02-02', '2015-02-02', '-3885403327825690133', 'toLift', '3 COLIS', '70.00', '', '95190', '92230', 'Eli', 'GRIFINS', '48.31', NULL, '', 3, 0),
(256, 'SOGETRA', 'G-15-3-6', '2015-02-02', '2015-02-02', '7857561441730577191', 'toLift', '3 COLIS', '45.00', '', '93300', '95190', 'Eli', 'GRIFINS', '42.25', NULL, '', 3, 0),
(257, 'SOGETRA', 'G-15-4-6', '2015-02-02', '2015-02-02', '-5007641535943063097', 'toLift', '11 COLIS', '275.00', '', '93300', '95190', 'Eli', 'GRIFINS', '60.44', NULL, '', 3, 1),
(258, 'SOGETRA', 'G-15-5-6', '2015-02-02', '2015-02-02', '952494999359407865', 'toLift', '1 COLIS', '20.00', '', '93300', '95190', 'Eli', 'GRIFINS', '39.12', NULL, '', 3, 0),
(259, 'SOGETRA', 'G-15-6-6', '2015-02-02', '2015-02-02', '9069906825196947696', 'toLift', '2 COLIS', '50.00', '', '93300', '95190', 'Eli', 'GRIFINS', '42.25', NULL, '', 3, 1),
(260, 'NOVA EOOD', 'G-15-7-6', '2015-01-30', '2015-02-03', '4061626866497572383', 'lifted', '2 DIVANA', '150.00', '', '44320', 'PO CHMR', 'Eli', 'Грифинс', '293.40', NULL, '', 1, 1),
(261, 'HH TRANS', 'G-15-8-6', '2015-01-29', '2015-01-31', '-1552550923826936376', 'toLift', '2 LAMPI ', NULL, '', '06000', 'SOFIA', 'Eli', 'Грифинс', '160.00', NULL, '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `deliverydirection`
--

CREATE TABLE IF NOT EXISTS `deliverydirection` (
  `Id` int(11) NOT NULL,
  `Direction` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deliverydirection`
--

INSERT INTO `deliverydirection` (`Id`, `Direction`) VALUES
(1, 'Внос'),
(2, 'Износ'),
(3, 'Фр-Фр');

-- --------------------------------------------------------

--
-- Table structure for table `printinghouse`
--

CREATE TABLE IF NOT EXISTS `printinghouse` (
  `Id` serial primary key,
  `Name` varchar(150) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `printinghouse`
--

INSERT INTO `printinghouse` (`Id`, `Name`) VALUES
(3, 'Алианс'),
(4, 'Булвест Принт АД'),
(5, 'Булгет'),
(6, 'Дедракс'),
(7, 'Диджитал Принт Експрес'),
(8, 'ИД Принт ООД'),
(9, 'Ифо Дизайн'),
(10, 'П. К. Д. Благоев'),
(11, 'Полиграф Комерс'),
(12, 'Полиграф ЮГ'),
(13, 'Спектър'),
(14, 'Фоли Арт'),
(15, 'Христо Смилков'),
(16, 'Скала Принт'),
(17, 'Офис Букпринт');

-- --------------------------------------------------------

--
-- Table structure for table `pulsiodetails`
--

CREATE TABLE IF NOT EXISTS `pulsiodetails` (
   `Id` serial primary key,
  `Contact1` varchar(20) DEFAULT NULL,
  `Contact2` varchar(20) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `Logo` blob,
  `Signature` blob
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pulsiodetails`
--

INSERT INTO `pulsiodetails` (`Id`, `Contact1`, `Contact2`, `Password`, `Logo`, `Signature`) VALUES
(1, '09 70 44 06 46', '09 70 40 75 02', 'm4r70', 0xffd8ffe000104a46494600010101006000600000ffdb0043000201010201010202020202020202030503030303030604040305070607070706070708090b0908080a0807070a0d0a0a0b0c0c0c0c07090e0f0d0c0e0b0c0c0cffdb004301020202030303060303060c0807080c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0c0cffc00011080041006d03012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00fdfca28a2800a28a2800a28a2800af34fda83f6bff00873fb1af8153c41f117c4f65e1fb4ba93ecf636e55ee2fb569fb41696d1869ae25391848918f3d2b8efdbd7f6d39bf650f0a683a37853c3b278efe2efc46bb7d27c0fe148a5f2ffb4ee9537cb713bffcb2b3b64fde4f2ff0ae00e58573dfb1affc13b21f843e295f8a5f163578fe2a7ed05ab42c352f15de447ecda2abf26c748b76f96cad107ca3605925c169092d8001cf699fb657ed1bfb431337c2bfd9d63f0a787a49316daf7c57d7bfb124b98f3cc8ba65ac73dd28230ca2531920f214e71b49a3feda4da0f9875efd995752f2b77d9c68bad9843ff77cdfb4838ff6bcbfc29ffb657fc162be017ec37e2e87c2de2ef1749aaf8eeeb60b7f09786ac65d675c98b6eda3ecf003b09da71e615cf1ea2bc5dffe0bdba9b5dc57717ec6dfb61bf86dad4dcc97e7c1512dc2e016e2dbed1923007f106e7eef1c807a55efed6ffb4f7c00b879be267ecf1a5f8dfc3709dd3eb3f0a7c47fda5756f18e0b9d32f6382773df6c2f2103a6e35ed3fb29fedb3f0cff006d4f0a5dea9f0f3c4d6fabbe972fd9f55d32689ecf55d167e861bbb4942cd038208c3a0ce0e338af2afd90ff00e0b41f003f6ccf1d8f06e85e29bcf0c7c41cec6f08f8bb4e9743d6b76012a90ce0095b9e91b31e0fa56f7ed8ff00f04edd1bf689f11da7c40f066af71f0b7e39787d07f6278eb47847da19579fb25fc59097d64ff75a197380728548cd007d1b5565ff00587eb5e0bfb08fed9fa87ed1b0f89fc17e3ed063f04fc6af86770963e2ef0fa3b35b4a1f3e46a760edf34ba7dd056689cf2a43a37cc873ef52ff00ac3f5a00b545213815fce7787bfe0e2ffdbebf69df1afc57f0afc25f02780f5c9be1d9bbd4af2ff4cd01da7d2f4eb59e4476659ae5a3919c05e02963b5b6a93d003fa32a2bf39bfe0dd1ff0082cc7887fe0ad9f013c589e3bd274bd37c7ff0f6eededefee34c468ed355b79d1cc5388c93e5be639159412bc2918ced1c17fc138ffe0b39f17ff6adff0082cf7c78f805e26b3f0647e06f86b65ae5c6952d869b3457ecd67a85b5bc3e6c8d332b0d9336ec20c9c631d2803f55abcfbc33fb56fc36f19fc72d67e19e95e37f0dea1f107c3b6e6ef53f0fc17a8fa858423cbcbc9103b957f7b1f27fbebeb5f9f3ff0006ddff00c162fe2d7fc157dfe2d8f8a16be0eb6ff841e4d3d34ffec2d3a5b4dde7fda37f99e64d26eff54b8c631cf5af16fd85745b6f107fc1dc1fb58585dc7e65adf7812e6de750c50ba3ff0062ab0dca411907a820d007dcdff04e0d222fdad3e3478fff006aad5e3fb48f14dd5cf83fe1c890965d33c2f6370d119e219c06bfbb8a5b8661c98d6dc670b8ae63fe0a83fb607c48f1c7c7af0c7ec9bfb3bdf45a5fc57f1f583eabe27f1614f362f875a00251ef080722ea5394841ee410416561f237fc1597fe0acff117fe09b5fb617c3cfd963e084bf0bfe037c3dd1fc376d2dbf8a7c5fa6dd5ce988852409027971ca5614d8a85846ec6463b994039fa6ffe081be22f197c75f0f7c46f8b1f153c13f0ee3f899e26bdb6d3eefe20f8435ab7d4acfc6d696e85211b619a45b768005050040c1d094041a00f16f8f1fb60fec89ff06c4784e3f09f877c3d77f123e39ebb10bdd5e5370971e21d4da5f99aef52d4240c6059092cb12824e4111e097af9aee3fe0ecafdab2f34cff84d2cbf653b71f0e9739bd6d3f5692dc8c12337c10459e47f0ff3afb2ff00e09eff00b297c05fdb1747f895fb49fc57f841e03bff00881e17f891e268e7d5c5bdcccb245a65dba453c90cb3491bc8238c1fbbb72a30ab802aefc3afda6bf6cdfda23f63c9ff0069ff00076adf0a3c3de1196c2e3c47e1cf8557be1e96e27d5744803b2a5c6a6b3868af668a3ca7969e52965041c9da01e6bfb37fedf7fb237fc1ccde1aff00857bf107c1ade06f8cda7db1b8d27cdb848f56b478fe7171a56a51857731b7ce61600f04947504d7d03ff04d4fda8fe247ecf7fb4aea5fb207ed0bac2f88bc6da1695fdb1f0f7c6cea50f8ff00434254f9b927fd3600a448324b05624b6ddeff0095bff05dafd9b3c31e1af82df017fe0a15fb3a6973fc36b9f1add69fa86ad67a7a2409a76a12466e2daed513e557df149149b46d721091966ddf797fc14d7e35da7c59fd837f642fdb534e8f4fd37c4be04f15786f5eb9b846d8a34fd50c76ba959863cf965e44eb9c08cfa9c807d21ff0551f0f4ffb37788bc0ff00b56f86a1116adf092e534df1b2c31664d6fc1d773225f42e0025cdab98ef23fee986403ef9afafa0bd8751b78ee2de58a7b7b8412c52c6c192446190ca47041041045617c77f86161f1bfe07f8c7c1baa47e7699e2dd0ef747ba4cfdf8ae20789b07e8e6bc6ffe093be30d4bc77ff04d1f81ba86b031aaff00c21d616b77fbcf33324110809dddff00d5f5a00fa3cf4afe4eff00e093fe01fdac3c7ffb49fed4765fb2bdef865350d463bad23c4d67ac4d0c466b4babbb948e680ca3609a22b2618b0c798786ce2bfac5af17fd993fe09e3f05ff00634f19f897c43f0c7e1fe8fe0fd67c618fed9bab3794b5fe247906edeec07ceec7803ad007c73ff06d67fc11cbc67ff04a7f811e35bcf89773a70f1dfc42bf81e7d374fb91730697696caeb129947caf2bb4b2336dca81b0024eeaf883f686ff00821cfedcdf03ff00e0abdf137e2a7ecefaa787ecb4ff008a17da9f95e241a9db45f61b1bf6f32686e219d59d594e0068d1ce5159483d3fa0da2803f26bfe0d84ff00824d7c6bff0082602fc605f8bfa3691a57fc25eda6b698d65ab437de7793f69f3377964edc79898cf5c9f4aeb7f669ff00827b7c4dfd9d7fe0bf5fb427ed39e2db0d234df83de27f095c5bd96a8ba9c72cf951a6bb17b75cc8a02da4e4923f847a8afd38a8eeada3bdb6921991258a5528e8e32aea460823b822803f243fe0a6bfb287ed35fb677ed03a27c4df83d07c1ffda4bf670f1ae836f77a7f82bc671db2d8d8192d914dc5bcac23987985527592399583b10cb851537fc1b23fb0d6a3fb167c43fda234ef1378b3c2767e369b54b15d63e1af86f509af2d3c10acb34d6e6479090d2491be14ab3e1231b9cb1c2fd4bff04a6d65bf677d4bc7dfb2c6b92c89ac7c19bf7bef0b191768d53c237f2bcda74d113f785bb196cdc0fb8d6c993f30af3cff00829afc10f1efec79fb57e89fb66fc18f0f6a5e2ebbd2f4c5f0efc56f0669ab9b9f14e80adbd2f2dd3387bbb5c0c7058a051c2a30201c57fc125ff691f82de03f09fc4efd9afc5ff14fc131fc49f17fc45f1839d020bf75b8686f2f26221dee8a9e7ec2dfbb0c5b238c9ab3f0dbe12fedb3fb38fec532fecc7a17c32f871e2eb7d37489fc23e1ef8a73f8d05a5adb69b2068a0b9bad31a069da78617c14462acc8b8dc339f2bfdb57fe0917fb3c7fc1c49e178bf681fd9ebe24e9de18f893750c42fefa042d15ccf1a811c5a95a8226b5ba40a17cc0376154ed900535f3ddb7fc11f7fe0ac3a5f873fe15f5bfed0447843ca6845e2f8f2e3688f98bcb1218bed414a12db7eee3afcd8a00c0ff00838afe30f877e017ec4bf007f604f86dacc9e3af187855f4e1af1b10b2c9e6430b436d6ccab9c4d3cd3b4a23eaaa91e7ef0afb0bfe0a61f0263f82bff0492fd94ff64692dffb4bc57f107c4fe13f089b4126f655b4922bad427ca904c7198f6965e82407deb95fd863fe08a1f02bfe082fa3cffb477ed37f13747f1278f347324f637d70cc961a7dcb024fd8e17fdfde5e36582b119f98911a9f987bd7fc13dbe10f8eff00e0a29fb678fdb23e2f7872f3c1fe19d174d9348f82fe0dd4140bbd32c26044fabdda63e5b8b85fb83b23770b1b100fbf3e2a78eec3e14fc2df11f89b54996d74bf0de9575aa5dccff76186085a5763ec1549fc2bc2bfe0923e1cd53c2dff0004caf81d6dad471c3aa4be11b2bdb88e3042a35c279e00079e920eb5c77fc15dfc6d75f147c1de11fd9a3c2f71743c63fb42ea0349bf7b36225d13c330b2c9acea0c7042a8b7ff00474ddf7a4ba4033835f58e8fa25a786748b4d36c208ed6c74e812d6da18c616189142a28f60001f85006ad15079b27f77f4a3cd93fbbfa5004f4557f324f7fca8df27bfe5401628aad993fdaa0f9847f15007cedfb7f7ec85e22f8c2de1cf89df0a2fac340f8eff0bccb3f866f6f0b2d8eb76d263ed3a36a1b7e66b3b80a3de395639179539d9fd8aff6f9f0e7ed73657fa15e58ddf817e2cf851113c5de02d61826abe1f98ff101f76e2d9cf31dc45ba3752a720e547b826f46e8df9578ff00ed5dfb037c3bfdb02f747d5fc4369a9e8de35f0c06fec0f18787af9f4bf1068449dc441751fcc5091931481e36ee86803c67f69aff00821b7c27f8d3f14aebe23781356f1a7c04f8a578c5ee3c51f0eb543a4cb7ee4f2d730006198905b276863b892c6b951ff04ccfdad21d23fb3a3fdbefc73f610a62567f877a235d797db3395f30be3f8b7673debbbd2fe1f7ed97fb3bdc25be91e34f855f1ffc350105478b2d26f0bf89360fe0fb4d9a4b69339cfdf6822e14704926b413f6abfdaa8f860cadfb25e8e359c9c5a8f8b7606d8fcdc7efbec9bbeef3feabaf1ef401c8fc05ff0082127c2cf02fc5db3f891f14bc45e3bfda27e23e9b279b61ad7c44d4ff00b461d2db2a41b6b300411e0aa91956da40230466bda7f6d9fdbe3c25fb16f86ecedeea0bdf177c43f12ee83c25e05d1079fae78a2e7801218864ac4a48324ec0471a8249e003e6b7de17fdb3ff006839cc17be22f849fb3de812e77b68504be30f10ed3905565b9482ce2201043f952f2394c1af4dfd963fe09f5f0f3f64fd7f53f1269906ade27f885e20454d6bc6de27be7d57c41aa81d11ee24ff005710c0c43088e3181f2e79a00e53f607fd91fc5de02f11f88fe31fc68bdd375af8ebf11e18a1d44580dda7f8434c4f9a0d0ec09e4c31b7cf2c9d6798976ced5afa465ff587eb56aab4a84c8783d7d2802cd1451400514514005145140051451400514514005145140051451401ffd9, 0x89504e470d0a1a0a0000000d49484452000000c50000005b08020000004c36d694000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa864000032cb49444154785eed5d074c54d9f71e150c550c4d20a0280415c1d835b655e3baba1abb465d578d7d8d150dd635162cb163ec1abb06d71abbc6ae51ac5151242835882004669892e9f7ff9d7b6786e1890a8a2efbfb73f2f9f6bdfb6e3de77be79e7bdf1b56c698b9b2428824b10a951a323333554e58e8c4cc92f42a546654663e11df258955a8e4a8ec7cb24172b70a9513957fbeb388e46e154a052b3ec113688fe23c3f14953f1eb789e46e1524908811dce2e9524fff435199f95485f2c2f65fb80a2563063bfc245655def9ae0a5f0567898d28200d7c9220959c31859919cc4c6f855152f607a18a4fff6170328143003921bdb1f0ecd9936fdf2632566066f99c43a09480b4ec0fc2ff1a9ff8932a9e51e9ad9f006beb3f29fee5cd194d4c07c6a0d539d1336432d99225cb706e224afd1b7ce27dfa1f831049e2cf814d24e93f0e2623d3a3bdbf97cc0799aacb3c9e3f4de5cd6b18a5db20c8f7c351317c0231f989d0a338fe8b102249fc39b08924fd07013c0157cc99a9a9f503c36a3af8cd9c1ec35b873974fc6883a4e08f4285f927955ea9a73148d37f3e84e39524fe1c88a67f4eeb663a822a74dcb1615b5deff026e1ddf3f3b594c870fc776c5101f1136a0193145ab9c6a836320320c950851f044e1d9695f63eb2611b4c765b361f10299c4c08aaa4f97f022a261eb7d10847d3cf5a9a564260f806a6ff091ab0fa0392458b56ba38f9f5fc6d186c601584e7fad2f2fff0854285adef049f7e4ea72b337ef4f0f90c872333f2dda6078f1f0537880cac17919c92854b1385e162fba004a78963243f9e4f8201df0954043e49122b2b48ad3f08d0c30faddf1e70841a563474f4f0eaceb5f71f3d8956f5acd0c48af86a0e9492e4b78924bd825161f13857a534b19c400d5004c1cc0c7aa6b102611902822fe8c2520a30f1058f0d5a66d630b39a99000d33d1ae9ff5168a95ace4db803e53ad66ea216a65da02a54eab363323ecfd49e6ef055a52f2605b4fffd55dbf751961d3ccd9b3d1ae8169f82e1450aa212452ea5d49e2b7a0c2e63bd42549293f6015dbfb01bd81a9013d534177e0d3175e920b8b0a98985e4f650976273a1dd3021a824ecf8c7aaa0de347590b247596057cc82031da458789f1f7afde09f10fbe72e922ced1a824ff77024f0b182a674c4d3dc6bc56d8bd7b975a1ede79051fd10783a988e7a171d99712e074299692b7a00769e237a352ed8fdbefe712b7ace344848b4b49e66270c740e044d498887f4546a63493e68563b30974ad353115605d51a3b805926acb06c12780c5c73f707576af5327202d330d97fc199064fe2ea08768063cd250a3ecc1fdab704e8b97d08693565f6462708ad22236f09116a3d4bb92c46f43a5e3131c0c2ca131c39f9bde24bd8a8fbf6732119f109f8990ff53d8f82400aee8f485fcdc54f021f5f4917d4ba267444f19b776f9a253a7ffc9cc7a0b03c028067391c124e60868b3dc7cc2220e1ec8c0b42028aafb98fbd1c5c53530a461fa47780b181cdd28079fbe303a7b989899464b533aebd1e5976ab21aefb373693434847f678340824ac4271e00119ff89ca5d66bb40d1b84350e6d484e870c8ed8a8f475b8cd43d84bfcdd87c3060f77aa56130f31c4dbddcbcdd11d27b5dd3c17ce9bfbf2593caad419d468cbfa7496fb01d571eaa3ad8cccb4c888663ede018f92df815c88d5f83b90f2f1e9f3bb0cc57de32ac291ddba761363993ff76f9cf374a072f04968b33240cc71fcb126236d5cbd1e2a8b59bc1ce710c12749110151d016117f48970fed3f0a65abc95c7afd3668d7eea3af5fa7171599de25e7c4ed3bdfa3533fdc82cc9d3d47a713bbc9828e3089b4e6cf00620603407a13774e3d7efb1515be7af90efdfbc88c6aea2a2ab430b52c107c92245a21e862bb346a8b942d1bb5a826737c979cce3b034106b468cbf3afa1f2f009ea571978dc83f394d789b0503599431adf56e122c96f019e5d1e742354a290e8dcc993be3ec128fbe7c889a929d996a22525e1e5db3f474d429e813d87d294054b18316be00422addf063c7c7ccb072b48fcc75cc41446f3071458ba6c39aa3a77ee32ce918efe480a961f821c022025868679194d5be4e6d96b6871c4a07138c7d83f295e2af00fd5f2fffe48549ef90ecfa88693897c4cdfdf7a4165dbb6ecc2b90937a9b364d152c1e72c52d682a828940a088eb87ceb11d40f6b182986d5f1709eec818ae03a841cde7f5c26abdefff7de7a75018fcd7976aa8720694280bb10c430f40fab455472e5c209b4b866ed7a9cebe162484a298e9625295f04263eb1b620a76b662a2c2c789c4722cf2bead9f13734faf06e022ef9e83e37519600982749f911a8447c8245f88a8c1d397010fa6adabc3557204c01cb7d5617dc7e44b8258b57a0d4c021e3b2d548670aaca7cd46781eb13614792026337769f0358c1d8b3b8622c3860ee477c87e9c55a5100280d9f8ac44194cb413c452539350bc6fbfc13837e23e17492981329adc0a64469f0548277cd14a2da28dd52b37b83b7bf6ecdecfa0a32169c975498a9702f41c0f4039bbf12da85c7c82c6746a4d68dd86b0d3c61ddc39911b80d382d64a79c4a12000d9b6c46e459199b316e3826b99ead2533456ac416e0e01caa537637e645b766c46c1c54b69d56da472963cb65212f0b915963415e6e405040439b9d4ceca122b2c21a577b29cbe41ca270c5f4bb3393b71fa6cf76e7d11089cbb74cdd29eb4eccf06d737415cfe9b7cb27545d88f3e53606cd39a8d3070bb965df30c06151102dacc63ac88e72b5110810cc5328c9d394c93ceefbdfb730ddb040690737f63b33168c4b76f2c2832500636337aa14ce6969a91662447489de145a4108d82197acee00943c7a0d1b85357718e1b5c2cddb383280b168219c5555921c96c03f844ce92fb4b4cc4c427d49e90f4a2df80c1ad5a75f5ae17f65e41512697e282a2870292faad89c529761099ed21c940f85c715e33c472f7df8cc7d13ce6238438b810a2f958105ca73eec74f0c009bab4e8b44828d4569033097103e9342f27cfc7d93ba26164a152a9e4d15176726adefb144ea60c6e0f5b41dc04630024a2b85a652e403d0ab5d6db2778c5ea153c1f4d2bd6cc3658dac5398fd558ec4a5a7b2e5bbe0df7ec449299f203e007a61beb5d1becb34980bba02c80138311813fedcd1aa3e7cf5bbb764b6050f8c80953d0988e76a124f5889a6db0bff5657c5b29019bd0e5bfc9273cb50af2e414cbe09184c4cc83ab9079d5ae9b922a967525f2dba0c39a991518d97be458316fa593ccfdf9b3d73857324d61913cb26ee3a103faf0c73a476c3dd80a72baa035710931f19d4fd6a95dd7c1c387f014710b6a454e1b6cd6a5da6e9d39874e86d56f2dfa6c2d522aec2b91a02c9643264311cb46fc74fdce8d0963a76f8b3de8e8e8f1ec1945e2fc8b5edb5804eceb97dc92408838970cb6f48e7157642b628f1252d6f9ce92fd334eef1b807e834f1a5aafe392e4def55b8eb26a30d5c4893379023a5ba28815f04f468d391f8cb975fd0af22f9a2fbec027b91f7f1f290dea05abb434d9f1f8c9d26764f9844f389a4e9f023f5ca6ce9cceaf910df98b671ceba403e3c1b121064f0c0dac8b262e9dbfcd6bf85c2705ec2b2901de44714ede68f1a580e89e9ea98c4c3765c6f49bd7eff7e8d6af7d872e68d440ef0cd01f4b25a2b81d272cc314773f45c99e9718ac2d8f3df8665be9fba5bc93c5f2753e899016eb08854e8e7aed6f7d276c8b0eea8889b58a6c093b39d5f4be7ce31e4f90e6b7c26ce44b1e954a818838303058aea25855c8d2654b50499326cd0bd5a81955934944417e025b5a354ed1127b70ff914ce658b741f3e4f477bc0261030cd9161123335c1de656b2dfe0c1b41d3a6a24edfd0841ff858a4a837d251250069bc94bad04fa81dad1c4c6dd5ba3a2e7bd799d5aa39a4bece6cdbc5928cd52090af28d318c14296280a0053d4b9feb18cf4ce09725062b4ad920f2a327081c6d97f6b05525f0753ef1be1bde66243f79f958638266514e9ae79b003723b698691289db7304767273f5eed4ad37ed4b7eb1156e5db669c34e14397efe1cce75a4448c878d1f374126ab3162d4782818f508aada1524ddf11888ee3cba1e1fd620b275c75e096934758a3539cf5942c59c4fd4c9050be837241ebef5dea6233283502866aff74f605f8904c403b42672f2f77dc595205ddc85e6533f7eecd4b3f7eba4d49ddb0f54afe6f8e6ed2bdeb4b01f65464e64b3a5f0ca314072ff9fef1801f931528cdabe9f28620f5b4e9eb944f152f1f5f8099944bd5a7a7b8aaa6d83f966a0123118049b44d0fcf7393e2e9e2d9bb6f10b085db07c2d5214dc4e254b11780770a2372a54f5029a75ef350c993e32b992ea312bf2739a47b680c96f3e7884e73ad704b29628ce0d40b6441347761e0ca81ed4bbfb883c9598ccb40672e9a251641056278837bed7ae5d7575f144e5cb36888d0c05dfe4d2f0c541295de528ae8483663a0158114fbc351bcaa315ea15174ae4d334aa65a3a7cefe6bf6629cb46dddb963874e06b38a3f81a2a0a5b87838e17d8d26dcb2d46325045555323fd1945390f2f0578d68c8d249b16ae646ffc2b83e8bb2c4e3103a11fdb34bff023024e41447c989bd60603455cd9f3215763a7de2bc8b9bf7998be2e3216496d429807fb8a5bf70f2a44ce679eed25da4a84d85a29e0b6768e3605af4229c8391454ccb677d521c17b3c948d38746a99b3d6b410d99fb8cbf166974e4db142c1f471d052b78acd100460a2e822b00980a3e997febd6d7b9866fc7f67d3e184da8853b33410e98104771297a683299e80944dc0380a6fc33047afab9069087d6664ab35e458da2eb38a2673a2d05947a3e792199ba7af2c4e5a64dbbcae5c68cd48f3299c3968d5b691ca889dae1c24f502996355a034df190a4e4b4f3e7cfe93558178be6a067ea1c3780594f1f76a221c4304c41dfee80a08835a1400083b5a90b7d00a878d95126fff485cbd2203aff39140bb2427253536a39388e1c327cfffe38ff80e07c792eaf41dcb4d569039a4725f2be3d7f6d1ed95903be90dec5c8d9c861435cdc6be568e069706d0455744c852995f7194f221db3df7f68d208815a8dd82dc77089ba8af86e218a08460068de484c82c245023b1877c6c33bcca166c0fea36771b7901698d41dac1ff52cdfc00af5ac408713faccc66834a34ba2be6241ff602e585804629c11a819fe008c07db908c4b100227006d916894d9cd1bb7dabf632f8a5fbb70a166b56a69492f7865a81f99617b6403e85d003f2245fffe5d72bf1eddbbb76fcd74b894886814ecc1111ab265408b1aa3365759909e969470e7daa5d5cbff8ebf731d373ef56d5fc60fdacfa467b15488ee43f458f6eb312a367af0483895ccac8f3d7b0ec6e205ee476f54f19cc45d01fe9c0178e851c498feeea5730d8743fb4fa338df38a66a2f5c388b7aa6cc98890b8541cd3fce149f778219463ddc2b63376edd681c1ed1b65de76bd7eec18650270acb49f13037d56f6b8808639d3b12df66780745d670f3ef3bfc0f5c7281ee6cc2e94724417e740f558a4b988d1bdbfc9119738cea2c6d51a65a919e93999099f23425f96172e2fdc4843bcf1e5f7b78fffc8d6b47cf9dde7de5e28197cfaf3c7d78fee2991d674fc40eeddfc5d7dd75d9a2599bd62fefff7b37b79a0ef3e74cdab076eafa3553d6ad9eb27963d4ae1db377ef9cb96ee38498b5a3d6c54e5abf72e25f237f9f37656c43ffdab3278e59326b76f4c4490ba64e5b3875da8639b363268f9ffbe7a0b9a3064ceedf6d7cff6e637a77ed1c1e36a853c7494347b46fd63ac4bf5ea87fbd7ade01ae8eae4e8e2ecd225abc4ba4df19db5ba12cf8d97c827d606f00e642678fee3a04120c1d3a06f6a9dfa0d9dc79f4410fb747896158cd8c73a260dcc1fd0e328794b71444abccb481f4ead52b3fbf005475e8c8515c1af83c8510c7c8e4267391ce400fe2a5cbd79c9cdddbb5ef242fc2e38836347273969ec11d7e4408c719807e21274ed08a38eacdfabcd1238637086ae8ebe573e4d00e95e2edbb17d712e22f3cbc76ecc291ad07b7aed8be7ac9fed8557b37addcb361c5b6358be74e1f3b73e2c851837bf5fca5658fce119dda84b48a08886ce81311e419e90b78f85597d5a24f277ea6a035172c9df989a3934b2d975a3ed59d3cfd829a74ec32b073b7811dbbf5f9bdff88c52b36ee3d7cead8f133496f049384cf29b64259f023f8042f528243f600297426a3d6481e253333b396b3bb87a7f7fb0ff9ef330aaacbdcd7aedbc40722a8530ccbd088645470e69499f5ea8450a443b78ca9191941f542dab4eb5cdb2be8c64db12d04368034f010e0079c8d7eff8edd5e6e5e63464e30a8a918a8a3d567e6143e7afdf6f2cdfb074f9ddf7c70ffead80d0b172f9a3c6e4c9f11437af4efdda56fafce3dbbb76fd134040671e104a855c31136298fd4442199cc59267347b427ab5647e610207309f6a9df3630b455ddb096f51ab50a6fd9a543f701fd874f18326a4a9f2163bbf61ed6adf7d05e03fe44c1765d066cd81ab76aedb6956bb6b8b8f9ffda63d08123e7d7ef383577e98ed59b8f6ddc757aebfeebdbf7dd9e316bebd89131470fdc8f5ebeb776bd8ed3176e3b7af1c1d5470967ee3c8abb72fb9f6b771fa7bc7f955d94f0be3031a72031372731ef43aa4afdeaa33c0bd10077aad02cf408c1894dc8069452c2105fc5f7ef8f8b76ed01ef424ff62710d301314263a093e123ff80ca4f5cba80f387b71f5693b99cbf74838662a9d95e6c6d91b46dd1a973eb5ff9a9395bfeb64dfb0eb366cf3f76fc6ccbd6b4d7c7b321c2c857695273939e3ebb7a69e9f4e90e32d92fcd3becddb46ffeb439e3860d1df0db2f2d9a84f979d61666ff9a10996a3a048635f8a571a3aecddbf66dd9796078fbdecd7e1dd275c4c40193a3262d5e3d6365ecf25d87571e3ab1745fdca65397561c3a71e4f6a3fb6f331fa565df4bce884f79ff343d3b212be775766ee287dc2c9536cb604ad11ad2f546f846043e05d650087e12b27cfb3ecf90a609b945a42604473ab35760bd6dfbe9e7bf08d8e54ca9e69ac4bfcbcf5f5fbcfb04e7cf9ebf0d6dfacbb68367706ea0d891dea0638dc63f228545a010002dbc37b3f77af641c772352c4fcbe4b4abccd75988e35021569d08211024600dc1bf3e159a2f2bcace27b803b15421e8f96a086b222dad4ac4d4802e812ae2287a2f80bb38f24085c9d54cabe2ba3871f21f1869e8e8313887acddbcd2ddaf6e36c68bc6046d5013fddc0965911fc5010a1b71a75564b3b963a7e2a428e775b76e4dfa76edf221256bd480610d7ceaac5b307fec807e9d3bb50d6fd6d8c3cbcdcdb13a2744e9e2e111181c1c1112d2bc7fff5163ff8a9a3c6b51d482b58b6376aed974f8d8b9ebf79ebcecf44bcfb62d7b0e1c31b57ecb4e0f52b2d2cd2c473c137662e1f827c2b586d5384cf2a9d0d200401e280b503323d6597a9892b13bb713640e9e07ff216660d187637eb6dcdf2becd8c1b35494e5984da4a60f194531cb76c4acd881f35bd7ef7a787845f3f704d63a8921e82c5615fcc730f0d38088f4718432450a6ec1a0c846bb03601e9f5e6c107d2c07ca31df89d5af917f346de44b502b68e6b107c66103342480730d7dc34f1350914a115027c0b5a65b5a2a7de2089934795ac3f0e6a8da6a1f9ce1b9c5b0738dcab786823745ef5f26bfb915fff0ec89635b1a04fa7568d22ceacf31756bd327e10ea54723ae75fd2265322f4c34ad7fe937ecafb923662e9cb761c7be0b37e36e3c3c71f7f995fb09991fd4720d2bc2329d2b4322b15b7621e6387cf8927fdd666bb6d022ab8099e525f903b5c012fc2b2be847ecd9d0097fcf8d491d4f39c66baf1bb011c0d44f06c3684dd62d4483b108ead1e5a803bcc3868ffc0b95f34d29d8dbfc313dcfdda1cef183e4c8b966d8f573f710529f8ebb89f38b676ff979878dfa835e1243d03fe4e0c3a18604acf1868d28b61482e880002f5a0c7b029405e5e013ef2775c566732e6895bcab8aa9d44cad616aac9584ce402071c2618633e37b68089f0dd327d1e7b6b12b79b484c783b121bd868f1934822e5572657a52dad35b572ec6eed9393f6adab0f62dc3c2027ddd1c31657d2a356aba05d4f20b0e89e820abe1d5a947ffa51bb76f3d7ce6c28da7af5e7e58b5609b877be4de233760131013ae056dc3bce88f7842b18ce42c1774a7df8ea2934a3001063b7303b5af581e1b3d6fb59757bddc1c8afa3566ccd334769006eb47fe6504cd29e2680fa44063f4ab0afe69e5a700dba00da211dfdb448a897fae337d529487877fc6079af7389f906836194c8dc3227fedda37332de7f8b1e3eddab40fad1f7ee91cc506fb0f1d7475f71d377e8ec1409640e78ab960d7dc1780d6d1900df616ff0694954fbc87243a0df964ab40f56003c60c6365626ee647b81ce14b612c1c61893cee6c908756640f6e5c84a97a76ed8d5a8daa5465eebbaca4576dc2233b4634c5cab65d78b8b79323e78a4d6ac864b56bfa340869d5a555a7be634647f9fa0622f58f3fc63f7ffd3e31bd2053a149cc94fb0437bb74f729ea27b33076faf425ac65562c5dc5aff42af61e20af4a8ed5c48f5a1d7d02a532d0eff540ad22335389df17e47cc875ab512b2cb8d98b67e9355d02162e5cca2b811208c2007c3f139a012dc8e45658f208482c571278329107ff4029344a0fd5b66dfb1c6ad6be78ed16ce3959914d27be90897f141f1ed1c2d333c0cb3b70c8b09105729af2464d182373769cbf34860a535544627443b0b964735f00f5a4a250763e59ba8c81aff87bc5d08103278e19316cd0efc306f71c3db26ff4f4a1eb62262f5b302a7adac02deb661dd8b96cf3da3907772dbb7fe3f09d6b87ae9cdd753a6ec38ed8e8d875b336af5952d7177390ac53875f3a77eee4e7ebeae3e9ca49532cd59cbc6bf9376cdb65c88871f336ee3c7ee1d68b7bafd35fe429b2c971b0dc6c15a6b8c14347f22b7487fa76fcf859cc4d6f92c43b5df62ef96d4868e3f13366710bc31ea0359e7800e7dc5702e498c84959814b61173678f00859f59aaf5ebf8f89d9191010fe2e330decd1d32c4f34e29f5e69e139843d84bdad2228652196d560b657f7c5805b426d280012883798af5e26611d397f19bd6ed299c172f40721b2f09ae89e3925ebfdadfbcf3272c875dd7df438ac096673a7d8bd47782518210270fa31a015145e970de861095b7f0fca1e8f5bc4a836468436b158fefba47a35475fcf90260ddb358be8e8e2e4d330acc3aaf5878e5f7cfc244df9345b8507507839fe8d9441c9cdf6eac5cb9661d4faf304a28e8629f414e6b39953a707f904aaf22c9fde8e1e36a979cb2e591abd600d988701e0282a14a0f981fb2aa108ee1188a2e7fe816393addbb1b34069f6f40c5919138b44a559a1a50d2de196900d47f487cf93fc5bf29262d318a76f09203301ab2ab4c7b35271b35adb34a24d78ab5f32b57a25d3a94d859c43c45df83f2d2b526873318d528d46e3ecb97fcbaab9d5a9d7e8dcb5077c80061516b3966901c315103ecf1ee876a940b5a2c3158072ed179020d24c78f3f29f3357b6ecbd307b51ecdc25dbc64c593273deaa1163a7f71d32ee8ff133478c9ed6ac45f7fa212d03eb35f3f00cf1f46e84d018a8e5eccd59641157e7da037e1f39b2efec6573b79e3b79a37387dfdab569a32e929ba06a128c930bbd6542e3a4ca9be72fd7ad1dd4a56577afda212f93923155a94d0adc503273c3a61dfbf51e4b3931e3e6e40687b4101fbd082fa037d387562afae305462d457b886ccc5aa651338592a90a99368fe90ac9182ce369924b35b70e988b195bba6445bdbaa1056a721e3cb841974809989f0cb47040c7c47ad3a219611c7e81280b4f3e4e30161b93c81358b3588a98402a4a649347ce7072f63efff03e1e885ca640148f753e1a4631504a8fde8166f0bb8f1ff4e9f28b83cc6bceac0d59b9a41903fba8671f4d2cdf487b0ea28400aab5474592e60b28d77e2695e06fec2da5ed05fd15bd060ad5ec4381fea3c29c92599499a3b87ef3ce93c72f162f8c018ddc3c42fa0d9a12d9a2a7934b831a4efe8eeebe825e42bc6bc822ebfaf5efd27ac18c3f56ad9a77e6d4fe43bb37c45f3ef1f6f9bd03bbb7d676715ab36ce59b67494d421a15e6a5f22ec09c4ca55278b9fb6d5db59377c4989df9262428e8fce9637a4d3a57b1827f324b7b2ae0939a2ca383b7d332a596152859918a9910dcc102e999d9918d5ab878f83fcfc829d019bc028217c5ac418d0a847944471431c2198079054c0b0b1732a39c190b99ae80e93e32ed07a6460ae61d0d2bc46c850a51ad005c283a0acd08ce01425126c4398c6ddfba0d31e2dacdb4f29753436a2d53f1d7c3a452feda0747d38a652ba122bf90b093e7ef500ad5a0e5919f966f0a144fc11cb6e94ca0d420498459158972f30910d12c868a73718291435f78c07102f340f5dc1398d4389ae9b97ffb2ed9cdd5c3d727283e81f6f233e4869769792f32721e67a65d78f274fdb193c3e72e46f4e0ec15dab6eb70078f10590d8f1ad59d9daa4b0273596883085fafe0da8eae13860f581a3df9d0f6d843db371dd8ba30d05db673f5829c37b755d9af8bb2b3a78d9a5053266b11567fcab801c92faf317d8e51996352e3e147f0819e02984d60685a6cd280c03b95a2658be6de3edecf93e80f1c1c387aa8415803850a792018a5302e4882135482e2482c555039aa4536a12dfcc33c4a213c22301d7df240c193e01664d7ee5d18d7a4050b893a10d89d9804aee348c52177afdce8daa51702849133e7a518a05e34afd59b0bc024be55210270c04626026f81d6e31c125312c4068124f13b51763ed1a3648344780028021e157706720e859a5e8de914f21c7f7f3f68edec39da2f919bb1aaa23aa053414161a50933e6d4a8e17ce2f8e58cf4bcf4b49ce437f95b371ff3f50e45c18080c6c3ff98d2b7df98a6cdbafafa217eaaee406fa32c624fba5a4e5eee35eb3855f3b15ccb64c19eaecd4382ebf9f884f9f9f66ed570fed8411be74e59316df4e655515326f61d3fbcd794617d964c1ad7b919c25b59eb762d162e9a3775fcd87a753c23c21b2c9a1fb5785ed4f19d1b8e6d5a16b771f99e98b9719b96eddb14bd6fe3fcdb670e26dcbefafaceed17d76f663e7a96fee051dabd876fee3d484f7c929bf1a4282f8d3e0c517e30e6be63f22ca62f60a6028365bf82ccccd5c69e3c7e5ca78edffcc54b4b72138a0129a115969a92f1f7ac450e32c7daee7e878e9c0547e0ea14fc97395cc31a6b48c79d5d09327d9d4f82e5154ba972ec8f8bb15a059718b03de09605c4600420e61e5dbac05463c7890d373c136abe0c868bc611e1925165c6838b912907f4ea8e9ca1fef59a87473668d44ae6ec57b751db0d3b4f6616d0038d3c68e6c4a58b1ef502af3d7d76f9c1b3fd67aeeefbe7626458d7d0faede62fd9323e6ae5b0c9f3474e8dee357c42eb6e432747af6f10dac6c3ab7e8f417fb6e8d9b7eb885175c35b3bf90403356af957f30c9039b8cb1c3ddc5dad819d9bbfccbd0e7fd7c629eae4217370e33770f9a5177735e82d9d8327bdada3acae8e32572787e611cd9b34a8e7efe1da3838b05dd3f02e1d5a8ffe73d894c9e3162d8c8e9a3965e1cc69eb972c0eaee357d737e8eac5ab8f9f3fba7befd6e3f8f8f7a9e9eafcecfccc449d22ffc8aeddc13e814e0eded326ce95bf179e12024dd00b6c98c4480aa4d91c8fb1f58b1741203a1a2d2f4cc02a1802a5ec4d49276092d1ce45d965f876943b1eb70aba68d914e4e077adb9d0358b98d8a45113a0e55e3dfb68747cf94439f05f519ba844095d00b8806e96aeddd1b475f7c62d3af61cd87ffff163291ff3443e0d53f24f9dd8c55b577c42c332d468946a41c9a0e0e098b5b4cf245402815e1188a099d69d868d9fbe148998a26084b73af65a694e901b9f7cd43ec9563ccf2a7c95513870f84499acdacc98ad77d2f3e333f25ebf2d68dbaad7e061932fde79e113dc74f1b2cdd71fbf3d119f74e2fe9b3d171f1cbafeecc8a5178b37c64d98bb76d2b2357fce993d74ec98b9f39774ee44bf01efd26b48afe1a35bf5e811d6be538b1e0322bbf6addfaa4b50f38eb5429a39fb84f8fa3672750e70abe9ebe316e859dd8398084feb0406db79d8eaae5eee9e753d6a370ca2df8d41229b7798376fd1ea98e5dbd7ae3db673c795e37b9fde399191fc489d57a05766ebb5297c64c2f3d90423a639ddc89458026b2876c4cc887996f66a05b88d7028b6152f25526c404af9502e3e491a83956dc0a5c840dbbe885ed17b747017ff9d5ab3166d95882fe9361225151657824910e3fc54f8b7d5984f8973b83c74f454b3567d0af140d224c9ee5cbd5bbdbaf3ad5bf7795eb4826917b750a13cf55d7a1dcfc89bd7e2f92d08750f77f97440a251e5f7ebdd1b3ddcb5230e2545ea9ba7af026af93dbafb78fc9f53706bf6b43948444b626aa66158051ca55d45c69e3d7dede3e9dfa265075c629505f36256425f11afe530966566efb42c596ecc2c64a9ef358579c6b7cfb3da46feeae214bce3c895f32fd2765f7e002fbb68d596a8bfd78e99bab057ef11ae3569be6edbae47afdf870705b7269759cd45e6e86fef2683bd821afa0586f9d5e9dabad5f4b163fe8e8a9a3a69ea869895670fec7972e178cecb787dc1074d41b6c180be08bd9ad4663516b62a935e49412dd77f89cd0e9c8be8c3065257b950ae78dc1eb68999c04d25ac45977a6ed4cb672f60d8984d122ddfd3882e7eb6128bb5795688885b910de7fcae52fce995751bb7ffde7f02fc38af8dad8dd9e4e95927bf100f28043d81a650844ef6ed3dd4b4590f25a868a941a3631fb5f4529d323f4f781a1840fbec07f61dc725aa56d0ecc0460cfca35dd34e5327cfa9e51a3476e4cca993884f184f21330329f2bc3b0f1fc4ac58b368e9ca1cac3a183b78f488b3337d577ee0d469b44a7d626cf3de5ddb0feee6a7a894aa459f447c5d50a8eaf5eb0099cce1e469fa6d31da85a74529641236811c387ed1c7bf518fae831edd7a9595969ffd51fd263bffcebb8cbd57efc49eb8b464f7d1d9ebb7f71c3335a243bf88167d239af66ad9ac6fb3463d3cdd8230d312d7b8c7abe715d4a171eba983c79ede7cf0c289732f135e99c50c412266158d916f4c60cdaba14565918ec9f9e6aabd5decedf575542c9fc4099463cccd4ef3f4a07df0a387e9f727bc08b80faf6299ad3fad446813e5316822a6651d442ac05deb1f2964eb6377ce59487fcf8457c8ba75ecfd7befbe38e1ada3026117f441b960c19249d3e8033d280b3e5f47fb3ad97c59a73b7b310e7dabed1574e7fe736440a0a1a196596252a26335b75d5b8ff4fa6dc8ea15bba74f59ba6ecd76a4e71b35e985b9cf5392576e5e3fb06f4f1f5777570767ad49b32fee404858786d0fff76bffc46fbaad4b471f9f2b9a87cf972101184c37c0dfae69ae8c7a50a1d53b5edd81977f7ec3b8cdc58ff16d1d7ebda22a62c625a259c07f77020d9e5dbcf02fd69e5d1a8beffd1431bb2f29f99a9aa62815e901349c88cae634678a7d4c667645f4f7cbbe650dc80bfa68777ede9dfb0b99393af984fabc91cbb76ecfad7f871c70eee494f78c4f90431c99952497b1c1a359317b15c1175d919c566ac32e17bf854bcbdc14727988023a6354d9fdf7a600c5b77d2d7928213fc2ef99bcf5562bf84e442a7d69c1818a2780a110e1f3bb370b9f80d1abb77e7ae83acd6d16371fc8abc979555c4a7e8e885bff6a03f7e82c74ecf0ab5667a8da8d5e74e9b8e804916deb4f52bfe75037f54d137eae48205f3c2429a15e4e9860e1dbb6c696c78e30e9b37d397054a835a6dd22a0d1a85a6485da8e8deb6dbe2e8a5cf125e87368d58b9727d9b169d9293d290edecb9132d9b853bd6a876f2d8215c32537efe87c47789f7c9b5d11c281f3f79349a5e19bb036ad2d0ceaa5e4f3b55080de5880ef946ab6556456f92b272672f5aeeeb1d8422906e5d3acc9d39f9d4ce3daf6eddcd4f7a47ef9a499057685e05eda00dccb659fc1d2aa6da54b3ee5156fab9c7f1878f9f9b3439aa69f3b6359de9e350a76ad53bb46d133d6f4e4232fdaeda2a268dbed060f9051b140e8b949f4f560b961718032c67032e45228e6cc688b118ff987193a01afe27b6305d208f105b0d22ffa795940adc85ba884f27cf5c5eb18e7eb10459b97ca55fed507911acc5672412540240d745c7e24e22e078f8907e03c335aebb75fb42707d32cf5f13e628b5948993090e1f35235a550707d79d3b87fe22decbc4e49855b18d23daa66612e74c669dd12c3e3863cb97aead59dde7d43f37ead48fd8fbcfa9a953e78c1b3ef9d5c384ee9d3b79d546dce3f47bcffeb11b77f6e8fe7b8bc8481f4f72d28be6cd4b7cf9bc633b4442b2980d5bd03fb45b64a228933f2470996002cd9eb805c1801526780e1ad253b961f9ceb3112dfb3955a7aa846025d9b74397e889636257cedbb17ec9811d6b939fdd2c4c8d57e7bfb13e5710288d7e55c1df5893e4e84ccfd3b24f5d8f9f346b41f71e036bb9d409ac1d3c76d0a4cdcb769d3d74e1636a2e354cc5508a28c59566334199f08d7c0213f917171668e9884ed304b46e116de3b66bf78b5c859120b7b02e4e6d625f9530bf807dba0410a81e21b97efa8cf9bbe3ce21c9c44ceddb741e396412eef1dff109ad89fc684e2b572a42431ad674acbe68e19c55abfe6edf9e7e7f1c1a167ee60cfd2d3988963e54a2df0f893f0e16bb6903d6feaf5e893fd8cae28e5d9834691e4ef4f4b322989cea3714699b84b79b13b5a94ba7d10bfede8094810346b939d5a9e319dcb15db7c4c4cc1dbbfe69dbfeb756ad7fed3760f4cc0531ebb7ef9bb96085cc95b6df201b6369f61486e2bf5d0670859a252ae20320b7a6179fd9bcd76992b2534f5fbbbc78d3cebe232744b4e9cadf6295901a325988b7579fce9d97cd8d3eb9736bd6836b9ab447c69c57ac080e0b2403458a05ea4ecccd3870326ee4e8498d1bb6879bafe71b3279e4e4cd9b561bcd18ac5167528255c2eb58b5fa757c65be430e498a006c091af1f52741439f6bd27c7c6407fd66b749d30e69efe9353896a9e8b975f7b6440d1c22dd1e920c165835a0516be551518b1ebd49c7c5d357af5d9c3d8f1d165fb8c22a181032533d3c85ccffe4f99b96adb1927786b6431bb6dcb3ff30588e74087fb10f8ed218110999ccda9006618306d2375822501b3f7ef6ee5df4675ef42c4f4fd30879c74dcb37b66bd367f9924393c68bff33187bf2e4d5df8b579c3a7349c3037f08425ccc1342400b3470faf6f3951bf73c7a926449a5346a57c07ef8481743e6c10095d6d00b222dfdc9294e3a9002c77c137b9ef1f1595aeef5276ff69cb8b87afbc139311b3af71becd3204ce622f6cc48e0c63c1d64e101f5db366edcaf5bc78533fedab369cdd1ed9baffe13f7f0d1bd023578438238fcead5f83f874df0e2bc1f3d68c08714fea506fda0af7c7be815158f93bc4d4eac2e93050436c8cc26d56bcd3a3d93f30f274853df035e3d7c895c675426bfcdba71e719aea7cd9c1352bf31ff734cf42a831bc6921f2ae0df25832e2c5fcfee3c4fbff138d5f2bff242c74c063dff2b75c29c288ec407fc0f695cb8205c97f94d72529f3e235ebfcec48591fe960b7c8429f1f59b90e0a6fdfb4c8f8edaa4a5d59ac64031b1103c579826f4f0d3788a10d2ea985ac5940aa62e34191468870b5ae2ad160fed73c01078c7cce0137f878d11995414bcd3bca8e07f2c0b27624ec4c870cc61e64ca67f53a4b89f92bafbc495190bd64e99b768dcace8169dfb07d56be6e28cb9d86ea38bf61e6a37f668d4b569f7a143c62d5eb876eba67d23874d090da0cf37dc1d9cf6c6c662c8a21b92be7d015fe213b70a3dc19244806bc61ecca0d6b56ddb115db9194f9fc7f3e712abb322fe2aa662f8c4a30e76f6ecb5a8697f638aad17d870ea945948916416105a50d1b2855e7269e91db01aae547802f8575b4e31d9fd3565ba5f9d003dbdd447dfd9b5ebf7860e9da0a49f79a2088c4879c64d9d895966d0c099e969301f3a5400f0571fc8804708f64513e824d6e12a237d489ca7a3871fdca3409beba41caac0c870e45fb6d024c04d0b62d137a2fc88733cb1589a29f937525aac1645ef057b7102a0dfe81cd6c6b9b9861709590f1fbdbd72ebd9f6f397a3b6ecfc236ad1e8d17306fc3622c0b73e5cb8875788ac866f0db7bab29a14a88d18331a95d8f7a72cf88a7f2a954f1895b5b7022493c7d16fc6771d12ff631a3ca6227a059960d78ae21345aca7cf5c593075f1abbb8978bceedfc7bab7f4310b63f09fede668598e867ed1815902c3113eb5d887a386dc821cbf3a0dd6addd48ed806d26367ddadf7bf7fec32f1179d0921ccc0a69d9c1af61eba464f16783e9b7da7cf818a60d341df181e3a83331842016f0dd0dd13420d5ea1720ded0098849d006ae102c44d00df41047623f817fd7c5b7003e6a58bef85183bd882f655152489142999295fb26477ef9e99bb34f5e5e7a9e702731a9c0004343ca67bb2fc5e3b8cda3901289a5f2e9d891a320d3ac59b432c23c00b7a4a59d319425bb560420a88aa6d18b176f2f9cb264e3c2cd415e0d15f4d92b3af0855684d82ef558bcc0d2dcf6288814e2d3e5eb575c9cfc12121245ee274f123a771a989e8e98099363aef08bb0d5e14b37efbca119506b8439f2b845bf2cc82076f6312da2ab6857348dcacaae19e4b487fdad1217300da732b4846950f84b0c218f4e28c446a23816a959919c5ec5c056989cc5ff0593664c64452fe59c8fa80b0c28d9c2d7f13dfb050029f4f2954b8876dbb5fb558df881ee211154c55152e47b809af17c937f3a73fafee83fa2231a755ac1bf9ce489122ddb4322f40cf1fca208b44f5cd9b33b2eb47eebbcbc4272246643d4ac4593ff5ac0f30b3dd364273ea784f0075170e2d3fa2522fa40d6e1b06fba4220b9c641d42f1c154e44bb484787059b05281b3ca58dd93c06106568a5c5b584529fb4f0357ce3fa8eb74492f8e65db5ea4eb56bfb2725d383cb0519a8eaef9fe66ce063066f884fd7ae3cf7abd3d4cdad5e5232fdba81ff1fdfa4f93f0f5bc7c4f8a159e2d3e489739a4576a6be3376efde9df6ed7e7d9b42ce89f30621a06d4921269a728dced25c4948f25420240dd9806edb665b8086007f26c05521940c08cd50ca27957f1ddfb6be430f483e7c504434e9e0ee1674ff3efdb0c4687193e8ae24fff7820f0f95d37cf7f2652ad61fa3474fe35dc05d10a244e63282d749b383c9ac8f6cd26e403fcbdfbae8d9b357f75ffb88736e06cc8f3422ab96611b6955ff05d8982440897c9a43588631dae7fc2e7c0b9f603ffc831c3d7ac6cb33f8dc39fa7d8fce28f6e971a722fb27c05b83c03fe9707dfefcf5f40ccb4f0f7880f22d2ddaf864306a1b86369f1d455b97478fc6393a385fbd46dffd099194facfa2143efd087c9b7f12c6601f72735e5a62584cc30832445451f1dde54d40e08ac4ff35d05ebe713f820f010f8041a1c8f7ab131a1313a352296bd4701c3e74142a55ea147c52a07f1cd2e2ff35c028b4f0b44272b7c2f0cdef5b30ef82403887a02218159311ccc343ba9299bf1b3602698d142dd16cab37a2512160b07de67281d8afd5abc242236645458d1d3bcec5c53de51dfda96a3d4d7396699d8ba4e07f0ed02145235648ee5618be994f92940ae7d057209e0649e23781e4cfd1f4975e64b26a97afd8663a49b62a9409df38dffd0f803f038291eceebd9bed3b74d8b377bfa01252912ec95f85b2a08a4f88e511f61181f8d1f2a055f1e9db50c527015008b114888573cea64ff257a12cf8e6fdf1ff31804688f4959c52422419aa502654f1c9062c4ec5fa5488e46e15ca84ffd77ce21b57a5c03a0356a1dcf8ff1b3f55e147e087f3099c95a454a1f2c3e66f24e95fc58fe59378772d49ac42e50727938822a5b7be8c1f183f1999414fbf31aa8a45fe8bb08924fd2bf8817c0293acdfd654e13f078948ee7e163f70beb3b52149af42e507375cb148ee7e0155ebbb2a94029b2f1090dcfd02aaf854858a44159faa5091a87adf52858a44159faa5091a89aefaa5091a8e253152a12557caa4245a22a7eaa42c58199ff0f58de7dc632f28a8c0000000049454e44ae426082);

-- --------------------------------------------------------

--
-- Table structure for table `transportation`
--

use transport;


CREATE TABLE IF NOT EXISTS `transport` (
  `Id` serial primary key,
  `WeekNumber` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `StartDate` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transportation`
--
INSERT INTO `transport` (`Id`, `WeekNumber`, `Year`, `StartDate`) VALUES
(2, 48, 2014, '2014-11-28'),
(3, 49, 2014, '2014-12-05'),
(4, 1, 2015, '2015-01-02'),
(5, 3, 2015, '2015-01-16'),
(6, 4, 2015, '2015-01-23'),
(7, 27, 2015, '2015-07-03');

-- --------------------------------------------------------

--
-- Table structure for table `truckGroup`
--

CREATE TABLE IF NOT EXISTS `truckGroup` (
  `Id` serial primary key,
  `Name` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `truckGroup`
--

INSERT INTO `truckGroup` (`Id`, `Name`) VALUES
(1, '1'),
(2, '2'),
(3, '3'),
(4, '4'),
(5, '5'),
(6, '6'),
(7, '7'),
(8, '8'),
(9, '9'),
(10, '10'),
(11, '11'),
(12, '12'),
(13, '13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additionalcost`
--

ALTER TABLE `additionalcost`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `TransportId` (`TransportId`);

--
-- Indexes for table `attachment`
--
ALTER TABLE `attachment`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `DeliveryId` (`DeliveryId`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `PackageId` (`PackageId`),
  ADD KEY `TransportId` (`TransportId`),
  ADD KEY `PrintingHouseId` (`PrintingHouseId`);

--
-- Indexes for table `bookspackage`
--
ALTER TABLE `bookspackage`
-- ADD PRIMARY KEY (`Id`),
  ADD KEY `TransportId` (`TransportId`),
  ADD KEY `TruckGroupId` (`TruckGroupId`);

--
-- Indexes for table `bookspackagehistory`
--
ALTER TABLE `bookspackagehistory`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `PackageId` (`PackageId`);

--
-- Indexes for table `box`
--
ALTER TABLE `box`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `BookId` (`BookId`),
  ADD KEY `PackageId` (`PackageId`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `DeliveryDirectionId` (`DeliveryDirectionId`);

--
-- Indexes for table `deliverydirection`
--
ALTER TABLE `deliverydirection`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `printinghouse`
--
ALTER TABLE `printinghouse`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `pulsiodetails`
--
ALTER TABLE `pulsiodetails`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `transportation`
--
ALTER TABLE `transportation`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `truckGroup`
--
ALTER TABLE `truckGroup`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `additionalcost`
--
ALTER TABLE `additionalcost`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `attachment`
--
ALTER TABLE `attachment`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=238;
--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=166;
--
-- AUTO_INCREMENT for table `bookspackage`
--
ALTER TABLE `bookspackage`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=118;
--
-- AUTO_INCREMENT for table `bookspackagehistory`
--
ALTER TABLE `bookspackagehistory`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=175;
--
-- AUTO_INCREMENT for table `box`
--
ALTER TABLE `box`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=181;
--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=262;
--
-- AUTO_INCREMENT for table `deliverydirection`
--
ALTER TABLE `deliverydirection`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `printinghouse`
--
ALTER TABLE `printinghouse`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `pulsiodetails`
--
ALTER TABLE `pulsiodetails`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `transportation`
--
ALTER TABLE `transportation`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `truckGroup`
--
ALTER TABLE `truckGroup`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `additionalcost`
--
ALTER TABLE `additionalcost`
  ADD CONSTRAINT `additionalcost_ibfk_1` FOREIGN KEY (`TransportId`) REFERENCES `transport` (`Id`);

--
-- Constraints for table `attachment`
--
ALTER TABLE `attachment`
  ADD CONSTRAINT `attachment_ibfk_2` FOREIGN KEY (`DeliveryId`) REFERENCES `delivery` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`PackageId`) REFERENCES `bookspackage` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `book_ibfk_2` FOREIGN KEY (`TransportId`) REFERENCES `transport` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `book_ibfk_3` FOREIGN KEY (`PrintingHouseId`) REFERENCES `printinghouse` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `bookspackage`
--
ALTER TABLE `bookspackage`
  ADD CONSTRAINT `bookspackage_ibfk_1` FOREIGN KEY (`TransportId`) REFERENCES `transport` (`Id`),
  ADD CONSTRAINT `bookspackage_ibfk_2` FOREIGN KEY (`TruckGroupId`) REFERENCES `truckGroup` (`Id`);

--
-- Constraints for table `bookspackagehistory`
--
ALTER TABLE `bookspackagehistory`
  ADD CONSTRAINT `bookspackagehistory_ibfk_1` FOREIGN KEY (`PackageId`) REFERENCES `bookspackage` (`Id`);

--
-- Constraints for table `box`
--
ALTER TABLE `box`
  ADD CONSTRAINT `box_ibfk_1` FOREIGN KEY (`BookId`) REFERENCES `book` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `box_ibfk_2` FOREIGN KEY (`PackageId`) REFERENCES `bookspackage` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`DeliveryDirectionId`) REFERENCES `deliverydirection` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
