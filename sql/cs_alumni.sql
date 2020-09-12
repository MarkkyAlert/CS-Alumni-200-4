-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for cs_alumni
CREATE DATABASE IF NOT EXISTS `cs_alumni` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `cs_alumni`;

-- Dumping structure for table cs_alumni.career
CREATE TABLE IF NOT EXISTS `career` (
  `std_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `career` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cs_alumni.career: ~0 rows (approximately)
/*!40000 ALTER TABLE `career` DISABLE KEYS */;
REPLACE INTO `career` (`std_id`, `career`, `timestamp`) VALUES
	('6010450497', 'Java Developer', 1568642629),
	('6010450497', 'Programmer', 1568643365);
/*!40000 ALTER TABLE `career` ENABLE KEYS */;

-- Dumping structure for table cs_alumni.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cs_alumni.category: ~3 rows (approximately)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
REPLACE INTO `category` (`id`, `name`) VALUES
	(1, 'news'),
	(2, 'sportnew'),
	(3, 'publicrelations');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Dumping structure for table cs_alumni.classify
CREATE TABLE IF NOT EXISTS `classify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` int(10) unsigned NOT NULL,
  `news_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_classify_category` (`cate_id`),
  KEY `FK_classify_news` (`news_id`),
  CONSTRAINT `FK_classify_category` FOREIGN KEY (`cate_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_classify_news` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cs_alumni.classify: ~6 rows (approximately)
/*!40000 ALTER TABLE `classify` DISABLE KEYS */;
REPLACE INTO `classify` (`id`, `cate_id`, `news_id`) VALUES
	(28, 1, 28),
	(29, 1, 29),
	(31, 1, 31),
	(32, 1, 32),
	(33, 2, 33),
	(34, 3, 34);
/*!40000 ALTER TABLE `classify` ENABLE KEYS */;

-- Dumping structure for table cs_alumni.news
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(10000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `picture` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_news_user` (`user_id`),
  CONSTRAINT `FK_news_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cs_alumni.news: ~6 rows (approximately)
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
REPLACE INTO `news` (`id`, `user_id`, `title`, `content`, `date`, `status`, `picture`) VALUES
	(28, 2, '"ลุงจรูญ" เป็นงงอีกรอบ "ครูปรีชา" ส่งหนังสือแจ้งข้อเท็จจริงและห้ามให้ทำธุรกรรมเบิกถอนเงินหวย 30 ล้านไปยังธนาคาร', 'จากกรณีมีการเผยแพร่หนังสือถึง ผู้จัดการธนาคาร สาขากาญจนบุรี เรื่องแจ้งข้อเท็จจริงและห้ามให้ทำธุรกรรมเบิกถอนเงินร.ต.ท.จรูญ วิมูล ในคดีหวย 30 ล้าน โดยมีการลงรายละเอียดเลขบัญชีของลุงจรูญ ซึ่งเอกสารดังกล่าวลงชื่อครูปรีชา ใคร่ครวญ ถูกเผยแพร่ในกลุ่มสื่อมวลชนนั้น\r\n\r\nล่าสุด เมื่อวันที่ 23 ส.ค. 62 นายษิทรา เบี้ยบังเกิด เลขาธิการมูลนิธิทีมงานทนายประชาชนฯ ทนายของ ร.ต.ท.จรูญ เปิดเผยผ่านรายการถามตรงๆ กับจอมขวัญว่า เอกสารนี้ถูกส่งไปที่ธนาคาร โดยระบุว่าห้ามให้ลุงจรูญเบิกถอนเงิน อันนี้อาจจะขัดกับคำสั่งศาลที่อนุญาตให้ลุงจรูญเบิกถอนเงินได้\r\n\r\nโดยหนังสือของเขาไม่สามารถบังคับตามกฎหมายได้ และธนาคารจะเชื่อตามหนังสือนี้ไม่ได้ เพราะต้องทำตามคำสั่งศาล เทคนิค คือ เขาพยายามทำอะไรก็ได้ที่ไม่ให้ลุงจรูญถอนเงิน แต่ลุงจรูญบอกว่า ตอนนี้ยังไม่จำเป็นที่ต้องถอนเงิน \r\n\r\n"วันจันทร์ (26 ส.ค.) ทางผม และลุงอาจจะต้องไปถอนเงิน และปิดบัญชีนี้ทันที เพราะเอกสารได้เผยแพร่เลขบัญชีของลุงจรูญ และหนังสือนี้ลงชื่อครูปรีชา ซึ่งไม่ควรที่จะเผยแพร่ข้อมูลส่วนตัว"\r\n\r\nส่วนการอุทธรณ์ที่ฝ่ายครูปรีชายื่นมาในคดีอาญานั้น วันที่ 1 ก.ย.นี้จะครบกำหนด ซึ่งถ้าเขาจะขยายเวลาอีก ทางเราก็คัดค้าน เพราะเหมือนจะมีการประวิงเวลา ซึ่งก็อยู่ที่ดุลพินิจของศาลว่าจะมีการขยายเวลาในการอุทธรณ์หรือไม่ อย่างไรก็ตาม เมื่อมีการเผยแพร่เอกสารนี้   \r\n\r\nทางด้าน ร.ต.ท.จรูญ กล่าวว่า บัญชี 30 ล้าน มีแค่ 1 บัญชีมีการเบิกถอนเงินออกไป 2 ครั้ง และถอนไป 5.5 ล้าน ส่วนอีก 24 ล้านก็ไม่ถอนเงินออก เราต้องรอหมายศาลแจ้งไปธนาคารว่าอนุญาตให้ถอนได้ ตอนนี้ก็ยังไม่ใช้เงิน เพราะยังไม่มีอะไรจำเป็น ', '2019-08-01', 'normal', 'img_5d67de7b47c6e.jpg'),
	(29, 2, 'กยศ.ใจป้ำ พักหนี้คนถือบัตรคนจน 1 ปี เพิ่มเงินค่าครองชีพ นักเรียน นักศึกษา 600', 'กยศ. ใจป้ำ ผุด 5 เกณฑ์เยียวยาลูกหนี้ โดยพักชำระหนี้คนถือบัตรคนจน 1 ปี พร้อมปรับเกณฑ์เบี้ยปรับใหม่ เริ่ม 1 ต.ค.นี้ และเพิ่มค่าครองชีพทุกกลุ่มอีก 600 บาท/เดือน เริ่มต้นปีการศึกษาหน้า\r\n\r\nนายชัยณรงค์ กัจฉปานันท์ ผู้จัดการกองทุนเงินให้กู้ยืมเพื่อการศึกษา เปิดเผยว่า กยศ.ได้ออกมาตรการแก้ไขปัญหาลูกหนี้ กยศ. และช่วยเหลือผู้กู้ยืมที่ค้างชำระหนี้ 5 แนวทาง ประกอบด้วย 1. ลดเบี้ยปรับให้ 80% สำหรับผู้กู้ยืมกลุ่มที่ชำระหนี้ปิดบัญชีในครั้งเดียว ตั้งแต่วันที่ 1 ก.ย. 2562 - 29 ก.พ. 2563 2. ลดเบี้ยปรับให้ 75% โดยเฉพาะผู้กู้ยืมกลุ่มก่อนฟ้องคดีที่มาชำระหนี้ค้างทั้งหมดให้มีสถานะปกติ (ไม่ค้างชำระ) ตั้งแต่วันที่ 1 ก.ย. 2562 - 29 ก.พ.2563 และจะต้องชำระหนี้ให้ตรงเวลา แต่ถ้าหากผิดนัดชำระหนี้ในปีที่ 2 กยศ.จะยึดสิทธิ์คืนไม่ผ่อนปรนให้ชำระหนี้ในอัตรา 75% โดยทั้ง 2 กลุ่มนี้มีจำนวนผู้ที่ต้องมาปิดบัญชี 110,000 ล้านคน\r\n\r\n3. พักชำระหนี้ 1 ปี สำหรับผู้กู้ยืมที่มีบัตรสวัสดิการแห่งรัฐหรือบัตรคนจน จำนวน 300,000 ราย โดยเงื่อนไขคือต้องเป็นผู้กู้ยืมก่อนมีการฟ้องคดี กรณีผู้ที่มีงวดชำระเป็นรายปี จะได้รับการพักชำระหนี้งวดปี 2563 กรณีผู้ที่มีงวดชำระเป็นรายเดือน พักชำระหนี้ 12 เดือน นับตั้งแต่เดือนถัดไปที่กองทุนอนุมัติ โดยสามารถลงทะเบียนขอรับสิทธิตามเงื่อนไขหลักเกณฑ์ที่กำหนดได้ทาง www.studentloan.or.th/promotion ตั้งแต่วันที่ 1 ก.ย.2562 - 29 ก.พ.2563 ทั้งนี้มีผู้กู้ยืมที่เข้าข่ายที่จะได้รับสิทธิพักชำระหนี้ 335,000 ราย\r\n\r\n4. ปรับอัตราเบี้ยปรับจากเดิม 12-18% เหลือ 7.5% ต่อปี เฉพาะกลุ่มก่อนดำเนินคดีมีผลตั้งแต่ 1 ต.ค.2562 เป็นต้นไป เพื่อเป็นการลดภาระหนี้ของผู้กู้ยืมเงินที่ค้างชำระให้สามารถผ่อนชำระเงินคืนได้อย่างต่อเนื่อง ส่วนงวดที่ผิดนัดชำระจนถึงวันที่ 30 ก.ย.62 ยังคิดอัตราเบี้ยปรับเท่าเดิม', '2019-08-05', 'normal', 'img_5d67dff257303.jpg'),
	(31, 2, 'สาวสูญเสียสามี เปิดใจรักครั้งใหม่ สุดท้ายล่ม โดนตีตราเป็น "ม่ายลูกติด"', 'สาววัย 26 เล่าความรักที่ไม่สมหวังดังใจ สามีเสียชีวิต พอเร่ิมเปิดใจมีคนเข้ามามากมายแต่สุดท้ายก็หายไปเพราะคำว่า "แม่ม่ายลูกติด"\r\n\r\n\r\nสมาชิกพันทิปหมายเลข 4876642 ได้แบ่งปันประสบการณ์ความรัก ผ่านกระทู้ ผู้หญิงลูกติด single mom กับความรักที่เป็นไปไม่ได้ โดยเล่าว่า ตนเองอายุ 26 ปี มีอาชีพรับราชการ อยู่หน่วยงานรัฐฯ แห่งหนึ่ง สถานะเป็นแม่ม่ายลูกติด เนื่องจากสามีรับราชการทหารได้เสียชีวิตที่ชายแดนใต้ เมื่อปี 2560 และได้ฝากลูกชายให้ยายเลี้ยงที่ต่างจังหวัด\r\n\r\nชีวิตช่วงนั้นต้องผ่านมรสุมอย่างหนัก ร้องไห้คนเดียวเพราะการสูญเสียคู่ชีวิตเป็นเรื่องที่ทำใจยาก แต่ก็ต้องยอมรับความเป็นจริง หลังจากให้เวลากับตัวเอง 2 ปี ก็เร่ิมเปิดใจ มีคนผ่านเข้ามาในชีวิตบ้าง แต่สุดท้ายก็หายไปจากวงโคจรชีวิตเพราะเงื่อนไข "มีบุตรเป็นพันธะ"\r\n\r\nกระทั่งได้มารู้จักกับผู้ชายคนหนึ่งอายุเท่ากัน รับราชการทหาร เป็นคนอบอุ่น รักครอบครัว เทคแคร์เก่ง ในตอนแรกตนไม่ได้บอกเรื่องที่มีลูกชาย แต่หลังจากคบหาดูใจกันก็รู้สึกว่าเขาเป็นคนที่ใช่ จึงเร่ิมเปิดใจสานต่อความสัมพันธ์และได้แลกเฟซบุ๊กกัน หวังว่าเขาเข้าไปดูเฟซบุ๊กก็คงจะรู้ว่าตนมีลูกแล้ว\r\n\r\nจนผ่านเข้าเดือนที่ 3 เขาได้แซวว่า อ้วนเหมือนคนท้องเลย ตนคิดว่าเขารู้แล้วว่าเคยมีลูกชาย ก็เลยตอบไปว่า "ก็มีลูกชายแล้วนะ" เขาก็อึ้ง แล้วถามว่า "พูดจริง หรือพูดเล่น" ตนก็ตอบว่า "พูดจริงค่ะ" สรุปเขานิ่ง เงียบเพราะเขาไม่ได้เข้าไปดูเฟซบุ๊กเลยจึงแยกย้ายกันกลับบ้าน\r\n\r\nต่อมาเขาได้ทักแชตมาถามว่า ก่อนหน้านี้เคยมีคนเข้ามาจีบไหม คนที่มาจีบรู้เรื่องนี้ไหม มีปฏิกิริยายังไง หากตนเป็นเขาควรหายไป หรืออยู่ดูและกันและกันตลอดไป แต่ไปไม่สุดทาง จะเลือกแบบไหน ตนเลยตอบไปว่า เลือกตัวเลือกที่ 2 เราสามารถตกลงกันได้ แต่ท้ายที่สุดแล้วระหว่างเราก็เร่ิมมีระยะห่าง ความถี่ในการคุยกันลดลง จึงนำเรื่องนี้มาให้กำลังใจทุกคน', '2019-08-07', 'normal', 'img_5d67e0bfbb764.jpg'),
	(32, 2, 'ถนัดศรี สวัสดิวัตน์ ตำนานคุณชายนักชิม', 'ม.ร.ว.ถนัดศรี สวัสดิวัตน์ เกิดเมื่อวันที่ 28 พฤษภาคม 2470 ณ วังเพชรบูรณ์ เป็นบุตรคนโตของหม่อมเจ้าเฉลิมศรี สวัสดิวัตน์ และหม่อมเจริญ สวัสดิวัตน์ เติบโต ณ วังสระปทุมตั้งแต่เล็กจนโตจึงย้ายมาอยู่ ณ วังศุโขทัย\r\n\r\nตลอดระยะเวลาได้เรียนรู้ ได้รับการอบรม บ่มนิสัยให้ประพฤติปฏิบัติตนตามขนบธรรมเนียมประเพณีภายในวังอย่างเคร่งครัดในทุกๆเรื่อง ทำให้ได้รับทราบเรื่องราวต่างๆโดยเฉพาะอย่างยิ่งด้านศิลปะการแสดง การดนตรี พิธีกรรมต่างๆ ทุกครั้งที่มีการจัดแสดงในโอกาสต่างๆจะมีส่วนร่วมเสมอ\r\n\r\nระหว่างศึกษาระดับประถมศึกษาที่โรงเรียนราชินี ในการเรียนวิชาดนตรีจะได้รับมอบหมายให้ร่วมขับร้องเพลงไทยด้วยทุกครั้ง เพราะเป็นผู้ที่ขับร้องเพลงไทยได้ดีและไพเราะ อีกทั้งยังได้เป็นลูกศิษย์ของคุณครูหลวงประดิษฐ์ไพเราะ (ศร ศิลปะบรรเลง) ด้วย\r\n\r\nม.ร.ว.ถนัดศรี สวัสดิวัตน์ ฉายแววมีผลงานตั้งแต่ยังเด็ก ด้วยใจรักการร้องเพลงเป็นอย่างยิ่ง บันทึกประวัติในช่วงอายุได้ 14 ปี เขียนไว้ว่า...ได้แอบพายเรือหนีออกจากวังสระปทุมไปประกวดร้องเพลงในงานภูเขาทอง โดยใช้นามแฝงว่า “ป.ปทุมวัน” ส่วนเพลงที่ร้องจำชื่อไม่ได้ แต่เป็นเพลงที่ดังมากในสมัยนั้น\r\n\r\nเวทีนี้...ได้รับรางวัลชนะเลิศรุ่นเล็ก มีถ้วยรางวัลและเงิน 5 บาท\r\n\r\nระหว่างศึกษาอยู่ที่โรงเรียนเตรียมปริญญามหาวิทยาลัยธรรมศาสตร์และการเมือง ได้รวบรวมสมัครพรรคพวกจัดตั้งวงดนตรีสมัครเล่น เพื่อหาเงินช่วยค่าอาหารกลางวันแก่เพื่อนนักเรียนที่ยากจน เพลงที่ขับร้องเป็นของคุณครูล้วน ควันธรรม, ครูนารถ ถาวรบุตร จากการตั้งวงครั้งนี้ทำให้ คุณอาภรณ์ กรรณสูต (ภรรยาครูเอื้อ สุนทรสนาน) เพื่อนนักเรียนร่วมมหาวิทยาลัยเป็นผู้บริจาคเงินเป็นประจำ จนคุณชายเรียกเพื่อนรุ่นพี่คนนี้ว่า...“พี่หนู”\r\n\r\nครูเอื้อได้ฟังเรื่องราวคุณชายจากภรรยารู้ว่า...ร้องเพลงได้ไพเราะมาก ต้องการรู้จักจึงมอบให้ครูแก้ว อัจฉริยะกุล ไปพบ ทดลองฟัง...ปรากฏว่าใช้ได้ บังเอิญว่าช่วงเวลานั้นเป็นช่วงสงครามโลกครั้งที่ 2 มหาวิทยาลัยปิดคุณชายเลยมีโอกาสคลุกคลีอยู่ใน “วงสุนทราภรณ์” ตั้งแต่นั้นเป็นต้นมา\r\n\r\nวันเวลาผ่านไปเก็บเกี่ยวประสบการณ์มากขึ้น ปี 2485 ก็ได้มีผลงานขับร้องเพลงตั้งแต่เป็นนักเรียนเตรียมมหาวิทยาลัยธรรมศาสตร์ เป็นนักร้องหลังม่านวงดนตรีสุนทราภรณ์ที่โรงหนังโอเดียนคู่กับชวลีย์ ช่วงวิทย์\r\n\r\nคุณชายขับร้องได้ไพเราะมาก และยังขยับขยายเพิ่มเติมประสบการณ์ด้วยการเดินทางไปแต่งเพลงในที่ต่างๆ เช่น ลงเรือจ้างล่องแม่น้ำเจ้าพระยา ประพันธ์คำร้องเพลง “เจ้าพระยา”\r\n\r\nคุณชายถนัดศรีมีเทคนิคการร้องดีเยี่ยม ไม่ว่าการเอื้อน...เสียงที่เป็นเอกลักษณ์เฉพาะตัวที่คนอื่นไม่สามารถเลียนแบบได้ จนครูเพลงหลายๆท่านชื่นชม เชื่อในฝีมือการขับร้องอย่างกว้างขวาง ทั้งยังได้รับความไว้วางใจให้เป็นผู้คอยแนะนำเทคนิคการร้องเพลง การเอื้อน การออกคำ ตลอดจนการถอนหายใจแก่นักร้องรุ่นน้อง', '2019-08-09', 'normal', 'img_5d67e121bf5f0.jpg'),
	(33, 2, 'เมื่อความ "สำเร็จ" มาพร้อม "ความกดดัน"', 'ไม่รู้ว่าต้องปรบมือกี่ร้อยกี่พันครั้ง ถึงจะเพียงพอสำหรับการสรรเสริญให้กับทีมนักตบลูกขนไก่ไทย ในการแข่งขันชิงแชมป์โลก 2019 ที่เมืองบาเซิล ประเทศสวิตเซอร์แลนด์ เมื่อสัปดาห์ที่ผ่านมา\r\n\r\nผลงาน 1 เหรียญเงิน กับอีก 2 เหรียญทองแดง น่าจะกล่าวได้อย่างเต็มปากเต็มคำว่า นี่คือผลงานที่สุดยอดที่สุดแล้ว นับตั้งแต่นักแบดมินตันไทยเข้าร่วมการแข่งขันในทัวร์นาเมนต์นี้\r\n\r\nแน่นอนว่าความสำเร็จที่เกิดขึ้น ต้องชื่นชมความร่วมมือของทุกฝ่าย ซึ่งอยู่ทั้งเบื้องหน้าและเบื้องหลังของทีมงานทั้งหมด เพราะหากไม่มีบรรดาผู้ปิดทองหลังพระคอยสนับสนุน ก็ไม่รู้ว่าความสำเร็จแบบนี้จะเกิดขึ้นอย่างที่เป็นอยู่ในทุกวันนี้หรือเปล่า\r\n\r\nการขึ้นยืนบนแป้นรับเหรียญของ "น้องเมย์" รัชนก อินทนนท์ ไม่ใช่ครั้งแรกในศึกชิงแชมป์โลก เพราะเธอเคยไปไกลสุดถึงการเป็นแชมป์เมื่อปี 2013 แต่ถึงยังไงในฐานะกองเชียร์ชาวไทย เราเองก็อยากเห็น "น้องเมย์" ยืนบนแป้นบ่อยที่สุดเท่าที่จะเป็นไปได้ ในการแข่งขันระดับนานาชาติ\r\n\r\nขณะที่ "กัน" กันตภณ หวังเจริญ ก็ทำผลงานได้อย่างเฉียบขาดตลอดทั้งปี 2019 พอมาถึงเดือนสิงหาคม ที่การแข่งขันชิงแชมป์โลกเวียนมาบรรจบ ปรากฏว่าเจ้าตัวยังทำผลงานได้อย่างร้อนแรงต่อเนื่อง\r\n\r\nการปราบทั้ง เค. ศรีคานธ์ มือ 7 จากอินเดีย รวมถึงเขี่ย โจว เทียน เฉิน เต็งสองของรายการ ร่วงตกรอบ 8 คนสุดท้ายอย่างมีสไตล์ คงทำให้เด็กหนุ่มวัย 20 ปีรายนี้จะไม่ถูกมองข้ามในทัวร์นาเมนต์ต่อๆ ไปอย่างแน่นอน\r\n\r\nด้าน "บาส-ปอป้อ" เดชาพล พัววรานุเคราะห์ กับ ทรัพย์สิรี แต้รัตนชัย ที่ขึ้นมายืนในท็อป 10 ของโลกตั้งนาน แต่กลับยังไม่ค่อยได้สัมผัสความสำเร็จในรายการระดับเมเจอร์มากนัก\r\n\r\nแต่มาครั้งนี้ยอมรับ และซูฮกให้ในความแข็งแกร่งโดยแท้ โดยเฉพาะการปราบเต็งสองจากจีนในรอบตัดเชือก น่าจะเป็นการเพิ่มความมั่นใจให้กับทั้งคู่ไม่น้อย ในทัวร์นาเมนต์ที่เหลือของปีนี้\r\n\r\nและแน่นอนว่าจากความสำเร็จที่เกิดขึ้น คงหนีไม่พ้นการคาดหวังของแฟนกีฬาไทย ที่อยากให้ทั้ง 4 คน รักษาเนื้อรักษาตัวและฟอร์มการเล่นให้ต่อเนื่องยาวนานไปถึงโอลิมปิก 2020 ในช่วงกลางปีหน้าที่ญี่ปุ่น\r\n\r\nแต่ทุกคนก็ต้องอย่าลืมว่าความสำเร็จขนาดนี้ย่อมมาพร้อมความกดดันก้อนโตอย่างหลีกเลี่ยงไม่ได้ ใครหลายคนอาจจะวาดฝันถึงภาพของนักแบดไทยได้ยืนแป้นขึ้นรับเหรียญโอลิมปิกซะที\r\n\r\nแต่ก็อย่างที่บอกไปว่า การจะเดินไปถึงความสำเร็จในวันนั้นที่เราฝันเอาไว้ มันคงไม่ใช่เรื่องง่ายอย่างที่คิดแน่\r\n\r\nเพราะคู่แข่งในโอลิมปิกย่อมเตรียมตัวมาดีเช่นกัน ยิ่งได้เห็นข้อบกพร่องของตัวเองในศึกชิงแชมป์โลก ก็ต้องพยายามลบจุดอ่อนของตัวเองให้ได้ เพื่อเป้าหมายที่วางเอาไว้\r\n\r\nจากวันนี้จะเป็นยังไงไม่รู้ แต่ที่รู้ๆ คือขอเป็นกำลังใจ และอยู่เคียงข้างนักแบดมินตันไทย ในการไล่ล่าความสำเร็จทุกๆ ทัวร์นาเมนต์.', '2019-08-20', 'normal', 'img_5d67e1dc2a0fb.jpg'),
	(34, 2, 'asdasdasdasdasdasdasd', 'การขึ้นทะเบียนรับพระราชทานปริญญาบัตร (ขึ้นทะเบียนบัณฑิต) ประจำปี พ.ศ.2562 ระหว่างวันที่ 10 กันยายน - 7 ตุลาคม 2562\r\nขั้นตอนที่ 1 ตรวจสอบรายชื่อผู้สำเร็จการศึกษา\r\nขั้นตอนที่ 2 ขึ้นทะเบียนรับปริญญาที่ https://jobsurvey.ku.ac.th\r\nขั้นตอนที่ 3 พิมพ์ใบยืนยันหรือบันทึกรูปภาพใบยืนยัน (capture) ไว้เป็นหลักฐาน', '2019-08-29', 'normal', 'img_5d67e91dac599.jpg');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;

-- Dumping structure for table cs_alumni.report
CREATE TABLE IF NOT EXISTS `report` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `news_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `comment` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__news` (`news_id`),
  KEY `FK__user` (`user_id`),
  CONSTRAINT `FK__news` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`),
  CONSTRAINT `FK__user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cs_alumni.report: ~0 rows (approximately)
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;

-- Dumping structure for table cs_alumni.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `std_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `career` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gen` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `std_id` (`std_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table cs_alumni.user: ~3 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`id`, `std_id`, `username`, `password`, `firstname`, `lastname`, `email`, `status`, `career`, `gen`) VALUES
	(1, NULL, 'folkdogfk', '$2y$10$sk2qnU.RN4q.ns6D2EpklOjxto2hM3PtbBWXBnwIewHUMw5QorB0.', 'Pattarapon', 'poltakhu', 'folk@folk.com', 'admin', 'Web Developer', NULL),
	(2, NULL, 'zelos', '$2y$10$sk2qnU.RN4q.ns6D2EpklOjxto2hM3PtbBWXBnwIewHUMw5QorB0.', 'Sikharin', 'Kadeeroj', 'zelos@zelos.com', 'officer', 'officer', NULL),
	(3, '6010450497', 'mark', '$2y$10$sk2qnU.RN4q.ns6D2EpklOjxto2hM3PtbBWXBnwIewHUMw5QorB0.', 'Puetipong', 'aonsud', 'mark@mark.com', 'alumni', 'Programmer', '32');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
