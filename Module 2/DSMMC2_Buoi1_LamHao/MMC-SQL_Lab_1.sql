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
    DepartmentID    INT,
    PositionID      INT,
    CreateDate      DATE
);

CREATE TABLE Groupss (
    GroupID     INT PRIMARY KEY AUTO_INCREMENT,
    GroupName   VARCHAR(50),
    CreatorID   INT,
    CreateDate  DATE
);

CREATE TABLE GroupAccount (
    GroupID     INT,
    AccountID   INT,
    JoinDate    DATE,
    PRIMARY KEY (GroupID, AccountID),
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
    CategoryID  INT,
    TypeID      INT,
    CreatorID   INT,
    CreateDate  DATE
);

CREATE TABLE Answer (
    AnswerID    INT PRIMARY KEY AUTO_INCREMENT,
    Content     VARCHAR(50),
    QuestionID  INT,
    isCorrect   BOOLEAN
);

CREATE TABLE Exam (
    ExamID      INT PRIMARY KEY AUTO_INCREMENT,
    Code        VARCHAR(50),
    Title       VARCHAR(50),
    CategoryID  INT,
    Duration    INT,
    CreatorID   INT,
    CreateDate  DATE
);

CREATE TABLE ExamQuestion (
    ExamID      INT,
    QuestionID  INT,
    PRIMARY KEY (ExamID, QuestionID),
);
