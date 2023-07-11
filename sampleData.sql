USE Library_HA2

INSERT INTO Category
	(CategoryName)
VALUES
	('Adventure'),
	('Classic'),
	('Crime'),
	('Fairy tale'),
	('Fantasy'),
	('Historical Fiction'),
	('Horror'),
	('Humor/Satire'),
	('Literary Fiction'),
	('Mystery'),
	('Poetry'),
	('Plays'),
	('Romance'),
	('Science Fiction'),
	('Short Story'),
	('Thriller'),
	('Non-Fiction'),
	('Self-Help'),
	('Biography')
GO

INSERT INTO Author
	(AuthorFName, AuthorLName)
VALUES
	('Wendy', 'Walker'),
	('Ali', 'Hazelwood'),
	('Harper', 'Lee'),
	('Robert', 'Greene'),
	('George', 'Orwell')
GO


INSERT INTO BookAuthor
	(BookID, AuthorID)
VALUES
	(101, 201),
	(102, 202),
	(103, 203),
	(104, 204),
	(105, 205),
	(106, 201),
	(107, 205),
	(108, 202)
GO


INSERT INTO Book
	( Title, AuthorID, CategoryID, Copies, PublicationYear)
VALUES 
	('Emma in the Night', 201, 10, 5, 2017),
	('The Love Hypothesis', 202, 13, 10, 2021),
	('To Kill a Mockingbird', 203, 16, 25, 1960),
	('The 48 Laws of Power', 204, 18, 2, 1998),
	('Nineteen Eighty-Four', 205, 8, 5, 1949),
	('The Night Before:', 201, 8, 1, 2019),
	('Animal Farm', 205, 8, 25, 1945),
	('Love on the Brain', 202, 13, 2, 2022)
GO

INSERT INTO MemberStatus
	( StatusValue)
VALUES
	('Active'),
	('Pending'),
	('Hold'),
	('Terminated'),
	('Cancelled')
GO

INSERT INTO Member
	(MemberFName, MemberLName, JoinDate, MemberStatusID)
VALUES
	('Josiah', 'Jugalbanda', '1/1/2019', 63),
	('John', 'Aleister', '1/25/1935', 67),
	('Geoffery', 'Alexander', '12/25/1986', 63),
	('Michael','Altringham', '9/9/2021', 65),
	('Anthony', 'Altringham', '6/2/2017', 63),
	('Peter', 'Belpit', '1/25/2023', 64),
	('Anne', 'Boyle', '5/8/2016', 66),
	('Elizabeth', 'Boyle', '6/9/2014', 63)
GO

INSERT INTO Loan
	(BookID, MemberID, LoanDate, ReturnDate)
VALUES
	(107, 70, '2/23/2019', '3/23/2019'),
	(101, 73, '9/11/2021', NULL),
	(104, 71, '8/4/2015', '8/12/2015'),
	(105, 74, '6/5/2017', '6/13/2017'),
	(106, 76, '6/9/2016', NULL),
	(102, 77, '8/4/2017', '8/26/2017')
GO

INSERT INTO Fine
	(MemberID, LoanID, FineAmount, FineDate)
VALUES
	(73, 81, 23.94, '9/19/2021'),
	(77, 85, 12.00, '8/26/2017'),
	(76, 84, 294.66, '6/17/2016')
GO

INSERT INTO FinePayment
	(FineID, MemberID, PaymentDate, PaymentAmount)
VALUES
	(90, 73, '9/20/2021', 23.94),
	(91, 77, '8/26/2017', 12.00),
	(92, 76, '7/24/2019', 659.32)
GO

INSERT INTO ReservationStatus
	( StatusValue)
VALUES
	('Reserved'),
	('Wait-list'),
	('Returned')
GO

INSERT INTO Reservation
	( BookID, MemberID, ReservationDate, ReservationStatusID)
VALUES
	( 101, 74, '1/30/2023', 881),
	(101, 77, '1/31/2023', 882),
	(102, 72, '1/20/2023', 883),
	(102, 72, '1/30/2023', 881)
GO



