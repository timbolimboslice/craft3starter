# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.38)
# Database: craft3starter
# Generation Time: 2019-05-02 21:37:48 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table assetindexdata
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assetindexdata`;

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  KEY `assetindexdata_volumeId_idx` (`volumeId`),
  CONSTRAINT `assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table assets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assets`;

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assets_filename_folderId_idx` (`filename`,`folderId`),
  KEY `assets_folderId_idx` (`folderId`),
  KEY `assets_volumeId_idx` (`volumeId`),
  CONSTRAINT `assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;

INSERT INTO `assets` (`id`, `volumeId`, `folderId`, `filename`, `kind`, `width`, `height`, `size`, `focalPoint`, `deletedWithVolume`, `keptFile`, `dateModified`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,1,1,'6669600007_large.jpg','image',575,431,32252,NULL,0,0,'2019-05-02 19:49:04','2019-05-02 19:49:04','2019-05-02 19:49:04','57a39331-8c3f-4fa0-83ee-dfe6b6d52d8b'),
	(3,1,1,'april-2019-header.jpg','image',580,349,211245,NULL,0,0,'2019-05-02 19:52:23','2019-05-02 19:52:23','2019-05-02 19:52:23','ed00fbb5-9f56-4d49-9746-fe67def71078'),
	(8,1,1,'boxed-water-is-better-1463962-unsplash.jpg','image',6490,5016,1528201,NULL,NULL,NULL,'2019-05-02 20:33:28','2019-05-02 20:33:29','2019-05-02 20:33:29','f0f3af90-fa96-44f9-96c8-ca04e0f31979');

/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table assettransformindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assettransformindex`;

CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `assettransformindex` WRITE;
/*!40000 ALTER TABLE `assettransformindex` DISABLE KEYS */;

INSERT INTO `assettransformindex` (`id`, `assetId`, `filename`, `format`, `location`, `volumeId`, `fileExists`, `inProgress`, `dateIndexed`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,8,'boxed-water-is-better-1463962-unsplash.jpg',NULL,'_980xAUTO_fit_center-center_none',1,1,0,'2019-05-02 20:38:05','2019-05-02 20:38:05','2019-05-02 20:38:06','dff0a83f-dc58-49fe-ae23-958858ecbc8f'),
	(2,8,'boxed-water-is-better-1463962-unsplash.jpg',NULL,'_1960xAUTO_fit_center-center_none',1,1,0,'2019-05-02 20:38:06','2019-05-02 20:38:06','2019-05-02 20:38:09','ad1cc6d5-4ef3-4d6c-add0-11879be322a4');

/*!40000 ALTER TABLE `assettransformindex` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table assettransforms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assettransforms`;

CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `assettransforms_name_unq_idx` (`name`),
  UNIQUE KEY `assettransforms_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categories_groupId_idx` (`groupId`),
  KEY `categories_parentId_fk` (`parentId`),
  CONSTRAINT `categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table categorygroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categorygroups`;

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `categorygroups_name_idx` (`name`),
  KEY `categorygroups_handle_idx` (`handle`),
  KEY `categorygroups_structureId_idx` (`structureId`),
  KEY `categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `categorygroups_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;

INSERT INTO `categorygroups` (`id`, `structureId`, `fieldLayoutId`, `name`, `handle`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,2,2,'Header Navigation','headerNavigation','2019-05-02 19:57:04','2019-05-02 20:01:29',NULL,'57487563-6b6e-4268-9d12-1ceb83f305bc'),
	(2,3,3,'Footer Navigation','footerNavigation','2019-05-02 19:57:15','2019-05-02 20:01:37',NULL,'48b37115-4a14-491c-b440-465103a86650'),
	(3,4,9,'POI Categoies','poiCategoies','2019-05-02 20:14:15','2019-05-02 20:15:01',NULL,'20cbfee4-ddd8-480b-beda-47886f631060');

/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categorygroups_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categorygroups_sites`;

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  KEY `categorygroups_sites_siteId_idx` (`siteId`),
  CONSTRAINT `categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;

INSERT INTO `categorygroups_sites` (`id`, `groupId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,0,NULL,NULL,'2019-05-02 19:57:04','2019-05-02 20:01:29','769b2c82-08a8-4b54-8b4b-0ceb0d98c607'),
	(2,2,1,0,NULL,NULL,'2019-05-02 19:57:15','2019-05-02 20:01:37','8e621e76-5dd5-4f22-8265-371d74644ad3'),
	(3,3,1,0,NULL,NULL,'2019-05-02 20:14:15','2019-05-02 20:15:02','8551589c-3ef2-49d9-ac0b-13f54227f1f8');

/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `content`;

CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_body` text,
  `field_seo` text,
  `field_navigationDestinationExternal` varchar(255) DEFAULT NULL,
  `field_footerAddress` text,
  `field_externalUrl` varchar(255) DEFAULT NULL,
  `field_city` text,
  `field_state` text,
  `field_zip` text,
  `field_website` varchar(255) DEFAULT NULL,
  `field_streetAddress` text,
  `field_phone` text,
  `field_longitude` text,
  `field_latitude` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `content_siteId_idx` (`siteId`),
  KEY `content_title_idx` (`title`),
  CONSTRAINT `content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`, `field_body`, `field_seo`, `field_navigationDestinationExternal`, `field_footerAddress`, `field_externalUrl`, `field_city`, `field_state`, `field_zip`, `field_website`, `field_streetAddress`, `field_phone`, `field_longitude`, `field_latitude`)
VALUES
	(1,1,1,NULL,'2019-05-02 19:27:51','2019-05-02 19:27:51','0faf0fb0-36aa-4bc8-b5c6-1ee481b8c9fd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,2,1,'6669600007 large','2019-05-02 19:49:04','2019-05-02 19:49:04','9e6eea88-a21c-4f87-9f65-dd7f69e3e273',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(3,3,1,'April 2019 header','2019-05-02 19:52:23','2019-05-02 19:52:23','fdcf1dcd-51d8-46e3-b3e1-ea4b50ebf61f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(4,4,1,NULL,'2019-05-02 20:02:34','2019-05-02 20:02:34','29f28966-570a-4afc-b2cf-f5bbc3d05b3e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(5,5,1,NULL,'2019-05-02 20:02:38','2019-05-02 20:02:38','c2840852-07c4-4559-9adf-a866392ac477',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(6,6,1,'Home','2019-05-02 20:23:43','2019-05-02 20:37:37','3525a893-cb57-4a90-a59b-2f791acec370',NULL,'{\"titleRaw\":{\"1\":\"Home\",\"2\":\" - craft3starter\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":\"\",\"title\":\"Home - craft3starter\",\"image\":null,\"description\":\"\"},\"facebook\":{\"handle\":\"\",\"title\":\"Home - craft3starter\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(7,8,1,'Boxed water is better 1463962 unsplash','2019-05-02 20:33:26','2019-05-02 20:33:26','379850d6-1855-4b88-9fa6-117b6cf3605d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table craftidtokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `craftidtokens`;

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `craftidtokens_userId_fk` (`userId`),
  CONSTRAINT `craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table deprecationerrors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `deprecationerrors`;

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table elementindexsettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elementindexsettings`;

CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elementindexsettings_type_unq_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `elementindexsettings` WRITE;
/*!40000 ALTER TABLE `elementindexsettings` DISABLE KEYS */;

INSERT INTO `elementindexsettings` (`id`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'craft\\elements\\Entry','{\"sourceOrder\":[[\"heading\",\"Website\"],[\"key\",\"section:a8e283f3-6ac5-4c16-b9f9-2fc3a99ccaf3\"],[\"heading\",\"Other Information\"],[\"key\",\"section:9a82a87b-701a-4493-91aa-57f7f68211ae\"],[\"heading\",\"\"],[\"key\",\"*\"]],\"sources\":{\"*\":{\"tableAttributes\":{\"1\":\"section\",\"2\":\"postDate\",\"3\":\"expiryDate\",\"4\":\"link\"}},\"section:9a82a87b-701a-4493-91aa-57f7f68211ae\":{\"tableAttributes\":{\"1\":\"postDate\",\"2\":\"expiryDate\",\"3\":\"link\"}}}}','2019-05-02 20:22:28','2019-05-02 20:22:28','283f973f-6585-432f-a33c-f497fbe2ae02');

/*!40000 ALTER TABLE `elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table elements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elements`;

CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `elements_dateDeleted_idx` (`dateDeleted`),
  KEY `elements_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `elements_type_idx` (`type`),
  KEY `elements_enabled_idx` (`enabled`),
  KEY `elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  CONSTRAINT `elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;

INSERT INTO `elements` (`id`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,NULL,'craft\\elements\\User',1,0,'2019-05-02 19:27:51','2019-05-02 19:27:51',NULL,'6776e72e-c69e-48ec-8fb9-c56274451f06'),
	(2,NULL,'craft\\elements\\Asset',1,0,'2019-05-02 19:49:04','2019-05-02 19:49:04','2019-05-02 19:52:17','7ead13c6-1540-4e7d-91c9-10c6e94faf62'),
	(3,NULL,'craft\\elements\\Asset',1,0,'2019-05-02 19:52:23','2019-05-02 19:52:23','2019-05-02 19:52:30','9eda1abb-9ffb-4271-a1ba-f5ac5bdbf9f0'),
	(4,NULL,'craft\\elements\\GlobalSet',1,0,'2019-05-02 20:02:34','2019-05-02 20:02:34',NULL,'e21deed6-576f-4f78-aee7-1c103e8b3b11'),
	(5,NULL,'craft\\elements\\GlobalSet',1,0,'2019-05-02 20:02:38','2019-05-02 20:02:38',NULL,'83ba206c-0b39-4444-8c0f-942d49d947dc'),
	(6,11,'craft\\elements\\Entry',1,0,'2019-05-02 20:23:43','2019-05-02 20:37:37',NULL,'80ee2b38-2e24-491f-b8e2-2a215083703b'),
	(7,1,'craft\\elements\\MatrixBlock',1,0,'2019-05-02 20:27:54','2019-05-02 20:37:37',NULL,'00dd69f9-54b1-457d-8d6d-25872ca38c1d'),
	(8,NULL,'craft\\elements\\Asset',1,0,'2019-05-02 20:33:26','2019-05-02 20:33:26',NULL,'90fc0b3c-75a0-4fbf-a7d4-5b8871bc6d87'),
	(9,5,'craft\\elements\\MatrixBlock',1,0,'2019-05-02 20:35:26','2019-05-02 20:37:37',NULL,'17d3fcef-10eb-44c6-b41f-1c6b452096ea'),
	(10,7,'craft\\elements\\MatrixBlock',1,0,'2019-05-02 20:35:26','2019-05-02 20:37:38',NULL,'86ed41b7-cf89-4849-b217-0617413aa7c4'),
	(11,6,'craft\\elements\\MatrixBlock',1,0,'2019-05-02 20:35:27','2019-05-02 20:37:38',NULL,'8a25fcb4-41fa-464d-ba15-d23a6a090b95');

/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table elements_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `elements_sites`;

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `elements_sites_siteId_idx` (`siteId`),
  KEY `elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  KEY `elements_sites_enabled_idx` (`enabled`),
  KEY `elements_sites_uri_siteId_idx` (`uri`,`siteId`),
  CONSTRAINT `elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,NULL,NULL,1,'2019-05-02 19:27:51','2019-05-02 19:27:51','4b3dd09e-ecd2-42ff-868f-e94113dfa587'),
	(2,2,1,NULL,NULL,1,'2019-05-02 19:49:04','2019-05-02 19:49:04','af4f6875-2e8e-45a4-87ca-767fbaee5795'),
	(3,3,1,NULL,NULL,1,'2019-05-02 19:52:23','2019-05-02 19:52:23','c180af1a-e130-414d-8727-b360a2d63571'),
	(4,4,1,NULL,NULL,1,'2019-05-02 20:02:34','2019-05-02 20:02:34','a8960631-fca3-4cc4-bd6e-7320a90f42a1'),
	(5,5,1,NULL,NULL,1,'2019-05-02 20:02:38','2019-05-02 20:02:38','d887d6aa-56d7-499d-973c-3f6bd84ee831'),
	(6,6,1,'__home__','__home__',1,'2019-05-02 20:23:43','2019-05-02 20:37:37','0b252ba9-f75e-4cd7-8b8c-99b990cc6bb1'),
	(7,7,1,NULL,NULL,1,'2019-05-02 20:27:54','2019-05-02 20:37:37','16e8e364-78b0-4d6c-b51e-5bbc334e41f2'),
	(8,8,1,NULL,NULL,1,'2019-05-02 20:33:26','2019-05-02 20:33:26','e084d82e-10a9-44db-8421-3664972d0e04'),
	(9,9,1,NULL,NULL,1,'2019-05-02 20:35:26','2019-05-02 20:37:37','845a46b2-06af-4caa-9f39-0015cd1599aa'),
	(10,10,1,NULL,NULL,1,'2019-05-02 20:35:26','2019-05-02 20:37:38','f041925d-23e1-401e-8db4-ed11c4a277fd'),
	(11,11,1,NULL,NULL,1,'2019-05-02 20:35:27','2019-05-02 20:37:38','e0a971f0-f5c4-4da2-9071-9adfcf293e92');

/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `entries`;

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entries_postDate_idx` (`postDate`),
  KEY `entries_expiryDate_idx` (`expiryDate`),
  KEY `entries_authorId_idx` (`authorId`),
  KEY `entries_sectionId_idx` (`sectionId`),
  KEY `entries_typeId_idx` (`typeId`),
  KEY `entries_parentId_fk` (`parentId`),
  CONSTRAINT `entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;

INSERT INTO `entries` (`id`, `sectionId`, `parentId`, `typeId`, `authorId`, `postDate`, `expiryDate`, `deletedWithEntryType`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(6,1,NULL,1,1,'2019-05-02 20:23:00',NULL,NULL,'2019-05-02 20:23:43','2019-05-02 20:37:37','eaaabf48-d03d-4a9e-b06a-8cda3533e3e5');

/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table entrydrafts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `entrydrafts`;

CREATE TABLE `entrydrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entrydrafts_sectionId_idx` (`sectionId`),
  KEY `entrydrafts_entryId_siteId_idx` (`entryId`,`siteId`),
  KEY `entrydrafts_siteId_idx` (`siteId`),
  KEY `entrydrafts_creatorId_idx` (`creatorId`),
  CONSTRAINT `entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entrydrafts_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table entrytypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `entrytypes`;

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) DEFAULT 'Title',
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  KEY `entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  KEY `entrytypes_sectionId_idx` (`sectionId`),
  KEY `entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `entrytypes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;

INSERT INTO `entrytypes` (`id`, `sectionId`, `fieldLayoutId`, `name`, `handle`, `hasTitleField`, `titleLabel`, `titleFormat`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,11,'Module Page','modulePage',1,'Title','',1,'2019-05-02 19:55:34','2019-05-02 20:23:07',NULL,'dcfa41be-0743-47bd-bc2e-05877a077c75'),
	(2,1,12,'Basic Page','basicPage',1,'Title','',2,'2019-05-02 19:55:58','2019-05-02 20:23:21',NULL,'5463c3e2-5d2e-4010-8ebf-a17cc94087bd'),
	(3,2,10,'Points of Interest','pointsOfInterest',1,'Title','',1,'2019-05-02 20:20:55','2019-05-02 20:21:33',NULL,'d41782ff-12be-4c85-9677-753e29944392');

/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table entryversions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `entryversions`;

CREATE TABLE `entryversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `siteId` int(11) NOT NULL,
  `num` smallint(6) unsigned NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `entryversions_sectionId_idx` (`sectionId`),
  KEY `entryversions_entryId_siteId_idx` (`entryId`,`siteId`),
  KEY `entryversions_siteId_idx` (`siteId`),
  KEY `entryversions_creatorId_idx` (`creatorId`),
  CONSTRAINT `entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `entryversions_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `entryversions` WRITE;
/*!40000 ALTER TABLE `entryversions` DISABLE KEYS */;

INSERT INTO `entryversions` (`id`, `entryId`, `sectionId`, `creatorId`, `siteId`, `num`, `notes`, `data`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,6,1,1,1,1,'','{\"typeId\":\"1\",\"authorId\":\"1\",\"title\":\"Home\",\"slug\":\"__home__\",\"postDate\":1556828580,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"3\":[],\"2\":{\"titleRaw\":{\"2\":\" - craft3starter\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":\"\",\"title\":\"Home - craft3starter\",\"image\":null,\"description\":\"\"},\"facebook\":{\"handle\":\"\",\"title\":\"Home - craft3starter\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}}}','2019-05-02 20:23:43','2019-05-02 20:23:43','1fe149ab-16f9-4b05-b56b-0aef386065c4'),
	(2,6,1,1,1,2,'','{\"typeId\":\"1\",\"authorId\":\"1\",\"title\":\"Home\",\"slug\":\"__home__\",\"postDate\":1556828580,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"3\":{\"7\":{\"type\":\"textModule\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentArea\":\"<h1>Lorem ipsum dolor sit amet, consectetur adipiscing</h1><p>Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. <em>Cras sit amet rutrum nibh</em>, eu ornare sapien. <del>Nulla pharetra vitae magna eu posuere</del>. <a href=\\\"http://www.lookthinkmake.com\\\">Vestibulum maximus velit justo</a>, et feugiat est ultricies ac. Etiam mollis sit amet tortor et molestie. Praesent ut fermentum elit. Vivamus a enim at elit eleifend mollis. Nullam in risus augue. Ut sed magna fermentum tortor consectetur fringilla. Sed at quam elementum, efficitur tortor lacinia, venenatis enim. Nulla vestibulum massa sed massa porttitor, molestie ultrices tortor viverra. Duis dictum ipsum massa, quis mollis eros scelerisque vel. Ut eu ligula sodales, ultricies eros non, porta diam.</p><h2>Bibendum interdum eleifend sit amet</h2>\\n<p>Donec eros velit, bibendum interdum eleifend sit amet, lacinia eget arcu. Nulla ut erat sed ante accumsan dictum. Aliquam sodales at diam vel finibus. Integer mauris risus, ornare quis tempus nec, porta rutrum erat. Pellentesque at commodo arcu. Fusce condimentum nibh et pharetra dignissim. Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p><ul><li>Fusce condimentum nibh et pharetra dignissim. </li><li>Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. </li><li>Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. </li><li>Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. </li><li>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; </li><li>Maecenas ut cursus turpis, eget aliquam dolor.</li></ul><h3>Diam enim laoreet libero</h3><p>In tincidunt, nulla eget sagittis aliquet, diam enim laoreet libero, a lacinia ante purus nec libero. Nulla vehicula vitae ligula id sodales. In feugiat sit amet erat vel hendrerit. Integer elementum ultricies scelerisque. Nam et efficitur eros. Maecenas sed nisl risus. Aliquam ut sapien vel sem rutrum mollis. Maecenas congue facilisis felis, sed auctor odio volutpat eu. Nam ultrices sapien non leo ultrices, in hendrerit dolor cursus. Mauris vitae auctor dolor, at sodales est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse quis ultricies eros. Donec ut purus purus. Suspendisse suscipit ac magna accumsan efficitur. Maecenas vulputate et nunc a sagittis. Quisque nec ex risus.</p><ol><li>Maecenas congue facilisis felis, sed auctor odio volutpat eu. </li><li>Nam ultrices sapien non leo ultrices, in hendrerit dolor cursus. </li><li>Mauris vitae auctor dolor, at sodales est. Pellentesque habitant morbi tristique senectus </li><li>et netus et malesuada fames ac turpis egestas. Suspendisse quis ultricies eros. </li><li>Donec ut purus purus. Suspendisse suscipit ac magna accumsan efficitur. </li><li>Maecenas vulputate et nunc a sagittis. Quisque nec ex risus.</li></ol><h4>Vivamus sit amet sapien risus.</h4>\\n<p>Quisque venenatis lectus a egestas finibus. Vivamus sit amet sapien risus. Pellentesque tempus, orci ut dignissim sollicitudin, odio mi placerat leo, vel euismod sapien magna a purus. Donec nulla lacus, dictum nec sapien id, tempus dignissim elit. Nulla quis ornare risus. Maecenas vel augue feugiat, laoreet nibh porta, ultrices diam. In hac habitasse platea dictumst. Quisque mollis, mauris sit amet faucibus egestas, eros tellus blandit dolor, id elementum dolor lacus bibendum magna. Aenean et tincidunt metus, finibus suscipit elit. In sed libero maximus leo hendrerit venenatis sit amet quis ipsum. Pellentesque ut faucibus sapien.</p><h5>Quam condimentum cursus</h5>\\n<p>Pellentesque vel cursus tellus. Integer ullamcorper, quam condimentum cursus egestas, neque nunc sollicitudin mauris, a dignissim eros sapien ac purus. Donec lorem elit, pellentesque aliquam luctus et, scelerisque et nibh. Quisque congue vel magna ac lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas et dictum magna. Pellentesque convallis quis felis eu vehicula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tincidunt ullamcorper erat eu hendrerit. Suspendisse dui turpis, interdum id convallis in, pharetra non erat. Sed porttitor felis lacus, nec congue sapien efficitur quis. Cras tempus maximus accumsan.</p><h6>Cras tempus maximus accumsan</h6><p>Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p><h4>Code for the nerds</h4><pre>Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</pre><h4>A blockquote style</h4><blockquote>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas et dictum magna. Pellentesque convallis quis felis eu vehicula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. </blockquote>\",\"moduleWidth\":\"8\",\"centerModule\":true,\"noMarginBottom\":false}}},\"2\":{\"titleRaw\":{\"1\":\"Home\",\"2\":\" - craft3starter\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":\"\",\"title\":\"Home - craft3starter\",\"image\":null,\"description\":\"\"},\"facebook\":{\"handle\":\"\",\"title\":\"Home - craft3starter\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}}}','2019-05-02 20:27:54','2019-05-02 20:27:54','ccc09a88-c45c-4b07-81cc-482db1109e3c'),
	(3,6,1,1,1,3,'','{\"typeId\":\"1\",\"authorId\":\"1\",\"title\":\"Home\",\"slug\":\"__home__\",\"postDate\":1556828580,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"3\":{\"7\":{\"type\":\"textModule\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentArea\":\"<h1>Lorem ipsum dolor sit amet, consectetur adipiscing</h1>\\n<p>Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. <em>Cras sit amet rutrum nibh</em>, eu ornare sapien. <del>Nulla pharetra vitae magna eu posuere</del>. <a href=\\\"http://www.lookthinkmake.com\\\">Vestibulum maximus velit justo</a>, et feugiat est ultricies ac. Etiam mollis sit amet tortor et molestie. Praesent ut fermentum elit. Vivamus a enim at elit eleifend mollis. Nullam in risus augue. Ut sed magna fermentum tortor consectetur fringilla. Sed at quam elementum, efficitur tortor lacinia, venenatis enim. Nulla vestibulum massa sed massa porttitor, molestie ultrices tortor viverra. Duis dictum ipsum massa, quis mollis eros scelerisque vel. Ut eu ligula sodales, ultricies eros non, porta diam.</p>\\n<h2>Bibendum interdum eleifend sit amet</h2>\\n<p>Donec eros velit, bibendum interdum eleifend sit amet, lacinia eget arcu. Nulla ut erat sed ante accumsan dictum. Aliquam sodales at diam vel finibus. Integer mauris risus, ornare quis tempus nec, porta rutrum erat. Pellentesque at commodo arcu. Fusce condimentum nibh et pharetra dignissim. Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p>\\n<ul><li>Fusce condimentum nibh et pharetra dignissim. </li><li>Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. </li><li>Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. </li><li>Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. </li><li>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; </li><li>Maecenas ut cursus turpis, eget aliquam dolor.</li></ul><h3>Diam enim laoreet libero</h3>\\n<p>In tincidunt, nulla eget sagittis aliquet, diam enim laoreet libero, a lacinia ante purus nec libero. Nulla vehicula vitae ligula id sodales. In feugiat sit amet erat vel hendrerit. Integer elementum ultricies scelerisque. Nam et efficitur eros. Maecenas sed nisl risus. Aliquam ut sapien vel sem rutrum mollis. Maecenas congue facilisis felis, sed auctor odio volutpat eu. Nam ultrices sapien non leo ultrices, in hendrerit dolor cursus. Mauris vitae auctor dolor, at sodales est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse quis ultricies eros. Donec ut purus purus. Suspendisse suscipit ac magna accumsan efficitur. Maecenas vulputate et nunc a sagittis. Quisque nec ex risus.</p>\\n<ol><li>Maecenas congue facilisis felis, sed auctor odio volutpat eu. </li><li>Nam ultrices sapien non leo ultrices, in hendrerit dolor cursus. </li><li>Mauris vitae auctor dolor, at sodales est. Pellentesque habitant morbi tristique senectus </li><li>et netus et malesuada fames ac turpis egestas. Suspendisse quis ultricies eros. </li><li>Donec ut purus purus. Suspendisse suscipit ac magna accumsan efficitur. </li><li>Maecenas vulputate et nunc a sagittis. Quisque nec ex risus.</li></ol><h4>Vivamus sit amet sapien risus.</h4>\\n<p>Quisque venenatis lectus a egestas finibus. Vivamus sit amet sapien risus. Pellentesque tempus, orci ut dignissim sollicitudin, odio mi placerat leo, vel euismod sapien magna a purus. Donec nulla lacus, dictum nec sapien id, tempus dignissim elit. Nulla quis ornare risus. Maecenas vel augue feugiat, laoreet nibh porta, ultrices diam.<br /></p><p> In hac habitasse platea dictumst. Quisque mollis, mauris sit amet faucibus egestas, eros tellus blandit dolor, id elementum dolor lacus bibendum magna. Aenean et tincidunt metus, finibus suscipit elit. In sed libero maximus leo hendrerit venenatis sit amet quis ipsum. Pellentesque ut faucibus sapien.</p>\\n<h5>Quam condimentum cursus</h5>\\n<p>Pellentesque vel cursus tellus. Integer ullamcorper, quam condimentum cursus egestas, neque nunc sollicitudin mauris, a dignissim eros sapien ac purus. Donec lorem elit, pellentesque aliquam luctus et, scelerisque et nibh. Quisque congue vel magna ac lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas et dictum magna. Pellentesque convallis quis felis eu vehicula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tincidunt ullamcorper erat eu hendrerit. Suspendisse dui turpis, interdum id convallis in, pharetra non erat. Sed porttitor felis lacus, nec congue sapien efficitur quis. Cras tempus maximus accumsan.</p>\\n<h6>Cras tempus maximus accumsan</h6>\\n<p>Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p>\\n<h4>Code for the nerds</h4>\\n<pre>Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</pre>\\n<h4>A blockquote style</h4>\\n<blockquote>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas et dictum magna. Pellentesque convallis quis felis eu vehicula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. </blockquote>\",\"moduleWidth\":\"8\",\"centerModule\":true,\"noMarginBottom\":false}}},\"2\":{\"titleRaw\":{\"1\":\"Home\",\"2\":\" - craft3starter\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":\"\",\"title\":\"Home - craft3starter\",\"image\":null,\"description\":\"\"},\"facebook\":{\"handle\":\"\",\"title\":\"Home - craft3starter\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}}}','2019-05-02 20:28:11','2019-05-02 20:28:11','cd5340b7-b9a0-480d-850e-2a1dac1ccca7'),
	(4,6,1,1,1,4,'','{\"typeId\":\"1\",\"authorId\":\"1\",\"title\":\"Home\",\"slug\":\"__home__\",\"postDate\":1556828580,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"3\":{\"7\":{\"type\":\"textModule\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentArea\":\"<h1>Lorem ipsum dolor sit amet, consectetur adipiscing</h1>\\n<p>Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. <em>Cras sit amet rutrum nibh</em>, eu ornare sapien. <del>Nulla pharetra vitae magna eu posuere</del>. <a href=\\\"http://www.lookthinkmake.com\\\">Vestibulum maximus velit justo</a>, et feugiat est ultricies ac. Etiam mollis sit amet tortor et molestie. Praesent ut fermentum elit. Vivamus a enim at elit eleifend mollis. Nullam in risus augue. Ut sed magna fermentum tortor consectetur fringilla. Sed at quam elementum, efficitur tortor lacinia, venenatis enim. Nulla vestibulum massa sed massa porttitor, molestie ultrices tortor viverra. Duis dictum ipsum massa, quis mollis eros scelerisque vel. Ut eu ligula sodales, ultricies eros non, porta diam.</p>\\n<h2>Bibendum interdum eleifend sit amet</h2>\\n<p>Donec eros velit, bibendum interdum eleifend sit amet, lacinia eget arcu. Nulla ut erat sed ante accumsan dictum. Aliquam sodales at diam vel finibus. Integer mauris risus, ornare quis tempus nec, porta rutrum erat. Pellentesque at commodo arcu. Fusce condimentum nibh et pharetra dignissim. Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p>\\n<ul><li>Fusce condimentum nibh et pharetra dignissim. </li><li>Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. </li><li>Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. </li><li>Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. </li><li>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; </li><li>Maecenas ut cursus turpis, eget aliquam dolor.</li></ul><h3>Diam enim laoreet libero</h3>\\n<p>In tincidunt, nulla eget sagittis aliquet, diam enim laoreet libero, a lacinia ante purus nec libero. Nulla vehicula vitae ligula id sodales. In feugiat sit amet erat vel hendrerit. Integer elementum ultricies scelerisque. Nam et efficitur eros. Maecenas sed nisl risus. Aliquam ut sapien vel sem rutrum mollis. Maecenas congue facilisis felis, sed auctor odio volutpat eu. Nam ultrices sapien non leo ultrices, in hendrerit dolor cursus. Mauris vitae auctor dolor, at sodales est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse quis ultricies eros. Donec ut purus purus. Suspendisse suscipit ac magna accumsan efficitur. Maecenas vulputate et nunc a sagittis. Quisque nec ex risus.</p>\\n<ol><li>Maecenas congue facilisis felis, sed auctor odio volutpat eu. </li><li>Nam ultrices sapien non leo ultrices, in hendrerit dolor cursus. </li><li>Mauris vitae auctor dolor, at sodales est. Pellentesque habitant morbi tristique senectus </li><li>et netus et malesuada fames ac turpis egestas. Suspendisse quis ultricies eros. </li><li>Donec ut purus purus. Suspendisse suscipit ac magna accumsan efficitur. </li><li>Maecenas vulputate et nunc a sagittis. Quisque nec ex risus.</li></ol><h4>Vivamus sit amet sapien risus.</h4>\\n<p>Quisque venenatis lectus a egestas finibus. Vivamus sit amet sapien risus. Pellentesque tempus, orci ut dignissim sollicitudin, odio mi placerat leo, vel euismod sapien magna a purus. Donec nulla lacus, dictum nec sapien id, tempus dignissim elit. Nulla quis ornare risus. Maecenas vel augue feugiat, laoreet nibh porta, ultrices diam.<br /></p>\\n<p> In hac habitasse platea dictumst. Quisque mollis, mauris sit amet faucibus egestas, eros tellus blandit dolor, id elementum dolor lacus bibendum magna. Aenean et tincidunt metus, finibus suscipit elit. In sed libero maximus leo hendrerit venenatis sit amet quis ipsum. Pellentesque ut faucibus sapien.</p>\\n<h5>Quam condimentum cursus</h5>\\n<p>Pellentesque vel cursus tellus. Integer ullamcorper, quam condimentum cursus egestas, neque nunc sollicitudin mauris, a dignissim eros sapien ac purus. Donec lorem elit, pellentesque aliquam luctus et, scelerisque et nibh. Quisque congue vel magna ac lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas et dictum magna. Pellentesque convallis quis felis eu vehicula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tincidunt ullamcorper erat eu hendrerit. Suspendisse dui turpis, interdum id convallis in, pharetra non erat. Sed porttitor felis lacus, nec congue sapien efficitur quis. Cras tempus maximus accumsan.</p>\\n<h6>Cras tempus maximus accumsan</h6>\\n<p>Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p>\\n<h4>Code for the nerds</h4>\\n<pre>Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</pre>\\n<h4>A blockquote style</h4>\\n<blockquote>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas et dictum magna. Pellentesque convallis quis felis eu vehicula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. </blockquote>\",\"moduleWidth\":\"8\",\"centerModule\":true,\"noMarginBottom\":false}}},\"2\":{\"titleRaw\":{\"1\":\"Home\",\"2\":\" - craft3starter\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":\"\",\"title\":\"Home - craft3starter\",\"image\":null,\"description\":\"\"},\"facebook\":{\"handle\":\"\",\"title\":\"Home - craft3starter\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}}}','2019-05-02 20:29:24','2019-05-02 20:29:24','d095d73c-5d11-46c0-b330-167cce9d02f9'),
	(5,6,1,1,1,5,'','{\"typeId\":\"1\",\"authorId\":\"1\",\"title\":\"Home\",\"slug\":\"__home__\",\"postDate\":1556828580,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"3\":{\"7\":{\"type\":\"textModule\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentArea\":\"<h1>Lorem ipsum dolor sit amet, consectetur adipiscing</h1>\\n<p>Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. <em>Cras sit amet rutrum nibh</em>, eu ornare sapien. <del>Nulla pharetra vitae magna eu posuere</del>. <a href=\\\"http://www.lookthinkmake.com\\\">Vestibulum maximus velit justo</a>, et feugiat est ultricies ac. Etiam mollis sit amet tortor et molestie. Praesent ut fermentum elit. Vivamus a enim at elit eleifend mollis. Nullam in risus augue. Ut sed magna fermentum tortor consectetur fringilla. Sed at quam elementum, efficitur tortor lacinia, venenatis enim. Nulla vestibulum massa sed massa porttitor, molestie ultrices tortor viverra. Duis dictum ipsum massa, quis mollis eros scelerisque vel. Ut eu ligula sodales, ultricies eros non, porta diam.</p>\\n<h2>Bibendum interdum eleifend sit amet</h2>\\n<p>Donec eros velit, bibendum interdum eleifend sit amet, lacinia eget arcu. Nulla ut erat sed ante accumsan dictum. Aliquam sodales at diam vel finibus. Integer mauris risus, ornare quis tempus nec, porta rutrum erat. Pellentesque at commodo arcu. Fusce condimentum nibh et pharetra dignissim. Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p>\\n<ul><li>Fusce condimentum nibh et pharetra dignissim. </li><li>Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. </li><li>Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. </li><li>Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. </li><li>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; </li><li>Maecenas ut cursus turpis, eget aliquam dolor.</li></ul><h3>Diam enim laoreet libero</h3>\\n<p>In tincidunt, nulla eget sagittis aliquet, diam enim laoreet libero, a lacinia ante purus nec libero. Nulla vehicula vitae ligula id sodales. In feugiat sit amet erat vel hendrerit. Integer elementum ultricies scelerisque. Nam et efficitur eros. Maecenas sed nisl risus. Aliquam ut sapien vel sem rutrum mollis. Maecenas congue facilisis felis, sed auctor odio volutpat eu. Nam ultrices sapien non leo ultrices, in hendrerit dolor cursus. Mauris vitae auctor dolor, at sodales est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse quis ultricies eros. Donec ut purus purus. Suspendisse suscipit ac magna accumsan efficitur. Maecenas vulputate et nunc a sagittis. Quisque nec ex risus.</p>\\n<ol><li>Maecenas congue facilisis felis, sed auctor odio volutpat eu. </li><li>Nam ultrices sapien non leo ultrices, in hendrerit dolor cursus. </li><li>Mauris vitae auctor dolor, at sodales est. Pellentesque habitant morbi tristique senectus </li><li>et netus et malesuada fames ac turpis egestas. Suspendisse quis ultricies eros. </li><li>Donec ut purus purus. Suspendisse suscipit ac magna accumsan efficitur. </li><li>Maecenas vulputate et nunc a sagittis. Quisque nec ex risus.</li></ol><h4>Vivamus sit amet sapien risus.</h4>\\n<p>Quisque venenatis lectus a egestas finibus. Vivamus sit amet sapien risus. Pellentesque tempus, orci ut dignissim sollicitudin, odio mi placerat leo, vel euismod sapien magna a purus. Donec nulla lacus, dictum nec sapien id, tempus dignissim elit. Nulla quis ornare risus. Maecenas vel augue feugiat, laoreet nibh porta, ultrices diam.<br /></p>\\n<p><a class=\\\"btn\\\" href=\\\"http://www.lookthinkmake.com\\\">Here is a button</a></p>\\n<p> In hac habitasse platea dictumst. Quisque mollis, mauris sit amet faucibus egestas, eros tellus blandit dolor, id elementum dolor lacus bibendum magna. Aenean et tincidunt metus, finibus suscipit elit. In sed libero maximus leo hendrerit venenatis sit amet quis ipsum. Pellentesque ut faucibus sapien.</p>\\n<h5>Quam condimentum cursus</h5>\\n<p>Pellentesque vel cursus tellus. Integer ullamcorper, quam condimentum cursus egestas, neque nunc sollicitudin mauris, a dignissim eros sapien ac purus. Donec lorem elit, pellentesque aliquam luctus et, scelerisque et nibh. Quisque congue vel magna ac lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas et dictum magna. Pellentesque convallis quis felis eu vehicula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tincidunt ullamcorper erat eu hendrerit. Suspendisse dui turpis, interdum id convallis in, pharetra non erat. Sed porttitor felis lacus, nec congue sapien efficitur quis. Cras tempus maximus accumsan.</p>\\n<h6>Cras tempus maximus accumsan</h6>\\n<p>Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p>\\n<h4>Code for the nerds</h4>\\n<pre>Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</pre>\\n<h4>A blockquote style</h4>\\n<blockquote>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas et dictum magna. Pellentesque convallis quis felis eu vehicula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. </blockquote>\",\"moduleWidth\":\"8\",\"centerModule\":true,\"noMarginBottom\":false}}},\"2\":{\"titleRaw\":{\"1\":\"Home\",\"2\":\" - craft3starter\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":\"\",\"title\":\"Home - craft3starter\",\"image\":null,\"description\":\"\"},\"facebook\":{\"handle\":\"\",\"title\":\"Home - craft3starter\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}}}','2019-05-02 20:32:50','2019-05-02 20:32:50','ca619ce0-d817-4854-be47-c6f7ab60fff1'),
	(6,6,1,1,1,6,'','{\"typeId\":\"1\",\"authorId\":\"1\",\"title\":\"Home\",\"slug\":\"__home__\",\"postDate\":1556828580,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"3\":{\"7\":{\"type\":\"textModule\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentArea\":\"<h1>Lorem ipsum dolor sit amet, consectetur adipiscing</h1>\\n<p>Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. <em>Cras sit amet rutrum nibh</em>, eu ornare sapien. <del>Nulla pharetra vitae magna eu posuere</del>. <a href=\\\"http://www.lookthinkmake.com\\\">Vestibulum maximus velit justo</a>, et feugiat est ultricies ac. Etiam mollis sit amet tortor et molestie. Praesent ut fermentum elit. Vivamus a enim at elit eleifend mollis. Nullam in risus augue. Ut sed magna fermentum tortor consectetur fringilla. Sed at quam elementum, efficitur tortor lacinia, venenatis enim. Nulla vestibulum massa sed massa porttitor, molestie ultrices tortor viverra. Duis dictum ipsum massa, quis mollis eros scelerisque vel. Ut eu ligula sodales, ultricies eros non, porta diam.</p>\\n<h2>Bibendum interdum eleifend sit amet</h2>\\n<p>Donec eros velit, bibendum interdum eleifend sit amet, lacinia eget arcu. Nulla ut erat sed ante accumsan dictum. Aliquam sodales at diam vel finibus. Integer mauris risus, ornare quis tempus nec, porta rutrum erat. Pellentesque at commodo arcu. Fusce condimentum nibh et pharetra dignissim. Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p>\\n<ul><li>Fusce condimentum nibh et pharetra dignissim. </li><li>Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. </li><li>Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. </li><li>Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. </li><li>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; </li><li>Maecenas ut cursus turpis, eget aliquam dolor.</li></ul><h3>Diam enim laoreet libero</h3>\\n<p>In tincidunt, nulla eget sagittis aliquet, diam enim laoreet libero, a lacinia ante purus nec libero. Nulla vehicula vitae ligula id sodales. In feugiat sit amet erat vel hendrerit. Integer elementum ultricies scelerisque. Nam et efficitur eros. Maecenas sed nisl risus. Aliquam ut sapien vel sem rutrum mollis. Maecenas congue facilisis felis, sed auctor odio volutpat eu. Nam ultrices sapien non leo ultrices, in hendrerit dolor cursus. Mauris vitae auctor dolor, at sodales est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse quis ultricies eros. Donec ut purus purus. Suspendisse suscipit ac magna accumsan efficitur. Maecenas vulputate et nunc a sagittis. Quisque nec ex risus.</p>\\n<ol><li>Maecenas congue facilisis felis, sed auctor odio volutpat eu. </li><li>Nam ultrices sapien non leo ultrices, in hendrerit dolor cursus. </li><li>Mauris vitae auctor dolor, at sodales est. Pellentesque habitant morbi tristique senectus </li><li>et netus et malesuada fames ac turpis egestas. Suspendisse quis ultricies eros. </li><li>Donec ut purus purus. Suspendisse suscipit ac magna accumsan efficitur. </li><li>Maecenas vulputate et nunc a sagittis. Quisque nec ex risus.</li></ol><h4>Vivamus sit amet sapien risus.</h4>\\n<p>Quisque venenatis lectus a egestas finibus. Vivamus sit amet sapien risus. Pellentesque tempus, orci ut dignissim sollicitudin, odio mi placerat leo, vel euismod sapien magna a purus. Donec nulla lacus, dictum nec sapien id, tempus dignissim elit. Nulla quis ornare risus. Maecenas vel augue feugiat, laoreet nibh porta, ultrices diam.<br /></p>\\n<p><a class=\\\"btn\\\" href=\\\"http://www.lookthinkmake.com\\\">Here is a button</a></p>\\n<p> In hac habitasse platea dictumst. Quisque mollis, mauris sit amet faucibus egestas, eros tellus blandit dolor, id elementum dolor lacus bibendum magna. Aenean et tincidunt metus, finibus suscipit elit. In sed libero maximus leo hendrerit venenatis sit amet quis ipsum. Pellentesque ut faucibus sapien.</p><figure><img src=\\\"{asset:8:url}\\\" alt=\\\"This is the title\\\" /><figcaption>This is the caption</figcaption></figure><h5>Quam condimentum cursus</h5>\\n<p>Pellentesque vel cursus tellus. Integer ullamcorper, quam condimentum cursus egestas, neque nunc sollicitudin mauris, a dignissim eros sapien ac purus. Donec lorem elit, pellentesque aliquam luctus et, scelerisque et nibh. Quisque congue vel magna ac lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas et dictum magna. Pellentesque convallis quis felis eu vehicula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tincidunt ullamcorper erat eu hendrerit. Suspendisse dui turpis, interdum id convallis in, pharetra non erat. Sed porttitor felis lacus, nec congue sapien efficitur quis. Cras tempus maximus accumsan.</p><figure style=\\\"float:right;margin:0px 0px 10px 10px;\\\"><img src=\\\"{asset:8:url}\\\" alt=\\\"This is the title\\\" /><figcaption>this is the caption</figcaption></figure><p>Donec eros velit, bibendum interdum eleifend sit amet, lacinia eget arcu. Nulla ut erat sed ante accumsan dictum. Aliquam sodales at diam vel finibus. Integer mauris risus, ornare quis tempus nec, porta rutrum erat. Pellentesque at commodo arcu. Fusce condimentum nibh et pharetra dignissim. Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p><p>Donec eros velit, bibendum interdum eleifend sit amet, lacinia eget arcu. Nulla ut erat sed ante accumsan dictum. Aliquam sodales at diam vel finibus. Integer mauris risus, ornare quis tempus nec, porta rutrum erat. Pellentesque at commodo arcu. Fusce condimentum nibh et pharetra dignissim. Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p>\\n<h6>Cras tempus maximus accumsan</h6>\\n<p>Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p>\\n<h4>Code for the nerds</h4>\\n<pre>Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</pre>\\n<h4>A blockquote style</h4>\\n<blockquote>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas et dictum magna. Pellentesque convallis quis felis eu vehicula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. </blockquote>\",\"moduleWidth\":\"8\",\"centerModule\":true,\"noMarginBottom\":false}},\"9\":{\"type\":\"imageModule\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"8\"],\"caption\":\"<p>Here\'s a caption</p>\",\"imageWidth\":\"12\",\"mobilePercentage\":\"80\",\"maxHeight\":null,\"fullWidth\":false,\"noMarginBottom\":false}},\"10\":{\"type\":\"imageAndTextModule\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentArea\":\"<h2>Donec eros velit, bibendum interdum eleifend sit amet</h2><p>Lacinia eget arcu. Nulla ut erat sed ante accumsan dictum. Aliquam sodales at diam vel finibus. Integer mauris risus, ornare quis tempus nec, porta rutrum erat. Pellentesque at commodo arcu. Fusce condimentum nibh et pharetra dignissim. Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p>\",\"image\":[\"8\"],\"imageAlignment\":\"image-right\",\"noMarginBottom\":false}},\"11\":{\"type\":\"formModule\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentArea\":\"<h2>Donec eros velit, bibendum interdum eleifend sit amet</h2>\\n<p>Lacinia eget arcu. Nulla ut erat sed ante accumsan dictum. Aliquam sodales at diam vel finibus. Integer mauris risus, ornare quis tempus nec, porta rutrum erat. Pellentesque at commodo arcu. Fusce condimentum nibh et pharetra dignissim. Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p>\",\"form\":1,\"buttonText\":null,\"successText\":null,\"failureText\":null,\"formAlignment\":\"form-right\",\"noMarginBottom\":false}}},\"2\":{\"titleRaw\":{\"1\":\"Home\",\"2\":\" - craft3starter\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":\"\",\"title\":\"Home - craft3starter\",\"image\":null,\"description\":\"\"},\"facebook\":{\"handle\":\"\",\"title\":\"Home - craft3starter\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}}}','2019-05-02 20:35:27','2019-05-02 20:35:27','b8bce80a-341b-43be-8460-ce90926102d6'),
	(7,6,1,1,1,7,'','{\"typeId\":\"1\",\"authorId\":\"1\",\"title\":\"Home\",\"slug\":\"__home__\",\"postDate\":1556828580,\"expiryDate\":null,\"enabled\":true,\"newParentId\":\"\",\"fields\":{\"3\":{\"7\":{\"type\":\"textModule\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentArea\":\"<h1>Lorem ipsum dolor sit amet, consectetur adipiscing</h1>\\n<p>Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. <em>Cras sit amet rutrum nibh</em>, eu ornare sapien. <del>Nulla pharetra vitae magna eu posuere</del>. <a href=\\\"http://www.lookthinkmake.com\\\">Vestibulum maximus velit justo</a>, et feugiat est ultricies ac. Etiam mollis sit amet tortor et molestie. Praesent ut fermentum elit. Vivamus a enim at elit eleifend mollis. Nullam in risus augue. Ut sed magna fermentum tortor consectetur fringilla. Sed at quam elementum, efficitur tortor lacinia, venenatis enim. Nulla vestibulum massa sed massa porttitor, molestie ultrices tortor viverra. Duis dictum ipsum massa, quis mollis eros scelerisque vel. Ut eu ligula sodales, ultricies eros non, porta diam.</p>\\n<h2>Bibendum interdum eleifend sit amet</h2>\\n<p>Donec eros velit, bibendum interdum eleifend sit amet, lacinia eget arcu. Nulla ut erat sed ante accumsan dictum. Aliquam sodales at diam vel finibus. Integer mauris risus, ornare quis tempus nec, porta rutrum erat. Pellentesque at commodo arcu. Fusce condimentum nibh et pharetra dignissim. Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p>\\n<ul><li>Fusce condimentum nibh et pharetra dignissim. </li><li>Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. </li><li>Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. </li><li>Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. </li><li>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; </li><li>Maecenas ut cursus turpis, eget aliquam dolor.</li></ul><h3>Diam enim laoreet libero</h3>\\n<p>In tincidunt, nulla eget sagittis aliquet, diam enim laoreet libero, a lacinia ante purus nec libero. Nulla vehicula vitae ligula id sodales. In feugiat sit amet erat vel hendrerit. Integer elementum ultricies scelerisque. Nam et efficitur eros. Maecenas sed nisl risus. Aliquam ut sapien vel sem rutrum mollis. Maecenas congue facilisis felis, sed auctor odio volutpat eu. Nam ultrices sapien non leo ultrices, in hendrerit dolor cursus. Mauris vitae auctor dolor, at sodales est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse quis ultricies eros. Donec ut purus purus. Suspendisse suscipit ac magna accumsan efficitur. Maecenas vulputate et nunc a sagittis. Quisque nec ex risus.</p>\\n<ol><li>Maecenas congue facilisis felis, sed auctor odio volutpat eu. </li><li>Nam ultrices sapien non leo ultrices, in hendrerit dolor cursus. </li><li>Mauris vitae auctor dolor, at sodales est. Pellentesque habitant morbi tristique senectus </li><li>et netus et malesuada fames ac turpis egestas. Suspendisse quis ultricies eros. </li><li>Donec ut purus purus. Suspendisse suscipit ac magna accumsan efficitur. </li><li>Maecenas vulputate et nunc a sagittis. Quisque nec ex risus.</li></ol><h4>Vivamus sit amet sapien risus.</h4>\\n<p>Quisque venenatis lectus a egestas finibus. Vivamus sit amet sapien risus. Pellentesque tempus, orci ut dignissim sollicitudin, odio mi placerat leo, vel euismod sapien magna a purus. Donec nulla lacus, dictum nec sapien id, tempus dignissim elit. Nulla quis ornare risus. Maecenas vel augue feugiat, laoreet nibh porta, ultrices diam.<br /></p>\\n<p><a class=\\\"btn\\\" href=\\\"http://www.lookthinkmake.com\\\">Here is a button</a></p>\\n<p> In hac habitasse platea dictumst. Quisque mollis, mauris sit amet faucibus egestas, eros tellus blandit dolor, id elementum dolor lacus bibendum magna. Aenean et tincidunt metus, finibus suscipit elit. In sed libero maximus leo hendrerit venenatis sit amet quis ipsum. Pellentesque ut faucibus sapien.</p>\\n<figure><img src=\\\"{asset:8:url}\\\" alt=\\\"This is the title\\\" /><figcaption>This is the caption</figcaption></figure><h5>Quam condimentum cursus</h5>\\n<p>Pellentesque vel cursus tellus. Integer ullamcorper, quam condimentum cursus egestas, neque nunc sollicitudin mauris, a dignissim eros sapien ac purus. Donec lorem elit, pellentesque aliquam luctus et, scelerisque et nibh. Quisque congue vel magna ac lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas et dictum magna. Pellentesque convallis quis felis eu vehicula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tincidunt ullamcorper erat eu hendrerit. Suspendisse dui turpis, interdum id convallis in, pharetra non erat. Sed porttitor felis lacus, nec congue sapien efficitur quis. Cras tempus maximus accumsan.</p>\\n<figure style=\\\"float:right;margin:0px 0px 10px 10px;\\\"><img src=\\\"{asset:8:url}\\\" alt=\\\"This is the title\\\" /><figcaption>this is the caption</figcaption></figure><p>Donec eros velit, bibendum interdum eleifend sit amet, lacinia eget arcu. Nulla ut erat sed ante accumsan dictum. Aliquam sodales at diam vel finibus. Integer mauris risus, ornare quis tempus nec, porta rutrum erat. Pellentesque at commodo arcu. Fusce condimentum nibh et pharetra dignissim. Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p>\\n<p>Donec eros velit, bibendum interdum eleifend sit amet, lacinia eget arcu. Nulla ut erat sed ante accumsan dictum. Aliquam sodales at diam vel finibus. Integer mauris risus, ornare quis tempus nec, porta rutrum erat. Pellentesque at commodo arcu. Fusce condimentum nibh et pharetra dignissim. Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p>\\n<h6>Cras tempus maximus accumsan</h6>\\n<p>Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p>\\n<h4>Code for the nerds</h4>\\n<pre>Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</pre>\\n<h4>A blockquote style</h4>\\n<blockquote>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas et dictum magna. Pellentesque convallis quis felis eu vehicula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. </blockquote>\",\"moduleWidth\":\"8\",\"centerModule\":true,\"noMarginBottom\":false}},\"9\":{\"type\":\"imageModule\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"image\":[\"8\"],\"caption\":\"<p>Here\'s a caption</p>\",\"imageWidth\":\"12\",\"mobilePercentage\":\"80\",\"maxHeight\":null,\"fullWidth\":false,\"noMarginBottom\":false}},\"10\":{\"type\":\"imageAndTextModule\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentArea\":\"<h2>Donec eros velit, bibendum interdum eleifend sit amet</h2>\\n<p>Lacinia eget arcu. Nulla ut erat sed ante accumsan dictum. Aliquam sodales at diam vel finibus. Integer mauris risus, ornare quis tempus nec, porta rutrum erat. Pellentesque at commodo arcu. Fusce condimentum nibh et pharetra dignissim. Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p>\",\"image\":[\"8\"],\"imageAlignment\":\"image-right\",\"noMarginBottom\":false}},\"11\":{\"type\":\"formModule\",\"enabled\":true,\"collapsed\":false,\"fields\":{\"contentArea\":\"<h2>Donec eros velit, bibendum interdum eleifend sit amet</h2>\\n<p>Lacinia eget arcu. Nulla ut erat sed ante accumsan dictum. Aliquam sodales at diam vel finibus. Integer mauris risus, ornare quis tempus nec, porta rutrum erat. Pellentesque at commodo arcu. Fusce condimentum nibh et pharetra dignissim. Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p>\",\"form\":1,\"buttonText\":null,\"successText\":null,\"failureText\":null,\"formAlignment\":\"form-right\",\"noMarginBottom\":false}}},\"2\":{\"titleRaw\":{\"1\":\"Home\",\"2\":\" - craft3starter\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":\"\",\"title\":\"Home - craft3starter\",\"image\":null,\"description\":\"\"},\"facebook\":{\"handle\":\"\",\"title\":\"Home - craft3starter\",\"image\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}}}','2019-05-02 20:37:38','2019-05-02 20:37:38','7f651930-eab9-4cf0-b570-7ac8e8e3176e');

/*!40000 ALTER TABLE `entryversions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldgroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldgroups`;

CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fieldgroups_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'Common','2019-05-02 19:27:51','2019-05-02 19:27:51','9f1def97-9d33-4ffd-b30f-77f9735f8ea1'),
	(2,'Navigation Fields','2019-05-02 19:57:40','2019-05-02 19:57:40','09461dfb-ed91-49de-9e46-4fcf9bc7922c'),
	(3,'Global Fields','2019-05-02 19:57:49','2019-05-02 19:57:49','7185efd2-e07e-411d-a469-aa3f8e7b6fa3'),
	(4,'Footer Fields','2019-05-02 19:57:56','2019-05-02 19:57:56','0ea6515f-5e3e-47d6-89e6-cc2dfb28206c'),
	(5,'Points of Interest Fields','2019-05-02 20:19:15','2019-05-02 20:19:15','f4b5e0bc-41ae-4250-830a-8b09f0d387d8');

/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldlayoutfields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldlayoutfields`;

CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  KEY `fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayoutfields_tabId_idx` (`tabId`),
  KEY `fieldlayoutfields_fieldId_idx` (`fieldId`),
  CONSTRAINT `fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;

INSERT INTO `fieldlayoutfields` (`id`, `layoutId`, `tabId`, `fieldId`, `required`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(5,2,2,8,0,1,'2019-05-02 20:01:29','2019-05-02 20:01:29','ef4417f3-2eff-4747-a95c-e4a22820ff5b'),
	(6,2,2,9,0,2,'2019-05-02 20:01:29','2019-05-02 20:01:29','5d9901d5-34d8-43aa-ba69-c8869b66c6c5'),
	(7,3,3,8,0,1,'2019-05-02 20:01:37','2019-05-02 20:01:37','2128b9af-3895-4598-85e3-87e9066d3c17'),
	(8,3,3,9,0,2,'2019-05-02 20:01:37','2019-05-02 20:01:37','53596d35-970b-4983-aca2-227b1b968660'),
	(9,4,4,11,1,1,'2019-05-02 20:04:18','2019-05-02 20:04:18','d7528674-ca9d-4be9-a949-3e3cc98cd824'),
	(10,4,4,12,1,2,'2019-05-02 20:04:18','2019-05-02 20:04:18','4e559836-59a1-4375-b7e4-32e64931ea09'),
	(11,4,4,13,1,3,'2019-05-02 20:04:18','2019-05-02 20:04:18','5f2af13e-1164-4e1f-8e12-a92267c31c64'),
	(85,9,19,37,0,1,'2019-05-02 20:15:01','2019-05-02 20:15:01','55756045-1605-452e-b978-ae06403cf430'),
	(113,10,25,48,0,1,'2019-05-02 20:21:33','2019-05-02 20:21:33','eb8118f3-c235-4411-b59c-14534a632147'),
	(114,10,25,44,0,2,'2019-05-02 20:21:33','2019-05-02 20:21:33','e605cf35-d1be-4a20-a056-8d9e141dc26f'),
	(115,10,25,40,0,3,'2019-05-02 20:21:33','2019-05-02 20:21:33','ead08505-0cdc-4a16-a25c-9e8141c02021'),
	(116,10,25,41,0,4,'2019-05-02 20:21:33','2019-05-02 20:21:33','c4041194-8b60-4ed9-ad76-023f3762f6b8'),
	(117,10,25,42,0,5,'2019-05-02 20:21:33','2019-05-02 20:21:33','05e4caf9-b5e2-4791-b297-1fc72d5e9dfb'),
	(118,10,25,45,0,6,'2019-05-02 20:21:33','2019-05-02 20:21:33','140a8f07-3bfa-42df-8801-f9c944b05758'),
	(119,10,25,43,0,7,'2019-05-02 20:21:33','2019-05-02 20:21:33','1991d7b7-df6a-4696-b3f7-742d91ade229'),
	(120,10,25,47,0,8,'2019-05-02 20:21:33','2019-05-02 20:21:33','95a69627-c48e-43ff-8cb7-ae57a7219906'),
	(121,10,25,46,0,9,'2019-05-02 20:21:33','2019-05-02 20:21:33','68e4b33a-ebd0-4e2c-bda2-a7bd8eeb45e4'),
	(122,11,26,3,0,1,'2019-05-02 20:23:07','2019-05-02 20:23:07','90bf768c-5691-4796-82ec-1e2b962510cd'),
	(123,11,27,2,0,1,'2019-05-02 20:23:07','2019-05-02 20:23:07','dbdb5201-e82f-45c8-9079-0184e289ad67'),
	(124,12,28,1,0,1,'2019-05-02 20:23:21','2019-05-02 20:23:21','6c507994-3535-4ad8-8dfe-3861b669611a'),
	(125,12,29,2,0,1,'2019-05-02 20:23:21','2019-05-02 20:23:21','1a2ec4a7-67a4-450a-b924-6654debd0f59'),
	(180,7,40,29,0,1,'2019-05-02 20:43:33','2019-05-02 20:43:33','64738174-1514-4d91-8c25-38c71aaa8fa1'),
	(181,7,40,30,0,2,'2019-05-02 20:43:33','2019-05-02 20:43:33','79bbd4c4-974a-4bd3-a7e3-29ce3f73bca8'),
	(182,7,40,31,0,3,'2019-05-02 20:43:33','2019-05-02 20:43:33','23f12f27-bee3-48e8-b911-59891e85f3fc'),
	(183,7,40,32,0,4,'2019-05-02 20:43:33','2019-05-02 20:43:33','0c8e089a-28d1-4475-9615-b8a572251494'),
	(184,1,41,4,0,1,'2019-05-02 20:43:33','2019-05-02 20:43:33','fe490463-2927-471b-ba09-f167b7dddf27'),
	(185,1,41,5,0,2,'2019-05-02 20:43:33','2019-05-02 20:43:33','3742400c-7897-4a91-8657-ae6d4d68c9ba'),
	(186,1,41,6,0,3,'2019-05-02 20:43:33','2019-05-02 20:43:33','d5e96122-1659-4c93-b17a-4ed0016e4009'),
	(187,1,41,7,0,4,'2019-05-02 20:43:33','2019-05-02 20:43:33','ecbb367c-ebaf-4147-8361-9034a9c5c241'),
	(188,5,42,15,1,1,'2019-05-02 20:43:33','2019-05-02 20:43:33','22efdecc-206e-420c-b014-96500c5ccd70'),
	(189,5,42,16,0,2,'2019-05-02 20:43:33','2019-05-02 20:43:33','c5d51f10-7914-4042-a36c-ab7115681fff'),
	(190,5,42,17,0,3,'2019-05-02 20:43:33','2019-05-02 20:43:33','be697e34-bc0c-4251-93f0-222a3701498e'),
	(191,5,42,18,0,4,'2019-05-02 20:43:33','2019-05-02 20:43:33','69350500-b1d2-4eed-8177-811e1169d051'),
	(192,5,42,19,0,5,'2019-05-02 20:43:33','2019-05-02 20:43:33','3ac56e34-a386-4349-b0f0-7c0f5eafd40c'),
	(193,5,42,20,0,6,'2019-05-02 20:43:33','2019-05-02 20:43:33','a676aa09-4fa2-4755-a9e7-f4b2ae8132bd'),
	(194,5,42,21,0,7,'2019-05-02 20:43:33','2019-05-02 20:43:33','da857fbf-3e18-403f-b0cb-976e33b6d297'),
	(195,6,43,22,0,1,'2019-05-02 20:43:34','2019-05-02 20:43:34','cef9186c-d7f3-45b0-94ad-71c6ed557e05'),
	(196,6,43,23,0,2,'2019-05-02 20:43:34','2019-05-02 20:43:34','bee2acea-aaa0-4b83-a7d8-79592d87b114'),
	(197,6,43,24,0,3,'2019-05-02 20:43:34','2019-05-02 20:43:34','6fa2917c-eed4-498f-9a16-de56f1ec1c5a'),
	(198,6,43,25,0,4,'2019-05-02 20:43:34','2019-05-02 20:43:34','d3468ced-2ec8-4ed0-9b53-bf953a12f0d5'),
	(199,6,43,26,0,5,'2019-05-02 20:43:34','2019-05-02 20:43:34','f1f5b607-31c1-4af1-ab8c-6702f41df087'),
	(200,6,43,27,0,6,'2019-05-02 20:43:34','2019-05-02 20:43:34','eeab1f63-4316-40c0-b89c-095ac06881a7'),
	(201,6,43,28,0,7,'2019-05-02 20:43:34','2019-05-02 20:43:34','3740d518-fa8f-4fc4-a21d-c0c98edce575'),
	(202,8,44,33,0,1,'2019-05-02 20:43:35','2019-05-02 20:43:35','e06cbe1f-36c0-4ec1-99ac-a924f205a15b'),
	(203,8,44,34,0,2,'2019-05-02 20:43:35','2019-05-02 20:43:35','e02f3f45-49ef-4e54-b4a3-0882ca59d7f3'),
	(204,8,44,35,0,3,'2019-05-02 20:43:35','2019-05-02 20:43:35','a299087a-bdf6-408f-ad16-eb8f0e600257'),
	(205,8,44,39,0,4,'2019-05-02 20:43:35','2019-05-02 20:43:35','e96ad0cc-1cb1-40e1-8d34-c8873fd935ec'),
	(206,8,44,36,0,5,'2019-05-02 20:43:35','2019-05-02 20:43:35','c7bc87f6-8364-43cb-90a9-049dec61864b');

/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldlayouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldlayouts`;

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  KEY `fieldlayouts_type_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;

INSERT INTO `fieldlayouts` (`id`, `type`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'craft\\elements\\MatrixBlock','2019-05-02 20:00:31','2019-05-02 20:43:33',NULL,'773641f2-a4f5-483a-8bac-7cfaa7d84f72'),
	(2,'craft\\elements\\Category','2019-05-02 20:01:29','2019-05-02 20:01:29',NULL,'87470ae6-7639-4e0f-a1eb-1194d7d496bb'),
	(3,'craft\\elements\\Category','2019-05-02 20:01:37','2019-05-02 20:01:37',NULL,'cda1d38e-735e-494a-968b-8b0dc7700964'),
	(4,'craft\\elements\\MatrixBlock','2019-05-02 20:04:18','2019-05-02 20:04:18',NULL,'f516b9a7-7d1e-458d-a4d3-b3391be2bc9e'),
	(5,'craft\\elements\\MatrixBlock','2019-05-02 20:10:41','2019-05-02 20:43:33',NULL,'37513270-b00f-46c8-a463-b8aaf12abdf0'),
	(6,'craft\\elements\\MatrixBlock','2019-05-02 20:10:42','2019-05-02 20:43:34',NULL,'e072813e-6804-48aa-bd9f-d816e3980d25'),
	(7,'craft\\elements\\MatrixBlock','2019-05-02 20:10:42','2019-05-02 20:43:32',NULL,'469f8dcb-4e2a-4d33-8b74-5f62e019d2a4'),
	(8,'craft\\elements\\MatrixBlock','2019-05-02 20:13:33','2019-05-02 20:43:35',NULL,'d13b86c9-aa81-403b-8a38-ca6520553b7b'),
	(9,'craft\\elements\\Category','2019-05-02 20:15:01','2019-05-02 20:15:01',NULL,'4075d28a-65b5-40fd-a3e1-b5b8a2ffec26'),
	(10,'craft\\elements\\Entry','2019-05-02 20:21:33','2019-05-02 20:21:33',NULL,'613eccd1-0f46-49e9-a988-f8670892f6c1'),
	(11,'craft\\elements\\Entry','2019-05-02 20:23:07','2019-05-02 20:23:07',NULL,'a1b15a75-992e-4cda-9344-51ebaa454b86'),
	(12,'craft\\elements\\Entry','2019-05-02 20:23:21','2019-05-02 20:23:21',NULL,'bc79956c-e34a-4122-9307-806fef05d066');

/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fieldlayouttabs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fieldlayouttabs`;

CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  KEY `fieldlayouttabs_layoutId_idx` (`layoutId`),
  CONSTRAINT `fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;

INSERT INTO `fieldlayouttabs` (`id`, `layoutId`, `name`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(2,2,'Navigation Fields',1,'2019-05-02 20:01:29','2019-05-02 20:01:29','40f3499b-ad19-488c-a709-30ad64a68d91'),
	(3,3,'Navigation Fields',1,'2019-05-02 20:01:37','2019-05-02 20:01:37','87a1a8ea-c5b3-4615-99f4-9e8afb81dd5b'),
	(4,4,'Content',1,'2019-05-02 20:04:18','2019-05-02 20:04:18','7be062a4-98de-4312-9752-a15d6057b1af'),
	(19,9,'Content',1,'2019-05-02 20:15:01','2019-05-02 20:15:01','595e5ab8-ebce-4654-9523-43e699e9f2f5'),
	(25,10,'Points of Interest Fields',1,'2019-05-02 20:21:33','2019-05-02 20:21:33','4122d78a-c6d1-4e03-9ed4-8fbbaffd3d7d'),
	(26,11,'Content',1,'2019-05-02 20:23:07','2019-05-02 20:23:07','12fd26cc-7a49-4742-bd75-8f7715375bf1'),
	(27,11,'SEO',2,'2019-05-02 20:23:07','2019-05-02 20:23:07','d573ab61-77c5-4433-b923-61c23f236b59'),
	(28,12,'Content',1,'2019-05-02 20:23:21','2019-05-02 20:23:21','60dc9732-f46a-4e90-9075-e256ae201aa2'),
	(29,12,'SEO',2,'2019-05-02 20:23:21','2019-05-02 20:23:21','a304d5e4-cfc2-4d19-bd8a-2e164d6e9cd0'),
	(40,7,'Content',1,'2019-05-02 20:43:32','2019-05-02 20:43:32','090eece5-cc33-4478-9b79-9bae1ab5cd3d'),
	(41,1,'Content',1,'2019-05-02 20:43:33','2019-05-02 20:43:33','5e431719-441d-4318-b736-8455aaff0ea3'),
	(42,5,'Content',1,'2019-05-02 20:43:33','2019-05-02 20:43:33','e23544bb-067f-4ba2-b704-0153ae07db6a'),
	(43,6,'Content',1,'2019-05-02 20:43:34','2019-05-02 20:43:34','9bd61856-d553-431b-89a3-63472567c76d'),
	(44,8,'Content',1,'2019-05-02 20:43:35','2019-05-02 20:43:35','53f25427-50c6-40d5-9c07-d4f06c68299e');

/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fields`;

CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fields_handle_context_unq_idx` (`handle`,`context`),
  KEY `fields_groupId_idx` (`groupId`),
  KEY `fields_context_idx` (`context`),
  CONSTRAINT `fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;

INSERT INTO `fields` (`id`, `groupId`, `name`, `handle`, `context`, `instructions`, `searchable`, `translationMethod`, `translationKeyFormat`, `type`, `settings`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'Body','body','global','',1,'none',NULL,'craft\\redactor\\Field','{\"redactorConfig\":\"Standard.json\",\"purifierConfig\":\"\",\"cleanupHtml\":true,\"removeInlineStyles\":\"1\",\"removeEmptyTags\":\"1\",\"removeNbsp\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}','2019-05-02 19:58:37','2019-05-02 19:58:37','f7fd636f-ead5-4d65-a8ae-1d5ca3f6ec76'),
	(2,1,'SEO','seo','global','',1,'none',NULL,'ether\\seo\\fields\\SeoField','{\"titleSuffix\":null,\"suffixAsPrefix\":null,\"title\":[{\"key\":\"1\",\"locked\":\"0\",\"template\":\"{title}\"},{\"key\":\"2\",\"locked\":\"0\",\"template\":\" - {{ siteName }}\"}],\"description\":\"\",\"socialImage\":\"\",\"hideSocial\":\"\",\"robots\":[\"\",\"\",\"\",\"\",\"\",\"\"]}','2019-05-02 19:59:10','2019-05-02 19:59:10','cac475d8-6f45-425f-8e92-6e0c1bd72109'),
	(3,1,'Module Matrix','moduleMatrix','global','',1,'site',NULL,'craft\\fields\\Matrix','{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_modulematrix}}\",\"localizeBlocks\":false}','2019-05-02 20:00:30','2019-05-02 20:43:32','507e655e-04cc-4b5d-a4d7-6a6f8aca2990'),
	(4,NULL,'Content Area','contentArea','matrixBlockType:3d20b894-240e-4f1d-bfa6-cb5dac7d444a','',1,'none',NULL,'craft\\redactor\\Field','{\"redactorConfig\":\"Standard.json\",\"purifierConfig\":\"\",\"cleanupHtml\":true,\"removeInlineStyles\":\"1\",\"removeEmptyTags\":\"1\",\"removeNbsp\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}','2019-05-02 20:00:31','2019-05-02 20:43:33','01fc2383-a7a7-43d6-8909-c7f92c961cea'),
	(5,NULL,'Module Width','moduleWidth','matrixBlockType:3d20b894-240e-4f1d-bfa6-cb5dac7d444a','Number of columns the text will take up. 1 is the minimum, maximum 16.',1,'none',NULL,'craft\\fields\\Number','{\"defaultValue\":\"8\",\"min\":\"1\",\"max\":\"16\",\"decimals\":0,\"size\":null,\"prefix\":\"\",\"suffix\":\"\"}','2019-05-02 20:00:31','2019-05-02 20:43:33','c78256c3-b899-4b9e-a7ad-15bb1d0f0c40'),
	(6,NULL,'Center Module','centerModule','matrixBlockType:3d20b894-240e-4f1d-bfa6-cb5dac7d444a','Will center text area if check off.',1,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":\"\"}','2019-05-02 20:00:31','2019-05-02 20:43:33','93068180-e0ad-4f30-8742-e483d4593450'),
	(7,NULL,'No Margin Bottom','noMarginBottom','matrixBlockType:3d20b894-240e-4f1d-bfa6-cb5dac7d444a','',1,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":\"\"}','2019-05-02 20:00:31','2019-05-02 20:43:33','864f6fdc-1125-4f96-abb7-f9bc5b9c940f'),
	(8,2,'Navigation Destination','navigationDestination','global','',1,'site',NULL,'craft\\fields\\Entries','{\"sources\":[\"section:a8e283f3-6ac5-4c16-b9f9-2fc3a99ccaf3\"],\"source\":null,\"targetSiteId\":null,\"viewMode\":null,\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2019-05-02 20:00:53','2019-05-02 20:00:53','843b9622-89e0-487e-b37f-90e23cda73b3'),
	(9,2,'Navigation Destination External','navigationDestinationExternal','global','If populated, this will override the other navigation destination field. Used for linking outside the current website.',1,'none',NULL,'craft\\fields\\Url','{\"placeholder\":\"\",\"maxLength\":\"255\"}','2019-05-02 20:01:17','2019-05-02 20:01:17','c941c7f3-f574-44e0-857f-251d9aee095b'),
	(10,4,'Social Media Links','socialMediaLinks','global','',1,'site',NULL,'craft\\fields\\Matrix','{\"minBlocks\":\"\",\"maxBlocks\":\"\",\"contentTable\":\"{{%matrixcontent_socialmedialinks}}\",\"localizeBlocks\":false}','2019-05-02 20:04:17','2019-05-02 20:04:17','64612a7f-8e5a-40f3-ae8a-b22990f2a76a'),
	(11,NULL,'Social Media Name','socialMediaName','matrixBlockType:05524c18-7ed5-4cd2-af86-df0e039cefc7','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-05-02 20:04:18','2019-05-02 20:04:18','0b8ea91c-ba2c-4d6c-a109-b3fcae2910ca'),
	(12,NULL,'Social Media Link','socialMediaLink','matrixBlockType:05524c18-7ed5-4cd2-af86-df0e039cefc7','',1,'none',NULL,'craft\\fields\\Url','{\"placeholder\":\"\",\"maxLength\":\"255\"}','2019-05-02 20:04:18','2019-05-02 20:04:18','7c4d11c4-20a6-4377-b7da-a3bd0a6621fa'),
	(13,NULL,'Social Media Icon','socialMediaIcon','matrixBlockType:05524c18-7ed5-4cd2-af86-df0e039cefc7','',1,'site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"volume:c9edfe95-9cbc-42b3-9fdf-52b85c8aefbd\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"volume:c9edfe95-9cbc-42b3-9fdf-52b85c8aefbd\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"1\",\"selectionLabel\":\"Add an icon\",\"localizeRelations\":false}','2019-05-02 20:04:18','2019-05-02 20:04:18','d23ac834-e93a-45bc-af3a-33a600c90046'),
	(14,4,'Footer Address','footerAddress','global','',1,'none',NULL,'craft\\redactor\\Field','{\"redactorConfig\":\"Simple.json\",\"purifierConfig\":\"\",\"cleanupHtml\":true,\"removeInlineStyles\":\"1\",\"removeEmptyTags\":\"1\",\"removeNbsp\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}','2019-05-02 20:04:38','2019-05-02 20:04:38','f28977d8-12bd-405e-8af9-70028a389173'),
	(15,NULL,'Image','image','matrixBlockType:8e542ee2-4f05-41e2-9ffe-e5e45c9bbc26','',1,'site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"volume:c9edfe95-9cbc-42b3-9fdf-52b85c8aefbd\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"volume:c9edfe95-9cbc-42b3-9fdf-52b85c8aefbd\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2019-05-02 20:10:41','2019-05-02 20:43:33','b0e41e4b-c762-4d27-a00d-50422ab7081d'),
	(16,NULL,'Caption','caption','matrixBlockType:8e542ee2-4f05-41e2-9ffe-e5e45c9bbc26','Optional.',1,'none',NULL,'craft\\redactor\\Field','{\"redactorConfig\":\"Standard.json\",\"purifierConfig\":\"\",\"cleanupHtml\":true,\"removeInlineStyles\":\"1\",\"removeEmptyTags\":\"1\",\"removeNbsp\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"\",\"availableTransforms\":\"*\"}','2019-05-02 20:10:41','2019-05-02 20:43:33','d93bb87d-6ee0-405c-b4c9-a057e6450a2f'),
	(17,NULL,'Image Width','imageWidth','matrixBlockType:8e542ee2-4f05-41e2-9ffe-e5e45c9bbc26','Number of columns an image will take up. 1 is the minimum, maximum 16.',1,'none',NULL,'craft\\fields\\Number','{\"defaultValue\":\"12\",\"min\":\"1\",\"max\":\"16\",\"decimals\":0,\"size\":null,\"prefix\":\"\",\"suffix\":\"\"}','2019-05-02 20:10:41','2019-05-02 20:43:33','f4bfef83-9e6a-4faa-9d7f-da9a4d150ed4'),
	(18,NULL,'Mobile Percentage','mobilePercentage','matrixBlockType:8e542ee2-4f05-41e2-9ffe-e5e45c9bbc26','Percentage of the screen that the image will take up on mobile devices.',1,'none',NULL,'craft\\fields\\Number','{\"defaultValue\":null,\"min\":\"1\",\"max\":\"100\",\"decimals\":0,\"size\":null,\"prefix\":\"\",\"suffix\":\"\"}','2019-05-02 20:10:41','2019-05-02 20:43:33','9391bf59-487e-49aa-86a0-e9b4a26409a1'),
	(19,NULL,'Max Height','maxHeight','matrixBlockType:8e542ee2-4f05-41e2-9ffe-e5e45c9bbc26','In pixels',1,'none',NULL,'craft\\fields\\Number','{\"defaultValue\":null,\"min\":\"0\",\"max\":null,\"decimals\":0,\"size\":null,\"prefix\":\"\",\"suffix\":\"\"}','2019-05-02 20:10:41','2019-05-02 20:43:33','6027b9e9-e395-455c-af57-38e30d010819'),
	(20,NULL,'Full Width','fullWidth','matrixBlockType:8e542ee2-4f05-41e2-9ffe-e5e45c9bbc26','This will override the \"Image Width\" and \"Mobile Percentage\" fields.',1,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":\"\"}','2019-05-02 20:10:41','2019-05-02 20:43:33','2a151c25-9a1e-45d5-be19-9985f4f3b5b6'),
	(21,NULL,'No Margin Bottom','noMarginBottom','matrixBlockType:8e542ee2-4f05-41e2-9ffe-e5e45c9bbc26','',1,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":\"\"}','2019-05-02 20:10:41','2019-05-02 20:43:33','6dfa4405-c4b8-4f78-b31c-d053cb248816'),
	(22,NULL,'Content Area','contentArea','matrixBlockType:4996e920-0227-4240-9edc-cda20818964c','',1,'none',NULL,'craft\\redactor\\Field','{\"redactorConfig\":\"Standard.json\",\"purifierConfig\":\"\",\"cleanupHtml\":true,\"removeInlineStyles\":\"1\",\"removeEmptyTags\":\"1\",\"removeNbsp\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}','2019-05-02 20:10:41','2019-05-02 20:43:33','d9e49f7c-44c2-4e9d-8886-976daa0794df'),
	(23,NULL,'Form','form','matrixBlockType:4996e920-0227-4240-9edc-cda20818964c','',1,'none',NULL,'wheelform\\fields\\FormField',NULL,'2019-05-02 20:10:41','2019-05-02 20:43:33','7f54df4f-0078-48ce-a681-2b4062fec75d'),
	(24,NULL,'Button Text','buttonText','matrixBlockType:4996e920-0227-4240-9edc-cda20818964c','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Submit\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-05-02 20:10:41','2019-05-02 20:43:33','fc69218b-1149-44c8-9162-1b3e479a4cfe'),
	(25,NULL,'Success Text','successText','matrixBlockType:4996e920-0227-4240-9edc-cda20818964c','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Thank you, we\'ll be in touch.\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-05-02 20:10:41','2019-05-02 20:43:33','bfc45612-9863-4e24-9726-cc944228f1ed'),
	(26,NULL,'Failure Text','failureText','matrixBlockType:4996e920-0227-4240-9edc-cda20818964c','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"Something went wrong, please try again later.\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-05-02 20:10:42','2019-05-02 20:43:34','15f0077a-39fd-4e1e-b41d-2e78ea30493b'),
	(27,NULL,'Form Alignment','formAlignment','matrixBlockType:4996e920-0227-4240-9edc-cda20818964c','',1,'none',NULL,'craft\\fields\\RadioButtons','{\"options\":[{\"label\":\"Form Left\",\"value\":\"form-left\",\"default\":\"\"},{\"label\":\"Form Right\",\"value\":\"form-right\",\"default\":\"1\"}]}','2019-05-02 20:10:42','2019-05-02 20:43:34','8a0e6ffa-f55b-4aab-b478-ad4ff67933a3'),
	(28,NULL,'No Margin Bottom','noMarginBottom','matrixBlockType:4996e920-0227-4240-9edc-cda20818964c','',1,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":\"\"}','2019-05-02 20:10:42','2019-05-02 20:43:34','19cade86-2f64-4be3-8b17-a72e38fd6fda'),
	(29,NULL,'Content Area','contentArea','matrixBlockType:76eae2e9-7001-4308-861b-716e3875cdd9','',1,'none',NULL,'craft\\redactor\\Field','{\"redactorConfig\":\"Standard.json\",\"purifierConfig\":\"\",\"cleanupHtml\":true,\"removeInlineStyles\":\"1\",\"removeEmptyTags\":\"1\",\"removeNbsp\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}','2019-05-02 20:10:42','2019-05-02 20:43:32','711d4441-fdc8-44ab-a1ca-02b81ed3bdef'),
	(30,NULL,'Image','image','matrixBlockType:76eae2e9-7001-4308-861b-716e3875cdd9','',1,'site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"volume:c9edfe95-9cbc-42b3-9fdf-52b85c8aefbd\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"volume:c9edfe95-9cbc-42b3-9fdf-52b85c8aefbd\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2019-05-02 20:10:42','2019-05-02 20:43:32','66c466de-1ee2-4e00-927a-d06610ed5114'),
	(31,NULL,'Image Alignment','imageAlignment','matrixBlockType:76eae2e9-7001-4308-861b-716e3875cdd9','',1,'none',NULL,'craft\\fields\\RadioButtons','{\"options\":[{\"label\":\"Image Left\",\"value\":\"image-left\",\"default\":\"\"},{\"label\":\"Image Right\",\"value\":\"image-right\",\"default\":\"1\"}]}','2019-05-02 20:10:42','2019-05-02 20:43:32','8a25071b-a158-493f-9695-2897b99defb7'),
	(32,NULL,'No Margin Bottom','noMarginBottom','matrixBlockType:76eae2e9-7001-4308-861b-716e3875cdd9','',1,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":\"\"}','2019-05-02 20:10:42','2019-05-02 20:43:32','8f711c2b-b2b8-4f53-8323-0d2984886e25'),
	(33,NULL,'Content Area','contentArea','matrixBlockType:52f3f6f3-8410-4bc7-b5a7-17d6a04cd561','',1,'none',NULL,'craft\\redactor\\Field','{\"redactorConfig\":\"Standard.json\",\"purifierConfig\":\"\",\"cleanupHtml\":true,\"removeInlineStyles\":\"1\",\"removeEmptyTags\":\"1\",\"removeNbsp\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}','2019-05-02 20:13:33','2019-05-02 20:43:35','ee2cb757-59a2-4ee4-a116-67415806929d'),
	(34,NULL,'Popup Content','popupContent','matrixBlockType:52f3f6f3-8410-4bc7-b5a7-17d6a04cd561','',1,'none',NULL,'craft\\redactor\\Field','{\"redactorConfig\":\"Standard.json\",\"purifierConfig\":\"\",\"cleanupHtml\":true,\"removeInlineStyles\":\"1\",\"removeEmptyTags\":\"1\",\"removeNbsp\":\"1\",\"purifyHtml\":\"1\",\"columnType\":\"text\",\"availableVolumes\":\"*\",\"availableTransforms\":\"*\"}','2019-05-02 20:13:33','2019-05-02 20:43:35','32ee9990-ee8e-4ba7-9c34-971922dba5f7'),
	(35,NULL,'Starting Coordinates','startingCoordinates','matrixBlockType:52f3f6f3-8410-4bc7-b5a7-17d6a04cd561','',1,'none',NULL,'craft\\fields\\Table','{\"addRowLabel\":\"\",\"maxRows\":\"1\",\"minRows\":\"1\",\"columns\":{\"col1\":{\"heading\":\"Longitude\",\"handle\":\"longitude\",\"width\":\"\",\"type\":\"singleline\"},\"col2\":{\"heading\":\"Latitude\",\"handle\":\"latitude\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":[{\"col1\":\"-97.7430608\",\"col2\":\"30.2672\"}],\"columnType\":\"text\"}','2019-05-02 20:13:33','2019-05-02 20:43:35','7501f82d-c6ce-4ca3-b94d-43237d13e3a7'),
	(36,NULL,'No Margin Bottom','noMarginBottom','matrixBlockType:52f3f6f3-8410-4bc7-b5a7-17d6a04cd561','',1,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":\"\"}','2019-05-02 20:13:53','2019-05-02 20:43:35','9f6a6151-39a3-40d7-90e6-35b487c857fc'),
	(37,1,'Icon','icon','global','',1,'site',NULL,'craft\\fields\\Assets','{\"useSingleFolder\":\"\",\"defaultUploadLocationSource\":\"volume:c9edfe95-9cbc-42b3-9fdf-52b85c8aefbd\",\"defaultUploadLocationSubpath\":\"\",\"singleUploadLocationSource\":\"volume:c9edfe95-9cbc-42b3-9fdf-52b85c8aefbd\",\"singleUploadLocationSubpath\":\"\",\"restrictFiles\":\"1\",\"allowedKinds\":[\"image\"],\"sources\":\"*\",\"source\":null,\"targetSiteId\":null,\"viewMode\":\"list\",\"limit\":\"1\",\"selectionLabel\":\"\",\"localizeRelations\":false}','2019-05-02 20:14:34','2019-05-02 20:14:34','a4253329-16f4-40a5-8191-b6c9cacb4386'),
	(38,1,'External URL','externalUrl','global','',1,'none',NULL,'craft\\fields\\Url','{\"placeholder\":\"\",\"maxLength\":\"255\"}','2019-05-02 20:14:43','2019-05-02 20:14:43','d03ae7a8-0842-47a6-ba70-0e88b66606fe'),
	(39,NULL,'Point of Interest Categories','pointOfInterestCategories','matrixBlockType:52f3f6f3-8410-4bc7-b5a7-17d6a04cd561','If one or more categories are selected, it\'ll draw the points of interest on the map.',1,'site',NULL,'craft\\fields\\Categories','{\"branchLimit\":\"\",\"sources\":\"*\",\"source\":\"group:20cbfee4-ddd8-480b-beda-47886f631060\",\"targetSiteId\":null,\"viewMode\":null,\"limit\":null,\"selectionLabel\":\"\",\"localizeRelations\":false}','2019-05-02 20:15:48','2019-05-02 20:43:35','c9ff355b-0655-4890-b16b-a24d1496419f'),
	(40,5,'City','city','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-05-02 20:19:21','2019-05-02 20:19:21','35151fed-eefa-4587-b2db-d497f43ae53f'),
	(41,5,'State','state','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-05-02 20:19:30','2019-05-02 20:19:30','2f3c8efd-0302-4a0f-a6e9-e9249786837b'),
	(42,5,'Zip','zip','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-05-02 20:19:34','2019-05-02 20:19:34','472e8a0f-b628-4886-86d0-f43ec6040992'),
	(43,5,'Website','website','global','',1,'none',NULL,'craft\\fields\\Url','{\"placeholder\":\"\",\"maxLength\":\"255\"}','2019-05-02 20:19:41','2019-05-02 20:19:41','51a54ed3-89a7-4f0c-ae90-31cfdb312062'),
	(44,5,'Street Address','streetAddress','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-05-02 20:19:47','2019-05-02 20:19:47','f11b6b46-a9c6-4978-861a-84bf94203268'),
	(45,5,'Phone','phone','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-05-02 20:19:52','2019-05-02 20:19:52','8904b186-5234-430a-87bf-2471e93da859'),
	(46,5,'Longitude','longitude','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-05-02 20:20:00','2019-05-02 20:20:00','7e118e6e-f58c-42c2-a752-17cbfccfb5f8'),
	(47,5,'Latitude','latitude','global','',1,'none',NULL,'craft\\fields\\PlainText','{\"placeholder\":\"\",\"code\":\"\",\"multiline\":\"\",\"initialRows\":\"4\",\"charLimit\":\"\",\"columnType\":\"text\"}','2019-05-02 20:20:05','2019-05-02 20:20:05','40b4824c-f6cf-41b0-93dc-3e3e88e02c8e'),
	(48,5,'POI Category','poiCategory','global','',1,'site',NULL,'craft\\fields\\Categories','{\"branchLimit\":\"1\",\"sources\":\"*\",\"source\":\"group:20cbfee4-ddd8-480b-beda-47886f631060\",\"targetSiteId\":null,\"viewMode\":null,\"limit\":null,\"selectionLabel\":\"\",\"localizeRelations\":false}','2019-05-02 20:20:21','2019-05-02 20:20:21','37af6612-3771-4c55-9cbd-da9a3bac6835');

/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table globalsets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `globalsets`;

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `globalsets_name_idx` (`name`),
  KEY `globalsets_handle_idx` (`handle`),
  KEY `globalsets_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;

INSERT INTO `globalsets` (`id`, `name`, `handle`, `fieldLayoutId`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(4,'Footer Fields','footerFields',NULL,'2019-05-02 20:02:34','2019-05-02 20:02:34','e08f666b-b0b0-4be0-9630-d4314519bd01'),
	(5,'Other Globals','otherGlobals',NULL,'2019-05-02 20:02:38','2019-05-02 20:02:38','71a3be8f-e93e-47bd-9cca-4311a9d395ac');

/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `info`;

CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `config` mediumtext,
  `configMap` mediumtext,
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `config`, `configMap`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'3.1.25','3.1.27',0,'a:14:{s:14:\"categoryGroups\";a:3:{s:36:\"57487563-6b6e-4268-9d12-1ceb83f305bc\";a:5:{s:4:\"name\";s:17:\"Header Navigation\";s:6:\"handle\";s:16:\"headerNavigation\";s:9:\"structure\";a:2:{s:3:\"uid\";s:36:\"5f6fba85-14d9-41e3-aef1-6e3b2a9ccaa9\";s:9:\"maxLevels\";i:2;}s:12:\"siteSettings\";a:1:{s:36:\"fc5e9046-d3d1-4ef3-bcf7-9b6177bb78f1\";a:3:{s:7:\"hasUrls\";b:0;s:9:\"uriFormat\";N;s:8:\"template\";N;}}s:12:\"fieldLayouts\";a:1:{s:36:\"87470ae6-7639-4e0f-a1eb-1194d7d496bb\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:4:\"name\";s:17:\"Navigation Fields\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:2:{s:36:\"843b9622-89e0-487e-b37f-90e23cda73b3\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"c941c7f3-f574-44e0-857f-251d9aee095b\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}}}}}}}s:36:\"48b37115-4a14-491c-b440-465103a86650\";a:5:{s:4:\"name\";s:17:\"Footer Navigation\";s:6:\"handle\";s:16:\"footerNavigation\";s:9:\"structure\";a:2:{s:3:\"uid\";s:36:\"42ff69c8-32c0-4837-9f40-ea6677f5661f\";s:9:\"maxLevels\";i:2;}s:12:\"siteSettings\";a:1:{s:36:\"fc5e9046-d3d1-4ef3-bcf7-9b6177bb78f1\";a:3:{s:7:\"hasUrls\";b:0;s:9:\"uriFormat\";N;s:8:\"template\";N;}}s:12:\"fieldLayouts\";a:1:{s:36:\"cda1d38e-735e-494a-968b-8b0dc7700964\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:4:\"name\";s:17:\"Navigation Fields\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:2:{s:36:\"843b9622-89e0-487e-b37f-90e23cda73b3\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"c941c7f3-f574-44e0-857f-251d9aee095b\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}}}}}}}s:36:\"20cbfee4-ddd8-480b-beda-47886f631060\";a:5:{s:4:\"name\";s:13:\"POI Categoies\";s:6:\"handle\";s:12:\"poiCategoies\";s:9:\"structure\";a:2:{s:3:\"uid\";s:36:\"b4283f1a-a782-49d8-bdfc-4869f26fd089\";s:9:\"maxLevels\";N;}s:12:\"siteSettings\";a:1:{s:36:\"fc5e9046-d3d1-4ef3-bcf7-9b6177bb78f1\";a:3:{s:7:\"hasUrls\";b:0;s:9:\"uriFormat\";N;s:8:\"template\";N;}}s:12:\"fieldLayouts\";a:1:{s:36:\"4075d28a-65b5-40fd-a3e1-b5b8a2ffec26\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:1:{s:36:\"a4253329-16f4-40a5-8191-b6c9cacb4386\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}}}}}}}s:12:\"dateModified\";i:1556829812;s:5:\"email\";a:5:{s:9:\"fromEmail\";s:21:\"$SYSTEM_EMAIL_ADDRESS\";s:8:\"fromName\";s:10:\"$SITE_NAME\";s:8:\"template\";N;s:13:\"transportType\";s:37:\"craft\\mail\\transportadapters\\Sendmail\";s:17:\"transportSettings\";N;}s:11:\"fieldGroups\";a:5:{s:36:\"9f1def97-9d33-4ffd-b30f-77f9735f8ea1\";a:1:{s:4:\"name\";s:6:\"Common\";}s:36:\"09461dfb-ed91-49de-9e46-4fcf9bc7922c\";a:1:{s:4:\"name\";s:17:\"Navigation Fields\";}s:36:\"7185efd2-e07e-411d-a469-aa3f8e7b6fa3\";a:1:{s:4:\"name\";s:13:\"Global Fields\";}s:36:\"0ea6515f-5e3e-47d6-89e6-cc2dfb28206c\";a:1:{s:4:\"name\";s:13:\"Footer Fields\";}s:36:\"f4b5e0bc-41ae-4250-830a-8b09f0d387d8\";a:1:{s:4:\"name\";s:25:\"Points of Interest Fields\";}}s:6:\"fields\";a:18:{s:36:\"f7fd636f-ead5-4d65-a8ae-1d5ca3f6ec76\";a:10:{s:4:\"name\";s:4:\"Body\";s:6:\"handle\";s:4:\"body\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:20:\"craft\\redactor\\Field\";s:8:\"settings\";a:10:{s:14:\"redactorConfig\";s:13:\"Standard.json\";s:14:\"purifierConfig\";s:0:\"\";s:11:\"cleanupHtml\";b:1;s:18:\"removeInlineStyles\";s:1:\"1\";s:15:\"removeEmptyTags\";s:1:\"1\";s:10:\"removeNbsp\";s:1:\"1\";s:10:\"purifyHtml\";s:1:\"1\";s:10:\"columnType\";s:4:\"text\";s:16:\"availableVolumes\";s:1:\"*\";s:19:\"availableTransforms\";s:1:\"*\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"9f1def97-9d33-4ffd-b30f-77f9735f8ea1\";}s:36:\"cac475d8-6f45-425f-8e92-6e0c1bd72109\";a:10:{s:4:\"name\";s:3:\"SEO\";s:6:\"handle\";s:3:\"seo\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:25:\"ether\\seo\\fields\\SeoField\";s:8:\"settings\";a:7:{s:11:\"titleSuffix\";N;s:14:\"suffixAsPrefix\";N;s:5:\"title\";a:2:{i:0;a:3:{s:3:\"key\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:8:\"template\";s:7:\"{title}\";}i:1;a:3:{s:3:\"key\";s:1:\"2\";s:6:\"locked\";s:1:\"0\";s:8:\"template\";s:17:\" - {{ siteName }}\";}}s:11:\"description\";s:0:\"\";s:11:\"socialImage\";s:0:\"\";s:10:\"hideSocial\";s:0:\"\";s:6:\"robots\";a:6:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:5;s:0:\"\";}}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"9f1def97-9d33-4ffd-b30f-77f9735f8ea1\";}s:36:\"507e655e-04cc-4b5d-a4d7-6a6f8aca2990\";a:10:{s:4:\"name\";s:13:\"Module Matrix\";s:6:\"handle\";s:12:\"moduleMatrix\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"site\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:19:\"craft\\fields\\Matrix\";s:8:\"settings\";a:4:{s:9:\"minBlocks\";s:0:\"\";s:9:\"maxBlocks\";s:0:\"\";s:12:\"contentTable\";s:31:\"{{%matrixcontent_modulematrix}}\";s:14:\"localizeBlocks\";b:0;}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";s:36:\"9f1def97-9d33-4ffd-b30f-77f9735f8ea1\";}s:36:\"843b9622-89e0-487e-b37f-90e23cda73b3\";a:10:{s:4:\"name\";s:22:\"Navigation Destination\";s:6:\"handle\";s:21:\"navigationDestination\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"site\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:20:\"craft\\fields\\Entries\";s:8:\"settings\";a:7:{s:7:\"sources\";a:1:{i:0;s:44:\"section:a8e283f3-6ac5-4c16-b9f9-2fc3a99ccaf3\";}s:6:\"source\";N;s:12:\"targetSiteId\";N;s:8:\"viewMode\";N;s:5:\"limit\";s:1:\"1\";s:14:\"selectionLabel\";s:0:\"\";s:17:\"localizeRelations\";b:0;}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";s:36:\"09461dfb-ed91-49de-9e46-4fcf9bc7922c\";}s:36:\"c941c7f3-f574-44e0-857f-251d9aee095b\";a:10:{s:4:\"name\";s:31:\"Navigation Destination External\";s:6:\"handle\";s:29:\"navigationDestinationExternal\";s:12:\"instructions\";s:118:\"If populated, this will override the other navigation destination field. Used for linking outside the current website.\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:16:\"craft\\fields\\Url\";s:8:\"settings\";a:2:{s:11:\"placeholder\";s:0:\"\";s:9:\"maxLength\";s:3:\"255\";}s:17:\"contentColumnType\";s:11:\"string(255)\";s:10:\"fieldGroup\";s:36:\"09461dfb-ed91-49de-9e46-4fcf9bc7922c\";}s:36:\"64612a7f-8e5a-40f3-ae8a-b22990f2a76a\";a:10:{s:4:\"name\";s:18:\"Social Media Links\";s:6:\"handle\";s:16:\"socialMediaLinks\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"site\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:19:\"craft\\fields\\Matrix\";s:8:\"settings\";a:4:{s:9:\"minBlocks\";s:0:\"\";s:9:\"maxBlocks\";s:0:\"\";s:12:\"contentTable\";s:35:\"{{%matrixcontent_socialmedialinks}}\";s:14:\"localizeBlocks\";b:0;}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";s:36:\"0ea6515f-5e3e-47d6-89e6-cc2dfb28206c\";}s:36:\"f28977d8-12bd-405e-8af9-70028a389173\";a:10:{s:4:\"name\";s:14:\"Footer Address\";s:6:\"handle\";s:13:\"footerAddress\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:20:\"craft\\redactor\\Field\";s:8:\"settings\";a:10:{s:14:\"redactorConfig\";s:11:\"Simple.json\";s:14:\"purifierConfig\";s:0:\"\";s:11:\"cleanupHtml\";b:1;s:18:\"removeInlineStyles\";s:1:\"1\";s:15:\"removeEmptyTags\";s:1:\"1\";s:10:\"removeNbsp\";s:1:\"1\";s:10:\"purifyHtml\";s:1:\"1\";s:10:\"columnType\";s:4:\"text\";s:16:\"availableVolumes\";s:1:\"*\";s:19:\"availableTransforms\";s:1:\"*\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"0ea6515f-5e3e-47d6-89e6-cc2dfb28206c\";}s:36:\"a4253329-16f4-40a5-8191-b6c9cacb4386\";a:10:{s:4:\"name\";s:4:\"Icon\";s:6:\"handle\";s:4:\"icon\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"site\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:19:\"craft\\fields\\Assets\";s:8:\"settings\";a:14:{s:15:\"useSingleFolder\";s:0:\"\";s:27:\"defaultUploadLocationSource\";s:43:\"volume:c9edfe95-9cbc-42b3-9fdf-52b85c8aefbd\";s:28:\"defaultUploadLocationSubpath\";s:0:\"\";s:26:\"singleUploadLocationSource\";s:43:\"volume:c9edfe95-9cbc-42b3-9fdf-52b85c8aefbd\";s:27:\"singleUploadLocationSubpath\";s:0:\"\";s:13:\"restrictFiles\";s:1:\"1\";s:12:\"allowedKinds\";a:1:{i:0;s:5:\"image\";}s:7:\"sources\";s:1:\"*\";s:6:\"source\";N;s:12:\"targetSiteId\";N;s:8:\"viewMode\";s:4:\"list\";s:5:\"limit\";s:1:\"1\";s:14:\"selectionLabel\";s:0:\"\";s:17:\"localizeRelations\";b:0;}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";s:36:\"9f1def97-9d33-4ffd-b30f-77f9735f8ea1\";}s:36:\"d03ae7a8-0842-47a6-ba70-0e88b66606fe\";a:10:{s:4:\"name\";s:12:\"External URL\";s:6:\"handle\";s:11:\"externalUrl\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:16:\"craft\\fields\\Url\";s:8:\"settings\";a:2:{s:11:\"placeholder\";s:0:\"\";s:9:\"maxLength\";s:3:\"255\";}s:17:\"contentColumnType\";s:11:\"string(255)\";s:10:\"fieldGroup\";s:36:\"9f1def97-9d33-4ffd-b30f-77f9735f8ea1\";}s:36:\"35151fed-eefa-4587-b2db-d497f43ae53f\";a:10:{s:4:\"name\";s:4:\"City\";s:6:\"handle\";s:4:\"city\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"f4b5e0bc-41ae-4250-830a-8b09f0d387d8\";}s:36:\"2f3c8efd-0302-4a0f-a6e9-e9249786837b\";a:10:{s:4:\"name\";s:5:\"State\";s:6:\"handle\";s:5:\"state\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"f4b5e0bc-41ae-4250-830a-8b09f0d387d8\";}s:36:\"472e8a0f-b628-4886-86d0-f43ec6040992\";a:10:{s:4:\"name\";s:3:\"Zip\";s:6:\"handle\";s:3:\"zip\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"f4b5e0bc-41ae-4250-830a-8b09f0d387d8\";}s:36:\"51a54ed3-89a7-4f0c-ae90-31cfdb312062\";a:10:{s:4:\"name\";s:7:\"Website\";s:6:\"handle\";s:7:\"website\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:16:\"craft\\fields\\Url\";s:8:\"settings\";a:2:{s:11:\"placeholder\";s:0:\"\";s:9:\"maxLength\";s:3:\"255\";}s:17:\"contentColumnType\";s:11:\"string(255)\";s:10:\"fieldGroup\";s:36:\"f4b5e0bc-41ae-4250-830a-8b09f0d387d8\";}s:36:\"f11b6b46-a9c6-4978-861a-84bf94203268\";a:10:{s:4:\"name\";s:14:\"Street Address\";s:6:\"handle\";s:13:\"streetAddress\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"f4b5e0bc-41ae-4250-830a-8b09f0d387d8\";}s:36:\"8904b186-5234-430a-87bf-2471e93da859\";a:10:{s:4:\"name\";s:5:\"Phone\";s:6:\"handle\";s:5:\"phone\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"f4b5e0bc-41ae-4250-830a-8b09f0d387d8\";}s:36:\"7e118e6e-f58c-42c2-a752-17cbfccfb5f8\";a:10:{s:4:\"name\";s:9:\"Longitude\";s:6:\"handle\";s:9:\"longitude\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"f4b5e0bc-41ae-4250-830a-8b09f0d387d8\";}s:36:\"40b4824c-f6cf-41b0-93dc-3e3e88e02c8e\";a:10:{s:4:\"name\";s:8:\"Latitude\";s:6:\"handle\";s:8:\"latitude\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";s:36:\"f4b5e0bc-41ae-4250-830a-8b09f0d387d8\";}s:36:\"37af6612-3771-4c55-9cbd-da9a3bac6835\";a:10:{s:4:\"name\";s:12:\"POI Category\";s:6:\"handle\";s:11:\"poiCategory\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"site\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:23:\"craft\\fields\\Categories\";s:8:\"settings\";a:8:{s:11:\"branchLimit\";s:1:\"1\";s:7:\"sources\";s:1:\"*\";s:6:\"source\";s:42:\"group:20cbfee4-ddd8-480b-beda-47886f631060\";s:12:\"targetSiteId\";N;s:8:\"viewMode\";N;s:5:\"limit\";N;s:14:\"selectionLabel\";s:0:\"\";s:17:\"localizeRelations\";b:0;}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";s:36:\"f4b5e0bc-41ae-4250-830a-8b09f0d387d8\";}}s:10:\"globalSets\";a:2:{s:36:\"e08f666b-b0b0-4be0-9630-d4314519bd01\";a:2:{s:4:\"name\";s:13:\"Footer Fields\";s:6:\"handle\";s:12:\"footerFields\";}s:36:\"71a3be8f-e93e-47bd-9cca-4311a9d395ac\";a:2:{s:4:\"name\";s:13:\"Other Globals\";s:6:\"handle\";s:12:\"otherGlobals\";}}s:16:\"matrixBlockTypes\";a:6:{s:36:\"3d20b894-240e-4f1d-bfa6-cb5dac7d444a\";a:6:{s:5:\"field\";s:36:\"507e655e-04cc-4b5d-a4d7-6a6f8aca2990\";s:4:\"name\";s:11:\"Text Module\";s:6:\"handle\";s:10:\"textModule\";s:9:\"sortOrder\";i:2;s:6:\"fields\";a:4:{s:36:\"01fc2383-a7a7-43d6-8909-c7f92c961cea\";a:10:{s:4:\"name\";s:12:\"Content Area\";s:6:\"handle\";s:11:\"contentArea\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:20:\"craft\\redactor\\Field\";s:8:\"settings\";a:10:{s:14:\"redactorConfig\";s:13:\"Standard.json\";s:14:\"purifierConfig\";s:0:\"\";s:11:\"cleanupHtml\";b:1;s:18:\"removeInlineStyles\";s:1:\"1\";s:15:\"removeEmptyTags\";s:1:\"1\";s:10:\"removeNbsp\";s:1:\"1\";s:10:\"purifyHtml\";s:1:\"1\";s:10:\"columnType\";s:4:\"text\";s:16:\"availableVolumes\";s:1:\"*\";s:19:\"availableTransforms\";s:1:\"*\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"c78256c3-b899-4b9e-a7ad-15bb1d0f0c40\";a:10:{s:4:\"name\";s:12:\"Module Width\";s:6:\"handle\";s:11:\"moduleWidth\";s:12:\"instructions\";s:70:\"Number of columns the text will take up. 1 is the minimum, maximum 16.\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:19:\"craft\\fields\\Number\";s:8:\"settings\";a:7:{s:12:\"defaultValue\";s:1:\"8\";s:3:\"min\";s:1:\"1\";s:3:\"max\";s:2:\"16\";s:8:\"decimals\";i:0;s:4:\"size\";N;s:6:\"prefix\";s:0:\"\";s:6:\"suffix\";s:0:\"\";}s:17:\"contentColumnType\";s:11:\"smallint(2)\";s:10:\"fieldGroup\";N;}s:36:\"93068180-e0ad-4f30-8742-e483d4593450\";a:10:{s:4:\"name\";s:13:\"Center Module\";s:6:\"handle\";s:12:\"centerModule\";s:12:\"instructions\";s:35:\"Will center text area if check off.\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:24:\"craft\\fields\\Lightswitch\";s:8:\"settings\";a:1:{s:7:\"default\";s:0:\"\";}s:17:\"contentColumnType\";s:7:\"boolean\";s:10:\"fieldGroup\";N;}s:36:\"864f6fdc-1125-4f96-abb7-f9bc5b9c940f\";a:10:{s:4:\"name\";s:16:\"No Margin Bottom\";s:6:\"handle\";s:14:\"noMarginBottom\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:24:\"craft\\fields\\Lightswitch\";s:8:\"settings\";a:1:{s:7:\"default\";s:0:\"\";}s:17:\"contentColumnType\";s:7:\"boolean\";s:10:\"fieldGroup\";N;}}s:12:\"fieldLayouts\";a:1:{s:36:\"773641f2-a4f5-483a-8bac-7cfaa7d84f72\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:4:{s:36:\"01fc2383-a7a7-43d6-8909-c7f92c961cea\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"c78256c3-b899-4b9e-a7ad-15bb1d0f0c40\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"93068180-e0ad-4f30-8742-e483d4593450\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}s:36:\"864f6fdc-1125-4f96-abb7-f9bc5b9c940f\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}}}}}}}s:36:\"05524c18-7ed5-4cd2-af86-df0e039cefc7\";a:6:{s:5:\"field\";s:36:\"64612a7f-8e5a-40f3-ae8a-b22990f2a76a\";s:4:\"name\";s:7:\"Account\";s:6:\"handle\";s:7:\"account\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:3:{s:36:\"0b8ea91c-ba2c-4d6c-a109-b3fcae2910ca\";a:10:{s:4:\"name\";s:17:\"Social Media Name\";s:6:\"handle\";s:15:\"socialMediaName\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:0:\"\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"7c4d11c4-20a6-4377-b7da-a3bd0a6621fa\";a:10:{s:4:\"name\";s:17:\"Social Media Link\";s:6:\"handle\";s:15:\"socialMediaLink\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:16:\"craft\\fields\\Url\";s:8:\"settings\";a:2:{s:11:\"placeholder\";s:0:\"\";s:9:\"maxLength\";s:3:\"255\";}s:17:\"contentColumnType\";s:11:\"string(255)\";s:10:\"fieldGroup\";N;}s:36:\"d23ac834-e93a-45bc-af3a-33a600c90046\";a:10:{s:4:\"name\";s:17:\"Social Media Icon\";s:6:\"handle\";s:15:\"socialMediaIcon\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"site\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:19:\"craft\\fields\\Assets\";s:8:\"settings\";a:14:{s:15:\"useSingleFolder\";s:0:\"\";s:27:\"defaultUploadLocationSource\";s:43:\"volume:c9edfe95-9cbc-42b3-9fdf-52b85c8aefbd\";s:28:\"defaultUploadLocationSubpath\";s:0:\"\";s:26:\"singleUploadLocationSource\";s:43:\"volume:c9edfe95-9cbc-42b3-9fdf-52b85c8aefbd\";s:27:\"singleUploadLocationSubpath\";s:0:\"\";s:13:\"restrictFiles\";s:1:\"1\";s:12:\"allowedKinds\";a:1:{i:0;s:5:\"image\";}s:7:\"sources\";s:1:\"*\";s:6:\"source\";N;s:12:\"targetSiteId\";N;s:8:\"viewMode\";s:4:\"list\";s:5:\"limit\";s:1:\"1\";s:14:\"selectionLabel\";s:11:\"Add an icon\";s:17:\"localizeRelations\";b:0;}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}}s:12:\"fieldLayouts\";a:1:{s:36:\"f516b9a7-7d1e-458d-a4d3-b3391be2bc9e\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:3:{s:36:\"0b8ea91c-ba2c-4d6c-a109-b3fcae2910ca\";a:2:{s:8:\"required\";b:1;s:9:\"sortOrder\";i:1;}s:36:\"7c4d11c4-20a6-4377-b7da-a3bd0a6621fa\";a:2:{s:8:\"required\";b:1;s:9:\"sortOrder\";i:2;}s:36:\"d23ac834-e93a-45bc-af3a-33a600c90046\";a:2:{s:8:\"required\";b:1;s:9:\"sortOrder\";i:3;}}}}}}}s:36:\"8e542ee2-4f05-41e2-9ffe-e5e45c9bbc26\";a:6:{s:5:\"field\";s:36:\"507e655e-04cc-4b5d-a4d7-6a6f8aca2990\";s:4:\"name\";s:12:\"Image Module\";s:6:\"handle\";s:11:\"imageModule\";s:9:\"sortOrder\";i:3;s:6:\"fields\";a:7:{s:36:\"b0e41e4b-c762-4d27-a00d-50422ab7081d\";a:10:{s:4:\"name\";s:5:\"Image\";s:6:\"handle\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"site\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:19:\"craft\\fields\\Assets\";s:8:\"settings\";a:14:{s:15:\"useSingleFolder\";s:0:\"\";s:27:\"defaultUploadLocationSource\";s:43:\"volume:c9edfe95-9cbc-42b3-9fdf-52b85c8aefbd\";s:28:\"defaultUploadLocationSubpath\";s:0:\"\";s:26:\"singleUploadLocationSource\";s:43:\"volume:c9edfe95-9cbc-42b3-9fdf-52b85c8aefbd\";s:27:\"singleUploadLocationSubpath\";s:0:\"\";s:13:\"restrictFiles\";s:1:\"1\";s:12:\"allowedKinds\";a:1:{i:0;s:5:\"image\";}s:7:\"sources\";s:1:\"*\";s:6:\"source\";N;s:12:\"targetSiteId\";N;s:8:\"viewMode\";s:4:\"list\";s:5:\"limit\";s:1:\"1\";s:14:\"selectionLabel\";s:0:\"\";s:17:\"localizeRelations\";b:0;}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}s:36:\"d93bb87d-6ee0-405c-b4c9-a057e6450a2f\";a:10:{s:4:\"name\";s:7:\"Caption\";s:6:\"handle\";s:7:\"caption\";s:12:\"instructions\";s:9:\"Optional.\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:20:\"craft\\redactor\\Field\";s:8:\"settings\";a:10:{s:14:\"redactorConfig\";s:13:\"Standard.json\";s:14:\"purifierConfig\";s:0:\"\";s:11:\"cleanupHtml\";b:1;s:18:\"removeInlineStyles\";s:1:\"1\";s:15:\"removeEmptyTags\";s:1:\"1\";s:10:\"removeNbsp\";s:1:\"1\";s:10:\"purifyHtml\";s:1:\"1\";s:10:\"columnType\";s:4:\"text\";s:16:\"availableVolumes\";s:0:\"\";s:19:\"availableTransforms\";s:1:\"*\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"f4bfef83-9e6a-4faa-9d7f-da9a4d150ed4\";a:10:{s:4:\"name\";s:11:\"Image Width\";s:6:\"handle\";s:10:\"imageWidth\";s:12:\"instructions\";s:70:\"Number of columns an image will take up. 1 is the minimum, maximum 16.\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:19:\"craft\\fields\\Number\";s:8:\"settings\";a:7:{s:12:\"defaultValue\";s:2:\"12\";s:3:\"min\";s:1:\"1\";s:3:\"max\";s:2:\"16\";s:8:\"decimals\";i:0;s:4:\"size\";N;s:6:\"prefix\";s:0:\"\";s:6:\"suffix\";s:0:\"\";}s:17:\"contentColumnType\";s:11:\"smallint(2)\";s:10:\"fieldGroup\";N;}s:36:\"9391bf59-487e-49aa-86a0-e9b4a26409a1\";a:10:{s:4:\"name\";s:17:\"Mobile Percentage\";s:6:\"handle\";s:16:\"mobilePercentage\";s:12:\"instructions\";s:71:\"Percentage of the screen that the image will take up on mobile devices.\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:19:\"craft\\fields\\Number\";s:8:\"settings\";a:7:{s:12:\"defaultValue\";N;s:3:\"min\";s:1:\"1\";s:3:\"max\";s:3:\"100\";s:8:\"decimals\";i:0;s:4:\"size\";N;s:6:\"prefix\";s:0:\"\";s:6:\"suffix\";s:0:\"\";}s:17:\"contentColumnType\";s:11:\"smallint(3)\";s:10:\"fieldGroup\";N;}s:36:\"6027b9e9-e395-455c-af57-38e30d010819\";a:10:{s:4:\"name\";s:10:\"Max Height\";s:6:\"handle\";s:9:\"maxHeight\";s:12:\"instructions\";s:9:\"In pixels\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:19:\"craft\\fields\\Number\";s:8:\"settings\";a:7:{s:12:\"defaultValue\";N;s:3:\"min\";s:1:\"0\";s:3:\"max\";N;s:8:\"decimals\";i:0;s:4:\"size\";N;s:6:\"prefix\";s:0:\"\";s:6:\"suffix\";s:0:\"\";}s:17:\"contentColumnType\";s:11:\"integer(10)\";s:10:\"fieldGroup\";N;}s:36:\"2a151c25-9a1e-45d5-be19-9985f4f3b5b6\";a:10:{s:4:\"name\";s:10:\"Full Width\";s:6:\"handle\";s:9:\"fullWidth\";s:12:\"instructions\";s:68:\"This will override the \"Image Width\" and \"Mobile Percentage\" fields.\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:24:\"craft\\fields\\Lightswitch\";s:8:\"settings\";a:1:{s:7:\"default\";s:0:\"\";}s:17:\"contentColumnType\";s:7:\"boolean\";s:10:\"fieldGroup\";N;}s:36:\"6dfa4405-c4b8-4f78-b31c-d053cb248816\";a:10:{s:4:\"name\";s:16:\"No Margin Bottom\";s:6:\"handle\";s:14:\"noMarginBottom\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:24:\"craft\\fields\\Lightswitch\";s:8:\"settings\";a:1:{s:7:\"default\";s:0:\"\";}s:17:\"contentColumnType\";s:7:\"boolean\";s:10:\"fieldGroup\";N;}}s:12:\"fieldLayouts\";a:1:{s:36:\"37513270-b00f-46c8-a463-b8aaf12abdf0\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:7:{s:36:\"b0e41e4b-c762-4d27-a00d-50422ab7081d\";a:2:{s:8:\"required\";b:1;s:9:\"sortOrder\";i:1;}s:36:\"d93bb87d-6ee0-405c-b4c9-a057e6450a2f\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"f4bfef83-9e6a-4faa-9d7f-da9a4d150ed4\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}s:36:\"9391bf59-487e-49aa-86a0-e9b4a26409a1\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}s:36:\"6027b9e9-e395-455c-af57-38e30d010819\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:5;}s:36:\"2a151c25-9a1e-45d5-be19-9985f4f3b5b6\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:6;}s:36:\"6dfa4405-c4b8-4f78-b31c-d053cb248816\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:7;}}}}}}}s:36:\"4996e920-0227-4240-9edc-cda20818964c\";a:6:{s:5:\"field\";s:36:\"507e655e-04cc-4b5d-a4d7-6a6f8aca2990\";s:4:\"name\";s:11:\"Form Module\";s:6:\"handle\";s:10:\"formModule\";s:9:\"sortOrder\";i:4;s:6:\"fields\";a:7:{s:36:\"d9e49f7c-44c2-4e9d-8886-976daa0794df\";a:10:{s:4:\"name\";s:12:\"Content Area\";s:6:\"handle\";s:11:\"contentArea\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:20:\"craft\\redactor\\Field\";s:8:\"settings\";a:10:{s:14:\"redactorConfig\";s:13:\"Standard.json\";s:14:\"purifierConfig\";s:0:\"\";s:11:\"cleanupHtml\";b:1;s:18:\"removeInlineStyles\";s:1:\"1\";s:15:\"removeEmptyTags\";s:1:\"1\";s:10:\"removeNbsp\";s:1:\"1\";s:10:\"purifyHtml\";s:1:\"1\";s:10:\"columnType\";s:4:\"text\";s:16:\"availableVolumes\";s:1:\"*\";s:19:\"availableTransforms\";s:1:\"*\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"7f54df4f-0078-48ce-a681-2b4062fec75d\";a:9:{s:4:\"name\";s:4:\"Form\";s:6:\"handle\";s:4:\"form\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:26:\"wheelform\\fields\\FormField\";s:17:\"contentColumnType\";s:7:\"integer\";s:10:\"fieldGroup\";N;}s:36:\"fc69218b-1149-44c8-9162-1b3e479a4cfe\";a:10:{s:4:\"name\";s:11:\"Button Text\";s:6:\"handle\";s:10:\"buttonText\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:6:\"Submit\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"bfc45612-9863-4e24-9726-cc944228f1ed\";a:10:{s:4:\"name\";s:12:\"Success Text\";s:6:\"handle\";s:11:\"successText\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:29:\"Thank you, we\'ll be in touch.\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"15f0077a-39fd-4e1e-b41d-2e78ea30493b\";a:10:{s:4:\"name\";s:12:\"Failure Text\";s:6:\"handle\";s:11:\"failureText\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:22:\"craft\\fields\\PlainText\";s:8:\"settings\";a:6:{s:11:\"placeholder\";s:45:\"Something went wrong, please try again later.\";s:4:\"code\";s:0:\"\";s:9:\"multiline\";s:0:\"\";s:11:\"initialRows\";s:1:\"4\";s:9:\"charLimit\";s:0:\"\";s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"8a0e6ffa-f55b-4aab-b478-ad4ff67933a3\";a:10:{s:4:\"name\";s:14:\"Form Alignment\";s:6:\"handle\";s:13:\"formAlignment\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:25:\"craft\\fields\\RadioButtons\";s:8:\"settings\";a:1:{s:7:\"options\";a:2:{i:0;a:3:{s:5:\"label\";s:9:\"Form Left\";s:5:\"value\";s:9:\"form-left\";s:7:\"default\";s:0:\"\";}i:1;a:3:{s:5:\"label\";s:10:\"Form Right\";s:5:\"value\";s:10:\"form-right\";s:7:\"default\";s:1:\"1\";}}}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}s:36:\"19cade86-2f64-4be3-8b17-a72e38fd6fda\";a:10:{s:4:\"name\";s:16:\"No Margin Bottom\";s:6:\"handle\";s:14:\"noMarginBottom\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:24:\"craft\\fields\\Lightswitch\";s:8:\"settings\";a:1:{s:7:\"default\";s:0:\"\";}s:17:\"contentColumnType\";s:7:\"boolean\";s:10:\"fieldGroup\";N;}}s:12:\"fieldLayouts\";a:1:{s:36:\"e072813e-6804-48aa-bd9f-d816e3980d25\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:7:{s:36:\"d9e49f7c-44c2-4e9d-8886-976daa0794df\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"7f54df4f-0078-48ce-a681-2b4062fec75d\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"fc69218b-1149-44c8-9162-1b3e479a4cfe\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}s:36:\"bfc45612-9863-4e24-9726-cc944228f1ed\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}s:36:\"15f0077a-39fd-4e1e-b41d-2e78ea30493b\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:5;}s:36:\"8a0e6ffa-f55b-4aab-b478-ad4ff67933a3\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:6;}s:36:\"19cade86-2f64-4be3-8b17-a72e38fd6fda\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:7;}}}}}}}s:36:\"76eae2e9-7001-4308-861b-716e3875cdd9\";a:6:{s:5:\"field\";s:36:\"507e655e-04cc-4b5d-a4d7-6a6f8aca2990\";s:4:\"name\";s:21:\"Image and Text Module\";s:6:\"handle\";s:18:\"imageAndTextModule\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:4:{s:36:\"711d4441-fdc8-44ab-a1ca-02b81ed3bdef\";a:10:{s:4:\"name\";s:12:\"Content Area\";s:6:\"handle\";s:11:\"contentArea\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:20:\"craft\\redactor\\Field\";s:8:\"settings\";a:10:{s:14:\"redactorConfig\";s:13:\"Standard.json\";s:14:\"purifierConfig\";s:0:\"\";s:11:\"cleanupHtml\";b:1;s:18:\"removeInlineStyles\";s:1:\"1\";s:15:\"removeEmptyTags\";s:1:\"1\";s:10:\"removeNbsp\";s:1:\"1\";s:10:\"purifyHtml\";s:1:\"1\";s:10:\"columnType\";s:4:\"text\";s:16:\"availableVolumes\";s:1:\"*\";s:19:\"availableTransforms\";s:1:\"*\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"66c466de-1ee2-4e00-927a-d06610ed5114\";a:10:{s:4:\"name\";s:5:\"Image\";s:6:\"handle\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"site\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:19:\"craft\\fields\\Assets\";s:8:\"settings\";a:14:{s:15:\"useSingleFolder\";s:0:\"\";s:27:\"defaultUploadLocationSource\";s:43:\"volume:c9edfe95-9cbc-42b3-9fdf-52b85c8aefbd\";s:28:\"defaultUploadLocationSubpath\";s:0:\"\";s:26:\"singleUploadLocationSource\";s:43:\"volume:c9edfe95-9cbc-42b3-9fdf-52b85c8aefbd\";s:27:\"singleUploadLocationSubpath\";s:0:\"\";s:13:\"restrictFiles\";s:1:\"1\";s:12:\"allowedKinds\";a:1:{i:0;s:5:\"image\";}s:7:\"sources\";s:1:\"*\";s:6:\"source\";N;s:12:\"targetSiteId\";N;s:8:\"viewMode\";s:4:\"list\";s:5:\"limit\";s:1:\"1\";s:14:\"selectionLabel\";s:0:\"\";s:17:\"localizeRelations\";b:0;}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}s:36:\"8a25071b-a158-493f-9695-2897b99defb7\";a:10:{s:4:\"name\";s:15:\"Image Alignment\";s:6:\"handle\";s:14:\"imageAlignment\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:25:\"craft\\fields\\RadioButtons\";s:8:\"settings\";a:1:{s:7:\"options\";a:2:{i:0;a:3:{s:5:\"label\";s:10:\"Image Left\";s:5:\"value\";s:10:\"image-left\";s:7:\"default\";s:0:\"\";}i:1;a:3:{s:5:\"label\";s:11:\"Image Right\";s:5:\"value\";s:11:\"image-right\";s:7:\"default\";s:1:\"1\";}}}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}s:36:\"8f711c2b-b2b8-4f53-8323-0d2984886e25\";a:10:{s:4:\"name\";s:16:\"No Margin Bottom\";s:6:\"handle\";s:14:\"noMarginBottom\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:24:\"craft\\fields\\Lightswitch\";s:8:\"settings\";a:1:{s:7:\"default\";s:0:\"\";}s:17:\"contentColumnType\";s:7:\"boolean\";s:10:\"fieldGroup\";N;}}s:12:\"fieldLayouts\";a:1:{s:36:\"469f8dcb-4e2a-4d33-8b74-5f62e019d2a4\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:4:{s:36:\"711d4441-fdc8-44ab-a1ca-02b81ed3bdef\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"66c466de-1ee2-4e00-927a-d06610ed5114\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"8a25071b-a158-493f-9695-2897b99defb7\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}s:36:\"8f711c2b-b2b8-4f53-8323-0d2984886e25\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}}}}}}}s:36:\"52f3f6f3-8410-4bc7-b5a7-17d6a04cd561\";a:6:{s:5:\"field\";s:36:\"507e655e-04cc-4b5d-a4d7-6a6f8aca2990\";s:4:\"name\";s:10:\"Map Module\";s:6:\"handle\";s:9:\"mapModule\";s:9:\"sortOrder\";i:5;s:6:\"fields\";a:5:{s:36:\"ee2cb757-59a2-4ee4-a116-67415806929d\";a:10:{s:4:\"name\";s:12:\"Content Area\";s:6:\"handle\";s:11:\"contentArea\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:20:\"craft\\redactor\\Field\";s:8:\"settings\";a:10:{s:14:\"redactorConfig\";s:13:\"Standard.json\";s:14:\"purifierConfig\";s:0:\"\";s:11:\"cleanupHtml\";b:1;s:18:\"removeInlineStyles\";s:1:\"1\";s:15:\"removeEmptyTags\";s:1:\"1\";s:10:\"removeNbsp\";s:1:\"1\";s:10:\"purifyHtml\";s:1:\"1\";s:10:\"columnType\";s:4:\"text\";s:16:\"availableVolumes\";s:1:\"*\";s:19:\"availableTransforms\";s:1:\"*\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"32ee9990-ee8e-4ba7-9c34-971922dba5f7\";a:10:{s:4:\"name\";s:13:\"Popup Content\";s:6:\"handle\";s:12:\"popupContent\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:20:\"craft\\redactor\\Field\";s:8:\"settings\";a:10:{s:14:\"redactorConfig\";s:13:\"Standard.json\";s:14:\"purifierConfig\";s:0:\"\";s:11:\"cleanupHtml\";b:1;s:18:\"removeInlineStyles\";s:1:\"1\";s:15:\"removeEmptyTags\";s:1:\"1\";s:10:\"removeNbsp\";s:1:\"1\";s:10:\"purifyHtml\";s:1:\"1\";s:10:\"columnType\";s:4:\"text\";s:16:\"availableVolumes\";s:1:\"*\";s:19:\"availableTransforms\";s:1:\"*\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"7501f82d-c6ce-4ca3-b94d-43237d13e3a7\";a:10:{s:4:\"name\";s:20:\"Starting Coordinates\";s:6:\"handle\";s:19:\"startingCoordinates\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:18:\"craft\\fields\\Table\";s:8:\"settings\";a:6:{s:11:\"addRowLabel\";s:0:\"\";s:7:\"maxRows\";s:1:\"1\";s:7:\"minRows\";s:1:\"1\";s:7:\"columns\";a:2:{s:4:\"col1\";a:4:{s:7:\"heading\";s:9:\"Longitude\";s:6:\"handle\";s:9:\"longitude\";s:5:\"width\";s:0:\"\";s:4:\"type\";s:10:\"singleline\";}s:4:\"col2\";a:4:{s:7:\"heading\";s:8:\"Latitude\";s:6:\"handle\";s:8:\"latitude\";s:5:\"width\";s:0:\"\";s:4:\"type\";s:10:\"singleline\";}}s:8:\"defaults\";a:1:{i:0;a:2:{s:4:\"col1\";s:11:\"-97.7430608\";s:4:\"col2\";s:7:\"30.2672\";}}s:10:\"columnType\";s:4:\"text\";}s:17:\"contentColumnType\";s:4:\"text\";s:10:\"fieldGroup\";N;}s:36:\"c9ff355b-0655-4890-b16b-a24d1496419f\";a:10:{s:4:\"name\";s:28:\"Point of Interest Categories\";s:6:\"handle\";s:25:\"pointOfInterestCategories\";s:12:\"instructions\";s:85:\"If one or more categories are selected, it\'ll draw the points of interest on the map.\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"site\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:23:\"craft\\fields\\Categories\";s:8:\"settings\";a:8:{s:11:\"branchLimit\";s:0:\"\";s:7:\"sources\";s:1:\"*\";s:6:\"source\";s:42:\"group:20cbfee4-ddd8-480b-beda-47886f631060\";s:12:\"targetSiteId\";N;s:8:\"viewMode\";N;s:5:\"limit\";N;s:14:\"selectionLabel\";s:0:\"\";s:17:\"localizeRelations\";b:0;}s:17:\"contentColumnType\";s:6:\"string\";s:10:\"fieldGroup\";N;}s:36:\"9f6a6151-39a3-40d7-90e6-35b487c857fc\";a:10:{s:4:\"name\";s:16:\"No Margin Bottom\";s:6:\"handle\";s:14:\"noMarginBottom\";s:12:\"instructions\";s:0:\"\";s:10:\"searchable\";b:1;s:17:\"translationMethod\";s:4:\"none\";s:20:\"translationKeyFormat\";N;s:4:\"type\";s:24:\"craft\\fields\\Lightswitch\";s:8:\"settings\";a:1:{s:7:\"default\";s:0:\"\";}s:17:\"contentColumnType\";s:7:\"boolean\";s:10:\"fieldGroup\";N;}}s:12:\"fieldLayouts\";a:1:{s:36:\"d13b86c9-aa81-403b-8a38-ca6520553b7b\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:5:{s:36:\"ee2cb757-59a2-4ee4-a116-67415806929d\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"32ee9990-ee8e-4ba7-9c34-971922dba5f7\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"7501f82d-c6ce-4ca3-b94d-43237d13e3a7\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}s:36:\"c9ff355b-0655-4890-b16b-a24d1496419f\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}s:36:\"9f6a6151-39a3-40d7-90e6-35b487c857fc\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:5;}}}}}}}}s:7:\"plugins\";a:8:{s:6:\"imager\";a:3:{s:7:\"edition\";s:8:\"standard\";s:7:\"enabled\";b:1;s:13:\"schemaVersion\";s:5:\"2.0.0\";}s:19:\"imager-pretransform\";a:3:{s:7:\"edition\";s:8:\"standard\";s:7:\"enabled\";b:1;s:13:\"schemaVersion\";s:5:\"2.0.0\";}s:8:\"redactor\";a:3:{s:7:\"edition\";s:8:\"standard\";s:7:\"enabled\";b:1;s:13:\"schemaVersion\";s:5:\"2.3.0\";}s:22:\"redactor-custom-styles\";a:3:{s:7:\"edition\";s:8:\"standard\";s:7:\"enabled\";b:1;s:13:\"schemaVersion\";s:5:\"1.0.0\";}s:6:\"retcon\";a:3:{s:7:\"edition\";s:8:\"standard\";s:7:\"enabled\";b:1;s:13:\"schemaVersion\";s:5:\"1.0.0\";}s:3:\"seo\";a:4:{s:7:\"edition\";s:8:\"standard\";s:7:\"enabled\";b:1;s:13:\"schemaVersion\";s:5:\"3.1.0\";s:8:\"settings\";a:11:{s:11:\"sitemapName\";s:7:\"sitemap\";s:12:\"sitemapLimit\";s:4:\"1000\";s:11:\"titleSuffix\";N;s:5:\"title\";a:2:{i:0;a:3:{s:3:\"key\";s:1:\"1\";s:6:\"locked\";s:1:\"0\";s:8:\"template\";s:7:\"{title}\";}i:1;a:3:{s:3:\"key\";s:1:\"2\";s:6:\"locked\";s:1:\"0\";s:8:\"template\";s:17:\" - {{ siteName }}\";}}s:11:\"description\";s:0:\"\";s:11:\"socialImage\";s:0:\"\";s:12:\"metaTemplate\";s:0:\"\";s:6:\"robots\";a:6:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";i:3;s:0:\"\";i:4;s:0:\"\";i:5;s:0:\"\";}s:9:\"robotsTxt\";s:339:\"{# Sitemap URL #}\r\nSitemap: {{ url(seo.sitemapName ~ \'.xml\') }}\r\n\r\n{# Disallows #}\r\n{% if craft.app.config.env != \'production\' %}\r\n\r\n{# Disallow access to everything when NOT in production #}\r\nUser-agent: *\r\nDisallow: /\r\n\r\n{% else %}\r\n\r\n{# Disallow access to cpresources/ when live #}\r\nUser-agent: *\r\nDisallow: /cpresources/\r\n\r\n{% endif %}\";s:13:\"facebookAppId\";s:0:\"\";s:13:\"twitterHandle\";s:0:\"\";}}s:11:\"super-table\";a:3:{s:7:\"edition\";s:8:\"standard\";s:7:\"enabled\";b:1;s:13:\"schemaVersion\";s:6:\"2.0.10\";}s:9:\"wheelform\";a:4:{s:7:\"edition\";s:8:\"standard\";s:7:\"enabled\";b:1;s:13:\"schemaVersion\";s:5:\"1.6.0\";s:8:\"settings\";a:7:{s:10:\"from_email\";s:21:\"tim@lookthinkmake.com\";s:8:\"cp_label\";s:5:\"Forms\";s:15:\"success_message\";s:50:\"Thank You! we will review your submission shortly.\";s:9:\"volume_id\";s:1:\"2\";s:17:\"recaptcha_version\";s:1:\"3\";s:16:\"recaptcha_public\";s:0:\"\";s:16:\"recaptcha_secret\";s:0:\"\";}}}s:8:\"sections\";a:2:{s:36:\"a8e283f3-6ac5-4c16-b9f9-2fc3a99ccaf3\";a:8:{s:4:\"name\";s:13:\"Site Sections\";s:6:\"handle\";s:12:\"siteSections\";s:4:\"type\";s:9:\"structure\";s:16:\"enableVersioning\";b:1;s:16:\"propagateEntries\";b:1;s:12:\"siteSettings\";a:1:{s:36:\"fc5e9046-d3d1-4ef3-bcf7-9b6177bb78f1\";a:4:{s:16:\"enabledByDefault\";b:1;s:7:\"hasUrls\";b:1;s:9:\"uriFormat\";s:19:\"{parent.uri}/{slug}\";s:8:\"template\";s:16:\"default-template\";}}s:9:\"structure\";a:2:{s:3:\"uid\";s:36:\"39731bbc-08c8-4926-b1d6-cf4fa24dac0a\";s:9:\"maxLevels\";N;}s:10:\"entryTypes\";a:2:{s:36:\"dcfa41be-0743-47bd-bc2e-05877a077c75\";a:7:{s:4:\"name\";s:11:\"Module Page\";s:6:\"handle\";s:10:\"modulePage\";s:13:\"hasTitleField\";b:1;s:10:\"titleLabel\";s:5:\"Title\";s:11:\"titleFormat\";s:0:\"\";s:9:\"sortOrder\";i:1;s:12:\"fieldLayouts\";a:1:{s:36:\"a1b15a75-992e-4cda-9344-51ebaa454b86\";a:1:{s:4:\"tabs\";a:2:{i:0;a:3:{s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:1:{s:36:\"507e655e-04cc-4b5d-a4d7-6a6f8aca2990\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}}i:1;a:3:{s:4:\"name\";s:3:\"SEO\";s:9:\"sortOrder\";i:2;s:6:\"fields\";a:1:{s:36:\"cac475d8-6f45-425f-8e92-6e0c1bd72109\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}}}}}}s:36:\"5463c3e2-5d2e-4010-8ebf-a17cc94087bd\";a:7:{s:4:\"name\";s:10:\"Basic Page\";s:6:\"handle\";s:9:\"basicPage\";s:13:\"hasTitleField\";b:1;s:10:\"titleLabel\";s:5:\"Title\";s:11:\"titleFormat\";s:0:\"\";s:9:\"sortOrder\";i:2;s:12:\"fieldLayouts\";a:1:{s:36:\"bc79956c-e34a-4122-9307-806fef05d066\";a:1:{s:4:\"tabs\";a:2:{i:0;a:3:{s:4:\"name\";s:7:\"Content\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:1:{s:36:\"f7fd636f-ead5-4d65-a8ae-1d5ca3f6ec76\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}}i:1;a:3:{s:4:\"name\";s:3:\"SEO\";s:9:\"sortOrder\";i:2;s:6:\"fields\";a:1:{s:36:\"cac475d8-6f45-425f-8e92-6e0c1bd72109\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}}}}}}}}}s:36:\"9a82a87b-701a-4493-91aa-57f7f68211ae\";a:7:{s:4:\"name\";s:18:\"Points of Interest\";s:6:\"handle\";s:16:\"pointsOfInterest\";s:4:\"type\";s:7:\"channel\";s:16:\"enableVersioning\";b:1;s:16:\"propagateEntries\";b:1;s:12:\"siteSettings\";a:1:{s:36:\"fc5e9046-d3d1-4ef3-bcf7-9b6177bb78f1\";a:4:{s:16:\"enabledByDefault\";b:1;s:7:\"hasUrls\";b:0;s:9:\"uriFormat\";N;s:8:\"template\";N;}}s:10:\"entryTypes\";a:1:{s:36:\"d41782ff-12be-4c85-9677-753e29944392\";a:7:{s:4:\"name\";s:18:\"Points of Interest\";s:6:\"handle\";s:16:\"pointsOfInterest\";s:13:\"hasTitleField\";b:1;s:10:\"titleLabel\";s:5:\"Title\";s:11:\"titleFormat\";s:0:\"\";s:9:\"sortOrder\";i:1;s:12:\"fieldLayouts\";a:1:{s:36:\"613eccd1-0f46-49e9-a988-f8670892f6c1\";a:1:{s:4:\"tabs\";a:1:{i:0;a:3:{s:4:\"name\";s:25:\"Points of Interest Fields\";s:9:\"sortOrder\";i:1;s:6:\"fields\";a:9:{s:36:\"37af6612-3771-4c55-9cbd-da9a3bac6835\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:1;}s:36:\"f11b6b46-a9c6-4978-861a-84bf94203268\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:2;}s:36:\"35151fed-eefa-4587-b2db-d497f43ae53f\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:3;}s:36:\"2f3c8efd-0302-4a0f-a6e9-e9249786837b\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:4;}s:36:\"472e8a0f-b628-4886-86d0-f43ec6040992\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:5;}s:36:\"8904b186-5234-430a-87bf-2471e93da859\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:6;}s:36:\"51a54ed3-89a7-4f0c-ae90-31cfdb312062\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:7;}s:36:\"40b4824c-f6cf-41b0-93dc-3e3e88e02c8e\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:8;}s:36:\"7e118e6e-f58c-42c2-a752-17cbfccfb5f8\";a:2:{s:8:\"required\";b:0;s:9:\"sortOrder\";i:9;}}}}}}}}}}s:10:\"siteGroups\";a:1:{s:36:\"ef66ab2e-3044-4d28-af9b-b08c19db375b\";a:1:{s:4:\"name\";s:13:\"Craft3starter\";}}s:5:\"sites\";a:1:{s:36:\"fc5e9046-d3d1-4ef3-bcf7-9b6177bb78f1\";a:8:{s:7:\"baseUrl\";s:17:\"$DEFAULT_SITE_URL\";s:6:\"handle\";s:7:\"default\";s:7:\"hasUrls\";b:1;s:8:\"language\";s:5:\"en-US\";s:4:\"name\";s:13:\"Craft3starter\";s:7:\"primary\";b:1;s:9:\"siteGroup\";s:36:\"ef66ab2e-3044-4d28-af9b-b08c19db375b\";s:9:\"sortOrder\";i:1;}}s:6:\"system\";a:5:{s:7:\"edition\";s:4:\"solo\";s:4:\"name\";s:10:\"$SITE_NAME\";s:4:\"live\";b:1;s:13:\"schemaVersion\";s:6:\"3.1.27\";s:8:\"timeZone\";s:15:\"America/Chicago\";}s:5:\"users\";a:5:{s:24:\"requireEmailVerification\";b:1;s:23:\"allowPublicRegistration\";b:0;s:12:\"defaultGroup\";N;s:14:\"photoVolumeUid\";N;s:12:\"photoSubpath\";s:0:\"\";}s:7:\"volumes\";a:2:{s:36:\"c9edfe95-9cbc-42b3-9fdf-52b85c8aefbd\";a:7:{s:4:\"name\";s:6:\"Images\";s:6:\"handle\";s:6:\"images\";s:4:\"type\";s:19:\"craft\\volumes\\Local\";s:7:\"hasUrls\";b:1;s:3:\"url\";s:22:\"@baseUrl/assets/images\";s:8:\"settings\";a:1:{s:4:\"path\";s:23:\"@basePath/assets/images\";}s:9:\"sortOrder\";i:1;}s:36:\"a2e2df64-a586-491b-8079-2dfd536d00a5\";a:7:{s:4:\"name\";s:12:\"Form Uploads\";s:6:\"handle\";s:11:\"formUploads\";s:4:\"type\";s:19:\"craft\\volumes\\Local\";s:7:\"hasUrls\";b:0;s:3:\"url\";s:0:\"\";s:8:\"settings\";a:1:{s:4:\"path\";s:29:\"@basePath/assets/form-uploads\";}s:9:\"sortOrder\";i:2;}}}','{\"categoryGroups\":\"@config/project.yaml\",\"dateModified\":\"@config/project.yaml\",\"email\":\"@config/project.yaml\",\"fieldGroups\":\"@config/project.yaml\",\"fields\":\"@config/project.yaml\",\"matrixBlockTypes\":\"@config/project.yaml\",\"plugins\":\"@config/project.yaml\",\"sections\":\"@config/project.yaml\",\"siteGroups\":\"@config/project.yaml\",\"sites\":\"@config/project.yaml\",\"system\":\"@config/project.yaml\",\"users\":\"@config/project.yaml\",\"volumes\":\"@config/project.yaml\",\"globalSets\":\"@config/project.yaml\"}','gTbsGqGYIGgL','2019-05-02 19:27:51','2019-05-02 20:43:35','001f3db5-acbb-4979-a507-e53f81e45fce');

/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table matrixblocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `matrixblocks`;

CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `ownerSiteId` int(11) DEFAULT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `matrixblocks_ownerId_idx` (`ownerId`),
  KEY `matrixblocks_fieldId_idx` (`fieldId`),
  KEY `matrixblocks_typeId_idx` (`typeId`),
  KEY `matrixblocks_sortOrder_idx` (`sortOrder`),
  KEY `matrixblocks_ownerSiteId_idx` (`ownerSiteId`),
  CONSTRAINT `matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocks_ownerSiteId_fk` FOREIGN KEY (`ownerSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;

INSERT INTO `matrixblocks` (`id`, `ownerId`, `ownerSiteId`, `fieldId`, `typeId`, `sortOrder`, `deletedWithOwner`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(7,6,NULL,3,1,1,NULL,'2019-05-02 20:27:54','2019-05-02 20:37:37','fdede7af-f35b-45cd-b870-1cd514621090'),
	(9,6,NULL,3,3,2,NULL,'2019-05-02 20:35:26','2019-05-02 20:37:37','6e59be02-c036-40ee-a940-2c236ce93344'),
	(10,6,NULL,3,5,3,NULL,'2019-05-02 20:35:27','2019-05-02 20:37:38','ae1c2e57-3ec1-4dcb-b9ca-c13bef4100d7'),
	(11,6,NULL,3,4,4,NULL,'2019-05-02 20:35:27','2019-05-02 20:37:38','31e4cf79-69eb-4b6d-9d93-4dcf8b4d4500');

/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table matrixblocktypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `matrixblocktypes`;

CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  UNIQUE KEY `matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  KEY `matrixblocktypes_fieldId_idx` (`fieldId`),
  KEY `matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;

INSERT INTO `matrixblocktypes` (`id`, `fieldId`, `fieldLayoutId`, `name`, `handle`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,3,1,'Text Module','textModule',2,'2019-05-02 20:00:31','2019-05-02 20:43:33','3d20b894-240e-4f1d-bfa6-cb5dac7d444a'),
	(2,10,4,'Account','account',1,'2019-05-02 20:04:18','2019-05-02 20:04:18','05524c18-7ed5-4cd2-af86-df0e039cefc7'),
	(3,3,5,'Image Module','imageModule',3,'2019-05-02 20:10:41','2019-05-02 20:43:33','8e542ee2-4f05-41e2-9ffe-e5e45c9bbc26'),
	(4,3,6,'Form Module','formModule',4,'2019-05-02 20:10:42','2019-05-02 20:43:34','4996e920-0227-4240-9edc-cda20818964c'),
	(5,3,7,'Image and Text Module','imageAndTextModule',1,'2019-05-02 20:10:42','2019-05-02 20:43:33','76eae2e9-7001-4308-861b-716e3875cdd9'),
	(6,3,8,'Map Module','mapModule',5,'2019-05-02 20:13:33','2019-05-02 20:43:35','52f3f6f3-8410-4bc7-b5a7-17d6a04cd561');

/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table matrixcontent_modulematrix
# ------------------------------------------------------------

DROP TABLE IF EXISTS `matrixcontent_modulematrix`;

CREATE TABLE `matrixcontent_modulematrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_textModule_contentArea` text,
  `field_textModule_moduleWidth` smallint(2) DEFAULT NULL,
  `field_textModule_centerModule` tinyint(1) DEFAULT NULL,
  `field_textModule_noMarginBottom` tinyint(1) DEFAULT NULL,
  `field_imageModule_caption` text,
  `field_imageModule_imageWidth` smallint(2) DEFAULT NULL,
  `field_imageModule_mobilePercentage` smallint(3) DEFAULT NULL,
  `field_imageModule_maxHeight` int(10) DEFAULT NULL,
  `field_imageModule_fullWidth` tinyint(1) DEFAULT NULL,
  `field_imageModule_noMarginBottom` tinyint(1) DEFAULT NULL,
  `field_formModule_contentArea` text,
  `field_formModule_form` int(11) DEFAULT NULL,
  `field_formModule_buttonText` text,
  `field_formModule_successText` text,
  `field_formModule_failureText` text,
  `field_formModule_formAlignment` varchar(255) DEFAULT NULL,
  `field_formModule_noMarginBottom` tinyint(1) DEFAULT NULL,
  `field_imageAndTextModule_contentArea` text,
  `field_imageAndTextModule_imageAlignment` varchar(255) DEFAULT NULL,
  `field_imageAndTextModule_noMarginBottom` tinyint(1) DEFAULT NULL,
  `field_mapModule_contentArea` text,
  `field_mapModule_popupContent` text,
  `field_mapModule_startingCoordinates` text,
  `field_mapModule_noMarginBottom` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_modulematrix_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_modulematrix_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_modulematrix_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_modulematrix_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `matrixcontent_modulematrix` WRITE;
/*!40000 ALTER TABLE `matrixcontent_modulematrix` DISABLE KEYS */;

INSERT INTO `matrixcontent_modulematrix` (`id`, `elementId`, `siteId`, `dateCreated`, `dateUpdated`, `uid`, `field_textModule_contentArea`, `field_textModule_moduleWidth`, `field_textModule_centerModule`, `field_textModule_noMarginBottom`, `field_imageModule_caption`, `field_imageModule_imageWidth`, `field_imageModule_mobilePercentage`, `field_imageModule_maxHeight`, `field_imageModule_fullWidth`, `field_imageModule_noMarginBottom`, `field_formModule_contentArea`, `field_formModule_form`, `field_formModule_buttonText`, `field_formModule_successText`, `field_formModule_failureText`, `field_formModule_formAlignment`, `field_formModule_noMarginBottom`, `field_imageAndTextModule_contentArea`, `field_imageAndTextModule_imageAlignment`, `field_imageAndTextModule_noMarginBottom`, `field_mapModule_contentArea`, `field_mapModule_popupContent`, `field_mapModule_startingCoordinates`, `field_mapModule_noMarginBottom`)
VALUES
	(1,7,1,'2019-05-02 20:27:54','2019-05-02 20:37:37','e9574e61-02d8-4708-837e-8e7197845066','<h1>Lorem ipsum dolor sit amet, consectetur adipiscing</h1>\n<p>Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. <em>Cras sit amet rutrum nibh</em>, eu ornare sapien. <del>Nulla pharetra vitae magna eu posuere</del>. <a href=\"http://www.lookthinkmake.com\">Vestibulum maximus velit justo</a>, et feugiat est ultricies ac. Etiam mollis sit amet tortor et molestie. Praesent ut fermentum elit. Vivamus a enim at elit eleifend mollis. Nullam in risus augue. Ut sed magna fermentum tortor consectetur fringilla. Sed at quam elementum, efficitur tortor lacinia, venenatis enim. Nulla vestibulum massa sed massa porttitor, molestie ultrices tortor viverra. Duis dictum ipsum massa, quis mollis eros scelerisque vel. Ut eu ligula sodales, ultricies eros non, porta diam.</p>\n<h2>Bibendum interdum eleifend sit amet</h2>\n<p>Donec eros velit, bibendum interdum eleifend sit amet, lacinia eget arcu. Nulla ut erat sed ante accumsan dictum. Aliquam sodales at diam vel finibus. Integer mauris risus, ornare quis tempus nec, porta rutrum erat. Pellentesque at commodo arcu. Fusce condimentum nibh et pharetra dignissim. Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p>\n<ul><li>Fusce condimentum nibh et pharetra dignissim. </li><li>Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. </li><li>Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. </li><li>Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. </li><li>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; </li><li>Maecenas ut cursus turpis, eget aliquam dolor.</li></ul><h3>Diam enim laoreet libero</h3>\n<p>In tincidunt, nulla eget sagittis aliquet, diam enim laoreet libero, a lacinia ante purus nec libero. Nulla vehicula vitae ligula id sodales. In feugiat sit amet erat vel hendrerit. Integer elementum ultricies scelerisque. Nam et efficitur eros. Maecenas sed nisl risus. Aliquam ut sapien vel sem rutrum mollis. Maecenas congue facilisis felis, sed auctor odio volutpat eu. Nam ultrices sapien non leo ultrices, in hendrerit dolor cursus. Mauris vitae auctor dolor, at sodales est. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse quis ultricies eros. Donec ut purus purus. Suspendisse suscipit ac magna accumsan efficitur. Maecenas vulputate et nunc a sagittis. Quisque nec ex risus.</p>\n<ol><li>Maecenas congue facilisis felis, sed auctor odio volutpat eu. </li><li>Nam ultrices sapien non leo ultrices, in hendrerit dolor cursus. </li><li>Mauris vitae auctor dolor, at sodales est. Pellentesque habitant morbi tristique senectus </li><li>et netus et malesuada fames ac turpis egestas. Suspendisse quis ultricies eros. </li><li>Donec ut purus purus. Suspendisse suscipit ac magna accumsan efficitur. </li><li>Maecenas vulputate et nunc a sagittis. Quisque nec ex risus.</li></ol><h4>Vivamus sit amet sapien risus.</h4>\n<p>Quisque venenatis lectus a egestas finibus. Vivamus sit amet sapien risus. Pellentesque tempus, orci ut dignissim sollicitudin, odio mi placerat leo, vel euismod sapien magna a purus. Donec nulla lacus, dictum nec sapien id, tempus dignissim elit. Nulla quis ornare risus. Maecenas vel augue feugiat, laoreet nibh porta, ultrices diam.<br /></p>\n<p><a class=\"btn\" href=\"http://www.lookthinkmake.com\">Here is a button</a></p>\n<p> In hac habitasse platea dictumst. Quisque mollis, mauris sit amet faucibus egestas, eros tellus blandit dolor, id elementum dolor lacus bibendum magna. Aenean et tincidunt metus, finibus suscipit elit. In sed libero maximus leo hendrerit venenatis sit amet quis ipsum. Pellentesque ut faucibus sapien.</p>\n<figure><img src=\"{asset:8:url}\" alt=\"This is the title\" /><figcaption>This is the caption</figcaption></figure><h5>Quam condimentum cursus</h5>\n<p>Pellentesque vel cursus tellus. Integer ullamcorper, quam condimentum cursus egestas, neque nunc sollicitudin mauris, a dignissim eros sapien ac purus. Donec lorem elit, pellentesque aliquam luctus et, scelerisque et nibh. Quisque congue vel magna ac lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas et dictum magna. Pellentesque convallis quis felis eu vehicula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tincidunt ullamcorper erat eu hendrerit. Suspendisse dui turpis, interdum id convallis in, pharetra non erat. Sed porttitor felis lacus, nec congue sapien efficitur quis. Cras tempus maximus accumsan.</p>\n<figure style=\"float:right;margin:0px 0px 10px 10px;\"><img src=\"{asset:8:url}\" alt=\"This is the title\" /><figcaption>this is the caption</figcaption></figure><p>Donec eros velit, bibendum interdum eleifend sit amet, lacinia eget arcu. Nulla ut erat sed ante accumsan dictum. Aliquam sodales at diam vel finibus. Integer mauris risus, ornare quis tempus nec, porta rutrum erat. Pellentesque at commodo arcu. Fusce condimentum nibh et pharetra dignissim. Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p>\n<p>Donec eros velit, bibendum interdum eleifend sit amet, lacinia eget arcu. Nulla ut erat sed ante accumsan dictum. Aliquam sodales at diam vel finibus. Integer mauris risus, ornare quis tempus nec, porta rutrum erat. Pellentesque at commodo arcu. Fusce condimentum nibh et pharetra dignissim. Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p>\n<h6>Cras tempus maximus accumsan</h6>\n<p>Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p>\n<h4>Code for the nerds</h4>\n<pre>Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</pre>\n<h4>A blockquote style</h4>\n<blockquote>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas et dictum magna. Pellentesque convallis quis felis eu vehicula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. </blockquote>',8,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,9,1,'2019-05-02 20:35:26','2019-05-02 20:37:37','89424460-07ec-46bf-8d3c-75e6c4891ecd',NULL,NULL,NULL,NULL,'<p>Here\'s a caption</p>',12,80,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(3,10,1,'2019-05-02 20:35:26','2019-05-02 20:37:38','ab56e6f7-d3c5-45c7-865b-4246c2f14c06',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<h2>Donec eros velit, bibendum interdum eleifend sit amet</h2>\n<p>Lacinia eget arcu. Nulla ut erat sed ante accumsan dictum. Aliquam sodales at diam vel finibus. Integer mauris risus, ornare quis tempus nec, porta rutrum erat. Pellentesque at commodo arcu. Fusce condimentum nibh et pharetra dignissim. Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p>','image-right',0,NULL,NULL,NULL,NULL),
	(4,11,1,'2019-05-02 20:35:27','2019-05-02 20:37:38','edd8b112-97aa-4c06-9225-29e605f295c6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<h2>Donec eros velit, bibendum interdum eleifend sit amet</h2>\n<p>Lacinia eget arcu. Nulla ut erat sed ante accumsan dictum. Aliquam sodales at diam vel finibus. Integer mauris risus, ornare quis tempus nec, porta rutrum erat. Pellentesque at commodo arcu. Fusce condimentum nibh et pharetra dignissim. Nunc a lorem lacinia dui dapibus faucibus sit amet a urna. Aenean tempor metus nisi. In arcu magna, fermentum et euismod ut, imperdiet vitae mi. Quisque ligula erat, auctor nec tortor faucibus, lacinia gravida diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Maecenas ut cursus turpis, eget aliquam dolor.</p>',1,NULL,NULL,NULL,'form-right',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `matrixcontent_modulematrix` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table matrixcontent_socialmedialinks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `matrixcontent_socialmedialinks`;

CREATE TABLE `matrixcontent_socialmedialinks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_account_socialMediaName` text,
  `field_account_socialMediaLink` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matrixcontent_socialmedialinks_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  KEY `matrixcontent_socialmedialinks_siteId_fk` (`siteId`),
  CONSTRAINT `matrixcontent_socialmedialinks_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `matrixcontent_socialmedialinks_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pluginId` int(11) DEFAULT NULL,
  `type` enum('app','plugin','content') NOT NULL DEFAULT 'app',
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `migrations_pluginId_idx` (`pluginId`),
  KEY `migrations_type_pluginId_idx` (`type`,`pluginId`),
  CONSTRAINT `migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `pluginId`, `type`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,'app','Install','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','198da2f6-dda5-41d4-adfd-f7ef468de53b'),
	(2,NULL,'app','m150403_183908_migrations_table_changes','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','4bebe848-4bbc-457c-a33c-d6e27c836945'),
	(3,NULL,'app','m150403_184247_plugins_table_changes','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','91f999d7-3a0a-4650-be42-9b44268f0b97'),
	(4,NULL,'app','m150403_184533_field_version','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','ede77e43-7101-4cc1-b2ee-ff908a69ea18'),
	(5,NULL,'app','m150403_184729_type_columns','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','7cf2dd42-b25a-47e3-b46a-68346145c324'),
	(6,NULL,'app','m150403_185142_volumes','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','f3ce0c87-7330-4a28-865b-5d7c60cf4018'),
	(7,NULL,'app','m150428_231346_userpreferences','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','6a992a45-5aa9-4147-894b-7299c666f530'),
	(8,NULL,'app','m150519_150900_fieldversion_conversion','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','bbe0df36-59cb-4984-b597-18b27527ff8f'),
	(9,NULL,'app','m150617_213829_update_email_settings','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','42e09a12-c5e3-44a1-b31f-dc51d660575d'),
	(10,NULL,'app','m150721_124739_templatecachequeries','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','d6c22498-cb74-4a99-9ae9-e62db5514e59'),
	(11,NULL,'app','m150724_140822_adjust_quality_settings','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','69df4fd8-9e41-4845-bbe2-4ad590a999c5'),
	(12,NULL,'app','m150815_133521_last_login_attempt_ip','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','699899ba-4d9e-4805-bcdf-093a6bcda50e'),
	(13,NULL,'app','m151002_095935_volume_cache_settings','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','7cce8496-8105-427b-8ac3-9f05fae4fd82'),
	(14,NULL,'app','m151005_142750_volume_s3_storage_settings','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','0c956dd5-c565-4caf-a29a-89bbf1b7295d'),
	(15,NULL,'app','m151016_133600_delete_asset_thumbnails','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','4500a80a-5014-4a6d-a4ff-fd6cc195c29a'),
	(16,NULL,'app','m151209_000000_move_logo','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','e04765a2-22b1-4227-bd2a-dd1e3f9f311d'),
	(17,NULL,'app','m151211_000000_rename_fileId_to_assetId','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','6932c005-9d8d-4c2d-9b39-17aa556def47'),
	(18,NULL,'app','m151215_000000_rename_asset_permissions','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','78d40e4c-a3dc-433c-9900-e2049197f96c'),
	(19,NULL,'app','m160707_000001_rename_richtext_assetsource_setting','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','7927e268-3fd0-4a00-8381-7930ec1c64f2'),
	(20,NULL,'app','m160708_185142_volume_hasUrls_setting','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','802d858c-7dfe-4c97-bd63-243014962fc1'),
	(21,NULL,'app','m160714_000000_increase_max_asset_filesize','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','e4933062-58e8-47c5-81dc-2c24abae9814'),
	(22,NULL,'app','m160727_194637_column_cleanup','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','9faad72c-5497-470d-bb3a-e70aeeab1655'),
	(23,NULL,'app','m160804_110002_userphotos_to_assets','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','17c07fd9-ad8f-4ee6-97fb-83eb19cc10b7'),
	(24,NULL,'app','m160807_144858_sites','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','71bb43fa-5297-4f7d-bac7-8d8e9edf6613'),
	(25,NULL,'app','m160829_000000_pending_user_content_cleanup','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','1060e85c-2a5e-42ba-b22c-882c536d3a84'),
	(26,NULL,'app','m160830_000000_asset_index_uri_increase','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','bf8e51d4-4691-42e2-b652-ce2fbc0443ce'),
	(27,NULL,'app','m160912_230520_require_entry_type_id','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','20e9bf61-7876-42b4-a919-1dacb732736f'),
	(28,NULL,'app','m160913_134730_require_matrix_block_type_id','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','e61d1b58-429d-4553-9077-f68568eceadb'),
	(29,NULL,'app','m160920_174553_matrixblocks_owner_site_id_nullable','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','57504f89-5b26-4f2c-bf0b-d62a7e5ebbda'),
	(30,NULL,'app','m160920_231045_usergroup_handle_title_unique','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','68ac5cfa-b559-4709-9ebc-58d98f5e2eb7'),
	(31,NULL,'app','m160925_113941_route_uri_parts','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','59169405-f610-4f00-8a61-8270c27b5276'),
	(32,NULL,'app','m161006_205918_schemaVersion_not_null','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','5689ecb2-284e-41c9-949b-d78219456e9c'),
	(33,NULL,'app','m161007_130653_update_email_settings','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','3f0c04e7-2415-48bf-8048-414bdb0708cb'),
	(34,NULL,'app','m161013_175052_newParentId','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','234e3d5a-4ad1-4634-961d-fd8ad01c0362'),
	(35,NULL,'app','m161021_102916_fix_recent_entries_widgets','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','8b7900d0-1253-473a-a860-61807121419d'),
	(36,NULL,'app','m161021_182140_rename_get_help_widget','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','b7f72ec1-8c95-4599-bf7f-e2760c612277'),
	(37,NULL,'app','m161025_000000_fix_char_columns','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','104d8b97-1dec-46a5-bd46-4a30dbafb6d6'),
	(38,NULL,'app','m161029_124145_email_message_languages','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','094d6a5f-efc3-4b89-a5b8-c134877fe139'),
	(39,NULL,'app','m161108_000000_new_version_format','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','b8ec8c15-9dbb-40ed-91e5-b80f96936190'),
	(40,NULL,'app','m161109_000000_index_shuffle','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','a5def20b-0002-4368-9483-52f4286a8873'),
	(41,NULL,'app','m161122_185500_no_craft_app','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','4006c08f-395a-4429-87eb-40b0045abd9a'),
	(42,NULL,'app','m161125_150752_clear_urlmanager_cache','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','b2a2fe85-b753-48d6-a38f-f93fc63a8e66'),
	(43,NULL,'app','m161220_000000_volumes_hasurl_notnull','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','960aa5c6-d785-4459-afac-50c839b579eb'),
	(44,NULL,'app','m170114_161144_udates_permission','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','49b29f63-3272-482f-903c-f6e7d66c4f5d'),
	(45,NULL,'app','m170120_000000_schema_cleanup','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','7b277fe4-bd60-48e6-b867-4c491c78cd56'),
	(46,NULL,'app','m170126_000000_assets_focal_point','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','2f948c4d-12a7-4797-8cc4-8d438a1a4515'),
	(47,NULL,'app','m170206_142126_system_name','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','0b7cfc55-3d01-4a72-b309-09b8759c5d57'),
	(48,NULL,'app','m170217_044740_category_branch_limits','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','3cabec12-a936-4986-be69-defcc2d60769'),
	(49,NULL,'app','m170217_120224_asset_indexing_columns','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','8ceb9e0a-eb2f-4804-9690-3fc08ec9a692'),
	(50,NULL,'app','m170223_224012_plain_text_settings','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','a7086bd1-33dc-43ed-98ce-80c0e1e012ef'),
	(51,NULL,'app','m170227_120814_focal_point_percentage','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','9363f531-afb4-450f-ad4e-3f9645faf2fd'),
	(52,NULL,'app','m170228_171113_system_messages','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','17234544-1654-4499-9696-7d26c99ad3ba'),
	(53,NULL,'app','m170303_140500_asset_field_source_settings','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','64d7eaf3-195a-4125-98bf-0e8924eb525b'),
	(54,NULL,'app','m170306_150500_asset_temporary_uploads','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','9a6b4788-94c7-42da-ac9c-c59d1550546f'),
	(55,NULL,'app','m170523_190652_element_field_layout_ids','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','610156c1-9faa-44d8-8710-f8b94c2615ab'),
	(56,NULL,'app','m170612_000000_route_index_shuffle','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','fb3f4b47-e22b-449e-9f5d-0cfb53cb3db1'),
	(57,NULL,'app','m170621_195237_format_plugin_handles','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','0f9699c2-c358-43af-90fa-05ae7fbb86f6'),
	(58,NULL,'app','m170630_161027_deprecation_line_nullable','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','8999ae78-8300-4ee5-b955-1fa98c389dfa'),
	(59,NULL,'app','m170630_161028_deprecation_changes','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','15296019-df97-45ca-a5f3-f11d06155cd2'),
	(60,NULL,'app','m170703_181539_plugins_table_tweaks','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','120c94a9-2750-4ad4-bd88-682488b69070'),
	(61,NULL,'app','m170704_134916_sites_tables','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','c3768fad-c1e4-4dec-a026-f20c1cb78f81'),
	(62,NULL,'app','m170706_183216_rename_sequences','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','218f44b6-65e9-4722-ac66-8e727e2de2d6'),
	(63,NULL,'app','m170707_094758_delete_compiled_traits','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','dbd3baf1-ec8c-42e8-8fd1-f9de7bd0f404'),
	(64,NULL,'app','m170731_190138_drop_asset_packagist','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','6674e348-4450-450d-8c92-3246ac279b4a'),
	(65,NULL,'app','m170810_201318_create_queue_table','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','f328dcc4-4cf9-4ecd-be60-7aba962651b4'),
	(66,NULL,'app','m170816_133741_delete_compiled_behaviors','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','bf771021-f491-4af3-b5e0-def5f1dede85'),
	(67,NULL,'app','m170903_192801_longblob_for_queue_jobs','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','d77b0e8c-d8bf-49d7-b037-afebd33e6d89'),
	(68,NULL,'app','m170914_204621_asset_cache_shuffle','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','36e42772-be51-43d1-b7a4-ecf5aa1c92b4'),
	(69,NULL,'app','m171011_214115_site_groups','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','807d2009-0c20-4bf2-bfd3-d31a46917f33'),
	(70,NULL,'app','m171012_151440_primary_site','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','58fb414c-bb63-4499-9584-4cea9c8ca5df'),
	(71,NULL,'app','m171013_142500_transform_interlace','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','3d372781-4107-4209-a71e-e26ac1da1a88'),
	(72,NULL,'app','m171016_092553_drop_position_select','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','2ef944c6-f31b-4b72-9b1a-5e97003fa157'),
	(73,NULL,'app','m171016_221244_less_strict_translation_method','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','f4e46b8f-1920-48eb-9a77-35e858131f9d'),
	(74,NULL,'app','m171107_000000_assign_group_permissions','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','9b5b1e86-3f88-4328-b7f3-7f736c617d56'),
	(75,NULL,'app','m171117_000001_templatecache_index_tune','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','bf104aa7-9e23-474e-b900-38c237a6dd82'),
	(76,NULL,'app','m171126_105927_disabled_plugins','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','ea6b31b2-4b5d-47b4-aa40-b51cf7721c1c'),
	(77,NULL,'app','m171130_214407_craftidtokens_table','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','15387652-cafc-4a1c-ac03-1f9a3ed4ab72'),
	(78,NULL,'app','m171202_004225_update_email_settings','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','12e78a34-0cca-41dd-9b9e-11a989365584'),
	(79,NULL,'app','m171204_000001_templatecache_index_tune_deux','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','449e94ae-4150-428d-baa2-b75613406658'),
	(80,NULL,'app','m171205_130908_remove_craftidtokens_refreshtoken_column','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','9f12f68c-c51b-4afe-b3a0-4fc92c8f7499'),
	(81,NULL,'app','m171218_143135_longtext_query_column','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','7d03ac29-9b95-43e9-b85f-0f4c4740a2c3'),
	(82,NULL,'app','m171231_055546_environment_variables_to_aliases','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','105b32c2-200f-47c8-a84d-7cfcda1632f4'),
	(83,NULL,'app','m180113_153740_drop_users_archived_column','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','9ea43935-5b7a-4b0d-a47e-cac0b36ecdfa'),
	(84,NULL,'app','m180122_213433_propagate_entries_setting','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','7c44329d-5466-46e8-bbfe-9848237b143d'),
	(85,NULL,'app','m180124_230459_fix_propagate_entries_values','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','a0c2d17b-a266-4330-85a0-8ad2dd8062a3'),
	(86,NULL,'app','m180128_235202_set_tag_slugs','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','0f6e5052-3413-4757-9e03-5c2c75900132'),
	(87,NULL,'app','m180202_185551_fix_focal_points','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','dbe06854-58d0-4453-9864-4cb60ea4ef3b'),
	(88,NULL,'app','m180217_172123_tiny_ints','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','1f0e37f0-d4ab-44d0-8a42-39fbb05e0d5c'),
	(89,NULL,'app','m180321_233505_small_ints','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','56ce547e-7038-4f0c-8fef-e7d7f760ae06'),
	(90,NULL,'app','m180328_115523_new_license_key_statuses','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','000ca1e2-f649-427a-9fda-2678625fb3ca'),
	(91,NULL,'app','m180404_182320_edition_changes','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','24a5aeb4-374f-4cb8-b3db-1f5cb51eb772'),
	(92,NULL,'app','m180411_102218_fix_db_routes','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','b73f384d-2fd3-4174-8ed9-8d623b73a420'),
	(93,NULL,'app','m180416_205628_resourcepaths_table','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','4775b6b0-f376-4c2f-b6e2-8d0a1b29b31c'),
	(94,NULL,'app','m180418_205713_widget_cleanup','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','df29a562-b148-45d4-b6ef-e3fadf5e9968'),
	(95,NULL,'app','m180425_203349_searchable_fields','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','362e8cdc-a3b7-4b93-8c49-434d03ca9376'),
	(96,NULL,'app','m180516_153000_uids_in_field_settings','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','b49da20c-3d49-49e7-9338-0d78ab0f7a4a'),
	(97,NULL,'app','m180517_173000_user_photo_volume_to_uid','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','9f106efe-aafa-4d17-9742-f52be454f6ef'),
	(98,NULL,'app','m180518_173000_permissions_to_uid','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','f7e27742-2e94-491f-9982-cbf055c5b7c4'),
	(99,NULL,'app','m180520_173000_matrix_context_to_uids','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','d40b3355-a6e9-430b-8dcc-7ce21036869a'),
	(100,NULL,'app','m180521_173000_initial_yml_and_snapshot','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','74bed900-177e-4c9a-ae18-32b7b5fd1a29'),
	(101,NULL,'app','m180731_162030_soft_delete_sites','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','d9344f3b-1362-4a0a-99af-73f54682630e'),
	(102,NULL,'app','m180810_214427_soft_delete_field_layouts','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','b41977b7-6cbd-4257-abbe-8e7a28fe0f4b'),
	(103,NULL,'app','m180810_214439_soft_delete_elements','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','604a6a61-8803-4694-a2b6-2e8670ab3897'),
	(104,NULL,'app','m180824_193422_case_sensitivity_fixes','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','e1fa4cc7-85d4-42ff-a9cb-988ea53bb324'),
	(105,NULL,'app','m180901_151639_fix_matrixcontent_tables','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','800b1d92-e1a9-421f-a9d7-291981e39fd7'),
	(106,NULL,'app','m180904_112109_permission_changes','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','43d83a3a-8416-4e53-8fbd-c933ad237dcf'),
	(107,NULL,'app','m180910_142030_soft_delete_sitegroups','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','d7f90b21-257e-4c47-8d20-0823400ce7ad'),
	(108,NULL,'app','m181011_160000_soft_delete_asset_support','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','8f234f1d-3043-4270-8dbe-1fbce3bd3375'),
	(109,NULL,'app','m181016_183648_set_default_user_settings','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','1cebb1ec-4341-48c7-8bdb-da3174a34651'),
	(110,NULL,'app','m181017_225222_system_config_settings','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','f8580d3a-64ed-48e3-b181-977d02fdb20a'),
	(111,NULL,'app','m181018_222343_drop_userpermissions_from_config','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','1aa39862-d951-4c6d-b7d7-e27e01fa9354'),
	(112,NULL,'app','m181029_130000_add_transforms_routes_to_config','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','d9736fbe-4847-469c-8def-54ba33c82832'),
	(113,NULL,'app','m181112_203955_sequences_table','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','82b54f87-1a4e-432b-abaa-31df24fa8cc5'),
	(114,NULL,'app','m181121_001712_cleanup_field_configs','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','77ced195-995d-4226-90ba-31477db8e268'),
	(115,NULL,'app','m181128_193942_fix_project_config','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','169ac563-833a-4aeb-b86d-64df91a10066'),
	(116,NULL,'app','m181130_143040_fix_schema_version','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','5af8915f-3176-4a7a-bf3b-b139ee39c363'),
	(117,NULL,'app','m181211_143040_fix_entry_type_uids','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','1088830d-46ea-4ae8-b42e-9555cf8c67e4'),
	(118,NULL,'app','m181213_102500_config_map_aliases','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','47f18dc5-e8b2-4811-b427-50c4e200eec0'),
	(119,NULL,'app','m181217_153000_fix_structure_uids','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','c611c96d-6430-469f-8a65-cc027b7e41e4'),
	(120,NULL,'app','m190104_152725_store_licensed_plugin_editions','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','c273294b-5ce5-4543-9921-48ddafa7b430'),
	(121,NULL,'app','m190108_110000_cleanup_project_config','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','80f391d1-d572-4b02-932e-57add99d779d'),
	(122,NULL,'app','m190108_113000_asset_field_setting_change','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','ff57e80f-d2b0-4a8a-9f95-df820dd0de0f'),
	(123,NULL,'app','m190109_172845_fix_colspan','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','47bd3164-004d-4201-8caf-eb44b2a1ca4d'),
	(124,NULL,'app','m190110_150000_prune_nonexisting_sites','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','91478878-b948-415e-9747-07e6288c8c93'),
	(125,NULL,'app','m190110_214819_soft_delete_volumes','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','a3f6df28-f286-415d-9b71-c8b92c08103e'),
	(126,NULL,'app','m190112_124737_fix_user_settings','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','ba823a87-e98d-4911-8604-0c35ed6b2ee4'),
	(127,NULL,'app','m190112_131225_fix_field_layouts','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','cbdd2b4d-5fa4-489d-9479-563b77089cd2'),
	(128,NULL,'app','m190112_201010_more_soft_deletes','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','3e7a28db-5041-4649-bc94-8acf4d1db6a3'),
	(129,NULL,'app','m190114_143000_more_asset_field_setting_changes','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','397b0b85-64d1-415a-aaf3-7e69d94e66a0'),
	(130,NULL,'app','m190121_120000_rich_text_config_setting','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','91151690-c27c-4dc8-a74a-25447d44175a'),
	(131,NULL,'app','m190125_191628_fix_email_transport_password','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','626dca6b-7733-4a45-bbdd-c7018cc9ece0'),
	(132,NULL,'app','m190128_181422_cleanup_volume_folders','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','406a2e7a-65fa-49aa-8208-337f7efc9a4b'),
	(133,NULL,'app','m190205_140000_fix_asset_soft_delete_index','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','8a239de9-5c60-4c82-8e35-35d764da6768'),
	(134,NULL,'app','m190208_140000_reset_project_config_mapping','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','f1df5457-74ec-48b7-8c53-654aa3c5fa5b'),
	(135,NULL,'app','m190218_143000_element_index_settings_uid','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','1cc70065-607b-4864-9d81-5ec08ca5d536'),
	(136,NULL,'app','m190401_223843_drop_old_indexes','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','38047b4c-7c5d-436d-a06d-058a2e8ea713'),
	(137,NULL,'app','m190416_014525_drop_unique_global_indexes','2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:53','161a1a7c-ace3-4b93-a13f-2be8fc15edc4'),
	(138,3,'plugin','m180430_204710_remove_old_plugins','2019-05-02 19:32:39','2019-05-02 19:32:39','2019-05-02 19:32:39','b4006a7e-c938-4797-8aff-07dad745129a'),
	(139,3,'plugin','Install','2019-05-02 19:32:39','2019-05-02 19:32:39','2019-05-02 19:32:39','07162be0-076c-4fc3-88f6-9e08d6253406'),
	(140,3,'plugin','m190225_003922_split_cleanup_html_settings','2019-05-02 19:32:39','2019-05-02 19:32:39','2019-05-02 19:32:39','aec71cb7-c604-43e4-94ae-5f1e2060fce1'),
	(141,6,'plugin','Install','2019-05-02 19:34:38','2019-05-02 19:34:38','2019-05-02 19:34:38','0519aa4b-f1c0-4f80-b3cc-d03d9d199b81'),
	(142,6,'plugin','m180906_152947_add_site_id_to_redirects','2019-05-02 19:34:38','2019-05-02 19:34:38','2019-05-02 19:34:38','68c4126b-ebf6-4b15-9807-920e8d41075b'),
	(143,6,'plugin','m190114_152300_upgrade_to_new_data_format','2019-05-02 19:34:38','2019-05-02 19:34:38','2019-05-02 19:34:38','3de42a1f-8f0a-4f3e-8bce-b71ba09ed5a5'),
	(144,7,'plugin','Install','2019-05-02 19:38:24','2019-05-02 19:38:24','2019-05-02 19:38:24','517237e3-0d9c-4ef9-9897-3cd1e4e975c1'),
	(145,7,'plugin','m180210_000000_migrate_content_tables','2019-05-02 19:38:24','2019-05-02 19:38:24','2019-05-02 19:38:24','a07fa0e4-0802-42fe-99f6-c01ad8915446'),
	(146,7,'plugin','m180211_000000_type_columns','2019-05-02 19:38:24','2019-05-02 19:38:24','2019-05-02 19:38:24','024ad6c9-adc4-4713-8e65-9a0f22bb620f'),
	(147,7,'plugin','m180219_000000_sites','2019-05-02 19:38:24','2019-05-02 19:38:24','2019-05-02 19:38:24','5d445d59-36cd-4857-b5ce-f2610a83324d'),
	(148,7,'plugin','m180220_000000_fix_context','2019-05-02 19:38:24','2019-05-02 19:38:24','2019-05-02 19:38:24','075f80ee-37f8-4c73-80e8-0b762369d35e'),
	(149,7,'plugin','m190117_000000_soft_deletes','2019-05-02 19:38:24','2019-05-02 19:38:24','2019-05-02 19:38:24','fdf1a4bd-7aad-4146-985e-cdd3685e98ed'),
	(150,7,'plugin','m190117_000001_context_to_uids','2019-05-02 19:38:24','2019-05-02 19:38:24','2019-05-02 19:38:24','58ea50e9-7cfd-4fd8-a0c7-e67aa3644480'),
	(151,7,'plugin','m190120_000000_fix_supertablecontent_tables','2019-05-02 19:38:25','2019-05-02 19:38:25','2019-05-02 19:38:25','0d8a7213-8169-4189-9681-b8bb5e6b7470'),
	(152,7,'plugin','m190131_000000_fix_supertable_missing_fields','2019-05-02 19:38:25','2019-05-02 19:38:25','2019-05-02 19:38:25','7605b735-e387-403f-a665-b0e9bc0c0e3d'),
	(153,7,'plugin','m190227_100000_fix_project_config','2019-05-02 19:38:25','2019-05-02 19:38:25','2019-05-02 19:38:25','039632c9-a781-4bd7-bd52-8dea35526f93'),
	(154,8,'plugin','Install','2019-05-02 19:47:21','2019-05-02 19:47:21','2019-05-02 19:47:21','96c3e196-dd32-4760-aa39-bcc9ec7ce358'),
	(155,8,'plugin','m180407_040301_add_index_view_column_to_form_fields_table','2019-05-02 19:47:21','2019-05-02 19:47:21','2019-05-02 19:47:21','9686d060-1fb4-4551-87a7-50ab3df70eac'),
	(156,8,'plugin','m180407_170219_add_active_column_to_form_fields','2019-05-02 19:47:21','2019-05-02 19:47:21','2019-05-02 19:47:21','8555b8bb-a658-4334-ba77-c45628db80d6'),
	(157,8,'plugin','m180430_232743_add_read_column_to_message','2019-05-02 19:47:21','2019-05-02 19:47:21','2019-05-02 19:47:21','c1ccde17-31d4-4588-af31-ce2dfd052ef0'),
	(158,8,'plugin','m180602_051517_AddOrderToField','2019-05-02 19:47:21','2019-05-02 19:47:21','2019-05-02 19:47:21','e72f89d0-e33d-463b-89cb-548266374034'),
	(159,8,'plugin','m180802_015031_save_entry_to_forms_table','2019-05-02 19:47:21','2019-05-02 19:47:21','2019-05-02 19:47:21','c6f30289-9cff-4c52-9e27-c2d0add9d195'),
	(160,8,'plugin','m180804_230709_add_options_to_form_fields','2019-05-02 19:47:21','2019-05-02 19:47:21','2019-05-02 19:47:21','f91056dd-6851-499d-b854-2832cd2159f8'),
	(161,8,'plugin','m180814_230614_add_options_column_forms_table','2019-05-02 19:47:21','2019-05-02 19:47:21','2019-05-02 19:47:21','fc3ea043-343c-4e09-8447-cb177ecc9d9a');

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table plugins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `plugins`;

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugins_handle_unq_idx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;

INSERT INTO `plugins` (`id`, `handle`, `version`, `schemaVersion`, `licenseKeyStatus`, `licensedEdition`, `installDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'imager','v2.1.10','2.0.0','unknown',NULL,'2019-05-02 19:30:16','2019-05-02 19:30:16','2019-05-02 19:47:30','748a3a8d-fada-4b60-bd85-d4869816db66'),
	(2,'imager-pretransform','2.0.2','2.0.0','unknown',NULL,'2019-05-02 19:31:55','2019-05-02 19:31:55','2019-05-02 19:47:30','2efd5b85-fef1-4212-bece-a29658a3e45b'),
	(3,'redactor','2.3.3.2','2.3.0','unknown',NULL,'2019-05-02 19:32:39','2019-05-02 19:32:39','2019-05-02 19:47:30','ff7e08f9-dd2f-421f-9412-420f114cf16f'),
	(4,'redactor-custom-styles','3.0.2','1.0.0','unknown',NULL,'2019-05-02 19:33:11','2019-05-02 19:33:11','2019-05-02 19:47:30','7cc88dd5-96f8-47b3-b969-b924030b0516'),
	(5,'retcon','2.0.12','1.0.0','unknown',NULL,'2019-05-02 19:33:48','2019-05-02 19:33:48','2019-05-02 19:47:30','3e05344b-47a8-4f62-b279-4f468214b3ab'),
	(6,'seo','3.5.4','3.1.0','unknown',NULL,'2019-05-02 19:34:38','2019-05-02 19:34:38','2019-05-02 19:47:30','bc72fe6b-5f4c-4bd2-aa1d-c97a0edbacd7'),
	(7,'super-table','2.1.18','2.0.10','unknown',NULL,'2019-05-02 19:38:24','2019-05-02 19:38:24','2019-05-02 19:47:30','7235fb3d-42d9-4900-93a0-7e242de36a4a'),
	(8,'wheelform','1.25.3','1.6.0','unknown',NULL,'2019-05-02 19:47:21','2019-05-02 19:47:21','2019-05-02 19:47:30','f03ecf0e-7ba9-47d6-b077-e2eb58f916d0');

/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table queue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `queue`;

CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `queue_fail_timeUpdated_timePushed_idx` (`fail`,`timeUpdated`,`timePushed`),
  KEY `queue_fail_timeUpdated_delay_idx` (`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table relations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `relations`;

CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `relations_sourceId_idx` (`sourceId`),
  KEY `relations_targetId_idx` (`targetId`),
  KEY `relations_sourceSiteId_idx` (`sourceSiteId`),
  CONSTRAINT `relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;

INSERT INTO `relations` (`id`, `fieldId`, `sourceId`, `sourceSiteId`, `targetId`, `sortOrder`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(3,15,9,NULL,8,1,'2019-05-02 20:37:37','2019-05-02 20:37:37','c60b1a0d-9364-4527-8229-99e19ddbe031'),
	(4,30,10,NULL,8,1,'2019-05-02 20:37:38','2019-05-02 20:37:38','f34096b2-b89f-439f-8055-cbb0d8588002');

/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table resourcepaths
# ------------------------------------------------------------

DROP TABLE IF EXISTS `resourcepaths`;

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;

INSERT INTO `resourcepaths` (`hash`, `path`)
VALUES
	('1914e660','@lib'),
	('1b8bc4a9','@craft/web/assets/matrixsettings/dist'),
	('213e2798','@bower/jquery/dist'),
	('24e7e5c5','@craft/web/assets/editentry/dist'),
	('2c967f0d','@lib/jquery.payment'),
	('30b1d0e5','@lib/velocity'),
	('42173c4a','@craft/web/assets/craftsupport/dist'),
	('44127c5','@craft/web/assets/dashboard/dist'),
	('45b5ed7f','@app/web/assets/cp/dist'),
	('4a88742a','@vendor/craftcms/redactor/lib/redactor-plugins/fullscreen'),
	('5e8da054','@app/web/assets/pluginstore/dist'),
	('66692bb7','@carlcs/redactorcustomstyles/assets/redactorplugin/dist'),
	('7617daa3','@app/web/assets/updater/dist'),
	('7d02010e','@craft/web/assets/feed/dist'),
	('7ddd8ecc','@vendor/craftcms/redactor/lib/redactor-plugins/video'),
	('7e184b40','@lib/jquery-ui'),
	('850f311b','@craft/web/assets/fields/dist'),
	('85caf8f6','@lib/fabric'),
	('8a0254da','@craft/redactor/assets/field/dist'),
	('908c2cc8','@lib/garnishjs'),
	('a3313b4e','@lib/d3'),
	('a5372b18','@craft/web/assets/utilities/dist'),
	('a7f6e40a','@verbb/supertable/resources/dist'),
	('a8b62d54','@lib/prismjs'),
	('aa3027dd','@lib/jquery-touch-events'),
	('ad1d836e','@craft/web/assets/tablesettings/dist'),
	('ad941b1f','@lib/picturefill'),
	('adecff61','@craft/web/assets/matrix/dist'),
	('b4991b46','@vendor/craftcms/redactor/lib/redactor-plugins/alignment'),
	('b57c1ae1','@lib/fileupload'),
	('bbefb93b','@craft/web/assets/sites/dist'),
	('c8cca901','@wheelform/assets'),
	('cc792a64','@lib/timepicker'),
	('d2c2ce72','@craft/web/assets/updater/dist'),
	('d6a33a48','@ether/seo/web/assets'),
	('db01882d','@craft/web/assets/recententries/dist'),
	('e5bbca43','@craft/web/assets/updateswidget/dist'),
	('eae8c6d','@lib/element-resize-detector'),
	('ec949e18','@craft/web/assets/generalsettings/dist'),
	('f3867211','@lib/xregexp'),
	('f6be23af','@craft/web/assets/pluginstore/dist'),
	('f758c95a','@vendor/craftcms/redactor/lib/redactor'),
	('f9ea369b','@lib/selectize'),
	('ffc513d2','@craft/web/assets/cp/dist');

/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table searchindex
# ------------------------------------------------------------

DROP TABLE IF EXISTS `searchindex`;

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `searchindex_keywords_idx` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`)
VALUES
	(1,'username',0,1,' timbo '),
	(1,'firstname',0,1,''),
	(1,'lastname',0,1,''),
	(1,'fullname',0,1,''),
	(1,'email',0,1,' tim lookthinkmake com '),
	(1,'slug',0,1,''),
	(2,'filename',0,1,' 6669600007_large jpg '),
	(2,'extension',0,1,' jpg '),
	(2,'kind',0,1,' image '),
	(2,'slug',0,1,''),
	(2,'title',0,1,' 6669600007 large '),
	(3,'filename',0,1,' april 2019 header jpg '),
	(3,'extension',0,1,' jpg '),
	(3,'kind',0,1,' image '),
	(3,'slug',0,1,''),
	(3,'title',0,1,' april 2019 header '),
	(4,'slug',0,1,''),
	(5,'slug',0,1,''),
	(6,'field',2,1,' home craft3starter '),
	(6,'slug',0,1,' __home__ '),
	(6,'title',0,1,' home '),
	(7,'field',5,1,' 8 '),
	(7,'field',6,1,' 1 '),
	(7,'field',7,1,''),
	(7,'slug',0,1,''),
	(8,'filename',0,1,' boxed water is better 1463962 unsplash jpg '),
	(8,'extension',0,1,' jpg '),
	(8,'kind',0,1,' image '),
	(8,'slug',0,1,''),
	(8,'title',0,1,' boxed water is better 1463962 unsplash '),
	(6,'field',3,1,' 1 lorem ipsum dolor sit amet consectetur adipiscing lorem ipsum dolor sit amet consectetur adipiscing elit cras sit amet rutrum nibh eu ornare sapien nulla pharetra vitae magna eu posuere vestibulum maximus velit justo et feugiat est ultricies ac etiam mollis sit amet tortor et molestie praesent ut fermentum elit vivamus a enim at elit eleifend mollis nullam in risus augue ut sed magna fermentum tortor consectetur fringilla sed at quam elementum efficitur tortor lacinia venenatis enim nulla vestibulum massa sed massa porttitor molestie ultrices tortor viverra duis dictum ipsum massa quis mollis eros scelerisque vel ut eu ligula sodales ultricies eros non porta diam bibendum interdum eleifend sit amet donec eros velit bibendum interdum eleifend sit amet lacinia eget arcu nulla ut erat sed ante accumsan dictum aliquam sodales at diam vel finibus integer mauris risus ornare quis tempus nec porta rutrum erat pellentesque at commodo arcu fusce condimentum nibh et pharetra dignissim nunc a lorem lacinia dui dapibus faucibus sit amet a urna aenean tempor metus nisi in arcu magna fermentum et euismod ut imperdiet vitae mi quisque ligula erat auctor nec tortor faucibus lacinia gravida diam vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae maecenas ut cursus turpis eget aliquam dolor fusce condimentum nibh et pharetra dignissim nunc a lorem lacinia dui dapibus faucibus sit amet a urna aenean tempor metus nisi in arcu magna fermentum et euismod ut imperdiet vitae mi quisque ligula erat auctor nec tortor faucibus lacinia gravida diam vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae maecenas ut cursus turpis eget aliquam dolor diam enim laoreet libero in tincidunt nulla eget sagittis aliquet diam enim laoreet libero a lacinia ante purus nec libero nulla vehicula vitae ligula id sodales in feugiat sit amet erat vel hendrerit integer elementum ultricies scelerisque nam et efficitur eros maecenas sed nisl risus aliquam ut sapien vel sem rutrum mollis maecenas congue facilisis felis sed auctor odio volutpat eu nam ultrices sapien non leo ultrices in hendrerit dolor cursus mauris vitae auctor dolor at sodales est pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas suspendisse quis ultricies eros donec ut purus purus suspendisse suscipit ac magna accumsan efficitur maecenas vulputate et nunc a sagittis quisque nec ex risus maecenas congue facilisis felis sed auctor odio volutpat eu nam ultrices sapien non leo ultrices in hendrerit dolor cursus mauris vitae auctor dolor at sodales est pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas suspendisse quis ultricies eros donec ut purus purus suspendisse suscipit ac magna accumsan efficitur maecenas vulputate et nunc a sagittis quisque nec ex risus vivamus sit amet sapien risus quisque venenatis lectus a egestas finibus vivamus sit amet sapien risus pellentesque tempus orci ut dignissim sollicitudin odio mi placerat leo vel euismod sapien magna a purus donec nulla lacus dictum nec sapien id tempus dignissim elit nulla quis ornare risus maecenas vel augue feugiat laoreet nibh porta ultrices diam here is a button in hac habitasse platea dictumst quisque mollis mauris sit amet faucibus egestas eros tellus blandit dolor id elementum dolor lacus bibendum magna aenean et tincidunt metus finibus suscipit elit in sed libero maximus leo hendrerit venenatis sit amet quis ipsum pellentesque ut faucibus sapien this is the caption quam condimentum cursus pellentesque vel cursus tellus integer ullamcorper quam condimentum cursus egestas neque nunc sollicitudin mauris a dignissim eros sapien ac purus donec lorem elit pellentesque aliquam luctus et scelerisque et nibh quisque congue vel magna ac lacinia pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas maecenas et dictum magna pellentesque convallis quis felis eu vehicula lorem ipsum dolor sit amet consectetur adipiscing elit suspendisse tincidunt ullamcorper erat eu hendrerit suspendisse dui turpis interdum id convallis in pharetra non erat sed porttitor felis lacus nec congue sapien efficitur quis cras tempus maximus accumsan this is the caption donec eros velit bibendum interdum eleifend sit amet lacinia eget arcu nulla ut erat sed ante accumsan dictum aliquam sodales at diam vel finibus integer mauris risus ornare quis tempus nec porta rutrum erat pellentesque at commodo arcu fusce condimentum nibh et pharetra dignissim nunc a lorem lacinia dui dapibus faucibus sit amet a urna aenean tempor metus nisi in arcu magna fermentum et euismod ut imperdiet vitae mi quisque ligula erat auctor nec tortor faucibus lacinia gravida diam vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae maecenas ut cursus turpis eget aliquam dolor donec eros velit bibendum interdum eleifend sit amet lacinia eget arcu nulla ut erat sed ante accumsan dictum aliquam sodales at diam vel finibus integer mauris risus ornare quis tempus nec porta rutrum erat pellentesque at commodo arcu fusce condimentum nibh et pharetra dignissim nunc a lorem lacinia dui dapibus faucibus sit amet a urna aenean tempor metus nisi in arcu magna fermentum et euismod ut imperdiet vitae mi quisque ligula erat auctor nec tortor faucibus lacinia gravida diam vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae maecenas ut cursus turpis eget aliquam dolor cras tempus maximus accumsan quisque ligula erat auctor nec tortor faucibus lacinia gravida diam vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae maecenas ut cursus turpis eget aliquam dolor code for the nerds quisque ligula erat auctor nec tortor faucibus lacinia gravida diam vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae maecenas ut cursus turpis eget aliquam dolor a blockquote style pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas maecenas et dictum magna pellentesque convallis quis felis eu vehicula lorem ipsum dolor sit amet consectetur adipiscing elit 8 here s a caption boxed water is better 1463962 unsplash 12 80 donec eros velit bibendum interdum eleifend sit amet lacinia eget arcu nulla ut erat sed ante accumsan dictum aliquam sodales at diam vel finibus integer mauris risus ornare quis tempus nec porta rutrum erat pellentesque at commodo arcu fusce condimentum nibh et pharetra dignissim nunc a lorem lacinia dui dapibus faucibus sit amet a urna aenean tempor metus nisi in arcu magna fermentum et euismod ut imperdiet vitae mi quisque ligula erat auctor nec tortor faucibus lacinia gravida diam vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae maecenas ut cursus turpis eget aliquam dolor boxed water is better 1463962 unsplash image right donec eros velit bibendum interdum eleifend sit amet lacinia eget arcu nulla ut erat sed ante accumsan dictum aliquam sodales at diam vel finibus integer mauris risus ornare quis tempus nec porta rutrum erat pellentesque at commodo arcu fusce condimentum nibh et pharetra dignissim nunc a lorem lacinia dui dapibus faucibus sit amet a urna aenean tempor metus nisi in arcu magna fermentum et euismod ut imperdiet vitae mi quisque ligula erat auctor nec tortor faucibus lacinia gravida diam vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae maecenas ut cursus turpis eget aliquam dolor form right '),
	(7,'field',4,1,' lorem ipsum dolor sit amet consectetur adipiscing lorem ipsum dolor sit amet consectetur adipiscing elit cras sit amet rutrum nibh eu ornare sapien nulla pharetra vitae magna eu posuere vestibulum maximus velit justo et feugiat est ultricies ac etiam mollis sit amet tortor et molestie praesent ut fermentum elit vivamus a enim at elit eleifend mollis nullam in risus augue ut sed magna fermentum tortor consectetur fringilla sed at quam elementum efficitur tortor lacinia venenatis enim nulla vestibulum massa sed massa porttitor molestie ultrices tortor viverra duis dictum ipsum massa quis mollis eros scelerisque vel ut eu ligula sodales ultricies eros non porta diam bibendum interdum eleifend sit amet donec eros velit bibendum interdum eleifend sit amet lacinia eget arcu nulla ut erat sed ante accumsan dictum aliquam sodales at diam vel finibus integer mauris risus ornare quis tempus nec porta rutrum erat pellentesque at commodo arcu fusce condimentum nibh et pharetra dignissim nunc a lorem lacinia dui dapibus faucibus sit amet a urna aenean tempor metus nisi in arcu magna fermentum et euismod ut imperdiet vitae mi quisque ligula erat auctor nec tortor faucibus lacinia gravida diam vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae maecenas ut cursus turpis eget aliquam dolor fusce condimentum nibh et pharetra dignissim nunc a lorem lacinia dui dapibus faucibus sit amet a urna aenean tempor metus nisi in arcu magna fermentum et euismod ut imperdiet vitae mi quisque ligula erat auctor nec tortor faucibus lacinia gravida diam vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae maecenas ut cursus turpis eget aliquam dolor diam enim laoreet libero in tincidunt nulla eget sagittis aliquet diam enim laoreet libero a lacinia ante purus nec libero nulla vehicula vitae ligula id sodales in feugiat sit amet erat vel hendrerit integer elementum ultricies scelerisque nam et efficitur eros maecenas sed nisl risus aliquam ut sapien vel sem rutrum mollis maecenas congue facilisis felis sed auctor odio volutpat eu nam ultrices sapien non leo ultrices in hendrerit dolor cursus mauris vitae auctor dolor at sodales est pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas suspendisse quis ultricies eros donec ut purus purus suspendisse suscipit ac magna accumsan efficitur maecenas vulputate et nunc a sagittis quisque nec ex risus maecenas congue facilisis felis sed auctor odio volutpat eu nam ultrices sapien non leo ultrices in hendrerit dolor cursus mauris vitae auctor dolor at sodales est pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas suspendisse quis ultricies eros donec ut purus purus suspendisse suscipit ac magna accumsan efficitur maecenas vulputate et nunc a sagittis quisque nec ex risus vivamus sit amet sapien risus quisque venenatis lectus a egestas finibus vivamus sit amet sapien risus pellentesque tempus orci ut dignissim sollicitudin odio mi placerat leo vel euismod sapien magna a purus donec nulla lacus dictum nec sapien id tempus dignissim elit nulla quis ornare risus maecenas vel augue feugiat laoreet nibh porta ultrices diam here is a button in hac habitasse platea dictumst quisque mollis mauris sit amet faucibus egestas eros tellus blandit dolor id elementum dolor lacus bibendum magna aenean et tincidunt metus finibus suscipit elit in sed libero maximus leo hendrerit venenatis sit amet quis ipsum pellentesque ut faucibus sapien this is the caption quam condimentum cursus pellentesque vel cursus tellus integer ullamcorper quam condimentum cursus egestas neque nunc sollicitudin mauris a dignissim eros sapien ac purus donec lorem elit pellentesque aliquam luctus et scelerisque et nibh quisque congue vel magna ac lacinia pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas maecenas et dictum magna pellentesque convallis quis felis eu vehicula lorem ipsum dolor sit amet consectetur adipiscing elit suspendisse tincidunt ullamcorper erat eu hendrerit suspendisse dui turpis interdum id convallis in pharetra non erat sed porttitor felis lacus nec congue sapien efficitur quis cras tempus maximus accumsan this is the caption donec eros velit bibendum interdum eleifend sit amet lacinia eget arcu nulla ut erat sed ante accumsan dictum aliquam sodales at diam vel finibus integer mauris risus ornare quis tempus nec porta rutrum erat pellentesque at commodo arcu fusce condimentum nibh et pharetra dignissim nunc a lorem lacinia dui dapibus faucibus sit amet a urna aenean tempor metus nisi in arcu magna fermentum et euismod ut imperdiet vitae mi quisque ligula erat auctor nec tortor faucibus lacinia gravida diam vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae maecenas ut cursus turpis eget aliquam dolor donec eros velit bibendum interdum eleifend sit amet lacinia eget arcu nulla ut erat sed ante accumsan dictum aliquam sodales at diam vel finibus integer mauris risus ornare quis tempus nec porta rutrum erat pellentesque at commodo arcu fusce condimentum nibh et pharetra dignissim nunc a lorem lacinia dui dapibus faucibus sit amet a urna aenean tempor metus nisi in arcu magna fermentum et euismod ut imperdiet vitae mi quisque ligula erat auctor nec tortor faucibus lacinia gravida diam vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae maecenas ut cursus turpis eget aliquam dolor cras tempus maximus accumsan quisque ligula erat auctor nec tortor faucibus lacinia gravida diam vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae maecenas ut cursus turpis eget aliquam dolor code for the nerds quisque ligula erat auctor nec tortor faucibus lacinia gravida diam vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae maecenas ut cursus turpis eget aliquam dolor a blockquote style pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas maecenas et dictum magna pellentesque convallis quis felis eu vehicula lorem ipsum dolor sit amet consectetur adipiscing elit '),
	(9,'field',15,1,' boxed water is better 1463962 unsplash '),
	(9,'field',16,1,' here s a caption '),
	(9,'field',17,1,' 12 '),
	(9,'field',18,1,' 80 '),
	(9,'field',19,1,''),
	(9,'field',20,1,''),
	(9,'field',21,1,''),
	(9,'slug',0,1,''),
	(10,'field',29,1,' donec eros velit bibendum interdum eleifend sit amet lacinia eget arcu nulla ut erat sed ante accumsan dictum aliquam sodales at diam vel finibus integer mauris risus ornare quis tempus nec porta rutrum erat pellentesque at commodo arcu fusce condimentum nibh et pharetra dignissim nunc a lorem lacinia dui dapibus faucibus sit amet a urna aenean tempor metus nisi in arcu magna fermentum et euismod ut imperdiet vitae mi quisque ligula erat auctor nec tortor faucibus lacinia gravida diam vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae maecenas ut cursus turpis eget aliquam dolor '),
	(10,'field',30,1,' boxed water is better 1463962 unsplash '),
	(10,'field',31,1,' image right '),
	(10,'field',32,1,''),
	(10,'slug',0,1,''),
	(11,'field',22,1,' donec eros velit bibendum interdum eleifend sit amet lacinia eget arcu nulla ut erat sed ante accumsan dictum aliquam sodales at diam vel finibus integer mauris risus ornare quis tempus nec porta rutrum erat pellentesque at commodo arcu fusce condimentum nibh et pharetra dignissim nunc a lorem lacinia dui dapibus faucibus sit amet a urna aenean tempor metus nisi in arcu magna fermentum et euismod ut imperdiet vitae mi quisque ligula erat auctor nec tortor faucibus lacinia gravida diam vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae maecenas ut cursus turpis eget aliquam dolor '),
	(11,'field',23,1,''),
	(11,'field',24,1,''),
	(11,'field',25,1,''),
	(11,'field',26,1,''),
	(11,'field',27,1,' form right '),
	(11,'field',28,1,''),
	(11,'slug',0,1,'');

/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagateEntries` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sections_handle_idx` (`handle`),
  KEY `sections_name_idx` (`name`),
  KEY `sections_structureId_idx` (`structureId`),
  KEY `sections_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;

INSERT INTO `sections` (`id`, `structureId`, `name`, `handle`, `type`, `enableVersioning`, `propagateEntries`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,'Site Sections','siteSections','structure',1,1,'2019-05-02 19:55:34','2019-05-02 20:23:21',NULL,'a8e283f3-6ac5-4c16-b9f9-2fc3a99ccaf3'),
	(2,NULL,'Points of Interest','pointsOfInterest','channel',1,1,'2019-05-02 20:20:54','2019-05-02 20:21:33',NULL,'9a82a87b-701a-4493-91aa-57f7f68211ae');

/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sections_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sections_sites`;

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  KEY `sections_sites_siteId_idx` (`siteId`),
  CONSTRAINT `sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;

INSERT INTO `sections_sites` (`id`, `sectionId`, `siteId`, `hasUrls`, `uriFormat`, `template`, `enabledByDefault`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,1,1,'{parent.uri}/{slug}','default-template',1,'2019-05-02 19:55:34','2019-05-02 20:23:21','c947033b-fa63-4fab-90ab-c019b109bd30'),
	(2,2,1,0,NULL,NULL,1,'2019-05-02 20:20:55','2019-05-02 20:21:33','ff4c88ea-0add-46a4-a182-6589a476cf32');

/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table seo_redirects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `seo_redirects`;

CREATE TABLE `seo_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `type` enum('301','302') NOT NULL,
  `siteId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table seo_sitemap
# ------------------------------------------------------------

DROP TABLE IF EXISTS `seo_sitemap`;

CREATE TABLE `seo_sitemap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group` enum('sections','categories','customUrls') NOT NULL,
  `url` varchar(255) NOT NULL,
  `frequency` enum('always','hourly','daily','weekly','monthly','yearly','never') NOT NULL,
  `priority` float NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sequences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sequences`;

CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sessions_uid_idx` (`uid`),
  KEY `sessions_token_idx` (`token`),
  KEY `sessions_dateUpdated_idx` (`dateUpdated`),
  KEY `sessions_userId_idx` (`userId`),
  CONSTRAINT `sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'p2DR8eNTLxxiQKQWq3A0nfm8qT0sRCmSKo9BwETbAcJaaUMOpW3ik3_GC-egFLlAZJAr2Y3uHKurTEYxFVRXw7BTLyBhaHVFLKxb','2019-05-02 19:27:53','2019-05-02 20:43:35','03c596d8-bca2-4f7f-9245-3893b9676958');

/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shunnedmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shunnedmessages`;

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `shunnedmessages_userId_message_unq_idx` (`userId`,`message`),
  CONSTRAINT `shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sitegroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sitegroups`;

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sitegroups_name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,'Craft3starter','2019-05-02 19:27:51','2019-05-02 19:27:51',NULL,'ef66ab2e-3044-4d28-af9b-b08c19db375b');

/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sites`;

CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sites_dateDeleted_idx` (`dateDeleted`),
  KEY `sites_handle_idx` (`handle`),
  KEY `sites_sortOrder_idx` (`sortOrder`),
  KEY `sites_groupId_fk` (`groupId`),
  CONSTRAINT `sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;

INSERT INTO `sites` (`id`, `groupId`, `primary`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,1,1,'Craft3starter','default','en-US',1,'$DEFAULT_SITE_URL',1,'2019-05-02 19:27:51','2019-05-02 19:27:51',NULL,'fc5e9046-d3d1-4ef3-bcf7-9b6177bb78f1');

/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table structureelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `structureelements`;

CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  KEY `structureelements_root_idx` (`root`),
  KEY `structureelements_lft_idx` (`lft`),
  KEY `structureelements_rgt_idx` (`rgt`),
  KEY `structureelements_level_idx` (`level`),
  KEY `structureelements_elementId_idx` (`elementId`),
  CONSTRAINT `structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;

INSERT INTO `structureelements` (`id`, `structureId`, `elementId`, `root`, `lft`, `rgt`, `level`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,NULL,1,1,4,0,'2019-05-02 20:23:43','2019-05-02 20:23:43','2999fd79-3f39-4a06-852e-30950f5f5b75'),
	(2,1,6,1,2,3,1,'2019-05-02 20:23:43','2019-05-02 20:23:43','d6437bd4-eea7-4be1-8030-a4080c1ebe67');

/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table structures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `structures`;

CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `structures_dateDeleted_idx` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;

INSERT INTO `structures` (`id`, `maxLevels`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,NULL,'2019-05-02 19:55:34','2019-05-02 20:23:21',NULL,'39731bbc-08c8-4926-b1d6-cf4fa24dac0a'),
	(2,2,'2019-05-02 19:57:04','2019-05-02 20:01:29',NULL,'5f6fba85-14d9-41e3-aef1-6e3b2a9ccaa9'),
	(3,2,'2019-05-02 19:57:15','2019-05-02 20:01:37',NULL,'42ff69c8-32c0-4837-9f40-ea6677f5661f'),
	(4,NULL,'2019-05-02 20:14:15','2019-05-02 20:15:01',NULL,'b4283f1a-a782-49d8-bdfc-4869f26fd089');

/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table supertableblocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `supertableblocks`;

CREATE TABLE `supertableblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `ownerSiteId` int(11) DEFAULT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `supertableblocks_ownerId_idx` (`ownerId`),
  KEY `supertableblocks_fieldId_idx` (`fieldId`),
  KEY `supertableblocks_typeId_idx` (`typeId`),
  KEY `supertableblocks_sortOrder_idx` (`sortOrder`),
  KEY `supertableblocks_ownerSiteId_idx` (`ownerSiteId`),
  CONSTRAINT `supertableblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `supertableblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `supertableblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `supertableblocks_ownerSiteId_fk` FOREIGN KEY (`ownerSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supertableblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `supertableblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table supertableblocktypes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `supertableblocktypes`;

CREATE TABLE `supertableblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `supertableblocktypes_fieldId_idx` (`fieldId`),
  KEY `supertableblocktypes_fieldLayoutId_idx` (`fieldLayoutId`),
  CONSTRAINT `supertableblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `supertableblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table systemmessages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `systemmessages`;

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `systemmessages_key_language_unq_idx` (`key`,`language`),
  KEY `systemmessages_language_idx` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table taggroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taggroups`;

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `taggroups_name_idx` (`name`),
  KEY `taggroups_handle_idx` (`handle`),
  KEY `taggroups_dateDeleted_idx` (`dateDeleted`),
  KEY `taggroups_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tags
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tags_groupId_idx` (`groupId`),
  CONSTRAINT `tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tags_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table templatecacheelements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `templatecacheelements`;

CREATE TABLE `templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  KEY `templatecacheelements_cacheId_idx` (`cacheId`),
  KEY `templatecacheelements_elementId_idx` (`elementId`),
  CONSTRAINT `templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table templatecachequeries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `templatecachequeries`;

CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecachequeries_cacheId_idx` (`cacheId`),
  KEY `templatecachequeries_type_idx` (`type`),
  CONSTRAINT `templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table templatecaches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `templatecaches`;

CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `templatecaches_siteId_idx` (`siteId`),
  CONSTRAINT `templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tokens`;

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_token_unq_idx` (`token`),
  KEY `tokens_expiryDate_idx` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usergroups`;

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usergroups_handle_unq_idx` (`handle`),
  UNIQUE KEY `usergroups_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table usergroups_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usergroups_users`;

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  KEY `usergroups_users_userId_idx` (`userId`),
  CONSTRAINT `usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table userpermissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpermissions`;

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_name_unq_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table userpermissions_usergroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpermissions_usergroups`;

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  KEY `userpermissions_usergroups_groupId_idx` (`groupId`),
  CONSTRAINT `userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table userpermissions_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpermissions_users`;

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  KEY `userpermissions_users_userId_idx` (`userId`),
  CONSTRAINT `userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table userpreferences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpreferences`;

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;

INSERT INTO `userpreferences` (`userId`, `preferences`)
VALUES
	(1,'{\"language\":\"en-US\"}');

/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `users_uid_idx` (`uid`),
  KEY `users_verificationCode_idx` (`verificationCode`),
  KEY `users_email_idx` (`email`),
  KEY `users_username_idx` (`username`),
  KEY `users_photoId_fk` (`photoId`),
  CONSTRAINT `users_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,'timbo',NULL,NULL,NULL,'tim@lookthinkmake.com','$2y$13$Cx2vHRC7/aSzUVfdUMJaTe4sSZAkAatGfMXMc9ZECOx3bfFblDZbS',1,0,0,0,'2019-05-02 19:27:53',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2019-05-02 19:27:53','2019-05-02 19:27:53','2019-05-02 19:27:55','d01f1342-c82a-42da-b3a0-8e7afed26505');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table volumefolders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `volumefolders`;

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  KEY `volumefolders_parentId_idx` (`parentId`),
  KEY `volumefolders_volumeId_idx` (`volumeId`),
  CONSTRAINT `volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;

INSERT INTO `volumefolders` (`id`, `parentId`, `volumeId`, `name`, `path`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,NULL,1,'Images','','2019-05-02 19:48:36','2019-05-02 19:51:09','7bbd0950-bbe1-489a-a994-1ffb6274d765'),
	(2,NULL,NULL,'Temporary source',NULL,'2019-05-02 19:48:57','2019-05-02 19:48:57','47eefedc-e75a-4613-879c-0eda2e2cd26e'),
	(3,2,NULL,'user_1','user_1/','2019-05-02 19:48:57','2019-05-02 19:48:57','bf007319-b4ec-4715-b0b8-6775a03057e8'),
	(4,NULL,2,'Form Uploads','','2019-05-02 20:18:21','2019-05-02 20:18:21','5ef78e23-4e0a-49b8-b827-ac9ec3cf4886');

/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table volumes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `volumes`;

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `volumes_name_idx` (`name`),
  KEY `volumes_handle_idx` (`handle`),
  KEY `volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  KEY `volumes_dateDeleted_idx` (`dateDeleted`),
  CONSTRAINT `volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;

INSERT INTO `volumes` (`id`, `fieldLayoutId`, `name`, `handle`, `type`, `hasUrls`, `url`, `settings`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`)
VALUES
	(1,NULL,'Images','images','craft\\volumes\\Local',1,'@baseUrl/assets/images','{\"path\":\"@basePath/assets/images\"}',1,'2019-05-02 19:48:36','2019-05-02 19:51:09',NULL,'c9edfe95-9cbc-42b3-9fdf-52b85c8aefbd'),
	(2,NULL,'Form Uploads','formUploads','craft\\volumes\\Local',0,NULL,'{\"path\":\"@basePath/assets/form-uploads\"}',2,'2019-05-02 20:18:21','2019-05-02 20:18:21',NULL,'a2e2df64-a586-491b-8079-2dfd536d00a5');

/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wheelform_form_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wheelform_form_fields`;

CREATE TABLE `wheelform_form_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `required` tinyint(3) NOT NULL DEFAULT '0',
  `index_view` tinyint(3) NOT NULL DEFAULT '0',
  `order` int(11) DEFAULT NULL,
  `active` tinyint(3) NOT NULL DEFAULT '1',
  `options` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `wheelform_form_fields_active_idx` (`active`),
  KEY `wheelform_form_fields_form_id_fk` (`form_id`),
  CONSTRAINT `wheelform_form_fields_form_id_fk` FOREIGN KEY (`form_id`) REFERENCES `wheelform_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `wheelform_form_fields` WRITE;
/*!40000 ALTER TABLE `wheelform_form_fields` DISABLE KEYS */;

INSERT INTO `wheelform_form_fields` (`id`, `form_id`, `name`, `type`, `required`, `index_view`, `order`, `active`, `options`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'email','email',1,0,3,1,'{\"validate\":0,\"label\":\"\",\"items\":[],\"containerClass\":\"animate-label\",\"fieldClass\":\"required\",\"selectEmpty\":0,\"placeholder\":\"\",\"is_reply_to\":false,\"is_user_notification_field\":false}','2019-05-02 19:47:21','2019-05-02 20:37:23','203f1b28-3170-4ab5-8cac-79e0d32defcf'),
	(2,1,'first-name','text',1,0,1,1,'{\"validate\":0,\"label\":\"\",\"items\":[],\"containerClass\":\"half-width animate-label\",\"fieldClass\":\"required\",\"selectEmpty\":0,\"placeholder\":\"\",\"is_reply_to\":false,\"is_user_notification_field\":false}','2019-05-02 19:47:21','2019-05-02 20:37:23','25c90ccc-ce4d-4d39-a51c-f49980caf61d'),
	(3,1,'message','textarea',0,0,5,1,'{\"validate\":0,\"label\":\"\",\"items\":[],\"containerClass\":\"\",\"fieldClass\":\"\",\"selectEmpty\":0,\"placeholder\":\"\",\"is_reply_to\":false,\"is_user_notification_field\":false}','2019-05-02 19:47:21','2019-05-02 20:37:23','6fc302ba-59ae-40ac-845c-ab0019713cc4'),
	(4,1,'last-name','text',1,0,2,1,'{\"validate\":0,\"label\":\"\",\"items\":[],\"containerClass\":\"half-width animate-label\",\"fieldClass\":\"required\",\"selectEmpty\":0,\"placeholder\":\"\",\"is_reply_to\":false,\"is_user_notification_field\":false}','2019-05-02 20:37:23','2019-05-02 20:37:23','5e280f47-0189-4eaf-88aa-a9db8f3dcb00'),
	(5,1,'phone','text',0,0,4,1,'{\"validate\":0,\"label\":\"\",\"items\":[],\"containerClass\":\"animate-label\",\"fieldClass\":\"\",\"selectEmpty\":0,\"placeholder\":\"\",\"is_reply_to\":false,\"is_user_notification_field\":false}','2019-05-02 20:37:23','2019-05-02 20:37:23','82b609f1-37fb-4715-a393-0c1e3398fd70');

/*!40000 ALTER TABLE `wheelform_form_fields` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wheelform_forms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wheelform_forms`;

CREATE TABLE `wheelform_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `to_email` varchar(255) NOT NULL,
  `active` tinyint(3) NOT NULL DEFAULT '1',
  `send_email` tinyint(3) NOT NULL DEFAULT '0',
  `recaptcha` tinyint(3) NOT NULL DEFAULT '0',
  `save_entry` tinyint(3) NOT NULL DEFAULT '1',
  `options` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `wheelform_forms_site_id_fk` (`site_id`),
  CONSTRAINT `wheelform_forms_site_id_fk` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `wheelform_forms` WRITE;
/*!40000 ALTER TABLE `wheelform_forms` DISABLE KEYS */;

INSERT INTO `wheelform_forms` (`id`, `site_id`, `name`, `to_email`, `active`, `send_email`, `recaptcha`, `save_entry`, `options`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'Contact Form','tim@lookthinkmake.com',1,1,0,1,'{\"honeypot\":\"\",\"email_subject\":\"\",\"user_notification\":0}','2019-05-02 19:47:21','2019-05-02 20:37:23','5919d203-a146-4df8-a87a-575caa1e97c6');

/*!40000 ALTER TABLE `wheelform_forms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wheelform_message_values
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wheelform_message_values`;

CREATE TABLE `wheelform_message_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `value` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `wheelform_message_values_message_id_fk` (`message_id`),
  KEY `wheelform_message_values_field_id_fk` (`field_id`),
  CONSTRAINT `wheelform_message_values_field_id_fk` FOREIGN KEY (`field_id`) REFERENCES `wheelform_form_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wheelform_message_values_message_id_fk` FOREIGN KEY (`message_id`) REFERENCES `wheelform_messages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table wheelform_messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wheelform_messages`;

CREATE TABLE `wheelform_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `read` tinyint(3) NOT NULL DEFAULT '0',
  `options` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `wheelform_messages_form_id_fk` (`form_id`),
  CONSTRAINT `wheelform_messages_form_id_fk` FOREIGN KEY (`form_id`) REFERENCES `wheelform_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table widgets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `widgets`;

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `widgets_userId_idx` (`userId`),
  CONSTRAINT `widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`)
VALUES
	(1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}',1,'2019-05-02 19:27:55','2019-05-02 19:27:55','de8608e2-a0ca-4465-8920-73e0ecebeeed'),
	(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2019-05-02 19:27:55','2019-05-02 19:27:55','b1ead8ad-5e3e-4097-a150-f6cca17dddba'),
	(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2019-05-02 19:27:55','2019-05-02 19:27:55','f8077fa6-3a51-45d8-b8d6-629041369c9a'),
	(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2019-05-02 19:27:55','2019-05-02 19:27:55','b5b57689-8525-4d52-9bfc-f5597521bf7f');

/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
