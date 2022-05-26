use happyhouse;

DROP TABLE IF EXISTS `happyhouse`.`qna`;

CREATE TABLE IF NOT EXISTS `happyhouse`.`qna` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(16) NULL DEFAULT NULL,
  `title` VARCHAR(100) NULL DEFAULT NULL,
  `content` VARCHAR(2000) NULL DEFAULT NULL,
  `hit` INT NULL DEFAULT 0,
  `replycount` INT NULL DEFAULT 0,
  `regtime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`no`),
  INDEX `qna_to_user_fk` (`id` ASC) VISIBLE,
  CONSTRAINT `qna_to_user_fk`
    FOREIGN KEY (`id`)
    REFERENCES `happyhouse`.`user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

commit;

-- select * from qna;