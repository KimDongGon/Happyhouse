DROP TABLE IF EXISTS `happyhouse`.`notice`;

CREATE TABLE IF NOT EXISTS `happyhouse`.`notice` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `subject` VARCHAR(100) NULL DEFAULT NULL,
  `content` VARCHAR(2000) NULL DEFAULT NULL,
  `regtime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`no`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

insert into notice(subject, content) 
values('홈페이지 업데이트 관련 공지', '홈페이지가 업데이트 될 예정이오니 공지한 시간대에는 접속을 금해주시길 바랍니다.'), 
      ('개인 정보 변경 관련 공지', '개인정보를 변경할 때는 아이디와 비밀번호를 필수 입력해야합니다.'),
      ('공지사항입니다.','로그인 전용 페이지입니다.');

select * from notice;
      