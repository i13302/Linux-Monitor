/* ユーザ作成 */
CREATE USER 'user1'@'10.0.1.%' IDENTIFIED BY 'password';

CREATE DATABASE IF NOT EXISTS `Machine` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE DATABASE IF NOT EXISTS `List` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

GRANT  INSERT,SELECT,UPDATE,CREATE, ON `Machine`.* TO 'user1'@'10.0.1.%';
GRANT  INSERT,SELECT,UPDATE, ON `List`.* TO 'user1'@'10.0.1.%';

CREATE TABLE `Machine`.`LoadAverage`(
	ID  INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY, /* 入力idx */
	gettime   DATETIME         NOT NULL,  /* 取得時間 */
	ipaddr    INTEGER UNSIGNED NOT NULL,  /* IPアドレス */
	la1min    FLOAT            NOT NULL,  /* 1min */
	la5min    FLOAT            NOT NULL,  /* 5min */
	la15min   FLOAT            NOT NULL   /* 10min */
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE `Machine`.`CPUUsage`(
	ID  INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY, /* 入力idx */
	gettime   DATETIME         NOT NULL,  /* 取得時間 */
	ipaddr    INTEGER UNSIGNED NOT NULL,  /* IPアドレス */
	cpuUsage  INTEGER          NOT NULL   /* CPU使用率 */
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE `Machine`.`MemUsage`(
	ID  INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY, /* 入力idx */
	gettime   DATETIME         NOT NULL,  /* 取得時間 */
	ipaddr    INTEGER UNSIGNED NOT NULL,  /* IPアドレス */
	memUsage  INTEGER          NOT NULL   /* メモリ使用率 */
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE `Machine`.`DiskUsage`(
	ID  INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY, /* 入力idx */
	gettime   DATETIME         NOT NULL,  /* 取得時間 */
	ipaddr    INTEGER UNSIGNED NOT NULL,  /* IPアドレス */
	diskUsage INTEGER          NOT NULL   /* Disk使用率 */
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE `Machine`.`Temperature`(
	ID  INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY, /* 入力idx */
	gettime   DATETIME         NOT NULL,  /* 取得時間 */
	ipaddr    INTEGER UNSIGNED NOT NULL,  /* IPアドレス */
	temperature INTEGER        NOT NULL   /* 温度 */
) ENGINE = InnoDB DEFAULT CHARSET = utf8;


CREATE TABLE `List`.`Connection`(
	ID  INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY, /* 入力idx */
	ipaddr    INTEGER UNSIGNED NOT NULL,  /* IPアドレス */
	name      VARCHAR(30) NOT NULL        /* マシン名 */
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE `List`.`MIBNodeOIDNumber`(
	ID  INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY, /* 入力idx */
	ipaddr    INTEGER UNSIGNED NOT NULL,  /* IPアドレス */
	oid       VARCHAR(50) NOT NULL        /* マシン名 */
) ENGINE = InnoDB DEFAULT CHARSET = utf8;