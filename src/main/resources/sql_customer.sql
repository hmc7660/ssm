-- create database ssm character set utf8;

drop table if exists tb_user;
drop table if exists tb_customer;

create table tb_user(
  id int primary key auto_increment,
  username varchar(100),
  password varchar(100)
) default charset = utf8;

create table tb_customer(
  id int primary key auto_increment,
  name varchar(100),
  telephone varchar(100),
  address varchar(100),
  remark varchar(100)
) default charset = utf8;

insert into tb_user values(1,'admin','admin');

insert into tb_customer values(1,'小张','135xxxx8891','北京','备注');
insert into tb_customer values(2,'小李','135xxxx8892','天津','备注');
insert into tb_customer values(3,'小王','135xxxx8893','重庆','备注');
insert into tb_customer values(4,'小赵','135xxxx8894','武汉','备注');
insert into tb_customer values(5,'小刘','135xxxx8895','青岛','备注');
insert into tb_customer values(6,'小周','135xxxx8896','上海','备注');

