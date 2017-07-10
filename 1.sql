-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: myblog
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `articleid` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `create_date` datetime DEFAULT NULL,
  `read_num` int(11) NOT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `isTop` bit(1) NOT NULL,
  PRIMARY KEY (`articleid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'<p>Who are the mythbusters?</p><p>Adam Savage</p><p>Jimmi:I always enjoy Adam in pain</p><p>Jimmi Hyneman</p><p>Jimmi:Jimmi wants a big boom<br/></p><p>Between them more than 30 years special effect experience</p><p>Together with Tory,Kary and Grant<br/></p><p>They don&#39;t just tell the myth,they put them to the test<br/></p><p><br/></p>','2017-05-15 15:23:47',119,'<p>Who are the mythbusters?</p><p>Adam Savage</p><p>Jimmi:I always enjoy Adam in pain</p><p>Jimmi Hy...','Who are the mythbusters','2017-05-20 00:00:00','\0'),(2,'<p>Who are the mythbusters?</p><p>Adam Savage</p><p>Jimmi:I always enjoy Adam in pain</p><p>Jimmi Hyneman</p><p>Jimmi:Jimmi wants a big boom<br/></p><p>Between them more than 30 years special effect experience</p><p>They don&#39;t just tell the myth,they put them to the test<br/></p><p><br/></p>','2017-05-15 15:24:09',14,'<p>Who are the mythbusters?</p><p>Adam Savage</p><p>Jimmi:I always enjoy Adam in pain</p><p>Jimmi Hy','who are the mythbuster','2017-05-15 15:24:09','\0'),(5,'Surprise Motherfucker<br/>','2017-05-15 15:33:38',8,'Surprise Motherfucker<br/>','Ahhhh!!!!!!!!','2017-05-15 15:33:38','\0'),(6,'Surprise Motherfucker<br/>','2017-05-15 15:33:45',13,'Surprise Motherfucker<br/>','Ahhhh!!!!!!!!','2017-05-15 15:33:45','\0'),(8,'<p>asdasdasdhttp://localhost:8080/admin/new-article</p>','2017-05-15 15:37:12',13,'<p>asdasdasdhttp://localhost:8080/admin/new-article</p>','Ahhhh!!!!!!!!','2017-05-15 15:37:12','\0'),(10,'<p><span style=\"font-family: 宋体,SimSun;\">Five&nbsp;score&nbsp;years&nbsp;ago,&nbsp;a&nbsp;great&nbsp;American,&nbsp;in&nbsp;whose&nbsp;symbolic&nbsp;shadow&nbsp;we&nbsp;stand&nbsp;today,&nbsp;signed&nbsp;the&nbsp;Emancipation&nbsp;Proclamation.&nbsp;This&nbsp;momentous&nbsp;decree&nbsp;came&nbsp;as&nbsp;a&nbsp;great&nbsp;beacon&nbsp;light&nbsp;of&nbsp;hope&nbsp;to&nbsp;millions&nbsp;of&nbsp;Negro&nbsp;slaves&nbsp;who&nbsp;had&nbsp;been&nbsp;seared&nbsp;in&nbsp;the&nbsp;flames&nbsp;of&nbsp;withering&nbsp;injustice.&nbsp;It&nbsp;came&nbsp;as&nbsp;a&nbsp;joyous&nbsp;daybreak&nbsp;to&nbsp;end&nbsp;the&nbsp;long&nbsp;night&nbsp;of&nbsp;bad&nbsp;captivity.</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-family: 黑体,SimHei;\">But&nbsp;one&nbsp;hundred&nbsp;years&nbsp;later,&nbsp;the&nbsp;Negro&nbsp;still&nbsp;is&nbsp;not&nbsp;free.&nbsp;One&nbsp;hundred&nbsp;years&nbsp;later,&nbsp;the&nbsp;life&nbsp;of&nbsp;the&nbsp;Negro&nbsp;is&nbsp;still&nbsp;sadly&nbsp;crippled&nbsp;by&nbsp;the&nbsp;manacles&nbsp;of&nbsp;segregation&nbsp;and&nbsp;the&nbsp;chains&nbsp;of&nbsp;discrimination.&nbsp;One&nbsp;hundred&nbsp;years&nbsp;later,&nbsp;the&nbsp;Negro&nbsp;lives&nbsp;on&nbsp;a&nbsp;lonely&nbsp;island&nbsp;of&nbsp;poverty&nbsp;in&nbsp;the&nbsp;midst&nbsp;of&nbsp;a&nbsp;vast&nbsp;ocean&nbsp;of&nbsp;material&nbsp;prosperity.&nbsp;One&nbsp;hundred&nbsp;years&nbsp;later,&nbsp;the&nbsp;Negro&nbsp;is&nbsp;still&nbsp;languished&nbsp;in&nbsp;the&nbsp;corners&nbsp;of&nbsp;American&nbsp;society&nbsp;and&nbsp;finds&nbsp;himself&nbsp;an&nbsp;exile&nbsp;in&nbsp;his&nbsp;own&nbsp;land.&nbsp;So&nbsp;we’ve&nbsp;come&nbsp;here&nbsp;today&nbsp;to&nbsp;dramatize&nbsp;a&nbsp;shameful&nbsp;condition.</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"color: rgb(0, 176, 240);\">I&nbsp;am&nbsp;not&nbsp;unmindful&nbsp;that&nbsp;some&nbsp;of&nbsp;you&nbsp;have&nbsp;come&nbsp;here&nbsp;out&nbsp;of&nbsp;great&nbsp;trials&nbsp;and&nbsp;tribulations.&nbsp;Some&nbsp;of&nbsp;you&nbsp;have&nbsp;come&nbsp;fresh&nbsp;from&nbsp;narrow&nbsp;jail&nbsp;cells.&nbsp;Some&nbsp;of&nbsp;you&nbsp;have&nbsp;come&nbsp;from&nbsp;areas&nbsp;where&nbsp;your&nbsp;quest&nbsp;for&nbsp;freedom&nbsp;left&nbsp;you&nbsp;battered&nbsp;by&nbsp;the&nbsp;storms&nbsp;of&nbsp;persecution&nbsp;and&nbsp;staggered&nbsp;by&nbsp;the&nbsp;winds&nbsp;of&nbsp;police&nbsp;brutality.&nbsp;You&nbsp;have&nbsp;been&nbsp;the&nbsp;veterans&nbsp;of&nbsp;creative&nbsp;suffering.&nbsp;Continue&nbsp;to&nbsp;work&nbsp;with&nbsp;the&nbsp;faith&nbsp;that&nbsp;unearned&nbsp;suffering&nbsp;is&nbsp;redemptive.<br/>Go&nbsp;back&nbsp;to&nbsp;Mississippi,&nbsp;go&nbsp;back&nbsp;to&nbsp;Alabama,&nbsp;go&nbsp;back&nbsp;to&nbsp;South&nbsp;Carolina,&nbsp;go&nbsp;back&nbsp;to&nbsp;Georgia,&nbsp;go&nbsp;back&nbsp;to&nbsp;Louisiana,&nbsp;go&nbsp;back&nbsp;to&nbsp;the&nbsp;slums&nbsp;and&nbsp;ghettos&nbsp;of&nbsp;our&nbsp;northern&nbsp;cities,&nbsp;knowing&nbsp;that&nbsp;somehow&nbsp;this&nbsp;situation&nbsp;can&nbsp;and&nbsp;will&nbsp;be&nbsp;changed.&nbsp;Let&nbsp;us&nbsp;not&nbsp;wallow&nbsp;in&nbsp;the&nbsp;valley&nbsp;of&nbsp;despair.</span><br/><span style=\"background-color: rgb(255, 192, 0);\">I&nbsp;say&nbsp;to&nbsp;you&nbsp;today,&nbsp;my&nbsp;friends,&nbsp;so&nbsp;even&nbsp;though&nbsp;we&nbsp;face&nbsp;the&nbsp;difficulties&nbsp;of&nbsp;today&nbsp;and&nbsp;tomorrow,&nbsp;I&nbsp;still&nbsp;have&nbsp;a&nbsp;dream.&nbsp;It&nbsp;is&nbsp;a&nbsp;dream&nbsp;deeply&nbsp;rooted&nbsp;in&nbsp;the&nbsp;American&nbsp;dream.<br/>&nbsp;&nbsp;&nbsp;&nbsp;I&nbsp;have&nbsp;a&nbsp;dream&nbsp;that&nbsp;one&nbsp;day&nbsp;this&nbsp;nation&nbsp;will&nbsp;rise&nbsp;up,&nbsp;live&nbsp;up&nbsp;to&nbsp;the&nbsp;true&nbsp;meaning&nbsp;of&nbsp;its&nbsp;creed:&nbsp;“We&nbsp;hold&nbsp;these&nbsp;truths&nbsp;to&nbsp;be&nbsp;self-evident;&nbsp;that&nbsp;all&nbsp;men&nbsp;are&nbsp;created&nbsp;equal.”<br/>&nbsp;&nbsp;&nbsp;&nbsp;I&nbsp;have&nbsp;a&nbsp;dream&nbsp;that&nbsp;one&nbsp;day&nbsp;on&nbsp;the&nbsp;red&nbsp;hills&nbsp;of&nbsp;Georgia&nbsp;the&nbsp;sons&nbsp;of&nbsp;former&nbsp;slaves&nbsp;and&nbsp;the&nbsp;sons&nbsp;of&nbsp;former&nbsp;slave-owners&nbsp;will&nbsp;be&nbsp;able&nbsp;to&nbsp;sit&nbsp;down&nbsp;together&nbsp;at&nbsp;the&nbsp;table&nbsp;of&nbsp;brotherhood.<br/>&nbsp;&nbsp;&nbsp;&nbsp;I&nbsp;have&nbsp;a&nbsp;dream&nbsp;that&nbsp;one&nbsp;day&nbsp;even&nbsp;the&nbsp;state&nbsp;of&nbsp;Mississippi,&nbsp;a&nbsp;state&nbsp;sweltering&nbsp;with&nbsp;the&nbsp;heat&nbsp;of&nbsp;injustice,&nbsp;sweltering&nbsp;with&nbsp;the&nbsp;heat&nbsp;of&nbsp;oppression,&nbsp;will&nbsp;be&nbsp;transformed&nbsp;into&nbsp;an&nbsp;oasis&nbsp;of&nbsp;freedom&nbsp;and&nbsp;justice.<br/>&nbsp;&nbsp;&nbsp;&nbsp;I&nbsp;have&nbsp;a&nbsp;dream&nbsp;that&nbsp;my&nbsp;four&nbsp;children&nbsp;will&nbsp;one&nbsp;day&nbsp;live&nbsp;in&nbsp;a&nbsp;nation&nbsp;where&nbsp;they&nbsp;will&nbsp;not&nbsp;be&nbsp;judged&nbsp;by&nbsp;the&nbsp;color&nbsp;if&nbsp;their&nbsp;skin&nbsp;but&nbsp;by&nbsp;the&nbsp;content&nbsp;of&nbsp;their&nbsp;character.<br/>&nbsp;&nbsp;&nbsp;&nbsp;I&nbsp;have&nbsp;a&nbsp;dream&nbsp;today.<br/>&nbsp;&nbsp;&nbsp;&nbsp;I&nbsp;have&nbsp;a&nbsp;dream&nbsp;that&nbsp;one&nbsp;day&nbsp;down&nbsp;in&nbsp;Alabama&nbsp;with&nbsp;its&nbsp;governor&nbsp;having&nbsp;his&nbsp;lips&nbsp;dripping&nbsp;with&nbsp;the&nbsp;words&nbsp;of&nbsp;interposition&nbsp;and&nbsp;nullification,&nbsp;one&nbsp;day&nbsp;right&nbsp;down&nbsp;in&nbsp;Alabama&nbsp;little&nbsp;black&nbsp;boys&nbsp;and&nbsp;black&nbsp;girls&nbsp;will&nbsp;be&nbsp;able&nbsp;to&nbsp;join&nbsp;hands&nbsp;with&nbsp;little&nbsp;white&nbsp;boys&nbsp;and&nbsp;white&nbsp;girls&nbsp;as&nbsp;sisters&nbsp;and&nbsp;brothers.<br/>&nbsp;&nbsp;&nbsp;&nbsp;I&nbsp;have&nbsp;a&nbsp;dream&nbsp;today.</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;I&nbsp;have&nbsp;a&nbsp;dream&nbsp;that&nbsp;one&nbsp;day&nbsp;every&nbsp;valley&nbsp;shall&nbsp;be&nbsp;exalted,&nbsp;every&nbsp;hill&nbsp;and&nbsp;mountain&nbsp;shall&nbsp;be&nbsp;made&nbsp;low,&nbsp;the&nbsp;rough&nbsp;places&nbsp;will&nbsp;be&nbsp;made&nbsp;plain,&nbsp;and&nbsp;the&nbsp;crooked&nbsp;places&nbsp;will&nbsp;be&nbsp;made&nbsp;straight,&nbsp;and&nbsp;the&nbsp;glory&nbsp;of&nbsp;the&nbsp;Lord&nbsp;shall&nbsp;be&nbsp;revealed,&nbsp;and&nbsp;all&nbsp;flesh&nbsp;shall&nbsp;see&nbsp;it&nbsp;together.<br/>This&nbsp;is&nbsp;our&nbsp;hope.&nbsp;This&nbsp;is&nbsp;the&nbsp;faith&nbsp;that&nbsp;I&nbsp;go&nbsp;back&nbsp;to&nbsp;the&nbsp;South&nbsp;with.&nbsp;With&nbsp;this&nbsp;faith&nbsp;we&nbsp;will&nbsp;be&nbsp;able&nbsp;to&nbsp;hew&nbsp;out&nbsp;of&nbsp;the&nbsp;mountain&nbsp;of&nbsp;despair&nbsp;a&nbsp;stone&nbsp;of&nbsp;hope.&nbsp;With&nbsp;this&nbsp;faith&nbsp;we&nbsp;will&nbsp;be&nbsp;able&nbsp;to&nbsp;transform&nbsp;the&nbsp;jangling&nbsp;discords&nbsp;of&nbsp;our&nbsp;nation&nbsp;into&nbsp;a&nbsp;beautiful&nbsp;symphony&nbsp;of&nbsp;brotherhood.&nbsp;With&nbsp;this&nbsp;faith&nbsp;we&nbsp;will&nbsp;be&nbsp;able&nbsp;to&nbsp;work&nbsp;together,&nbsp;to&nbsp;pray&nbsp;together,&nbsp;to&nbsp;struggle&nbsp;together,&nbsp;to&nbsp;go&nbsp;to&nbsp;jail&nbsp;together,&nbsp;to&nbsp;stand&nbsp;up&nbsp;for&nbsp;freedom&nbsp;together,&nbsp;knowing&nbsp;that&nbsp;we&nbsp;will&nbsp;be&nbsp;free&nbsp;one&nbsp;day.<br/>&nbsp;&nbsp;&nbsp;&nbsp;This&nbsp;will&nbsp;be&nbsp;the&nbsp;day&nbsp;when&nbsp;all&nbsp;of&nbsp;God’s&nbsp;children&nbsp;will&nbsp;be&nbsp;able&nbsp;to&nbsp;sing&nbsp;with&nbsp;new&nbsp;meaning.&nbsp;<br/>My&nbsp;country,&nbsp;’&nbsp;tis&nbsp;of&nbsp;thee,<br/>Sweet&nbsp;land&nbsp;of&nbsp;liberty,<br/>Of&nbsp;thee&nbsp;I&nbsp;sing:<br/>Land&nbsp;where&nbsp;my&nbsp;fathers&nbsp;died,<br/>Land&nbsp;of&nbsp;the&nbsp;pilgrims’&nbsp;pride,<br/>From&nbsp;every&nbsp;mountainside<br/>Let&nbsp;freedom&nbsp;ring.<br/>And&nbsp;if&nbsp;America&nbsp;is&nbsp;to&nbsp;be&nbsp;a&nbsp;great&nbsp;nation&nbsp;this&nbsp;must&nbsp;become&nbsp;true.&nbsp;So&nbsp;let&nbsp;freedom&nbsp;ring&nbsp;from&nbsp;the&nbsp;prodigious&nbsp;hilltops&nbsp;of&nbsp;New&nbsp;Hampshire.<br/>Let&nbsp;freedom&nbsp;ring&nbsp;from&nbsp;the&nbsp;mighty&nbsp;mountains&nbsp;of&nbsp;New&nbsp;York!<br/>Let&nbsp;freedom&nbsp;ring&nbsp;from&nbsp;the&nbsp;heightening&nbsp;Alleghenies&nbsp;of&nbsp;Pennsylvania!<br/>Let&nbsp;freedom&nbsp;ring&nbsp;from&nbsp;the&nbsp;snowcapped&nbsp;Rockies&nbsp;of&nbsp;Colorado!<br/>Let&nbsp;freedom&nbsp;ring&nbsp;from&nbsp;the&nbsp;curvaceous&nbsp;slops&nbsp;of&nbsp;California!<br/>But&nbsp;not&nbsp;only&nbsp;that;&nbsp;let&nbsp;freedom&nbsp;ring&nbsp;from&nbsp;Stone&nbsp;Mountain&nbsp;of&nbsp;Georgia!<br/>Let&nbsp;freedom&nbsp;ring&nbsp;from&nbsp;Lookout&nbsp;Mountain&nbsp;of&nbsp;Tennessee!<br/>Let&nbsp;freedom&nbsp;ring&nbsp;from&nbsp;every&nbsp;hill&nbsp;and&nbsp;molehill&nbsp;of&nbsp;Mississippi!<br/>From&nbsp;every&nbsp;mountainside,&nbsp;let&nbsp;freedom&nbsp;ring!<br/>When&nbsp;we&nbsp;let&nbsp;freedom&nbsp;ring,&nbsp;when&nbsp;we&nbsp;let&nbsp;it&nbsp;ring&nbsp;from&nbsp;every&nbsp;village&nbsp;and&nbsp;every&nbsp;hamlet,&nbsp;from&nbsp;every&nbsp;state&nbsp;and&nbsp;every&nbsp;city,&nbsp;we&nbsp;will&nbsp;be&nbsp;able&nbsp;to&nbsp;speed&nbsp;up&nbsp;that&nbsp;day&nbsp;when&nbsp;all&nbsp;of&nbsp;God’s&nbsp;children,&nbsp;black&nbsp;men&nbsp;and&nbsp;white&nbsp;men,&nbsp;Jews&nbsp;and&nbsp;Gentiles,&nbsp;Protestants&nbsp;and&nbsp;Catholics,&nbsp;will&nbsp;be&nbsp;able&nbsp;to&nbsp;join&nbsp;hands&nbsp;and&nbsp;sing&nbsp;in&nbsp;the&nbsp;words&nbsp;of&nbsp;the&nbsp;old&nbsp;Negro&nbsp;spiritual,&nbsp;“Free&nbsp;at&nbsp;last!&nbsp;free&nbsp;at&nbsp;last!&nbsp;thank&nbsp;God&nbsp;almighty,&nbsp;we&nbsp;are&nbsp;free&nbsp;at&nbsp;last!”<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我有一个梦想<br/>&nbsp;&nbsp;&nbsp;&nbsp;一百年前，一位伟大的美国人签署了解放黑奴宣言，今天我们就是在他的雕像前集会。这一庄严宣言犹如灯塔的光芒，给千百万在那摧残生命的不义之火中受煎熬的黑奴带来了希望。它的到来犹如欢乐的黎明，结束了束缚黑人的漫漫长夜。<br/>&nbsp;&nbsp;&nbsp;&nbsp;然而一百年后的今天，黑人还没有得到自由，一百年后的今天，在种族隔离的镣铐和种族歧视的枷锁下，黑人的生活备受压榨。一百年后的今天，黑人仍生活在物质充裕的海洋中一个贫困的孤岛上。一百年后的今天，黑人仍然萎缩在美国社会的角落里，并且意识到自己是故土家园中的流亡者。今天我们在这里集会，就是要把这种骇人听闻的情况公诸于众。<br/>&nbsp;&nbsp;&nbsp;&nbsp;我并非没有注意到，参加今天集会的人中，有些受尽苦难和折磨，有些刚刚走出窄小的牢房，有些由于寻求自由，曾早居住地惨遭疯狂迫害的打击，并在警察暴行的旋风中摇摇欲坠。你们是人为痛苦的长期受难者。坚持下去吧，要坚决相信，忍受不应得的痛苦是一种赎罪。<br/>&nbsp;&nbsp;&nbsp;&nbsp;让我们回到密西西比去，回到阿拉巴马去，回到南卡罗莱纳去，回到佐治亚去，回到路易斯安那去，回到我们北方城市中的贫民区和少数民族居住区去，要心中有数，这种状况是能够也必将改变的。我们不要陷入绝望而不能自拔。<br/>&nbsp;&nbsp;&nbsp;&nbsp;朋友们，今天我对你们说，在此时此刻，我们虽然遭受种种困难和挫折，我仍然有一个梦想。这个梦是深深扎根于美国的梦想中的。<br/>&nbsp;&nbsp;&nbsp;&nbsp;我梦想有一天，这个国家会站立起来，真正实现其信条的真谛：“我们认为这些真理是不言而喻的；人人生而平等。”<br/>&nbsp;&nbsp;&nbsp;&nbsp;我梦想有一天，在佐治亚的红山上，昔日奴隶的儿子将能够和昔日奴隶主的儿子坐在一起，共叙兄弟情谊。<br/>&nbsp;&nbsp;&nbsp;&nbsp;我梦想有一天，甚至连密西西比州这个正义匿迹，压迫成风，如同沙漠般的地方，也将变成自由和正义的绿洲。<br/>&nbsp;&nbsp;&nbsp;&nbsp;我梦想有一天，我的四个孩子将在一个不是以他们的肤色，而是以他们的品格优劣来评判他们的国度里生活。<br/>&nbsp;&nbsp;&nbsp;&nbsp;我今天有一个梦想。<br/>&nbsp;&nbsp;&nbsp;&nbsp;我梦想有一天，阿拉巴马州能够有所转变，尽管该州州长现在仍然满口异议，反对联邦法令，但有着一日，那里的黑人男孩和女孩将能够与白人男孩和女孩情同骨肉，携手并进。<br/>&nbsp;&nbsp;&nbsp;&nbsp;我今天有一个梦想。<br/>&nbsp;&nbsp;&nbsp;&nbsp;我梦想有一天，幽谷上升，高山下降，坎坷曲折之路成坦途，圣光披露，满照人间。<br/>&nbsp;&nbsp;&nbsp;&nbsp;这就是我们的希望。我怀着这种信念回到南方。有了这个信念，我们将能从绝望之岭劈出一块希望之石。有了这个信念，我们将能把这个国家刺耳的争吵声，改变成为一支洋溢手足之情的优美交响曲。有了这个信念，我们将能一起工作，一起祈祷，一起斗争，一起坐牢，一起维护自由；因为我们知道，终有一天，我们是会自由的。<br/>&nbsp;&nbsp;&nbsp;&nbsp;在自由到来的那一天，上帝的所有儿女们将以新的含义高唱这支歌：“我的祖国，美丽的自由之乡，我为您歌唱。您是父辈逝去的地方，您是最初移民的骄傲，让自由之声响彻每个山冈。”<br/>&nbsp;&nbsp;&nbsp;&nbsp;如果美国要成为一个伟大的国家，这个梦想必须实现。让自由之声从新罕布什尔州的巍峨峰巅响起来！让自由之声从纽约州的崇山峻岭响起来！让自由之声从宾夕法尼亚州阿勒格尼山的顶峰响起！让自由之声从科罗拉多州冰雪覆盖的落矶山响起来！让自由之声从加利福尼亚州蜿蜒的群峰响起来！不仅如此，还要让自由之声从佐治亚州的石岭响起来！让自由之声从田纳西州的了望山响起来！让自由之声从密西西比州的每一座丘陵响起来！让自由之声从每一片山坡响起来。<br/>&nbsp;&nbsp;&nbsp;&nbsp;当我们让自由之声响起来，让自由之声从每一个大小村庄、每一个州和每一个城市响起来时，我们将能够加速这一天的到来，那时，上帝的所有儿女，黑人和白人，犹太人和非犹太人，新教徒和天主教徒，都将手携手，合唱一首古老的黑人灵歌：“终于自由啦！终于自由啦！感谢全能的上帝，我们终于自由啦！”</p><p><br/></p>','2017-05-19 10:25:20',34,'<p><span style=\"font-family: 宋体,SimSun;\">Five&nbsp;score&nbsp;years&nbsp;ago,&nbsp;a&nbsp;great&nbsp...','I have a dream','2017-05-19 10:25:20','\0'),(11,'<p><span style=\"color: rgb(149, 179, 215);\">asdxcsdasczxcadsadasczxcxcasqdasc</span></p><p><span style=\"color: rgb(128, 100, 162);\">非常惊喜</span><span style=\"color: rgb(149, 179, 215);\"><br/></span></p><p><span style=\"color: rgb(128, 100, 162);\">axxxxxxxx</span></p><p><span style=\"color: rgb(128, 100, 162);\">xVCXVCxv</span></p><p><span style=\"color: rgb(128, 100, 162);\"><img src=\"/ueditor/jsp/upload/image/20170601/1496283263324036816.jpg\" title=\"1496283263324036816.jpg\" alt=\"24e66da98226cffc38639e3bbf014a90f703ea15.jpg\"/><span style=\"color: rgb(128, 100, 162); background-color: rgb(0, 0, 0);\"></span><br/></span></p><p><span style=\"background-color: rgb(73, 68, 41);\">asdxcxcxc</span><br/><span style=\"color: rgb(128, 100, 162);\"></span></p>','2017-06-01 10:14:25',24,'<p><span style=\"color: rgb(149, 179, 215);\">asdxcsdasczxcadsadasczxcxcasqdasc</span></p><p><span sty...','惊喜吗','2017-06-08 00:00:00','\0'),(12,'<p>传你妹的火</p><p><img src=\"/ueditor/jsp/upload/image/20170617/1497687591350096170.jpg\" title=\"1497687591350096170.jpg\" alt=\"31e2f725bc315c604f0985238ab1cb134854777f.jpg\"/></p><p>传不了传不了<br/></p><p><img src=\"/ueditor/jsp/upload/image/20170617/1497687594778066130.jpg\" title=\"1497687594778066130.jpg\" alt=\"34c1891190ef76c6141b5de79a16fdfaad5167ca.jpg\"/></p>','2017-06-17 16:20:17',4,'<p>传你妹的火</p><p><img src=\"/ueditor/jsp/upload/image/20170617/1497687591350096170.jpg\" title=\"14976875...','传火吗朋友','2017-06-17 16:20:17','\0');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_to_reply`
--

DROP TABLE IF EXISTS `article_to_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_to_reply` (
  `articleid` int(11) NOT NULL,
  `replyid` int(11) NOT NULL,
  UNIQUE KEY `UK_gw0m4w9ow49mkt55q9ya67j2j` (`replyid`),
  KEY `FK_5hb1qk99j7nbpwp2xtw6ms9vr` (`articleid`),
  CONSTRAINT `FK_5hb1qk99j7nbpwp2xtw6ms9vr` FOREIGN KEY (`articleid`) REFERENCES `article` (`articleid`),
  CONSTRAINT `FK_gw0m4w9ow49mkt55q9ya67j2j` FOREIGN KEY (`replyid`) REFERENCES `reply` (`replyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_to_reply`
--

LOCK TABLES `article_to_reply` WRITE;
/*!40000 ALTER TABLE `article_to_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_to_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picture`
--

DROP TABLE IF EXISTS `picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picture`
--

LOCK TABLES `picture` WRITE;
/*!40000 ALTER TABLE `picture` DISABLE KEYS */;
INSERT INTO `picture` VALUES (1,'nIZSw7Kxy06w25x.jpg'),(2,'5J43DtyRe1yp8Jh.png'),(3,'XaclVOH9qyJbeDg.png'),(4,'O5m0ecY6Vbiu4Xl.jpg'),(5,'ye2TU3WmKF37UU9.jpg'),(6,'yB2mOlkmQNxnvnG.png'),(7,'t2xho7kih6Ks1Qf.jpg'),(8,'FRZpmedbTSQe70Z.png'),(9,'PbJoOZImPjlD1JH.jpg'),(10,'U4NdOuBHaNDTHq4.png'),(11,'NeSj8JGKDzvAt1f.png'),(12,'B0fDtbTjwBGE5ck.jpg'),(13,'hpE8f1hF3vNjqaZ.jpg'),(14,'74Sd847XZ6bg1H5.jpg'),(15,'3v2dY11p6CtABao.jpg'),(16,'diHBdiTAnNd35pN.jpg'),(17,'fegFb1ymHaRKgdd.jpg'),(18,'hRKCA7nAwAGlHWU.jpg'),(19,'1xLkqbKX1VJfqpL.jpg'),(20,'pJvqSen6IJvNrss.jpg'),(21,'PY3173ll8c7u9YT.jpg'),(22,'PiO8XlYikEDAiK2.jpg'),(23,'W0dkrxk4B58tpC7.jpg'),(24,'LPkHkLjqm3KOm0A.jpg'),(25,'OrS2tltFP9nhrtH.jpg'),(26,'iOqKAneSpIFr1rl.jpg'),(27,'PagXzX6sY1maBWz.jpg'),(28,'f0dlGzWnbRNXmoR.jpg'),(29,'YDcqBLR0Q1wc7yy.jpg'),(30,'WYoLuhNlOp0V3yU.jpg'),(31,'XnYD17IRNiqc97R.jpg'),(32,'TEUSVZzkdZCxjdL.jpg'),(33,'6UWoLIG6yZHaSiD.jpg'),(34,'YXfx7iDaqP6xFxT.jpg'),(35,'aaZU5zt8jfz8k5a.png'),(36,'0nmA60c1QsCKmNX.jpg'),(37,'UIp0WwDxziibLwp.jpg'),(38,'5RhJVOAtwyz3mY4.jpg'),(39,'KQ6wZcCrZwjr5pc.png');
/*!40000 ALTER TABLE `picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (5,'国语独立乐队和音乐人','//music.163.com/outchain/player?type=0&id=717969049&auto=0&height=430'),(8,'音游曲','//music.163.com/outchain/player?type=0&id=83410515&auto=0&height=430'),(9,'日系硬核','//music.163.com/outchain/player?type=0&id=67731018&auto=0&height=430'),(10,'纯音乐','//music.163.com/outchain/player?type=0&id=68083790&auto=0&height=430');
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reply` (
  `replyid` int(11) NOT NULL AUTO_INCREMENT,
  `replyContent` varchar(255) DEFAULT NULL,
  `replyTime` varchar(255) DEFAULT NULL,
  `replyer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`replyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-10 14:53:41
