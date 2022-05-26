
---------------------------------------------------
-- noice_table dummy data 
---------------------------------------------------
insert into notice(subject, content) 
values('[필독] 해피하우스 이용 회원 공지','해피하우스는 로그인을 하셔야 이용하실 수 있습니다.'),
	('홈페이지 업데이트 관련 공지', '홈페이지가 업데이트 될 예정이오니 공지한 시간대에는 접속을 금해주시길 바랍니다.'), 
      ('개인 정보 변경 관련 공지', '개인정보를 변경할 때는 아이디와 비밀번호를 필수 입력해야합니다.'),
      ('공지사항입니다.','로그인 전용 페이지입니다.'),
      ('최신 뉴스 페이지 추가','경제, 아파트 매매 관련 최신 뉴스를 실시간으로 제공해드립니다.');

-- select * from notice;
---------------------------------------------------
-- qna_table dummy data 
---------------------------------------------------
insert into qna(id, title, content,hit) 
values('kimssafy', '아파트 매매정보 관련', '아파트 관련 정보는 언제 업데이트 되나요?',20), 
      ('leessafy', '개인 정보 변경 관련 질문', '개인정보를 변경하려는데 비밀번호 오류가 뜹니다.',33),
      ('user01', '회원탈퇴 관련 질문', '회원탈퇴가 진행되질 않습니다. 답변 부탁드립니다.',45),
      ('user02', '아파트 업데이트 질문', '아파트 매매 정보가 업데이트 되질 않습니다. 확인 부탁드립니다.',17),
      ('user03', '뉴스페이지 관련 질문', '뉴스페이지에 접속이 되질 않습니다.',66),
      ('user04', '회원탈퇴 관련 질문', '회원탈퇴가 진행되질 않습니다. 답변 부탁드립니다.',45),
      ('user03', '로그인 오류', '제대로된 정보를 입력하였는데 로그인이 되질 않습니다.',49),
      ('user03', '비밀번호 관련 오류', '올바른 비밀번호를 입력하였는데 잘못된 정보라고 나옵니다.',26),
      ('user02', '아파트 매매 관련 문의드립니다.', '회원탈퇴가 진행되질 않습니다. 답변 부탁드립니다.',49),
      ('leessafy', '뉴스 기사 관련 문의드립니다.', '뉴스 기사 업데이트의 기준이 뭔가요?',77),
      ('parkssafy', '아파트 위치 정보 문의', '회원탈퇴가 진행되질 않습니다. 답변 부탁드립니다.',123),
      ('leessafy', '개인 정보 관련 질문', '회원정보는 가입 시 얼마나 유지되는지 알고싶습니다.',44),
      ('user04', '회원탈퇴 관련 질문', '회원탈퇴가 진행되질 않습니다. 답변 부탁드립니다.',26),
      ('user01', '지도 정보 문의', '아파트 매매 정보에서 아파트 위치 정보가 나타나지 않습니다. 확인 부탁드려요.',49),
      ('user04', '홈페이지 광고 차단', '홈페이지에 불필요한 광고가 너무 자주 노출됩니다.',52),
      ('kimssafy', '회원가입 오류', '잘못된 개인정보로 회원가입을 했는데 변경이 가능할까요?',9),
      ('parkssafy', '해피하우스 지인 추천', '지인에게 해피하우스 홈페이지를 추천해서 가입하면 이득이 있나요?',19),
      ('user01', '회원탈퇴 관련 질문', '회원탈퇴가 진행되질 않습니다. 답변 부탁드립니다.',10),
      ('user02', '아파트 매매정보 관련', '아파트 관련 정보는 언제 업데이트 되나요?',34);

-- select * from qna;
---------------------------------------------------
-- qna_table dummy data 
---------------------------------------------------
insert into reply(replyno, no, content) 
values(1, 1, '확인 후 개인 메일 발송드리겠습니다.'),
	(1, 3, '메일 발송하였습니다. 확인 부탁드립니다.'),
    (2, 1, '아파트 매매 정보는 매 주 일요일 오후에 업데이트 됩니다.'),
    (1, 2, '개인정보가 계속 바뀌질 않으면 홈페이지 내 명시되어 있는 전화번호로 연락 부탁드립니다.'),
    (1, 4, '내부 서버에서 일시적인 오류가 발생하였습니다.'),
    (2, 4, '서버 업데이트 되었습니다. 다시 접속 부탁드립니다.'),
    (1, 5, '새로고침 후 다시 접속하여 주시길 바랍니다.'),
    (1, 6, '확인 후 개인 메일 발송 드리겠습니다.'),
    (1, 8, '개인 정보 확인 후 다시 접속 부탁드립니다.'),
    (1, 10, '뉴스는 실시간으로 해피하우스 회원들에게 제공됩니다. 실시간으로 변경됩니다.'),
    (1, 11, '내부 서버에서 일시적인 오류가 발생하였습니다. 잠시만 기다려주세요.'),
    (2, 11, '서버 업데이트 완료했습니다.'),
    (1, 12, '회원 가입시 최대 1년 개인정보가 유지됩니다. 이후에는 갱신이 필요합니다.'),
    (1, 13, '탈퇴처리를 원하시면 문의 부탁드립니다.'),
    (1, 14, '확인 후 개인 메일 발송드리겠습니다.'),
    (1, 15, '마이페이지에서 개인정보 변경 해보시고 오류가 발생한다면 다시 문의 주시길 바랍니다.'),
    (1, 16, '아파트 매매 정보는 금일 오후 6시경에 새로 업데이트 될 예정입니다.'),
    (2, 16, '아파트 매매 정보가 업데이트 되었습니다. 확인바랍니다.');

-- select * from reply;
    
    
    