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

select * from reply;

insert into reply(no, content) 
values(3,'확인 후 개인 메일 발송드리겠습니다.'),
	(3, '메일 발송하였습니다. 확인 부탁드립니다.'),
    (1, '아파트 매매 정보는 매 주 일요일 오후에 업데이트 됩니다.');

      
      
      