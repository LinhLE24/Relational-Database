CREATE DATABASE "EPITA Modeling"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;

CREATE TABLE Candidate (
    candidateID int NOT NULL PRIMARY KEY,
    firstName varchar(255),
    lastName varchar(255),
    country varchar(255),
	email  varchar(254),
	paymentID int ,
	recruited smallint
	
);

CREATE TABLE Payment (
    paymentID int NOT NULL PRIMARY KEY,
    studentID int NOT NULL,
	paid float
	
);

CREATE TABLE Student (
    studentID int NOT NULL PRIMARY KEY,
    firstName varchar(255),
	lastName varchar(255),
    country varchar(255),
	email  varchar(254),
	programID int NOT Null,
	intakeID int NOT Null
	
	
);

CREATE TABLE Intake(
    IntakeID int NOT NULL PRIMARY KEY,
    nameIntake varchar(254),
    intYear int
	
	
);

CREATE TABLE program(
    programID int NOT NULL PRIMARY KEY,
    name varchar(254)
    
	
);

CREATE TABLE programcourse(
    programID int NOT NULL,
    courseID int NOT NULL
    
	
);



CREATE TABLE Course(
    CourseID int NOT NULL PRIMARY KEY,
    name varchar(254),
    duration varchar(254),
	teachingunit varchar(254),
	coefficient int
	
);

CREATE TABLE Session(
    sessionID int NOT NULL PRIMARY KEY,
    courseID int NOT NULL,
    teacherID int NOT NULL,
	typeID int NOT NULL,
	roomId  int not null,
    startTime timestamp,
    endTime   timestamp
  
);

CREATE TABLE GroupSession(
    GroupsessionID int NOT NULL PRIMARY KEY,
    sessionID int NOT NULL,
    studentID int NOT NULL
	
  
);

CREATE TABLE Attendance(
    attendanceID int NOT NULL PRIMARY KEY,
    sessionID int NOT NULL,
    studentID int NOT NULL,
	present smallint
	
  
);

CREATE TABLE room( 
    roomID int NOT NULL PRIMARY KEY,
    location varchar(254)
    

);

CREATE TABLE sessiontype(
    typeID int NOT NULL PRIMARY KEY,
    name varchar(254)
    

);

CREATE TABLE Exam(
    ExamID int NOT NULL PRIMARY KEY,
    courseID int NOT NULL,
	typeID int NOT NULL,
	weight int,
	studentID int NOT NULL,
	grade float

);

CREATE TABLE ExamType(
    typeID int NOT NULL PRIMARY KEY,
    name varchar(254)

);

CREATE TABLE Admin(
    AdminID int NOT NULL PRIMARY KEY,
    firstName varchar(255),
    lastName varchar(255),
	email  varchar(254),
	userID int NOT NULL

);

CREATE TABLE UserLogin(
    userID int NOT NULL PRIMARY KEY,
    username varchar(255),
    password varchar(255)
	

);

CREATE TABLE teacher (
    teacherID int NOT NULL PRIMARY KEY,
    firstName varchar(255),
	lastName varchar(255),
	email  varchar(254),
	phone varchar(254),
    bankaccount varchar(254),
    userID int NOT NULL,
	internal smallint
);




alter table Candidate add constraint FK_payment foreign key (paymentID)
      references payment(paymentID) on delete restrict on update restrict;


alter table payment add constraint FK_student foreign key (studentID)
      references student(studentID) on delete restrict on update restrict;

alter table student add constraint FK_program foreign key (programID)
      references program(programID) on delete restrict on update restrict;

alter table student add constraint FK_intake foreign key (intakeID)
      references intake(intakeID) on delete restrict on update restrict;

alter table groupsession add constraint FK_session foreign key (sessionID)
      references session(sessionID) on delete restrict on update restrict;

alter table groupsession add constraint FK_student foreign key (studentID)
      references student(studentID) on delete restrict on update restrict;

alter table session add constraint FK_course foreign key (courseID)
      references course(courseID) on delete restrict on update restrict;

alter table session add constraint FK_teacher foreign key (teacherID)
      references teacher(teacherID) on delete restrict on update restrict;

alter table session add constraint FK_type foreign key (typeID)
      references sessiontype(typeID) on delete restrict on update restrict;

alter table session add constraint FK_room foreign key (roomID)
      references room(roomID) on delete restrict on update restrict;

alter table teacher add constraint FK_user foreign key (userID)
      references userlogin(userID) on delete restrict on update restrict;

alter table exam add constraint FK_course foreign key (courseID)
      references course(courseID) on delete restrict on update restrict;

alter table exam add constraint FK_type foreign key (typeID)
      references examtype(typeID) on delete restrict on update restrict;

alter table exam add constraint FK_student foreign key (studentID)
      references student(studentID) on delete restrict on update restrict;

alter table admin add constraint FK_user foreign key (userID)
      references userlogin(userID) on delete restrict on update restrict;

alter table programcourse add constraint FK_course foreign key (courseID)
      references course(courseID) on delete restrict on update restrict;

alter table programcourse add constraint FK_program foreign key (programID)
      references program(programID) on delete restrict on update restrict;


alter table attendance add constraint FK_student foreign key (studentID)
      references student(studentID) on delete restrict on update restrict;

alter table attendance add constraint FK_session foreign key (sessionID)
      references session(sessionID) on delete restrict on update restrict;