
drop database if exists PRO1041;
create database PRO1041;
use PRO1041;

drop table if exists roles;
create table roles 
(
	id int auto_increment primary key,
    roleName nvarchar(55) null,
    createdDate date null,
    updatedDate date null
);

drop table if exists users;
create table users
(
	id int auto_increment primary key,
    roleId int,
    username varchar(55) null,
    password varchar(100) null,
    fullName nvarchar(100) null,
    birthDay date null,
    email varchar (55) null,
    address nvarchar(255) null,
    phone varchar(11) null,
    createdDate date null,
    updatedDate date null,
    isActived bit null,
    foreign key (roleId) references roles(id) 
);

drop table if exists events;
create table events 
(
	id int primary key auto_increment,
    userId int null,
    title nvarchar(255) null,
    content nvarchar(255) null,
    location nvarchar(255) null,
    status nvarchar(55) null,
    startedDate date null,
    endedDate date null,
    createdDate date null,
    updatedDate date null,
    foreign key (userId) references users(id)
);

drop table if exists account;
create table account
(
	id int primary key,
    username varchar(55) null,
    password varchar(55) null
);

insert into account values (1, "", "");

insert into roles (roleName) VALUES 
(N'Chủ nhiệm'),
(N'Phó chủ nhiệm'),
(N'Thủ quỹ'),
(N'Thành viên');

insert into users (roleId, username, password, fullName, birthDay, email, address, phone, createdDate, updatedDate, isActived) VALUES 
(1, 'phanlamhung', '1234', N'Nguyễn Phan Lâm Hùng', '1999-01-01', 'hung@example.com', N'123 Đường A, Hà Nội', '0909123456', '2023-01-01', '2023-01-01', 1),
(2, 'giangnd', '123', N'Nguyễn Đằng Giang', '1999-02-01', 'giang@example.com', N'456 Đường B, TP.HCM', '0909876543', '2023-01-02', '2023-01-02', 1),
(3, 'haithach', '456', N'Nguyễn Dung Hải Thạch', '2002-03-01', 'thach@example.com', N'789 Đường C, Đà Nẵng', '0909345678', '2023-01-03', '2023-01-03', 1),
(4, 'vulam', '789', N'Hà Vũ Lâm', '1998-04-01', 'lam@example.com', N'101 Đường D, Cần Thơ', '0909789123', '2023-01-04', '2023-01-04', 1);

insert into events (userId, title, content, location, status, startedDate, endedDate, createdDate, updatedDate) values
(1, 'Hội thảo Java Cơ Bản', 'Tìm hiểu các kiến thức cơ bản về lập trình Java.', 'Phòng 101', 'sắp diễn ra', '2024-08-01', '2024-08-01', '2024-07-10', '2024-07-10'),
(2, 'Kỹ Thuật Java Nâng Cao', 'Làm chủ các kỹ thuật lập trình Java nâng cao.', 'Phòng 102', 'sắp diễn ra', '2024-08-05', '2024-08-05', '2024-07-10', '2024-07-10'),
(3, 'Java cho Phát Triển Web', 'Khám phá Java trong phát triển web.', 'Phòng 103', 'sắp diễn ra', '2024-08-10', '2024-08-10', '2024-07-10', '2024-07-10'),
(4, 'Giới Thiệu Spring Boot', 'Bắt đầu với Spring Boot.', 'Phòng 104', 'sắp diễn ra', '2024-08-15', '2024-08-15', '2024-07-10', '2024-07-10'),
(1, 'Viết CV Hiệu Quả', 'Học cách viết một CV hiệu quả.', 'Phòng 105', 'sắp diễn ra', '2024-08-20', '2024-08-20', '2024-07-10', '2024-07-10'),
(2, 'Kỹ Năng Thuyết Trình', 'Cải thiện kỹ năng thuyết trình trước đám đông.', 'Phòng 106', 'sắp diễn ra', '2024-08-25', '2024-08-25', '2024-07-10', '2024-07-10'),
(3, 'Kỹ Thuật Giải Quyết Vấn Đề', 'Nâng cao kỹ năng giải quyết vấn đề.', 'Phòng 107', 'sắp diễn ra', '2024-08-30', '2024-08-30', '2024-07-10', '2024-07-10'),
(1, 'Trình Diễn Dự Án Java', 'Trình diễn các dự án Java của bạn.', 'Phòng 108', 'sắp diễn ra', '2024-09-05', '2024-09-05', '2024-07-10', '2024-07-10');
