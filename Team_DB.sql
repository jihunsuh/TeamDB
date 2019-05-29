-------------shop 계정 만들기---------------

drop user shop cascade;

-- oracle 계정: shop / 비밀번호: shop
create user shop
identified by shop;

grant connect, resource to shop;
grant create view, create synonym to shop;

alter user shop account unlock;

-------------상품(tbl_product) 테이블-----------------
create table tbl_product(
    productCode varchar2(100),
    productName varchar2(100), 
    manufacturer varchar2(100),
    price number,
    description varchar2(300),
    os varchar2(50),
    productType varchar2(100),
    stock number,
    usability varchar2(50)
);
--기본키 설정(productCode)--
alter table tbl_product add constraint pk_product primary key (productCode);

drop table tbl_product;
commit;
---------사용자(tbl_user) 테이블------------------
create table tbl_user(
    id varchar2(50),
    password varchar2(250),
    name varchar2(50),
    address varchar2(100),
    contact varchar2(50),
    email varchar2(50),
    point number,
    userCode number,
    regiDate DATE
);
--기본키 설정(id)--
alter table tbl_user add constraint pk_user primary key (id);

drop table tbl_user;
commit;
---------장바구니(tbl_cart) 테이블------------------
create table tbl_cart(
    cartNo NUMBER,
    productCode VARCHAR2(100),
    id varchar2(50),
    amount number
);
--기본키(복합키) 설정(cartNo, productCode, id)--
alter table tbl_cart add constraint pk_cart primary key (cartNo, productCode, id);
--외래키 설정(productCode)--
alter table tbl_cart add constraint fk_cart1
foreign key (productCode) references tbl_product (productCode);
--외래키 설정(id)
alter table tbl_cart add constraint fk_cart2
foreign key (id) references tbl_user (id);

drop table tbl_cart;
---------결제(tbl_payment) 테이블----------------
create table tbl_payment(
    payCode varchar2(50),
    cartNo number,
    id varchar2(50),
    productCode varchar2(100),
    amount number,
    address varchar2(100),
    payDate DATE,
    contact varchar2(50)
);
--기본키(복합키) 설정(payCode, cartNo, productCode, id)--
alter table tbl_payment add constraint pk_payment primary key (payCode, cartNo, productCode, id);
--외래키 설정(cartNo, id, productCode)-- 
alter table tbl_payment add constraint fk_payment
foreign key (cartNo, id, productCode) references tbl_cart (cartNo, id, productCode);

commit;
drop table tbl_payment;
---------카테고리(tbl_category) 테이블.....기본키 설정과 외래키 설정해야함-----------
create table tbl_category(
    cateCode varchar2(30),
    productCode varchar2(100),
    productType varchar2(100),
    cateCodeRef varchar2(30)
);
--기본키 설정(cateCode)--
alter table tbl_category add constraint pk_category primary key (cateCode);
--외래키 설정(productCode)-- 
alter table tbl_category add constraint fk_category1
foreign key (productCode) references tbl_product (productCode);
--외래키 설정(cateCodeRef)-- 
alter table tbl_category add constraint fk_category2
foreign key (cateCodeRef) references tbl_category (cateCode);

drop table tbl_category;
commit;
---------리뷰(tbl_review) 테이블-----------------
create table tbl_review(
    reviewNo number,
    cartNo number,
    productCode varchar2(100),
    payCode varchar2(50),
    id varchar2(50),
    name varchar2(50),
    content varchar2(300),
    reviewPoint number,
    reviewDate DATE
);
--리뷰 시퀸스(tbl_review_seq) 리뷰글번호(reviewNo)에 적용--
create sequence tbl_review_seq
start with 1
increment by 1;
--기본키(복합키) 설정(reviewNo, payCode, cartNo, productCode, id)--
alter table tbl_review add constraint pk_review primary key (reviewNo, payCode, cartNo, productCode, id);
--외래키 설정(payCode, cartNo, id, productCode)-- 
alter table tbl_review add constraint fk_review
foreign key (payCode, cartNo, id, productCode) references tbl_payment (payCode, cartNo, id, productCode);

drop sequence tbl_review_seq;
drop table tbl_review;
commit;
---------문의(tbl_inquiry) 테이블---------------
create table tbl_inquiry(
   inquiryNo number,
   id varchar2(50),
   name varchar2(50),
   title varchar2(100),
   content varchar2(300),
   password varchar2(250),
   inquiryDate DATE
);
--문의 시퀀스(tbl_inquiry_seq) 문의 글번호(inquiryNo)에 적용--
create sequence tbl_inquiry_seq
start with 1
increment by 1;
--기본키(복합키) 설정(inquiryNo, id)--
alter table tbl_inquiry add constraint pk_inquiry primary key (inquiryNo, id);
--아이디(id) 외래키 설정--
alter table tbl_inquiry add constraint fk_inquiry
foreign key (id) references tbl_user (id);

drop sequence tbl_inquiry_seq;
drop table tbl_inquiry;
---------답변(tbl_reply) 테이블-----------------
create table tbl_reply(
    replyNo number,
    inquiryNo number,
    id varchar2(50),
    title varchar2(100),
    content varchar2(300),
    replyDate DATE
);
--답변 시퀀스(tbl_reply_seq) 답변 글번호(replyNo)에 적용--
create sequence tbl_reply_seq
start with 1
increment by 1;
--기본키 설정(replyNo)--
alter table tbl_reply add constraint pk_reply primary key (replyNo);

--외래키 설정(inquiryNo, id)--
alter table tbl_reply add constraint fk_reply
foreign key (inquiryNo, id) references tbl_inquiry (inquiryNo, id);

drop sequence tbl_reply_seq;
drop table tbl_reply;
commit;
--------------------------------------------------