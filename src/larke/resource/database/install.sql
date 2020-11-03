DROP TABLE IF EXISTS `pre__larke_admin`;
CREATE TABLE `pre__larke_admin` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ID',
  `name` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '管理账号',
  `password` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '管理密码',
  `password_salt` varchar(6) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '加密因子',
  `nickname` varchar(150) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '昵称',
  `email` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `avatar` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `is_root` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1-超级管理',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `last_active` int(10) DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT '0' COMMENT '最后登录IP',
  `create_time` int(10) DEFAULT '0' COMMENT '创建时间',
  `create_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建IP',
  PRIMARY KEY (`id`),
  KEY `username` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='管理员表';

DROP TABLE IF EXISTS `pre__larke_admin_log`;
CREATE TABLE `pre__larke_admin_log` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '日志ID',
  `admin_id` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '管理账号ID',
  `admin_name` varchar(250) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '管理账号',
  `method` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '请求类型',
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `info` text COLLATE utf8mb4_unicode_ci COMMENT '内容信息',
  `useragent` text COLLATE utf8mb4_unicode_ci COMMENT 'User-Agent',
  `ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT '0',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `create_time` int(10) DEFAULT '0' COMMENT '创建时间',
  `create_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='操作日志';

DROP TABLE IF EXISTS `pre__larke_attachment`;
CREATE TABLE `pre__larke_attachment` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `belong_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '附件属于',
  `belong_id` varchar(32) CHARACTER SET utf8mb4 DEFAULT '0' COMMENT '附件属于ID',
  `name` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件路径',
  `mime` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `extension` char(10) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` int(11) NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'sha1 散列值',
  `driver` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local' COMMENT '上传驱动',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `update_time` int(10) DEFAULT '0' COMMENT '更新时间',
  `update_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '修改IP',
  `create_time` int(10) DEFAULT '0' COMMENT '创建时间',
  `create_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='附件表';

DROP TABLE IF EXISTS `pre__larke_auth_group`;
CREATE TABLE `pre__larke_auth_group` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户组id',
  `parentid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '父组别',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '描述信息',
  `listorder` smallint(5) DEFAULT '100' COMMENT '排序ID',
  `is_system` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1-系统默认角色',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `update_time` int(10) DEFAULT '0' COMMENT '更新时间',
  `update_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '修改IP',
  `create_time` int(10) DEFAULT '0' COMMENT '创建时间',
  `create_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='权限组表';

DROP TABLE IF EXISTS `pre__larke_auth_group_access`;
CREATE TABLE `pre__larke_auth_group_access` (
  `id` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '0',
  `admin_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `group_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_id` (`admin_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='管理员与用户组关联表';

DROP TABLE IF EXISTS `pre__larke_auth_rule`;
CREATE TABLE `pre__larke_auth_rule` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则id',
  `parentid` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `title` varchar(150) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '名称',
  `url` varchar(250) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '权限链接',
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '请求类型',
  `slug` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '地址标识',
  `description` varchar(255) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '描述',
  `listorder` smallint(5) DEFAULT '100' COMMENT '排序ID',
  `is_need_auth` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-验证权限',
  `is_system` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1-系统权限',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `update_time` int(10) DEFAULT '0' COMMENT '更新时间',
  `update_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '修改IP',
  `create_time` int(10) DEFAULT '0' COMMENT '创建时间',
  `create_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='规则表';

DROP TABLE IF EXISTS `pre__larke_auth_rule_access`;
CREATE TABLE `pre__larke_auth_rule_access` (
  `id` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '0',
  `group_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `rule_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rule_id` (`rule_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户组与权限关联表';

DROP TABLE IF EXISTS `pre__larke_config`;
CREATE TABLE `pre__larke_config` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '配置ID',
  `group` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '配置分组',
  `type` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '配置类型',
  `title` varchar(80) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '配置标题',
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '配置名称',
  `options` text CHARACTER SET utf8mb4 COMMENT '配置项',
  `value` text COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  `description` varchar(250) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '配置描述',
  `listorder` smallint(5) DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) DEFAULT '1' COMMENT '1-显示',
  `is_system` tinyint(1) DEFAULT '0' COMMENT '1-系统默认角色',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态，1-启用',
  `update_time` int(10) DEFAULT '0' COMMENT '更新时间',
  `update_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '修改IP',
  `create_time` int(10) DEFAULT '0' COMMENT '创建时间',
  `create_ip` varchar(50) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '创建IP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `group` (`group`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='网站配置';

DROP TABLE IF EXISTS `pre__larke_extension`;
CREATE TABLE `pre__larke_extension` (
  `id` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `name` varchar(160) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '扩展id',
  `title` varchar(250) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '名称',
  `introduce` mediumtext CHARACTER SET utf8mb4 NOT NULL COMMENT '简介',
  `author` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '作者',
  `authorsite` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '作者地址',
  `authoremail` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '作者邮箱',
  `version` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '版本',
  `adaptation` varchar(50) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '适配最低版本',
  `require_extension` text CHARACTER SET utf8mb4 COMMENT '依赖扩展',
  `config` mediumtext CHARACTER SET utf8mb4 COMMENT '配置设置信息',
  `config_data` text CHARACTER SET utf8mb4 COMMENT '配置结果信息',
  `class_name` text CHARACTER SET utf8mb4 COMMENT '扩展绑定类',
  `installtime` int(10) DEFAULT '0' COMMENT '安装时间',
  `upgradetime` int(10) DEFAULT '0' COMMENT '更新时间',
  `listorder` smallint(5) DEFAULT '100' COMMENT '排序',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `update_time` int(10) DEFAULT '0' COMMENT '更新时间',
  `update_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '更新IP',
  `create_time` int(10) DEFAULT '0' COMMENT '创建时间',
  `create_ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '创建IP',
  PRIMARY KEY (`id`),
  KEY `Extension` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='已安装模块列表';

DROP TABLE IF EXISTS `pre__larke_rules`;
CREATE TABLE `pre__larke_rules` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ptype` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `v0` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `v1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `v2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `v3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `v4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `v5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pre__larke_admin` (`id`,`name`,`password`,`password_salt`,`nickname`,`email`,`avatar`,`is_root`,`status`,`last_active`,`last_ip`,`create_time`,`create_ip`) VALUES ('04f65b19e5a2513fe5a89100309da9b7','admin','17f7ebcebe6ec437baf57361a723e871','NgWvGe','admin','larke-admin@larke-admin.com','e76037551a4ea416bc729419bae69f5e',1,1,1604238768,'127.0.0.1',1564667925,'2130706433');
INSERT INTO `pre__larke_auth_rule` (`id`,`parentid`,`title`,`url`,`method`,`slug`,`description`,`listorder`,`is_need_auth`,`is_system`,`status`,`update_time`,`update_ip`,`create_time`,`create_ip`) VALUES ('0269a89fed2383d93bfc800db33394d7','738db418879bb2d959d86ab19a8cb362','larke-admin-attachment-upload','admin-api/attachment/upload','POST','larke-admin-attachment-upload','larke-admin-attachment-upload',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('050e33bde25ade298078d9c529c7bea1','73925f7b28cad778903d6027ffbdd3c2','larke-admin-auth-rule-index','admin-api/auth/rule/index','GET','larke-admin-auth-rule-index','larke-admin-auth-rule-index',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('0b22b0d6c4ccb27fb4eeee73e508e36d','a20a4e869bccf36a9380b320fec9d702','larke-admin-profile-rules','admin-api/profile/rules','GET','larke-admin-profile-rules','larke-admin-profile-rules',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('147655fde3adc829e9d3f7031ad6ab00','2387d7cfa5462da26d0139a8103559f3','扩展列表','admin-api/extension/index','HEAD','larke-admin-extension-index','系统扩展列表管理',101,1,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('172169d37495fafc5df04d27f938e748','b529d72a44d326550add56384f57b483','larke-admin-system-clear-cache','admin-api/system/clear-cache','POST','larke-admin-system-clear-cache','larke-admin-system-clear-cache',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('17d8f8f057a474e81b7a606fc0a65524','af2bea560da9e1a3d61f34f156434fe4','larke-admin-passport-captcha','admin-api/passport/captcha','HEAD','larke-admin-passport-captcha','larke-admin-passport-captcha',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('180c004a8c09e974698bd3fd76bedfcc','2387d7cfa5462da26d0139a8103559f3','larke-admin-extension-upgrade','admin-api/extension/upgrade','PUT','larke-admin-extension-upgrade','larke-admin-extension-upgrade',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('18271f26a8448a88214715c555061af3','73925f7b28cad778903d6027ffbdd3c2','larke-admin-auth-rule-create','admin-api/auth/rule/create','POST','larke-admin-auth-rule-create','larke-admin-auth-rule-create',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('1a7b23e9d9fefe52766338f77deafacd','738db418879bb2d959d86ab19a8cb362','larke-admin-attachment-detail','admin-api/attachment/detail','HEAD','larke-admin-attachment-detail','larke-admin-attachment-detail',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('1b88767771951a4d78dac33886c6ce71','2387d7cfa5462da26d0139a8103559f3','larke-admin-extension-enable','admin-api/extension/enable','PATCH','larke-admin-extension-enable','larke-admin-extension-enable',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('1dfe26950599df603a55cc5b5ff9499e','b529d72a44d326550add56384f57b483','larke-admin-system-info','admin-api/system/info','HEAD','larke-admin-system-info','larke-admin-system-info',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('1f0765349b2bef6407d2739182051141','738db418879bb2d959d86ab19a8cb362','larke-admin-attachment-download','admin-api/attachment/download','HEAD','larke-admin-attachment-download','larke-admin-attachment-download',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('2300b9534e776699bcb19e62169b02f0','2387d7cfa5462da26d0139a8103559f3','larke-admin-extension-disable','admin-api/extension/disable','PATCH','larke-admin-extension-disable','larke-admin-extension-disable',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('2387d7cfa5462da26d0139a8103559f3','0','扩展','','Error','2f701f424548fa2f18584532e6f05d60','系统扩展管理',105,1,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('2e5e93ee5f9d3da88287524549453e57','2387d7cfa5462da26d0139a8103559f3','larke-admin-extension-listorder','admin-api/extension/listorder','PATCH','larke-admin-extension-listorder','larke-admin-extension-listorder',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('2ec717a7b518dc717be9d297c33ec48c','c70cb3a2475b1b01f81c6fcc33a78589','larke-admin-auth-group-disable','admin-api/auth/group/disable','PATCH','larke-admin-auth-group-disable','larke-admin-auth-group-disable',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('2fa16d3dfc4a0c8187accdcc73baf6ff','738db418879bb2d959d86ab19a8cb362','larke-admin-attachment-disable','admin-api/attachment/disable','PATCH','larke-admin-attachment-disable','larke-admin-attachment-disable',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('307a39aa787049950b703b94795e0fb1','73925f7b28cad778903d6027ffbdd3c2','larke-admin-auth-rule-detail','admin-api/auth/rule/detail','HEAD','larke-admin-auth-rule-detail','larke-admin-auth-rule-detail',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('31717f5c40a98d9ae1cf2040aa501998','c70cb3a2475b1b01f81c6fcc33a78589','larke-admin-auth-group-detail','admin-api/auth/group/detail','HEAD','larke-admin-auth-group-detail','larke-admin-auth-group-detail',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('342185ee8bd45db58695c0fbe4b9e87d','c70cb3a2475b1b01f81c6fcc33a78589','larke-admin-auth-group-index-tree','admin-api/auth/group/index-tree','GET','larke-admin-auth-group-index-tree','larke-admin-auth-group-index-tree',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('342d4e822323889b4e7aecd8bcaa8ccf','73925f7b28cad778903d6027ffbdd3c2','larke-admin-auth-rule-index-children','admin-api/auth/rule/index-children','GET','larke-admin-auth-rule-index-children','larke-admin-auth-rule-index-children',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('34caefbc3509689bca367bd0b9590776','60ddae159c2bd0ec4f5910608d643680','larke-admin-log-detail','admin-api/log/detail','HEAD','larke-admin-log-detail','larke-admin-log-detail',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('364112a708f5462fe33b3db1a5f4abb4','8463daa7b5859fac24c9a2f9bf50df70','larke-admin-config-listorder','admin-api/config/listorder','PATCH','larke-admin-config-listorder','larke-admin-config-listorder',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('3779cbc7ee953f385d109a8b53cdd32f','8463daa7b5859fac24c9a2f9bf50df70','larke-admin-config-enable','admin-api/config/enable','PATCH','larke-admin-config-enable','larke-admin-config-enable',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('37fdcc7fdf6efd3df27497176c046ea8','2387d7cfa5462da26d0139a8103559f3','本地扩展','admin-api/extension/local','HEAD','larke-admin-extension-local','本地全部扩展',102,1,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('386ef94dfbc9c4046acaf6c26088c372','af112165b09c1d1c0f22b3118e406783','larke-admin-frontend-menu-index','admin-api/frontend/menu/index','GET','larke-admin-frontend-menu-index','larke-admin-frontend-menu-index',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('393b449ddb3c6d997ba81f7ac33935ab','738db418879bb2d959d86ab19a8cb362','larke-admin-attachment-index','admin-api/attachment/index','HEAD','larke-admin-attachment-index','larke-admin-attachment-index',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('4094571a92ff48c361b86daa307b69bf','0','账号','','Error','2860414dba1f175d0cda312e2c87ddf8','系统账号管理',105,1,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('434a6ffa0c1aeaaf48720f9c5ff6856b','c70cb3a2475b1b01f81c6fcc33a78589','larke-admin-auth-group-index-tree','admin-api/auth/group/index-tree','HEAD','larke-admin-auth-group-index-tree','larke-admin-auth-group-index-tree',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('46b92ca5095900f31cef207cd95b7962','4094571a92ff48c361b86daa307b69bf','larke-admin-admin-password','admin-api/admin/password','PUT','larke-admin-admin-password','larke-admin-admin-password',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('47bba22842c64c141bd846503b35a912','73925f7b28cad778903d6027ffbdd3c2','larke-admin-auth-rule-enable','admin-api/auth/rule/enable','PATCH','larke-admin-auth-rule-enable','larke-admin-auth-rule-enable',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('4941381479c375efe1d1378404e4374b','c70cb3a2475b1b01f81c6fcc33a78589','larke-admin-auth-group-update','admin-api/auth/group/update','PUT','larke-admin-auth-group-update','larke-admin-auth-group-update',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('49432e3fb1ee735b27aeffa41fb683ff','c70cb3a2475b1b01f81c6fcc33a78589','larke-admin-auth-group-index','admin-api/auth/group/index','GET','larke-admin-auth-group-index','larke-admin-auth-group-index',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('4b6da56b77f67a564e2b734afc53cd6b','af112165b09c1d1c0f22b3118e406783','larke-admin-frontend-menu-index','admin-api/frontend/menu/index','HEAD','larke-admin-frontend-menu-index','larke-admin-frontend-menu-index',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('4b78ece6d61ce253555f848a9285b081','60ddae159c2bd0ec4f5910608d643680','larke-admin-log-index','admin-api/log/index','GET','larke-admin-log-index','larke-admin-log-index',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('4bce00073c1dfec1254817a3573fd6a5','738db418879bb2d959d86ab19a8cb362','larke-admin-attachment-download','admin-api/attachment/download','GET','larke-admin-attachment-download','larke-admin-attachment-download',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('4bf1032fd51888e526778c86cc0ace94','8463daa7b5859fac24c9a2f9bf50df70','larke-admin-config-create','admin-api/config/create','POST','larke-admin-config-create','larke-admin-config-create',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('507b32f7f5797acc8727ddddada12159','2387d7cfa5462da26d0139a8103559f3','larke-admin-extension-install','admin-api/extension/install','POST','larke-admin-extension-install','larke-admin-extension-install',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('554c4c35b7e7eb0bb5ae196b76ad3980','a20a4e869bccf36a9380b320fec9d702','larke-admin-profile','admin-api/profile','HEAD','larke-admin-profile','larke-admin-profile',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('5d1f833c692e14351d8d1a5200a81b67','73925f7b28cad778903d6027ffbdd3c2','larke-admin-auth-rule-listorder','admin-api/auth/rule/listorder','PATCH','larke-admin-auth-rule-listorder','larke-admin-auth-rule-listorder',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('600def5af845a1ec5640673e76323a5a','af2bea560da9e1a3d61f34f156434fe4','larke-admin-passport-logout','admin-api/passport/logout','POST','larke-admin-passport-logout','larke-admin-passport-logout',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('60ddae159c2bd0ec4f5910608d643680','0','larke-admin-log-index','','Error','d151a1ca6c9495eee94174a61b488512','larke-admin-log-index',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('63d8f83b49dafaaebce47b41ae3e0924','b529d72a44d326550add56384f57b483','larke-admin-system-cache','admin-api/system/cache','POST','larke-admin-system-cache','larke-admin-system-cache',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('688e9707adfe511a46ec40b2ae858a83','73925f7b28cad778903d6027ffbdd3c2','larke-admin-auth-rule-update','admin-api/auth/rule/update','PUT','larke-admin-auth-rule-update','larke-admin-auth-rule-update',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('68e5278362f392aaadd4d1beaeaaf03e','2387d7cfa5462da26d0139a8103559f3','扩展列表','admin-api/extension/index','GET','larke-admin-extension-index','系统扩展列表管理',101,1,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('6f74281b10c4e10aad7f30a86ff95609','738db418879bb2d959d86ab19a8cb362','larke-admin-attachment-enable','admin-api/attachment/enable','PATCH','larke-admin-attachment-enable','larke-admin-attachment-enable',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('715929914c3a4f41f277034a9d2c9dc4','8463daa7b5859fac24c9a2f9bf50df70','larke-admin-config-delete','admin-api/config/delete','DELETE','larke-admin-config-delete','larke-admin-config-delete',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('738db418879bb2d959d86ab19a8cb362','0','附件','','Error','dcc0476aa3a9d4e87b258b2796e5a989','系统附件管理',108,1,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('73925f7b28cad778903d6027ffbdd3c2','0','权限','','Error','ec75e3e1924853faf9875da4e09ac3b1','系统权限管理',106,1,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('73e1e140ade2b6e27f3ebcd3c126bb5e','4094571a92ff48c361b86daa307b69bf','larke-admin-admin-logout','admin-api/admin/logout','POST','larke-admin-admin-logout','larke-admin-admin-logout',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('757c074bf3dad3b6cefc1e212e99d7e1','2387d7cfa5462da26d0139a8103559f3','本地扩展','admin-api/extension/local','GET','larke-admin-extension-local','本地全部扩展',102,1,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('75d98cc52a94cffe8b1aadaeb3a487d3','8463daa7b5859fac24c9a2f9bf50df70','larke-admin-config-index','admin-api/config/index','GET','larke-admin-config-index','larke-admin-config-index',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('78ac0bd8ca1505f2c1017576e11d3857','c70cb3a2475b1b01f81c6fcc33a78589','larke-admin-auth-group-create','admin-api/auth/group/create','POST','larke-admin-auth-group-create','larke-admin-auth-group-create',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('7f6c1ce6d592583c44cb9ab2ec264f4d','4094571a92ff48c361b86daa307b69bf','larke-admin-admin-update','admin-api/admin/update','PUT','larke-admin-admin-update','larke-admin-admin-update',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('83b960c899dceb83946086a15d677b2a','c70cb3a2475b1b01f81c6fcc33a78589','larke-admin-auth-group-listorder','admin-api/auth/group/listorder','PATCH','larke-admin-auth-group-listorder','larke-admin-auth-group-listorder',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('8463daa7b5859fac24c9a2f9bf50df70','0','配置','','Error','ecffbb622b021395890ac020ab2f7a47','系统配置管理',104,1,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('891cbe2ea9fa96129498af641401c268','c70cb3a2475b1b01f81c6fcc33a78589','larke-admin-auth-group-index-children','admin-api/auth/group/index-children','GET','larke-admin-auth-group-index-children','larke-admin-auth-group-index-children',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('930aa2138c222d7c10091c79555f8d4a','73925f7b28cad778903d6027ffbdd3c2','larke-admin-auth-rule-index-children','admin-api/auth/rule/index-children','HEAD','larke-admin-auth-rule-index-children','larke-admin-auth-rule-index-children',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('975a829463b69ee5d24c83bca6838ee0','8463daa7b5859fac24c9a2f9bf50df70','larke-admin-config-detail','admin-api/config/detail','GET','larke-admin-config-detail','larke-admin-config-detail',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('99ef82e46912071fa0279badb7251977','c70cb3a2475b1b01f81c6fcc33a78589','larke-admin-auth-group-detail','admin-api/auth/group/detail','GET','larke-admin-auth-group-detail','larke-admin-auth-group-detail',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('9aa5a6cb37aa7740ed4a90309e667b3f','2387d7cfa5462da26d0139a8103559f3','larke-admin-extension-uninstall','admin-api/extension/uninstall','DELETE','larke-admin-extension-uninstall','larke-admin-extension-uninstall',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('9e8e2073dad48664f0b73c38669d712c','af2bea560da9e1a3d61f34f156434fe4','larke-admin-passport-captcha','admin-api/passport/captcha','GET','larke-admin-passport-captcha','larke-admin-passport-captcha',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('a195e55156b345ef5a9acb864dcfae28','4094571a92ff48c361b86daa307b69bf','larke-admin-admin-enable','admin-api/admin/enable','PATCH','larke-admin-admin-enable','larke-admin-admin-enable',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('a20a4e869bccf36a9380b320fec9d702','0','个人信息','','Error','d4674d1f215582b8a93c6486cf54424b','个人信息管理',102,1,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('a3fcbd3bb0f4ef72b17d25585a63ffd8','4094571a92ff48c361b86daa307b69bf','larke-admin-admin-rules','admin-api/admin/rules','GET','larke-admin-admin-rules','larke-admin-admin-rules',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('a4729379515b72445c2bde5303cca8a5','4094571a92ff48c361b86daa307b69bf','larke-admin-admin-delete','admin-api/admin/delete','DELETE','larke-admin-admin-delete','larke-admin-admin-delete',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('a7724e8464d929d1c1bc2b3d9f70dde6','af2bea560da9e1a3d61f34f156434fe4','larke-admin-passport-refresh-token','admin-api/passport/refresh-token','PUT','larke-admin-passport-refresh-token','larke-admin-passport-refresh-token',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('aa0e6d5cdf00f02d1304237730b88ba0','4094571a92ff48c361b86daa307b69bf','larke-admin-admin-index','admin-api/admin/index','HEAD','larke-admin-admin-index','larke-admin-admin-index',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('aca688603dee81f94011276c93b35a52','4094571a92ff48c361b86daa307b69bf','larke-admin-admin-detail','admin-api/admin/detail','GET','larke-admin-admin-detail','larke-admin-admin-detail',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('af112165b09c1d1c0f22b3118e406783','0','larke-admin-frontend-menu-index','','Error','a0f14295270a7a156e13690b5771b3c0','larke-admin-frontend-menu-index',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('af2bea560da9e1a3d61f34f156434fe4','0','登陆','','Error','a27c2f0b4e3fb506f14a433534f7bc7c','系统登陆管理',100,1,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('b04af331b9945633ac0700580220a140','a20a4e869bccf36a9380b320fec9d702','larke-admin-profile-password','admin-api/profile/password','PUT','larke-admin-profile-password','larke-admin-profile-password',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('b2afd5075a8b91d9d4b0169565908b63','73925f7b28cad778903d6027ffbdd3c2','larke-admin-auth-rule-index-tree','admin-api/auth/rule/index-tree','GET','larke-admin-auth-rule-index-tree','larke-admin-auth-rule-index-tree',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('b529d72a44d326550add56384f57b483','0','系统','','Error','8c0301ac1a101b063df73b1c156528d7','系统管理',103,1,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('b5dc172f4849ed4bd2c0a8d42893665d','8463daa7b5859fac24c9a2f9bf50df70','larke-admin-config-update','admin-api/config/update','PUT','larke-admin-config-update','larke-admin-config-update',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('b62c488ebce5ed74bfebea5e6cae21cd','4094571a92ff48c361b86daa307b69bf','larke-admin-admin-index','admin-api/admin/index','GET','larke-admin-admin-index','larke-admin-admin-index',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('b7b9ec1945891816938aef16518d382f','af2bea560da9e1a3d61f34f156434fe4','larke-admin-passport-login','admin-api/passport/login','POST','larke-admin-passport-login','larke-admin-passport-login',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('b951c41cc7644d93639b5196cf7170b1','c70cb3a2475b1b01f81c6fcc33a78589','larke-admin-auth-group-access','admin-api/auth/group/access','PUT','larke-admin-auth-group-access','larke-admin-auth-group-access',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('bad857dd1a90008853f5221154232e7f','a20a4e869bccf36a9380b320fec9d702','larke-admin-profile-rules','admin-api/profile/rules','HEAD','larke-admin-profile-rules','larke-admin-profile-rules',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('bb214e739f248347615370dd63b9554f','4094571a92ff48c361b86daa307b69bf','larke-admin-admin-rules','admin-api/admin/rules','HEAD','larke-admin-admin-rules','larke-admin-admin-rules',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('bce9a48520147ee0eb9c4d5f28fc0cdc','60ddae159c2bd0ec4f5910608d643680','larke-admin-log-index','admin-api/log/index','HEAD','larke-admin-log-index','larke-admin-log-index',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('bd216ba88c0e3cec9feb66748fa44c5f','4094571a92ff48c361b86daa307b69bf','larke-admin-admin-detail','admin-api/admin/detail','HEAD','larke-admin-admin-detail','larke-admin-admin-detail',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('bfa946161dede666027e05ce43c28bce','73925f7b28cad778903d6027ffbdd3c2','larke-admin-auth-rule-index-tree','admin-api/auth/rule/index-tree','HEAD','larke-admin-auth-rule-index-tree','larke-admin-auth-rule-index-tree',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('c4c698f2b51462f7988c94007204a7cc','8463daa7b5859fac24c9a2f9bf50df70','larke-admin-config-detail','admin-api/config/detail','HEAD','larke-admin-config-detail','larke-admin-config-detail',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('c6ce3b73c311cc7f3634ddf69684d468','738db418879bb2d959d86ab19a8cb362','larke-admin-attachment-detail','admin-api/attachment/detail','GET','larke-admin-attachment-detail','larke-admin-attachment-detail',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('c70cb3a2475b1b01f81c6fcc33a78589','0','管理分组','','Error','e17b25427af8e11406fa7fb692ac23b8','系统管理分组管理',107,1,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('c7b81e8fcd153d7c602a133ab69ce6ae','8463daa7b5859fac24c9a2f9bf50df70','larke-admin-config-setting','admin-api/config/setting','PUT','larke-admin-config-setting','larke-admin-config-setting',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('c7d67c96bf9912ec26ebbf85872a1cf0','60ddae159c2bd0ec4f5910608d643680','larke-admin-log-detail','admin-api/log/detail','GET','larke-admin-log-detail','larke-admin-log-detail',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('c948207f1750906d19a65fc949d4b20c','73925f7b28cad778903d6027ffbdd3c2','larke-admin-auth-rule-detail','admin-api/auth/rule/detail','GET','larke-admin-auth-rule-detail','larke-admin-auth-rule-detail',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('cc069580466b44868ed38e8af2e23272','b529d72a44d326550add56384f57b483','larke-admin-system-info','admin-api/system/info','GET','larke-admin-system-info','larke-admin-system-info',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('ccceeb206f3e7c6ebd226ddfce1f67fb','a20a4e869bccf36a9380b320fec9d702','larke-admin-profile-update','admin-api/profile/update','PUT','larke-admin-profile-update','larke-admin-profile-update',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('cdb209c687942b884e99b0bc806e380d','73925f7b28cad778903d6027ffbdd3c2','larke-admin-auth-rule-disable','admin-api/auth/rule/disable','PATCH','larke-admin-auth-rule-disable','larke-admin-auth-rule-disable',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('cf9f3cb8f61b47bcb47dcb86fc2e3fd2','2387d7cfa5462da26d0139a8103559f3','larke-admin-extension-config','admin-api/extension/config','PUT','larke-admin-extension-config','larke-admin-extension-config',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('d39a9eb4f86ff22eb402c5f31ee0aac2','8463daa7b5859fac24c9a2f9bf50df70','larke-admin-config-index','admin-api/config/index','HEAD','larke-admin-config-index','larke-admin-config-index',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('d4f7b10a3c9ea9d15f0030de410652d3','4094571a92ff48c361b86daa307b69bf','larke-admin-admin-disable','admin-api/admin/disable','PATCH','larke-admin-admin-disable','larke-admin-admin-disable',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('d67112646f88793da38c609e032e71a7','4094571a92ff48c361b86daa307b69bf','larke-admin-admin-create','admin-api/admin/create','POST','larke-admin-admin-create','larke-admin-admin-create',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('d82f3631ae1ba70dddf535f93c3238fd','738db418879bb2d959d86ab19a8cb362','larke-admin-attachment-index','admin-api/attachment/index','GET','larke-admin-attachment-index','larke-admin-attachment-index',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('dd7dc3a64b8809c6523326f19dc9e480','c70cb3a2475b1b01f81c6fcc33a78589','larke-admin-auth-group-enable','admin-api/auth/group/enable','PATCH','larke-admin-auth-group-enable','larke-admin-auth-group-enable',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('e04a186b34a209518d128a697a9fcd12','2387d7cfa5462da26d0139a8103559f3','larke-admin-extension-upload','admin-api/extension/upload','POST','larke-admin-extension-upload','larke-admin-extension-upload',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('e0f5291ca73982be077fb626fc419d0d','a20a4e869bccf36a9380b320fec9d702','larke-admin-profile','admin-api/profile','GET','larke-admin-profile','larke-admin-profile',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('e30295b7fc029277923e522188954f2a','c70cb3a2475b1b01f81c6fcc33a78589','larke-admin-auth-group-index','admin-api/auth/group/index','HEAD','larke-admin-auth-group-index','larke-admin-auth-group-index',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('e5238bffebc2c5e92b6104389a1e8641','4094571a92ff48c361b86daa307b69bf','larke-admin-admin-access','admin-api/admin/access','PUT','larke-admin-admin-access','larke-admin-admin-access',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('e6c89c4b3c39c93f1d2cd3e2f13fd145','73925f7b28cad778903d6027ffbdd3c2','larke-admin-auth-rule-delete','admin-api/auth/rule/delete','DELETE','larke-admin-auth-rule-delete','larke-admin-auth-rule-delete',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('e7f5d847bb770999a2151ad0a4b369d9','8463daa7b5859fac24c9a2f9bf50df70','larke-admin-config-disable','admin-api/config/disable','PATCH','larke-admin-config-disable','larke-admin-config-disable',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('f13e3b9504e4833b699d2b49e3a464cb','73925f7b28cad778903d6027ffbdd3c2','larke-admin-auth-rule-index','admin-api/auth/rule/index','HEAD','larke-admin-auth-rule-index','larke-admin-auth-rule-index',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('f20d5b2bec5b8e267107c1908f153374','c70cb3a2475b1b01f81c6fcc33a78589','larke-admin-auth-group-index-children','admin-api/auth/group/index-children','HEAD','larke-admin-auth-group-index-children','larke-admin-auth-group-index-children',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('f249b2a4f5675855e21a466030c97b39','60ddae159c2bd0ec4f5910608d643680','larke-admin-log-delete','admin-api/log/delete','DELETE','larke-admin-log-delete','larke-admin-log-delete',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('f82756db3552613c1248b2a8da2e7329','738db418879bb2d959d86ab19a8cb362','larke-admin-attachment-download-code','admin-api/attachment/download/code','HEAD','larke-admin-attachment-download-code','larke-admin-attachment-download-code',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('fc5e2cd86b1ab16720945b5a8ea94ad9','c70cb3a2475b1b01f81c6fcc33a78589','larke-admin-auth-group-delete','admin-api/auth/group/delete','DELETE','larke-admin-auth-group-delete','larke-admin-auth-group-delete',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('ff79f719d46e3892c599d017a18e1fda','738db418879bb2d959d86ab19a8cb362','larke-admin-attachment-download-code','admin-api/attachment/download/code','GET','larke-admin-attachment-download-code','larke-admin-attachment-download-code',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1'),('ffedfe4f8d7dec3fe79302f9e46aa788','738db418879bb2d959d86ab19a8cb362','larke-admin-attachment-delete','admin-api/attachment/delete','DELETE','larke-admin-attachment-delete','larke-admin-attachment-delete',100,0,0,1,1604378944,'127.0.0.1',1604378944,'127.0.0.1');
