DROP DATABASE IF EXISTS Testing_System_Db;
CREATE DATABASE Testing_System_Db;

USE Testing_System_Db;


-- Create Table

DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
    DepartmentID    TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName  NVARCHAR(50)
);

DROP TABLE IF EXISTS PositionTable;
CREATE TABLE PositionTable (
    PositionID      TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName    ENUM('Dev', 'Test', 'Scrum Master', 'PM') NOT NULL
);

DROP TABLE IF EXISTS Account;
CREATE TABLE Account (
    AccountID       TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email           VARCHAR(50),
    Username        VARCHAR(50),
    FullName        NVARCHAR(50),
    DepartmentID    TINYINT UNSIGNED,
    PositionID      TINYINT UNSIGNED,
    CreateDate      DATETIME DEFAULT NOW(),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (PositionID) REFERENCES PositionTable(PositionID)
);

DROP TABLE IF EXISTS GroupTable;
CREATE TABLE GroupTable (
    GroupID     TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName   NVARCHAR(50),
    CreatorID   TINYINT UNSIGNED,
    CreateDate  DATETIME DEFAULT NOW(),
    FOREIGN KEY (CreatorID) REFERENCES Account(AccountID)
);

DROP TABLE IF EXISTS  GroupAccount;
CREATE TABLE GroupAccount (
    GroupID     TINYINT UNSIGNED NOT NULL,
    AccountID   TINYINT UNSIGNED NOT NULL,
    JoinDate    DATETIME DEFAULT NOW(),
    PRIMARY KEY(GroupID, AccountID),
    FOREIGN KEY (GroupID) REFERENCES GroupTable(GroupID),
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
    TypeID      TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName    NVARCHAR(50)
);

DROP TABLE IF EXISTS  CategoryQuestion;
CREATE TABLE CategoryQuestion (
    CategoryID      TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName    NVARCHAR(50)
);

DROP TABLE IF EXISTS Question;
CREATE TABLE Question (
    QuestionID  TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content     NVARCHAR(50),
    CategoryID  TINYINT UNSIGNED,
    TypeID      TINYINT UNSIGNED,
    CreatorID   TINYINT UNSIGNED,
    CreateDate  DATETIME DEFAULT NOW(),
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY (CreatorID) REFERENCES Account(AccountID)
);

DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer (
    AnswerID    TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content     NVARCHAR(50),
    QuestionID  TINYINT UNSIGNED,
    isCorrect   BOOLEAN,
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);

DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam (
    ExamID      TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Code        NVARCHAR(50),
    Title       NVARCHAR(50),
    CategoryID  TINYINT UNSIGNED,
    Duration    INT,
    CreatorID   TINYINT UNSIGNED,
    CreateDate  DATETIME DEFAULT NOW(),
    FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY (CreatorID) REFERENCES Account(AccountID)
);

DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion (
    ExamID      TINYINT UNSIGNED NOT NULL,
    QuestionID  TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (ExamID, QuestionID),
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);


-- Insert Data

INSERT INTO Department(DepartmentID, DepartmentName )
values                (1           , N'Marketing'   ),
                      (2           , N'Sale'        ),
                      (3           , N'Bảo vệ'      ),
                      (4           , N'Nhân sự'     ),
                      (5           , N'Kỹ thuật'    ),
                      (6           , N'Tài chính'   ),
                      (7           , N'Phó giám đốc'),
                      (8           , N'Giám đống'   ),
                      (9           , N'Thư kí'      ),
                      (10          , N'Bán hàng'    );
