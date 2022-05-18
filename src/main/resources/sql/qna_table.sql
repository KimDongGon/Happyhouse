use happyhouse;

CREATE TABLE IF NOT EXISTS `happyhouse`.`qna` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `id` VARCHAR(16) NULL DEFAULT NULL,
  `title` VARCHAR(100) NULL DEFAULT NULL,
  `content` VARCHAR(2000) NULL DEFAULT NULL,
  `hit` INT NULL DEFAULT 0,
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


insert into qna(id, title, content) 
values('ssafy', '아파트 매매정보 관련', '아파트 관련 정보는 언제 업데이트 되나요?'), 
      ('user01', '개인 정보 변경 관련 질문', '개인정보를 변경하려는데 비밀번호 오류가 뜹니다.'),
      ('user04', '회원탈퇴 관련 질문', '회원탈퇴가 진행되질 않습니다. 답변 부탁드립니다.');
      
commit;

-- select * from qna;