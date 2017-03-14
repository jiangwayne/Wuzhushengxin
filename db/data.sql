CREATE TABLE `t_article` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '站点描述',
  `site_domain` varchar(200) DEFAULT NULL COMMENT '站点域名',
  `create_time` timestamp NULL DEFAULT NULL,
  `resource_domain` varchar(200) DEFAULT NULL COMMENT '资源域名',
  `pub_id` int(20) DEFAULT NULL COMMENT '媒体ID',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_del` int(10) DEFAULT NULL COMMENT '1为逻辑删除',
  `status` int(11) DEFAULT NULL COMMENT '0',
  `primary_site` int(11) DEFAULT NULL,
  `grade_two_site` int(11) DEFAULT NULL,
  `iframe_count` int(11) DEFAULT NULL,
  `pc_blacklist_status` int(11) NOT NULL DEFAULT '0' COMMENT 'PC白名单状态：0位启用，1位停用',
  `mobile_blacklist_status` int(11) NOT NULL DEFAULT '0' COMMENT '移动白名单状态：0位启用，1位停用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC