CREATE DATABASE IF NOT EXISTS `List` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

GRANT  INSERT,SELECT,UPDATE ON `List`.* TO 'user1'@'10.0.1.%';

CREATE TABLE `List`.`Connection`(
	ID  INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY, /* 入力idx */
	ipaddr    INTEGER UNSIGNED NOT NULL,  /* IPアドレス */
	name      VARCHAR(30) NOT NULL        /* マシン名 */
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE `List`.`MIBNodeOIDNumber`(
	ID  INTEGER UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY, /* 入力idx */
	oid       VARCHAR(50) NOT NULL,       /* マシン名 */
	name      VARCHAR(30) NOT NULL        /* マシン名 */
) ENGINE = InnoDB DEFAULT CHARSET = utf8;
