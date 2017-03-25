DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL COMMENT '名称',
  `status` int(2) DEFAULT 1 COMMENT '状态(1:有效数据)',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modify` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC

DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL COMMENT '标题',
  `brief` varchar(256) DEFAULT NULL COMMENT '简介',
  `url` varchar(256) DEFAULT NULL COMMENT '内容地址',
  `views` int(10) DEFAULT 0 COMMENT '阅读数',
  `comments` int(10) DEFAULT 0 COMMENT '评论数',
  `category_id` int(10) DEFAULT 0 COMMENT '分类id',
  `no` varchar(16) NOT NULL COMMENT '编号',
  `status` int(2) DEFAULT 1 COMMENT '状态(1:有效数据)',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modify` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC

DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL COMMENT '名称',
  `content` varchar(2048) NOT NULL COMMENT '内容',
  `article_id` int(10) NOT NULL COMMENT '文章id',
  `status` int(2) DEFAULT 1 COMMENT '状态(1:有效数据)',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modify` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC

