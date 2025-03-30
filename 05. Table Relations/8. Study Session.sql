CREATE TABLE students (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_name VARCHAR(50)
);

CREATE TABLE exams (
    id INT GENERATED ALWAYS AS IDENTITY (START WITH 101 INCREMENT BY 1) PRIMARY KEY,
    exam_name VARCHAR(50)
);

CREATE TABLE study_halls(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    study_hall_name VARCHAR(50),
    exam_id INT,

    CONSTRAINT fk_study_halls_students
    FOREIGN KEY (exam_id)
    REFERENCES exams(id)
);

CREATE TABLE students_exams(
    student_id INT,
    exam_id INT,

    CONSTRAINT pk_students_exam
    PRIMARY KEY (student_id, exam_id),

    CONSTRAINT fk_students_exams_students
    FOREIGN KEY (student_id)
    REFERENCES students(id),

    CONSTRAINT fk_students_exams_exams
    FOREIGN KEY (exam_id)
    REFERENCES exams(id)
)