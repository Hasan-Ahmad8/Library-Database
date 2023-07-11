USE master;
GO

IF DB_ID('Library_HA2')IS NOT NULL
	DROP DATABASE Library_HA2
GO

CREATE DATABASE Library_HA2
GO

SET quoted_identifier on
GO
SET DATEFORMAT mdy
GO

USE Library_HA2
CREATE TABLE Category(
	CategoryID		INT		IDENTITY(1,1) PRIMARY KEY		NOT NULL,
	CategoryName	VARCHAR(25)		NOT NULL,
)
GO

USE Library_HA2
CREATE TABLE MemberStatus(
	MemberStatusID	INT		IDENTITY(63,1) PRIMARY KEY	NOT NULL,
	StatusValue		VARCHAR(50) NOT NULL,
)
GO

USE Library_HA2
CREATE TABLE Author(
	AuthorID		INT		IDENTITY(201,1) PRIMARY KEY		NOT NULL,
	AuthorFName		VARCHAR(50)		NOT NULL,
	AuthorLName		VARCHAR(50)		NOT NULL,
)
GO

USE Library_HA2
CREATE TABLE Book(
	BookID			INT		IDENTITY(101,1) PRIMARY KEY		NOT NULL,
	Title			VARCHAR(50)		NOT NULL,
	AuthorID		INT				NOT NULL,
	CategoryID		INT				NOT NULL,
	Copies			INT				NOT NULL,
	PublicationYear	INT				NOT NULL,
	FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
	FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
)
GO

USE Library_HA2
CREATE TABLE Member(
	MemberID		INT		IDENTITY(70,1) PRIMARY KEY		NOT NULL,
	MemberFName		VARCHAR(50)		NOT NULL,
	MemberLName		VARCHAR(50)		NOT NULL,
	JoinDate		Date			NOT NULL,
	MemberStatusID  INT				NOT NULL,
	FOREIGN KEY (MemberStatusID) REFERENCES MemberStatus(MemberStatusID)
)
GO

USE Library_HA2
CREATE TABLE Loan(
	LoanID			INT		IDENTITY(80,1) PRIMARY KEY		NOT NULL,
	BookID			INT				NOT NULL,
	MemberID		INT				NOT NULL,
	LoanDate		date			NOT NULL,
	ReturnDate		date			NULL,
	FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
	FOREIGN KEY (BookID) REFERENCES Book(BookID),
)
GO

USE Library_HA2
CREATE TABLE Fine(
	FineID		INT		IDENTITY(90,1) PRIMARY KEY		NOT NULL,
	MemberID	INT				NOT NULL,
	LoanID		INT				NOT NULL,
	FineAmount	MONEY			NOT NULL,
	FineDate	Date			NOT NULL,
	FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
	FOREIGN KEY (LoanID) REFERENCES Loan(LoanID)
)
GO

USE Library_HA2
CREATE TABLE ReservationStatus(
	ReservationStatusID		INT	 IDENTITY(881,1) PRIMARY KEY	NOT NULL,
	StatusValue		VARCHAR(50) NOT NULL,
)
GO

USE Library_HA2
CREATE TABLE Reservation(
	ReservationID		INT	 IDENTITY(771,1) PRIMARY KEY	NOT NULL,
	BookID				INT		NOT NULL,
	MemberID			INT		NOT NULL,
	ReservationDate		Date	NOT NULL,
	ReservationStatusID	INT		NOT NULL,
	FOREIGN KEY (BookID) REFERENCES Book(BookID),
	FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
	FOREIGN KEY (ReservationStatusID) REFERENCES ReservationStatus(ReservationStatusID)
)
GO

USE Library_HA2
CREATE TABLE FinePayment(
	FineID		INT	 	NOT NULL,
	MemberID	INT		NOT NULL,
	PaymentDate	Date	NOT NULL,
	PaymentAmount Money NOT NULL,
	FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
)
GO

USE Library_HA2
CREATE TABLE BookAuthor(
	BookID		INT		NOT NULL,
	AuthorID	INT		NOT NULL,
)
GO




