-------------상품(tbl_product) 테이블에 insert-----------------
insert into 
tbl_product(productCode, productName, manufacturer, price, description, os, productType, stock, usability) 
values('a12', '오디세이', '삼성', 2000000, 'cpu: i7 / ram: 16gb', 'windows7', '데스크탑', 25, '게이밍PC');

insert into 
tbl_product(productCode, productName, manufacturer, price, description, os, productType, stock, usability) 
values('b12', '27V790', 'LG', 2500000, 'cpu: i8 / ram: 32gb / 일체형 데스크탑', 'windows7', '데스크탑', 20, '사무용PC');
-------------사용자 테이블에 insert----------------
insert into
tbl_user(id, password, name, address, contact, email, point, userCode, regiDate)
values('hong1', 'hong1', '홍길동', '인천 부평구', '010-1234-5678', 'hong@a.com', 5000000, 100, sysdate);

insert into
tbl_user(id, password, name, address, contact, email, point, userCode, regiDate)
values('hong2', 'hong2', '홍길자', '인천 계양구', '010-1567-5788', 'hong2@a2.com', 5000000, 100, sysdate);

insert into
tbl_user(id, password, name, contact, email, userCode, regiDate)
values('admin', 'admin', '관리자', '02-1245-6789', 'admin@admin.com', 200, sysdate);
commit;
-------------장바구니 테이블에 insert---------------
insert into 
tbl_cart(cartNo, productCode, id, amount)
values(1, 'a12', 'hong1', 1);

insert into 
tbl_cart(cartNo, productCode, id, amount)
values(1, 'b12', 'hong1', 1);

insert into 
tbl_cart(cartNo, productCode, id, amount)
values(2, 'b12', 'hong2', 2);

insert into 
tbl_cart(cartNo, productCode, id, amount)
values(2, 'a12', 'hong2', 2);
-------------결제 테이블에 insert------------------
insert into
tbl_payment(payCode, cartNo, id, productCode, amount, address, payDate, contact)
values('p1', 1, 'hong1', 'a12', 1, '인천 부평구', sysdate, '010-1234-5678');

insert into
tbl_payment(payCode, cartNo, id, productCode, amount, address, payDate, contact)
values('p1', 1, 'hong1', 'b12', 1, '인천 부평구', sysdate, '010-1234-5678');

insert into
tbl_payment(payCode, cartNo, id, productCode, amount, address, payDate, contact)
values('p2', 2, 'hong2', 'a12', 2, '인천 계양구', sysdate, '010-1567-5788');

insert into
tbl_payment(payCode, cartNo, id, productCode, amount, address, payDate, contact)
values('p2', 2, 'hong2', 'b12', 2, '인천 계양구', sysdate, '010-1567-5788');
-------------리뷰 테이블에 insert------------------
insert into 
tbl_review(reviewNo, cartNo, productCode, payCode, id, name, content, reviewPoint, reviewDate)
values(tbl_review_seq.nextval, 1, 'a12', 'p1', 'hong1', '홍길동', '만족합니다.', 5, sysdate);

insert into 
tbl_review(reviewNo, cartNo, productCode, payCode, id, name, content, reviewPoint, reviewDate)
values(tbl_review_seq.nextval, 1, 'b12', 'p1', 'hong1', '홍길동', '만족합니다.', 4, sysdate);

insert into 
tbl_review(reviewNo, cartNo, productCode, payCode, id, name, content, reviewPoint, reviewDate)
values(tbl_review_seq.nextval, 2, 'a12', 'p2', 'hong2', '홍길자', '별로입니다.', 1, sysdate);

insert into 
tbl_review(reviewNo, cartNo, productCode, payCode, id, name, content, reviewPoint, reviewDate)
values(tbl_review_seq.nextval, 2, 'b12', 'p2', 'hong2', '홍길자', '그냥 쓰려고합니다.', 3, sysdate);
commit;
-------------문의 테이블에 insert------------------
insert into
tbl_inquiry(inquiryNo, id, name, title, content, password, inquiryDate)
values(tbl_inquiry_seq.nextval, 'hong1', '홍길동', '상품 문의', '할인이 되나요?', 'hong1', sysdate);

insert into
tbl_inquiry(inquiryNo, id, name, title, content, password, inquiryDate)
values(tbl_inquiry_seq.nextval, 'hong2', '홍길자', '환불 문의', '환불절차 궁금합니다', 'hong2', sysdate);
commit;
-------------답변 테이블에 insert------------------
insert into 
tbl_reply(replyNo, inquiryNo, id, title, content, replyDate)
values(tbl_reply_seq.nextval, 2, 'hong1', '할인 절차', '할인 절차를 이렇습니다.', sysdate);

insert into 
tbl_reply(replyNo, inquiryNo, id, title, content, replyDate)
values(tbl_reply_seq.nextval, 3, 'hong2', '환불 관련', '환불 절차는 이렇습니다.', sysdate);

insert into
tbl_reply(replyNo, inquiryNo, id, title, content, replyDate)
values(tbl_reply_seq.nextval,(select inquiryNo from tbl_inquiry where id = 'hong1'), 'hong1', '할인 절차', '추가 절차', sysdate);

commit;
-----------------------------------------------------------------------------------------------
---------------------------select 문 테스트------------------------------------------
select * from tbl_product;
select * from tbl_user;
select * from tbl_cart;
select * from tbl_payment;
select * from tbl_review;
select * from tbl_inquiry;
select * from tbl_reply;
