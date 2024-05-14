CREATE DATABASE Testing_System_Db;

USE Testing_System_Db;

CREATE TABLE Department (
    DepartmentID    INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName  VARCHAR(50)
);

CREATE TABLE Positions (
    PositionID      INT PRIMARY KEY AUTO_INCREMENT,
    PositionName    VARCHAR(50)
);

CREATE TABLE Account (
    AccountID       INT PRIMARY KEY AUTO_INCREMENT,
    Email           VARCHAR(50),
    Username        VARCHAR(50),
    FullName        VARCHAR(50),
    DepartmentID    INT REFERENCES Department.DepartmentID,
    PositionID      INT REFERENCES Positions.PositionID,
    CreateDate      DATE
);

CREATE TABLE Groupss (
    GroupID     INT PRIMARY KEY AUTO_INCREMENT,
    GroupName   VARCHAR(50),
    CreatorID   INT REFERENCES Account.AccountID,
    CreateDate  DATE
);

CREATE TABLE GroupAccount (
    GroupID     INT REFERENCES Groupss.GroupID,
    AccountID   INT REFERENCES Account.AccountID,
    JoinDate    DATE
);

CREATE TABLE TypeQuestion (
    TypeID      INT PRIMARY KEY AUTO_INCREMENT,
    TypeName    VARCHAR(50)
);

CREATE TABLE CategoryQuestion (
    CategoryID      INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName    VARCHAR(50)
);

CREATE TABLE Question (
    QuestionID  INT PRIMARY KEY AUTO_INCREMENT,
    Content     VARCHAR(50),
    CategoryID  INT REFERENCES CategoryQuestion.CategoryID,
    TypeID      INT REFERENCES TypeQuestion.TypeID,
    CreatorID   INT REFERENCES Account.AccountID,
    CreateDate  DATE
);

CREATE TABLE Answer (
    AnswerID    INT PRIMARY KEY AUTO_INCREMENT,
    Content     VARCHAR(50),
    QuestionID  INT REFERENCES Question.QuestionID,
    isCorrect   BOOLEAN
);

CREATE TABLE Exam (
    ExamID      INT PRIMARY KEY AUTO_INCREMENT,
    Code        VARCHAR(50),
    Title       VARCHAR(50),
    CategoryID  INT REFERENCES CategoryQuestion.CategoryID,
    Duration    INT,
    CreatorID   INT REFERENCES Account.AccountID,
    CreateDate  DATE
);

CREATE TABLE ExamQuestion (
    ExamID      INT REFERENCES Exam.ExamID,
    QuestionID  INT REFERENCES Question.QuestionID
);
