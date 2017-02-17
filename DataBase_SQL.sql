CREATE DATABASE assignment4;
USE abhishekasg4;

CREATE TABLE `User` (
    `Useremail` VARCHAR(50) NOT NULL DEFAULT '',
    `Username` VARCHAR(50) NOT NULL DEFAULT '',
    `SaltedPassword` VARCHAR(100) NOT NULL DEFAULT '',
    `Salt` VARCHAR(50) NOT NULL DEFAULT '',
    `Type` VARCHAR(50) NOT NULL DEFAULT '',
    `Studies` INT(15) DEFAULT '0',
    `Participation` INT(15) DEFAULT '0',
    `Coins` INT(15) DEFAULT '0',
    PRIMARY KEY (`Useremail`)
);

CREATE TABLE `Study` (
    `StudyID` VARCHAR(50) NOT NULL DEFAULT '',
    `StudyName` VARCHAR(50) DEFAULT NULL,
    `Description` VARCHAR(50) DEFAULT NULL,
    `Useremail` VARCHAR(50) DEFAULT NULL,
    `DateCreated` DATETIME DEFAULT NULL,
    `ImageURL` VARCHAR(50) DEFAULT NULL,
    `ReqParticipants` INT(15) DEFAULT NULL,
    `ActParticipants` INT(15) DEFAULT NULL,
    `SStatus` VARCHAR(15) DEFAULT NULL,
    PRIMARY KEY (`StudyID`),
    KEY `Useremail` (`Useremail`),
    CONSTRAINT `study_ibfk_1` FOREIGN KEY (`Useremail`)
        REFERENCES `User` (`Useremail`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `Question` (
    `QuestionID` VARCHAR(50) NOT NULL DEFAULT '',
    `StudyID` VARCHAR(50) DEFAULT NULL,
    `Question` VARCHAR(50) DEFAULT NULL,
    `AnswerType` VARCHAR(15) DEFAULT NULL,
    `Option1` VARCHAR(50) DEFAULT NULL,
    `Option2` VARCHAR(50) DEFAULT NULL,
    `Option3` VARCHAR(50) DEFAULT NULL,
    `Option4` VARCHAR(50) DEFAULT NULL,
    `Option5` VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY (`QuestionID`),
    KEY `StudyID` (`StudyID`),
    CONSTRAINT `question_ibfk_1` FOREIGN KEY (`StudyID`)
        REFERENCES `Study` (`StudyID`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `Answer` (
    `StudyID` VARCHAR(50) NOT NULL DEFAULT '',
    `QuestionID` VARCHAR(50) NOT NULL DEFAULT '',
    `Useremail` VARCHAR(50) NOT NULL DEFAULT '',
    `Choice` VARCHAR(50) DEFAULT NULL,
    `DateSubmitted` DATETIME DEFAULT NULL,
    PRIMARY KEY (`StudyID` , `QuestionID` , `Useremail`),
    KEY `answer_ibfk_1` (`Useremail`),
    CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`Useremail`)
        REFERENCES `User` (`Useremail`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `Report` (
    `QuestionID` VARCHAR(50) NOT NULL,
    `StudyID` VARCHAR(50) NOT NULL DEFAULT '',
    `Date` DATETIME DEFAULT NULL,
    `NumParticipants` INT(15) DEFAULT NULL,
    `RStatus` VARCHAR(15) DEFAULT NULL,
    PRIMARY KEY (`StudyID` , `QuestionID`),
    KEY `QuestionID` (`QuestionID`),
    CONSTRAINT `reported_ibfk_1` FOREIGN KEY (`QuestionID`)
        REFERENCES `Question` (`QuestionID`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `reported_ibfk_2` FOREIGN KEY (`StudyID`)
        REFERENCES `Study` (`StudyID`)
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TempUser (
    Token VARCHAR(50),
    Useremail VARCHAR(50),
    Username VARCHAR(50),
    Password VARCHAR(50),
    IssueDate DATETIME,
    Recommender VARCHAR(50),
    PRIMARY KEY (`Token`)
);

CREATE TABLE ResetPswd (
    Token VARCHAR(50),
    Useremail VARCHAR(50),
    IssueDate DATETIME,
    ExpirationDate DATETIME,
    PRIMARY KEY (`Token`)
);


INSERT INTO `User` 
(Useremail, Username, SaltedPassword, Salt, Type, Studies, Participation, Coins)
VALUES 
('admin@gmail.com','Admin','d7fabdbd119ec95eeaba6dd316e3f38534677c8021f71b5631e8b31238748fec','R5tMd5RtFe2La84+TiqDMsk0wv+0vbNNsIjHWmV/BiI=','Admin',0,0,0);
