/*
Navicat MySQL Data Transfer
Source Host     : localhost:3306
Source Database : train
Target Host     : localhost:3306
Target Database : train
Date: 2010-12-02 10:57:30
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `course` varchar(100) DEFAULT NULL,
  `teacher` varchar(30) DEFAULT NULL,
  `infor` varchar(4000) DEFAULT NULL,
  `start` varchar(20) DEFAULT NULL,
  `end` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'J2EE开发', 'qq', '    J2EE核心是一组技术规范与指南，其中所包含的各类组件、服务架构及技术层次，均有共通的标准及规格，让各种依循J2EE架构的不同平台之间，存在良好的兼容性，解决过去企业后端使用的信息产品彼此之间无法兼容,，企业内部或外部难以互通的窘境。', '2010-11-21', '2010-11-30');

-- ----------------------------
-- Table structure for coursedetail
-- ----------------------------
DROP TABLE IF EXISTS `coursedetail`;
CREATE TABLE `coursedetail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cid` int(10) DEFAULT NULL,
  `tname` varchar(50) DEFAULT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `ftime` varchar(20) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coursedetail
-- ----------------------------
INSERT INTO `coursedetail` VALUES ('6', '1', 'qq', '课程总结.ppt', '2010-12-1', '/upload/courdel/课程总结.ppt');
INSERT INTO `coursedetail` VALUES ('8', '1', 'qq', '12.高级计算机系统结构_总线技术2.ppt', '2010-12-1', '/upload/courdel/12.高级计算机系统结构_总线技术2.ppt');
INSERT INTO `coursedetail` VALUES ('9', '1', 'qq', '1.高级计算机系统结构_概述.ppt', '2010-12-1', '/upload/courdel/1.高级计算机系统结构_概述.ppt');

-- ----------------------------
-- Table structure for datas
-- ----------------------------
DROP TABLE IF EXISTS `datas`;
CREATE TABLE `datas` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `link` varchar(150) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of datas
-- ----------------------------
INSERT INTO `datas` VALUES ('3', '电子科大ACM测评', 'http://acm.uestc.edu.cn/ProblemList.aspx');
INSERT INTO `datas` VALUES ('4', '北大POJ', 'http://acm.pku.edu.cn/JudgeOnline/');

-- ----------------------------
-- Table structure for papers
-- ----------------------------
DROP TABLE IF EXISTS `papers`;
CREATE TABLE `papers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `type` varchar(10) NOT NULL,
  `state` varchar(10) NOT NULL,
  `alltime` varchar(20) NOT NULL,
  `stime` varchar(20) NOT NULL,
  `single` varchar(10) DEFAULT NULL,
  `more` varchar(10) DEFAULT NULL,
  `slist` varchar(200) DEFAULT NULL,
  `mlist` varchar(200) DEFAULT NULL,
  `cid` int(10) DEFAULT NULL,
  `course` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of papers
-- ----------------------------
INSERT INTO `papers` VALUES ('2', '6月校内测试', '竞赛试卷', '进行中', '01:30:00', '2010-05-10 09:30:00', '50', '50', '9,13', '14,24', null, null);
INSERT INTO `papers` VALUES ('4', '7月校内测试', '练习试卷', '等待中', '01:30:00', '2010-05-10 09:30:00', '50', '50', '13,16', '14,24', null, null);
INSERT INTO `papers` VALUES ('6', '5月校内测试', '竞赛试卷', '进行中', '01:30:00 ', '2010-05-10 09:30:00', '40', '60', '23,21', '24,14', null, null);
INSERT INTO `papers` VALUES ('7', '5月校内竞赛', '竞赛试卷', '已结束', '01:30:00 ', '2010-05-10 09:30:00', '50', '50', '23,22', '24,14', null, null);

-- ----------------------------
-- Table structure for paresult
-- ----------------------------
DROP TABLE IF EXISTS `paresult`;
CREATE TABLE `paresult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paid` int(11) NOT NULL,
  `patitle` varchar(100) NOT NULL,
  `userid` varchar(45) NOT NULL,
  `sscore` int(11) DEFAULT '0',
  `mscore` int(11) DEFAULT '0',
  `subtime` varchar(45) DEFAULT NULL,
  `course` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of paresult
-- ----------------------------
INSERT INTO `paresult` VALUES ('1', '2', '6月校内测试', 'wints', '50', '0', '2010-06-07 12:29:42', null);
INSERT INTO `paresult` VALUES ('2', '2', '6月校内测试', 'wints', '50', '50', '2010-06-08 07:58:37', null);
INSERT INTO `paresult` VALUES ('3', '2', '6月校内测试', 'wints', '25', '50', '2010-06-08 08:02:59', null);
INSERT INTO `paresult` VALUES ('4', '2', '6月校内测试', 'wints', '25', '25', '2010-06-08 12:05:07', null);
INSERT INTO `paresult` VALUES ('5', '4', '7月校内测试', 'wints', '50', '50', '2010-06-08 12:28:56', null);
INSERT INTO `paresult` VALUES ('6', '4', '7月校内测试', 'wints', '50', '50', '2010-06-13 01:19:50', null);
INSERT INTO `paresult` VALUES ('7', '5', '8月校内检查', 'wints', '38', '50', '2010-06-21 00:31:00', null);
INSERT INTO `paresult` VALUES ('8', '6', '5月校内测试', 'wints', '20', '30', '2010-06-21 08:57:02', null);
INSERT INTO `paresult` VALUES ('9', '6', '5月校内测试', 'wints', '0', '0', '2010-06-22 09:14:28', null);
INSERT INTO `paresult` VALUES ('10', '6', '5月校内测试', 'wints', '0', '0', '2010-06-23 09:09:14', null);
INSERT INTO `paresult` VALUES ('11', '10', '8月校内检查', 'wints', '40', '0', '2010-06-23 17:10:45', null);

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `id` int(8) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `title` varchar(500) NOT NULL,
  `type` varchar(6) NOT NULL,
  `optionA` varchar(500) NOT NULL,
  `optionB` varchar(500) NOT NULL,
  `optionC` varchar(500) NOT NULL,
  `optionD` varchar(500) NOT NULL,
  `answer` varchar(10) NOT NULL,
  `note` varchar(500) DEFAULT NULL,
  `cid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES ('00000001', '线性表采用链式存储时，结点的存储地址（   ）', '单选题', '必须是不连续的', '连续与否均可', '必须是连续的', '和头结点的存储地址相连续', 'B', null, null);
INSERT INTO `questions` VALUES ('00000002', '将长度为n的单链表链接在长度为m的单链表之后的算法的时间复杂度为（  ）', '单选题', 'O（1）', 'O（n）', 'O（m）', 'O（m+n）', 'C', null, null);
INSERT INTO `questions` VALUES ('00000003', '由两个栈共享一个向量空间的好处是：（   ）', '单选题', '减少存取时间，降低下溢发生的机率', '节省存储空间，降低上溢发生的机率', '减少存取时间，降低上溢发生的机率', '节省存储空间，降低下溢发生的机率', 'B', null, null);
INSERT INTO `questions` VALUES ('00000004', '设数组data[m]作为循环队列SQ的存储空间，front为队头指针，rear为队尾指针，则执行出队操作后其头指针front值为（   ）', '单选题', 'front=front+1', 'front=(front+1)%(m-1)', 'front=(front-1)%m ', 'front=(front+1)%m', 'D', null, null);
INSERT INTO `questions` VALUES ('00000005', '如下陈述中正确的是（    ）', '单选题', '串是一种特殊的线性表', '串的长度必须大于零', '串中元素只能是字母', '空串就是空白串', 'A', null, null);
INSERT INTO `questions` VALUES ('00000006', '在标准ASCII字符集中，一个字符的编码占是用（）', '多选题', '4个字节', '2个字节 ', '1个字节 ', '7bit', 'ABD', '', null);
INSERT INTO `questions` VALUES ('00000007', '若目标串的长度为n，模式串的长度为[n/3]，则执行模式匹配算法时，在最坏情况下的时间复杂度是（    ）', '单选题', 'O（1）', 'O（n）', 'O（n2）', 'O（n3）', 'C', null, null);
INSERT INTO `questions` VALUES ('00000008', '一个非空广义表的表头（    ）', '单选题', '不可能是子表', '只能是子表', '只能是原子', '可以是子表或原子', 'D', null, null);
INSERT INTO `questions` VALUES ('00000009', '在一棵度为3的树中,度为3的结点个数为2,度为2 的结点个数为1,则度为0的结点个数为(    )', '单选题', '4', '5', '6', '7', 'C', '11', null);
INSERT INTO `questions` VALUES ('00000010', '在含n个顶点和e条边的无向图的邻接矩阵中,零元素的个数为(    )', '单选题', 'e ', '2e', 'n2－e', 'n2－2e', 'D', null, null);
INSERT INTO `questions` VALUES ('00000011', '假设一个有n个顶点和e条弧的有向图用邻接表表示,则删除与某个顶点vi相关的所有弧的时间复杂度是(    )', '多选题', 'O(n)', 'O(e)', 'O(n+e)', 'O(n*e)', 'C', null, null);
INSERT INTO `questions` VALUES ('00000012', '用某种排序方法对关键字序列（25，84，21，47，15，27，68，35，20）进行排序时，序列的变化情况如下：\r\n        20，15，21，25，47，27，68，35，84\r\n        15，20，21，25，35，27，47，68，84\r\n        15，20，21，25，27，35，47，68，84\r\n    则所采用的排序方法是（   ）\r\n', '单选题', '选择排序', '希尔排序', '归并排序', '快速排序', 'D', null, null);
INSERT INTO `questions` VALUES ('00000013', '适于对动态查找表进行高效率查找的组织结构是（   ）', '单选题', '有序表', '分块有序表', '三叉排序树', '线性链表', 'C', '4', null);
INSERT INTO `questions` VALUES ('00000014', '在一棵完全二叉树中，若编号为i的结点存在右孩子，则右孩子结点的编号为（）', '多选题', '2i ', '2i-1', '2i+1', '2i+2', 'C', '5', null);
INSERT INTO `questions` VALUES ('00000015', '设高度为h的二叉树上只有度为0和度为2的结点，则此类二叉树中所包含的结点数至少为（）', '单选题', '2h', '2h-1', '2h+1', 'h+1', 'B', null, null);
INSERT INTO `questions` VALUES ('00000016', '按照二叉树的定义，具有3个结点的二叉树有（）种状态。', '单选题', '5', '4', '3', '30', 'A', '7', null);
INSERT INTO `questions` VALUES ('00000017', '若查找每个元素的概率相等，则在长度为n的顺序表上查找任意元素的平均查找长度为（）', '多选题', 'n', 'n+1', '(n-1)/2', '(n+1)/2', 'D', '8', null);
INSERT INTO `questions` VALUES ('00000018', '顺序查找法适合于存储结构为（）的线性表。', '单选题', '散列存储', '顺序存储或链接存储', '压缩存储', '索引存储', 'A', null, null);
INSERT INTO `questions` VALUES ('00000019', '对于顺序存储的有序表（5，12，20，26，37，42，46，50，64），若采用折半查找，则查找元素26的查找长度（）', '单选题', '2', '3', '4', '5', 'C', null, null);
INSERT INTO `questions` VALUES ('00000020', '对线性表进行折半查找时，要求线性表必须（）', '单选题', '以顺序方式存储', '以链接方式存储', '以顺序方式存储，且结点按关键字有序排序', '以链接方式存储，且结点按关键字有序排序', 'C', '1', null);
INSERT INTO `questions` VALUES ('00000021', '设单链表中指针p指向结点ai,指针f指向将要插入的新结点 x，则当x插在链表中两个数据元素ai和ai+1之间时，只要先修改（ ）后修改（）即可。', '多选题', 'p->next= f', 'p->next= p->next->next ', 'p->next=f->next', 'f->next= p->next', 'DA', '2', null);
INSERT INTO `questions` VALUES ('00000022', '设单链表中指针p指向结点ai,指针f指向将要插入的新结点 x，则在链表中最后一个结点an之后插入时，只要先修改（）后修改（）即可。', '多选题', 'f->next= p', ' f->next= p->next', 'p->next=f', 'p->next= f->next', 'BC', '3', null);
INSERT INTO `questions` VALUES ('00000023', '6', '单选题', '4', '4', '4', '4', 'A', '4', null);
INSERT INTO `questions` VALUES ('00000024', '12345678', '多选题', '33', '44', '55', '66', 'ABC', '', null);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `authorid` varchar(25) NOT NULL,
  `studentid` varchar(25) NOT NULL,
  `name` varchar(25) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `question` varchar(200) NOT NULL,
  `answer` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('000001', 'wints', '2606001014', '邱兴乾', '123', '我喜欢的颜色？', '红色', 'qqxingqian@163.com');
INSERT INTO `student` VALUES ('000002', 'liuwei', '2606001012', '刘伟', '123', '我喜欢的颜色？', '红色', '02861823452');
INSERT INTO `student` VALUES ('000003', 'maqing', '2606001013', '马清', '123', '我的生日？', '7月17日', '02861823452');
INSERT INTO `student` VALUES ('000004', 'wushi', '2606001006', '黄务实', '123', '我的生日？', '7-17', '02861823452');

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cid` int(10) DEFAULT NULL,
  `student` varchar(30) DEFAULT NULL,
  `teacher` varchar(30) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `mark` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tasks
-- ----------------------------
INSERT INTO `tasks` VALUES ('1', '1', '邱兴乾', 'qq', '2.高级计算机系统结构_Intel86体系结构1.ppt', '/upload/tasks/2.高级计算机系统结构_Intel86体系结构1.ppt', '2010-12-1', '90');
INSERT INTO `tasks` VALUES ('2', '1', '邱兴乾', 'qq', '3.高级计算机体系结构_Intel86体系结构2.ppt', '/upload/tasks/3.高级计算机体系结构_Intel86体系结构2.ppt', '2010-12-1', '89');
INSERT INTO `tasks` VALUES ('3', '1', '黄务实', 'qq', '5.高级计算机系统结构_高速缓存.ppt', '/upload/tasks/5.高级计算机系统结构_高速缓存.ppt', '2010-12-1', '81');

-- ----------------------------
-- Table structure for tb_manager
-- ----------------------------
DROP TABLE IF EXISTS `tb_manager`;
CREATE TABLE `tb_manager` (
  `id` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of tb_manager
-- ----------------------------
INSERT INTO `tb_manager` VALUES ('008', '邱兴乾', '111');
INSERT INTO `tb_manager` VALUES ('009', 'wints', '123');
INSERT INTO `tb_manager` VALUES ('010', 'qq', '111');
