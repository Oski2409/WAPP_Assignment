/* ============================================
   SmartClicks Database Setup Script
   Run this script inside SmartClicksDB
   ============================================ */

-- ============================================
-- DROP TABLES (Safe Reset Order)
-- ============================================

IF OBJECT_ID('SavedTutorials','U') IS NOT NULL DROP TABLE SavedTutorials;
IF OBJECT_ID('QuizAttempts','U') IS NOT NULL DROP TABLE QuizAttempts;
IF OBJECT_ID('Questions','U') IS NOT NULL DROP TABLE Questions;
IF OBJECT_ID('Quizzes','U') IS NOT NULL DROP TABLE Quizzes;
IF OBJECT_ID('Tutorials','U') IS NOT NULL DROP TABLE Tutorials;
IF OBJECT_ID('Topics','U') IS NOT NULL DROP TABLE Topics;
IF OBJECT_ID('Users','U') IS NOT NULL DROP TABLE Users;

-- ============================================
-- USERS
-- ============================================

CREATE TABLE [Users] (
    [UserID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [FullName] NVARCHAR(100) NOT NULL,
    [Email] NVARCHAR(100) NOT NULL,
    [PasswordHash] NVARCHAR(255) NOT NULL,
    [Role] NVARCHAR(20) NOT NULL,
    [RegistrationDate] DATETIME NOT NULL DEFAULT GETDATE(),
    [AccountStatus] NVARCHAR(20) NOT NULL,

    CONSTRAINT UQ_Users_Email UNIQUE (Email),

    CONSTRAINT CK_Users_Role 
        CHECK (Role IN ('Admin','RegisteredUser')),

    CONSTRAINT CK_Users_AccountStatus 
        CHECK (AccountStatus IN ('Active','Suspended'))
);

-- ============================================
-- TOPICS
-- ============================================

CREATE TABLE [Topics] (
    [TopicID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [TopicName] NVARCHAR(100) NOT NULL,
    [TopicDescription] NVARCHAR(255),

    CONSTRAINT UQ_Topics_TopicName UNIQUE (TopicName)
);

-- ============================================
-- TUTORIALS
-- ============================================

CREATE TABLE [Tutorials] (
    [TutorialID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Title] NVARCHAR(150) NOT NULL,
    [Description] NVARCHAR(255) NOT NULL,
    [ContentText] NVARCHAR(MAX) NOT NULL,
    [VideoURL] NVARCHAR(255),
    [ImageURL] NVARCHAR(255),
    [TopicID] INT NOT NULL,
    [CreatedBy] INT NOT NULL,
    [CreatedDate] DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_Tutorials_Topics
        FOREIGN KEY (TopicID)
        REFERENCES Topics(TopicID)
        ON DELETE NO ACTION,

    CONSTRAINT FK_Tutorials_Users
        FOREIGN KEY (CreatedBy)
        REFERENCES Users(UserID)
        ON DELETE NO ACTION
);

-- ============================================
-- QUIZZES (1 Tutorial = 1 Quiz)
-- ============================================

CREATE TABLE [Quizzes] (
    [QuizID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [TutorialID] INT NOT NULL,
    [Title] NVARCHAR(150) NOT NULL,
    [Description] NVARCHAR(255),
    [CreatedDate] DATETIME NOT NULL DEFAULT GETDATE(),
    [CreatedBy] INT NOT NULL,

    CONSTRAINT UQ_Quizzes_TutorialID UNIQUE (TutorialID),

    CONSTRAINT FK_Quizzes_Tutorials
        FOREIGN KEY (TutorialID)
        REFERENCES Tutorials(TutorialID)
        ON DELETE NO ACTION,

    CONSTRAINT FK_Quizzes_Users
        FOREIGN KEY (CreatedBy)
        REFERENCES Users(UserID)
        ON DELETE NO ACTION
);

-- ============================================
-- QUESTIONS
-- ============================================

CREATE TABLE [Questions] (
    [QuestionID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [QuizID] INT NOT NULL,
    [QuestionText] NVARCHAR(500) NOT NULL,
    [OptionA] NVARCHAR(255) NOT NULL,
    [OptionB] NVARCHAR(255) NOT NULL,
    [OptionC] NVARCHAR(255) NOT NULL,
    [OptionD] NVARCHAR(255) NOT NULL,
    [CorrectAnswer] CHAR(1) NOT NULL,

    CONSTRAINT CK_Questions_CorrectAnswer
        CHECK (CorrectAnswer IN ('A','B','C','D')),

    CONSTRAINT FK_Questions_Quizzes
        FOREIGN KEY (QuizID)
        REFERENCES Quizzes(QuizID)
        ON DELETE NO ACTION
);

-- ============================================
-- QUIZ ATTEMPTS
-- ============================================

CREATE TABLE [QuizAttempts] (
    [AttemptID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [UserID] INT NOT NULL,
    [QuizID] INT NOT NULL,
    [Score] INT NOT NULL,
    [AttemptDate] DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT CK_QuizAttempts_Score
        CHECK (Score BETWEEN 0 AND 100),

    CONSTRAINT FK_QuizAttempts_Users
        FOREIGN KEY (UserID)
        REFERENCES Users(UserID)
        ON DELETE NO ACTION,

    CONSTRAINT FK_QuizAttempts_Quizzes
        FOREIGN KEY (QuizID)
        REFERENCES Quizzes(QuizID)
        ON DELETE NO ACTION
);

-- ============================================
-- SAVED TUTORIALS (Many-to-Many)
-- ============================================

CREATE TABLE [SavedTutorials] (
    [UserID] INT NOT NULL,
    [TutorialID] INT NOT NULL,
    [SavedDate] DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT PK_SavedTutorials
        PRIMARY KEY (UserID, TutorialID),

    CONSTRAINT FK_SavedTutorials_Users
        FOREIGN KEY (UserID)
        REFERENCES Users(UserID)
        ON DELETE NO ACTION,

    CONSTRAINT FK_SavedTutorials_Tutorials
        FOREIGN KEY (TutorialID)
        REFERENCES Tutorials(TutorialID)
        ON DELETE NO ACTION
);

-- ============================================
-- TEST DATA
-- ============================================

-- Users
INSERT INTO [Users] (FullName, Email, PasswordHash, Role, AccountStatus)
VALUES
('Admin User', 'admin@smartclicks.com', '1234', 'Admin', 'Active'),
('John Doe', 'john@example.com', '1234', 'RegisteredUser', 'Active'),
('Sarah Joe', 'sarah@example.com', '1234', 'RegisteredUser', 'Active');

-- Topics
INSERT INTO [Topics] (TopicName, TopicDescription)
VALUES
('Camera Basics', 'Introduction to camera functions and settings'),
('Lighting Techniques', 'Understanding natural and artificial lighting'),
('Composition', 'Rules and creative framing techniques'),
('Smartphone Photography', 'Taking professional photos using smartphones');