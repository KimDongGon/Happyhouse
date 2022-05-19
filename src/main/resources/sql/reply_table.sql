CREATE TABLE IF NOT EXISTS `happyhouse`.`reply` (
  `replyno` INT NOT NULL AUTO_INCREMENT,
  `no` INT NULL DEFAULT NULL,
  `content` VARCHAR(2000) NULL DEFAULT NULL,
  `regtime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`replyno`),
  INDEX `reply_to_qna_fk` (`no` ASC) VISIBLE,
  CONSTRAINT `reply_to_qna_fk`
    FOREIGN KEY (`no`)
    REFERENCES `happyhouse`.`qna` (`no`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;