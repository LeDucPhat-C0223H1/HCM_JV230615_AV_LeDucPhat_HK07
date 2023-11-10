DROP DATABASE IF EXISTS test;
CREATE DATABASE IF NOT EXISTS test;
USE test;

# Bảng teacher 
CREATE TABLE teacher
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    birthday DATE
);

# Bảng class_room 
CREATE TABLE class_room
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    total_student INT DEFAULT 0,
    start_date DATE,
    end_date DATE, 
    CHECK (end_date > start_date)
);

# Bảng teacher_class 
CREATE TABLE teacher_class
(
	teacher_id INT,
    class_room_id INT,
    start_date DATE,
    end_date DATE,
    time_slot_start INT,
    time_slot_end INT,
    CONSTRAINT fk_teacher_id FOREIGN KEY (teacher_id) REFERENCES teacher(id),
    CONSTRAINT fk_teacher_class_room_id FOREIGN KEY (class_room_id) REFERENCES class_room(id)
);

# Bảng student
CREATE TABLE student
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(150) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(50) NOT NULL UNIQUE,
    gender TINYINT NOT NULL CHECK (gender IN (1, 2)),
    class_room_id INT,
    birthday DATE NOT NULL,
    CONSTRAINT fk_student_class_room_id FOREIGN KEY (class_room_id) REFERENCES class_room(id)
);

# Bảng subject
CREATE TABLE subject (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(200) NOT NULL UNIQUE
);

# Bảng mark
CREATE TABLE mark (
  student_id INT NOT NULL,
  subject_id INT NOT NULL,
  score INT NOT NULL CHECK (score >= 0 AND score <= 10),
  CONSTRAINT fk_student_id FOREIGN KEY (student_id) REFERENCES student(id),
  CONSTRAINT fk_subject_id FOREIGN KEY (subject_id) REFERENCES subject(id)
);

-- Bảng teacher ít nhất là 5 bản ghi dữ liệu phù hợp
INSERT INTO teacher (name, phone, email, birthday) VALUES
    ('Võ Văn Toàn', '0932789641', 'toanvo@gmail.com', '1976-10-04'),
    ('Trần Hoàng Yến', '0932658373', 'yentran@gmail.com', '1973-05-20'),
    ('Lê Xuân Nghiêm', '0932838920', 'nghiemle@gmail.com', '1972-06-25'),
    ('Nguyễn Hùng Anh', '0932453623', 'hunganh@gmail.com', '1975-11-20'),
    ('Đào Thiên Trang', '0932093674', 'trangdao@gmail.com', '1976-07-18');
    
 -- Bảng class_room ít nhất là 5 bản ghi dữ liệu phù hợp
INSERT INTO class_room (name, total_student, start_date, end_date) VALUES
	('A011', 10, '2023-01-01', '2023-07-31'),
    ('B012', 10, '2023-02-01', '2023-08-31'),
    ('C013', 10, '2023-03-01', '2023-09-30'),
    ('D014', 10, '2023-04-01', '2023-10-31'),
    ('E015', 10, '2023-05-01', '2023-11-30'),
    ('A011', 10, '2024-01-01', '2024-07-31');
    
-- Bảng student Ít nhất 15 bản ghi dữ liệu phù hợp
INSERT INTO student (name, email, phone, gender, class_room_id, birthday) VALUES
	('Lê Đức Phát', 'phatle@gmail.com', '0983567834', 1, 1, '2000-08-28'),
    ('Võ Mạnh Cương', 'cuongvo@gmail.com', '0983743265', 1, 1, '2000-05-12'),
    ('Đặng Quốc Phong', 'phongdang@gmail.com', '0983783451', 1, 3, '1998-07-25'),
    ('Lê Xuân Đông Nghi', 'nghile@gmail.com', '0983626535', 2, 4, '1999-06-26'),
    ('Lâm Kim Vy', 'vylam@gmail.com', '0983583097', 2, 5, '1999-04-23'),
    
    ('Lê Văn Hoàng', 'hoangle@gmail.com', '0976645823', 1, 2, '1997-06-28'),
    ('Võ Hùng Dũng', 'dungvo@gmail.com', '0976340203', 1, 2, '1997-07-12'),
    ('Đặng Như Mai', 'maidang@gmail.com', '0976655671', 2, 2, '1998-09-10'),
    ('Lê Hy Văn', 'vanle@gmail.com', '0976838243', 2, 4, '1999-04-26'),
    ('Trân Kim Yến', 'yentran@gmail.com', '0976221560', 2, 5, '1999-03-15'),
    
    ('Nguyễn Quốc Khanh', 'khanhnguyen@gmail.com', '0965792251', 1, 3, '2000-02-27'),
    ('Võ Quang Tiến', 'tienvo@gmail.com', '0965341489', 1, 3, '1997-01-20'),
    ('Đặng Kim Ngân', 'ngandang@gmail.com', '0965717023', 2, 3, '1998-03-08'),
    ('Đào Mỹ Dung', 'đungao@gmail.com', '0965790301', 2, 4, '1999-09-22'),
    ('Nguyễn Minh Thy', 'thynguyen@gmail.com', '0965823612', 2, 5, '1999-09-17');
    
-- Bảng subject ít nhất 3 bản ghi dữ liệu phù hợp
INSERT INTO subject (name) VALUES
	('Toán Cao Cấp'), ('Hệ Điều Hành'), ('Ngôn Ngữ Máy'), ('Triết Học'), ('Kỹ Năng Giao Tiếp');

-- Bảng mark ít nhất 20 bản ghi dữ liệu phù hợp
INSERT INTO mark (student_id, subject_id, score) VALUES
	-- học sinh 1-5
	(1, 1, 5), (2, 2, 6), (3, 3, 7), (4, 4, 8), (5, 5, 9),
    -- học sinh 5-10
    (6, 1, 10), (7, 2, 9), (8, 3, 8), (9, 4, 7), (10, 5, 6),
    -- học sinh 10-15
    (11, 1, 4), (12, 2, 3), (13, 3, 2), (14, 4, 1), (15, 5, 0),
    -- thi lại 
    (11, 1, 7), (12, 2, 6), (13, 3, 6), (14, 4, 5), (15, 5, 4);

-- bảng teacher_class
INSERT INTO teacher_class(teacher_id, class_room_id, start_date, end_date, time_slot_start, time_slot_end) VALUES
	(1, 1, '2023-01-01', '2023-07-31', null, null),
    (1, 2, '2023-01-01', '2023-07-31', null, null),
	(2, 2, '2023-03-01', '2023-09-30', null, null),
	(3, 1, '2023-11-01', '2023-03-31', null, null),
	(4, 3, '2023-04-01', '2023-10-31', null, null),
	(5, 2, '2024-01-01', '2024-07-30', null, null);
    

/* Thực hiện các truy vấn dữ liệu */
-- 1. Lấy ra danh sách Student có sắp xếp tăng dần theo Name gồm các cột sau: Id,
-- Name, Email, Phone, Gender, BirthDay, Age
SELECT 
	id as Id, 
    name as Name, 
    email as Email, 
    phone as Phone,
    gender as Gender,
    birthday as Birthday,
    year(curdate())-year(birthday) as Age
FROM student
ORDER BY name asc;


-- 2.Lấy ra danh sách Teacher gồm: Id, Name, Phone, Email, BirthDay, Age, TotalCLass
SELECT  
	id as Id, 
    name as Name, 
    email as Email, 
    phone as Phone,
    birthday as Birthday,
    year(curdate())-year(birthday) as Age,
    count(teacher_class.class_room_id) as TotalClass
FROM teacher
JOIN teacher_class ON teacher.id = teacher_class.teacher_id
GROUP BY teacher.id;


-- 3.Truy vấn danh sách class_room gồm: Id, Name, TotalStudent, StartDate, EndDate khai giảng năm 2023
SELECT 	
	id as Id,
    name as Name, 
    total_student as TatalStudent,
    start_date as StartDate,
    end_date as EndDate
FROM class_room
WHERE year(start_date) = 2023;


-- 4. Cập nhật cột ToalStudent trong bảng class_room = Tổng số Student của mỗi class_room theo Id của class_room
UPDATE class_room as clr
SET clr.total_student = (
	SELECT count(s.id)
	FROM student as s
	WHERE clr.id = s.class_room_id 
);

select * from class_room;

-- 5. Tạo View v_getStudentInfo thực hiện lấy ra danh sách Student gồm: Id, Name,
-- Email, Phone, Address, Gender, BirthDay, ClassName, MarksAvg, Trong đó cột
-- MarksAvg hiển thị như sau:
-- 		0 < MarksAvg <=5 Loại Yếu
-- 		5 < MarksAvg < 7.5 Loại Trung bình
-- 		7.5 <= MarksAvg <= 8 Loại GIỏi
-- 		8 < MarksAvg Loại xuất sắc

CREATE VIEW v_getStudentInfo as
SELECT
	s.id       	as Id,
	s.name     	as Name,
	s.email    	as Email,
	s.phone    	as Phone,
	s.gender   	as Gender,
	s.birthday 	as Birthday,
	clr.name	as ClassName, 
	CASE
		when AVG(m.score) > 0 and AVG(m.score) <= 5 then 'Loại Yếu'
		when AVG(m.score) > 5 and AVG(m.score) < 7.5 then 'Loại Trung bình'
		when AVG(m.score) >= 7.5 and AVG(m.score) <= 8 then 'Loại Giỏi'
		when AVG(m.score) > 8 then 'Loại Xuất sắc'
		else 'Không có dữ liệu'
	END			as MarksAvg
FROM student as s
JOIN mark as m ON s.id = m.student_id
JOIN class_room as clr ON s.class_room_id = clr.id
GROUP BY s.id;
#
SELECT * FROM v_getStudentInfo;


-- 6. View v_getStudentMax hiển thị danh sách Sinh viên có điểm trung bình >= 7.5
CREATE VIEW v_getStudentMax as
SELECT 
	s.id       	as Id,
	s.name     	as Name,
	s.email    	as Email,
	s.phone    	as Phone,
	s.gender   	as Gender,
	s.birthday 	as Birthday
FROM student as s
JOIN mark as m ON s.id = m.student_id
GROUP BY s.id
HAVING AVG(m.score) >= 7.5;
#
SELECT * FROM v_getStudentMax;


-- 7.Tạo thủ tục thêm mới dữ liệu vào bảng class_room
DELIMITER //
CREATE PROCEDURE addNewDataClassRoom(
	IN input_name VARCHAR(255),
    IN input_total_student INT,
    IN input_start_date DATE,
    IN input_end_date DATE
)
BEGIN
    INSERT INTO class_room (name, total_student, start_date, end_date)
    VALUES
    (
		input_name,
        input_total_student,
        input_start_date,
        input_end_date
	);
END //
DELIMITER ;


-- 8.Tạo thủ tục cập nhật dữ liệu trên bảng student
DELIMITER //
CREATE PROCEDURE updateDataStudent(
    IN input_id INT,
    IN new_name VARCHAR(255),
    IN new_email VARCHAR(255),
    IN new_phone VARCHAR(255),
    IN new_address VARCHAR(255),
    IN new_gender VARCHAR(255),
    IN new_birthday DATE,
    IN new_class_room_id DATE
)
BEGIN
    UPDATE student
    SET name          = new_name,
        email         = new_email,
        phone         = new_phone,
        gender        = new_gender,
        birthday      = new_birthday,
        class_room_id = new_class_room_id
    WHERE id = input_id;
END //
DELIMITER ;


-- 9.Tạo thủ tục xóa dữ liệu theo id trên bảng subject
DELIMITER //
CREATE PROCEDURE deleteSubjectById(IN input_id INT)
BEGIN
    DELETE
    FROM subject
    WHERE id = input_id;
END //
DELIMITER ;

-- # 10. Tạo thủ tục getStudentPaginate lấy ra danh sách sinh viên có phân trang gồm:
-- # Id, Name, Email, Phone, Address, Gender, BirthDay, ClassName, Khi gọi thủ tuc
-- # truyền vào limit và page

DELIMITER //
CREATE PROCEDURE getStudentPaginate(
    IN limit INT,
    IN page INT
)
BEGIN
    DECLARE start_index INT;

    SET start_index = (page - 1) * limit;

    SELECT 	s.id       	as Id,
			s.name     	as Name,
			s.email    	as Email,
			s.phone    	as Phone,
			s.gender   	as Gender,
			s.birthday 	as BirthDay,
			clr.name  	as ClassName
    FROM student as s
	JOIN class_room as clr ON s.class_room_id = clr.id
    LIMIT limit OFFSET start_index;
END;
DELIMITER ;