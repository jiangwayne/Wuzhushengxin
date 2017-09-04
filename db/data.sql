DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL COMMENT '名称',
  `directory` varchar(128) DEFAULT NULL COMMENT '目录',
  `prefix` varchar(16) NOT NULL COMMENT '该类article的文件名前缀',
  `status` int(2) DEFAULT 1 COMMENT '状态(1:有效数据)',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modify` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
-- init data
INSERT INTO t_category VALUES (1100, '数学分析', 'articles/mathematics/mathematicalAnalysis/', 'math', 1, now(), now());
INSERT INTO t_category VALUES (2100, '数据结构', 'articles/algorithm/dataStructure/', 'algorithm', 1, now(), now());
INSERT INTO t_category VALUES (6100, '小故事', 'articles/conte/', 'conte', 1, now(), now());
INSERT INTO t_category VALUES (3100, 'java', 'articles/program/java/', 'program', 1, now(), now());
INSERT INTO t_category VALUES (3200, 'hadoop', 'articles/program/hadoop/', 'program', 1, now(), now());

DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL COMMENT '标题',
  `brief` varchar(256) DEFAULT NULL COMMENT '简介',
  `keywords` varchar(256) DEFAULT NULL COMMENT '关键字',
  `views` int(10) DEFAULT 0 COMMENT '阅读数',
  `comments` int(10) DEFAULT 0 COMMENT '评论数',
  `category_id` int(10) DEFAULT 0 COMMENT '分类id',
  `status` int(2) DEFAULT 1 COMMENT '状态(1:有效数据)',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modify` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
-- init data
INSERT INTO t_article VALUES (11001,'实数及其性质','实数的定义:任何实数都可用一个确定的无限小数来表示。','数学分析，实数',0,0,1100,1,now(),now());
INSERT INTO t_article VALUES (21001,'线性表','线性表是最基本、最简单、也是最常用的一种数据结构','数据结构，线性表，链表',0,0,2100,1,now(),now());
INSERT INTO t_article VALUES(31001,'java基本数据类型','java一共有8种基本类型，其中4种整型，2种浮点类型，1种字符类型，1种boolean类型','java,数据类型',0,0,3100,1,now(),now());
INSERT INTO t_article VALUES (32001,'hadoop安装','在centos7.2下安装hadoop2.8.0，伪分布式配置','centos,hadoop,安装',0,0,3200,1,now(),now());
INSERT INTO t_article VALUES (32002,'hdfs的基本操作','用命令接口与java来操作hdfs','hdfs,操作',0,0,3200,1,now(),now());
INSERT INTO t_article VALUES (32003,'mapreduce简单应用','用mapreduce来统计本站每个ip的访问次数','mapreduce',0,0,3200,1,now(),now());
INSERT INTO t_article VALUES (61001,'人间的实相(佛说譬喻经)','在一个寂寞的秋日黄昏，无尽广阔的荒野中，有一位旅人步履蹒跚地赶着路。突然','佛教，故事，实相',0,0,6100,1,now(),now());


DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL COMMENT '评论人名称',
  `content` varchar(2048) NOT NULL COMMENT '内容',
  `article_id` int(10) NOT NULL COMMENT '文章id',
  `status` int(2) DEFAULT 1 COMMENT '状态(1:有效数据)',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modify` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


