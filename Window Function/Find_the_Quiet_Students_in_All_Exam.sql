# Find the quiet students in all exams

DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Exam;
Create table If Not Exists Student (student_id int, student_name varchar(30)) ;
Create table If Not Exists Exam (exam_id int, student_id int, score int) ;
Truncate table Student ;
insert into Student (student_id, student_name) values ('1', 'Daniel') ;
insert into Student (student_id, student_name) values ('2', 'Jade') ;
insert into Student (student_id, student_name) values ('3', 'Stella') ;
insert into Student (student_id, student_name) values ('4', 'Jonathan') ;
insert into Student (student_id, student_name) values ('5', 'Will') ;
Truncate table Exam ;
insert into Exam (exam_id, student_id, score) values ('10', '1', '70') ;
insert into Exam (exam_id, student_id, score) values ('10', '2', '80') ;
insert into Exam (exam_id, student_id, score) values ('10', '3', '90') ;
insert into Exam (exam_id, student_id, score) values ('20', '1', '80') ;
insert into Exam (exam_id, student_id, score) values ('30', '1', '70') ;
insert into Exam (exam_id, student_id, score) values ('30', '3', '80') ;
insert into Exam (exam_id, student_id, score) values ('30', '4', '90') ;
insert into Exam (exam_id, student_id, score) values ('40', '1', '60') ;
insert into Exam (exam_id, student_id, score) values ('40', '2', '70') ;
insert into Exam (exam_id, student_id, score) values ('40', '4', '80');


select * from student;
select * from Exam;

# SELECT the students who are in the middle of the rank of ALL exams
# Student PK: student_id
# possible issues: dense rank; same value
# Exam PK: (exam_id, student_id)
# Step 1: Dense rank the students with ascending and descending for each exam

WITH CTE AS
  (
  SELECT
    e.exam_id,
    e.student_id ,
    s.student_name,
    e.score,
    DENSE_RANK() OVER(PARTITION BY exam_id ORDER BY score DESC) AS DR_desc,
        DENSE_RANK() OVER(PARTITION BY exam_id ORDER BY score) AS DR_asc
  FROM exam e
  INNER JOIN Student s
    ON e.student_id = s.student_id
  )
# Step 2: Select the quiet student
SELECT DISTINCT student_id, student_name
FROM CTE
WHERE DR_desc != 1 OR DR_asc != 1
ORDER BY student_id;