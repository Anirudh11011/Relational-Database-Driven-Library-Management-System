-- initial_data.sql
SET DEFINE OFF;
WHENEVER SQLERROR EXIT SQL.SQLCODE;

-- ========================
-- 15 Members
-- ========================
INSERT INTO Member (MemberId, SSN, MembershipStartDate, Name, CampusAddress, HomeAddress, Phone, LoanPeriodDays, GracePeriodDays, Type) VALUES
 (  1, '100-00-0001', TO_DATE('2022-09-01','YYYY-MM-DD'), 'Alice Smith',     '123 College Ave','456 Main St',   '555-0101',30, 7,'Student');
INSERT INTO Member (MemberId, SSN, MembershipStartDate, Name, CampusAddress, HomeAddress, Phone, LoanPeriodDays, GracePeriodDays, Type) VALUES
 (  2, '100-00-0002', TO_DATE('2023-01-15','YYYY-MM-DD'), 'Bob Johnson',     '234 University Rd','789 Elm St',    '555-0102',30, 7,'Student');
INSERT INTO Member (MemberId, SSN, MembershipStartDate, Name, CampusAddress, HomeAddress, Phone, LoanPeriodDays, GracePeriodDays, Type) VALUES
 (  3, '100-00-0003', TO_DATE('2021-08-20','YYYY-MM-DD'), 'Charlie Lee',     '345 Campus Dr',   '321 Oak St',    '555-0103',30, 7,'Student');
INSERT INTO Member (MemberId, SSN, MembershipStartDate, Name, CampusAddress, HomeAddress, Phone, LoanPeriodDays, GracePeriodDays, Type) VALUES
 (  4, '100-00-0004', TO_DATE('2024-02-10','YYYY-MM-DD'), 'Diana Patel',     '456 College Ave',  '654 Pine St',   '555-0104',30, 7,'Student');
INSERT INTO Member (MemberId, SSN, MembershipStartDate, Name, CampusAddress, HomeAddress, Phone, LoanPeriodDays, GracePeriodDays, Type) VALUES
 (  5, '100-00-0005', TO_DATE('2022-11-05','YYYY-MM-DD'), 'Ethan Williams',  '567 University Rd','987 Maple St',  '555-0105',30, 7,'Student');
INSERT INTO Member (MemberId, SSN, MembershipStartDate, Name, CampusAddress, HomeAddress, Phone, LoanPeriodDays, GracePeriodDays, Type) VALUES
 (  6, '100-00-0006', TO_DATE('2023-05-18','YYYY-MM-DD'), 'Fiona Chen',      '678 Campus Dr',   '147 Cedar St',  '555-0106',30, 7,'Student');
INSERT INTO Member (MemberId, SSN, MembershipStartDate, Name, CampusAddress, HomeAddress, Phone, LoanPeriodDays, GracePeriodDays, Type) VALUES
 (  7, '100-00-0007', TO_DATE('2024-03-12','YYYY-MM-DD'), 'George Brown',    '789 College Ave',  '258 Birch St',  '555-0107',30, 7,'Student');
INSERT INTO Member (MemberId, SSN, MembershipStartDate, Name, CampusAddress, HomeAddress, Phone, LoanPeriodDays, GracePeriodDays, Type) VALUES
 (  8, '200-00-0001', TO_DATE('2019-01-15','YYYY-MM-DD'), 'Dr. Helen Miller','101 Uni Blvd',      '369 Walnut St', '555-0201',60,14,'Professor');
INSERT INTO Member (MemberId, SSN, MembershipStartDate, Name, CampusAddress, HomeAddress, Phone, LoanPeriodDays, GracePeriodDays, Type) VALUES
 (  9, '200-00-0002', TO_DATE('2020-06-30','YYYY-MM-DD'), 'Dr. Ian Clark',   '202 Scholar Rd',    '147 Spruce St','555-0202',60,14,'Professor');
INSERT INTO Member (MemberId, SSN, MembershipStartDate, Name, CampusAddress, HomeAddress, Phone, LoanPeriodDays, GracePeriodDays, Type) VALUES
 ( 10, '200-00-0003', TO_DATE('2018-09-05','YYYY-MM-DD'), 'Dr. Jane Davis',  '303 Faculty Ln',    '258 Aspen St',  '555-0203',60,14,'Professor');
INSERT INTO Member (MemberId, SSN, MembershipStartDate, Name, CampusAddress, HomeAddress, Phone, LoanPeriodDays, GracePeriodDays, Type) VALUES
 ( 11, '200-00-0004', TO_DATE('2021-02-22','YYYY-MM-DD'),'Dr. Kevin Wilson','404 Lecturer Way',  '369 Poplar St', '555-0204',60,14,'Professor');
INSERT INTO Member (MemberId, SSN, MembershipStartDate, Name, CampusAddress, HomeAddress, Phone, LoanPeriodDays, GracePeriodDays, Type) VALUES
 ( 12, '200-00-0005', TO_DATE('2017-11-11','YYYY-MM-DD'),'Dr. Laura Martinez','505 Academic Cir', '741 Redwood St','555-0205',60,14,'Professor');
INSERT INTO Member (MemberId, SSN, MembershipStartDate, Name, CampusAddress, HomeAddress, Phone, LoanPeriodDays, GracePeriodDays, Type) VALUES
 ( 13, '300-00-0001', TO_DATE('2021-05-20','YYYY-MM-DD'), 'Mary Thompson',   'Library Bldg',      '852 Chestnut St','555-0301',45,10,'Non Academic Staff');
INSERT INTO Member (MemberId, SSN, MembershipStartDate, Name, CampusAddress, HomeAddress, Phone, LoanPeriodDays, GracePeriodDays, Type) VALUES
 ( 14, '300-00-0002', TO_DATE('2022-07-08','YYYY-MM-DD'), 'Nathan Anderson',  'Library Bldg',      '963 Cypress St','555-0302',45,10,'Non Academic Staff');
INSERT INTO Member (MemberId, SSN, MembershipStartDate, Name, CampusAddress, HomeAddress, Phone, LoanPeriodDays, GracePeriodDays, Type) VALUES
 ( 15, '300-00-0003', TO_DATE('2023-10-01','YYYY-MM-DD'), 'Olivia King',      'Library Bldg',      '159 Willow St', '555-0303',45,10,'Non Academic Staff');

-- ========================
-- 5 LibraryStaff
-- ========================
INSERT INTO LibraryStaff (StaffID, Name, Phone, Email, Role) VALUES
 (1, 'Alice Johnson',    '555-1001', 'alice.johnson@library.com',    'ChiefLibrarian');
INSERT INTO LibraryStaff (StaffID, Name, Phone, Email, Role) VALUES
 (2, 'Brian Edwards',    '555-1002', 'brian.edwards@library.com',    'AssociateLibrarian');
INSERT INTO LibraryStaff (StaffID, Name, Phone, Email, Role) VALUES
 (3, 'Catherine Garcia', '555-1003', 'catherine.garcia@library.com','ReferenceLibrarian');
INSERT INTO LibraryStaff (StaffID, Name, Phone, Email, Role) VALUES
 (4, 'David Lee',        '555-1004', 'david.lee@library.com',        'AssistantLibrarian');
INSERT INTO LibraryStaff (StaffID, Name, Phone, Email, Role) VALUES
 (5, 'Emily Davis',      '555-1005', 'emily.davis@library.com',      'CheckOutStaff');

-- ========================
-- 30 Books
-- ========================
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0001','Database Systems Concepts','Henry Korth',           'Computer Science','Y','Hardcover','English','6th');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0002','Introduction to Psychology','James Kalat',          'Psychology','Y','Paperback','English','8th');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0003','Modern Physics','Serway & Jewett',                   'Physics','Y','Hardcover','English','4th');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0004','Organic Chemistry','Paula Bruice',                  'Chemistry','Y','Paperback','English','7th');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0005','Calculus: Early Transcendentals','James Stewart',   'Mathematics','Y','Hardcover','English','9th');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0006','Civil Engineering Materials','Peter A. Claisse',    'Engineering','Y','Hardcover','English','2nd');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0007','World History','William McNeill',                    'History','Y','Paperback','English','1st');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0008','Microeconomics','Paul Krugman',                     'Economics','Y','Paperback','English','4th');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0009','Principles of Marketing','Philip Kotler',           'Business','Y','Hardcover','English','15th');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0010','Fundamentals of Nursing','Barbara Kozier',          'Medicine','Y','Paperback','English','9th');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0011','Art: A World History','Elke Linda Buchholz',        'Art','Y','Hardcover','English','2nd');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0012','Sociology: A Brief Introduction','Richard T. Schaefer','Sociology','Y','Paperback','English','12th');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0013','Philosophy: The Basics','Nigel Warburton',          'Philosophy','Y','Paperback','English','2nd');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0014','Introduction to Linguistics','Victoria Fromkin',    'Languages','Y','Hardcover','English','3rd');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0015','Business Law','Kenneth Clarkson',                   'Law','Y','Paperback','English','14th');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0016','Music Theory: From Beginner to Expert','Mark Haviland','Music','Y','Paperback','English','1st');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0017','Introduction to Astronomy','Chaisson & McMillan','Astronomy','Y','Paperback','English','7th');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0018','Environmental Science','G. Tyler Miller','Environmental Sci','Y','Hardcover','English','17th');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0019','Cognitive Neuroscience','Michael Gazzaniga','Biology','Y','Paperback','English','3rd');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0020','Graphic Design Basics','Amy E. Arntson','Art','Y','Paperback','English','4th');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0021','Introduction to Statistics','Ronald Walpole','Mathematics','Y','Paperback','English','9th');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0022','Engineering Mechanics','Meriam & Kraige','Engineering','Y','Hardcover','English','7th');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0023','Introduction to Algorithms','Cormen et al.','Computer Science','Y','Hardcover','English','3rd');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0024','Ethics: Theory and Practice','Jacques Thiroux','Philosophy','Y','Paperback','English','4th');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0025','Advanced Organic Chemistry','F. A. Carey','Chemistry','Y','Hardcover','English','5th');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0026','The Art of War','Sun Tzu','Philosophy','Y','Paperback','English','1st');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0027','The Great Gatsby','F. Scott Fitzgerald','Literature','Y','Paperback','English','1st');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0028','Data Structures & Algorithm Analysis','Mark Allen Weiss','Computer Science','Y','Hardcover','English','4th');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0029','Introduction to Machine Learning','Ethem Alpaydin','Computer Science','Y','Hardcover','English','2nd');
INSERT INTO Book (ISBN, Title, Author, SubjectArea, IsLendable, Binding, Language, Edition) VALUES
 ('B0030','Digital Communications','Simon Haykin','Engineering','Y','Hardcover','English','5th');

-- ========================
-- 30 BookCopies (one per book)
-- ========================
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1001,'B0001','Available',TO_DATE('2022-05-10','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1002,'B0002','Borrowed', TO_DATE('2023-02-12','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1003,'B0003','Available',TO_DATE('2021-11-01','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1004,'B0004','Available',TO_DATE('2022-07-22','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1005,'B0005','Borrowed', TO_DATE('2024-03-15','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1006,'B0006','Available',TO_DATE('2021-09-30','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1007,'B0007','Available',TO_DATE('2022-01-05','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1008,'B0008','Available',TO_DATE('2023-06-18','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1009,'B0009','Available',TO_DATE('2021-12-12','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1010,'B0010','Borrowed', TO_DATE('2024-04-01','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1011,'B0011','Available',TO_DATE('2022-08-08','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1012,'B0012','Available',TO_DATE('2023-03-20','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1013,'B0013','Available',TO_DATE('2021-05-25','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1014,'B0014','Available',TO_DATE('2022-10-31','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1015,'B0015','Borrowed', TO_DATE('2024-02-28','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1016,'B0016','Available',TO_DATE('2023-01-14','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1017,'B0017','Available',TO_DATE('2021-03-09','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1018,'B0018','Available',TO_DATE('2022-06-21','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1019,'B0019','Available',TO_DATE('2023-09-12','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1020,'B0020','Borrowed', TO_DATE('2024-03-28','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1021,'B0021','Available',TO_DATE('2022-04-15','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1022,'B0022','Available',TO_DATE('2021-07-07','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1023,'B0023','Available',TO_DATE('2022-02-02','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1024,'B0024','Available',TO_DATE('2023-11-11','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1025,'B0025','Available',TO_DATE('2021-10-19','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1026,'B0026','Available',TO_DATE('2022-12-01','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1027,'B0027','Available',TO_DATE('2023-08-08','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1028,'B0028','Available',TO_DATE('2021-01-23','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1029,'B0029','Available',TO_DATE('2022-03-03','YYYY-MM-DD'));
INSERT INTO BookCopy (CopyID, ISBN, Status, AcquisitionDate) VALUES (1030,'B0030','Available',TO_DATE('2023-12-12','YYYY-MM-DD'));

-- ========================
-- 30 Catalog entries
-- ========================
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES (  1,'B0001','Database Concepts and Design');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES (  2,'B0002','Introductory Psychology Text');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES (  3,'B0003','Modern Physics Fundamentals');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES (  4,'B0004','Organic Chemistry Principles');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES (  5,'B0005','Calculus & Transcendentals');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES (  6,'B0006','Materials in Civil Engineering');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES (  7,'B0007','Survey of World History');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES (  8,'B0008','Microeconomic Theory');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES (  9,'B0009','Marketing Principles');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES ( 10,'B0010','Basics of Nursing');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES ( 11,'B0011','Global Art History');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES ( 12,'B0012','Intro to Sociology');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES ( 13,'B0013','Foundations of Philosophy');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES ( 14,'B0014','Linguistics Overview');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES ( 15,'B0015','Business Law Essentials');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES ( 16,'B0016','Music Theory Guide');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES ( 17,'B0017','Astronomy for Beginners');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES ( 18,'B0018','Environmental Science Today');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES ( 19,'B0019','Cognitive Neuroscience Intro');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES ( 20,'B0020','Graphic Design Fundamentals');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES ( 21,'B0021','Statistics: An Introduction');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES ( 22,'B0022','Engineering Mechanics Text');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES ( 23,'B0023','Algorithms & Data Structures');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES ( 24,'B0024','Ethics in Theory & Practice');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES ( 25,'B0025','Advanced Organic Chemistry');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES ( 26,'B0026','Sun Tzu’s Art of War');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES ( 27,'B0027','The Great Gatsby Novel');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES ( 28,'B0028','Data Structures Analysis');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES ( 29,'B0029','Machine Learning Basics');
INSERT INTO Catalog (CatalogID, ISBN, Description) VALUES ( 30,'B0030','Digital Communications Text');


-- ========================
-- 5 AcquisitionInterestList rows
-- ========================
INSERT ALL
  INTO AcquisitionInterestList (InterestID, ISBN, RequestedByStaffID, Author, Title, Reason)
    VALUES (1, 'B0001', 1, 'Henry Korth',       'Database Systems Concepts',        'Request new edition')
  INTO AcquisitionInterestList (InterestID, ISBN, RequestedByStaffID, Author, Title, Reason)
    VALUES (2, 'B0005', 2, 'James Stewart',     'Calculus: Early Transcendentals',   'Need extra copies for fall course')
  INTO AcquisitionInterestList (InterestID, ISBN, RequestedByStaffID, Author, Title, Reason)
    VALUES (3, 'B0014', 3, 'Victoria Fromkin',  'Introduction to Linguistics',      'Add to language reference section')
  INTO AcquisitionInterestList (InterestID, ISBN, RequestedByStaffID, Author, Title, Reason)
    VALUES (4, 'B0023', 4, 'Cormen et al.',     'Introduction to Algorithms',       'CS dept wants latest print')
  INTO AcquisitionInterestList (InterestID, ISBN, RequestedByStaffID, Author, Title, Reason)
    VALUES (5, 'B0029', 5, 'Ethem Alpaydin',    'Introduction to Machine Learning', 'Popular new course text')
SELECT * FROM DUAL;
-- ========================
-- 5 Borrowing records
-- ========================
INSERT ALL
  INTO Borrowing (BorrowID, CopyID, MemberID, StaffID, BorrowDate,   DueDate,      ReturnDate)
    VALUES (1, 1002,  2, 5, DATE '2024-04-01', DATE '2024-05-01', DATE '2024-04-10')
  INTO Borrowing (BorrowID, CopyID, MemberID, StaffID, BorrowDate,   DueDate,      ReturnDate)
    VALUES (2, 1005,  5, 4, DATE '2024-03-15', DATE '2024-04-14', NULL)
  INTO Borrowing (BorrowID, CopyID, MemberID, StaffID, BorrowDate,   DueDate,      ReturnDate)
    VALUES (3, 1010, 10, 5, DATE '2024-04-05', DATE '2024-06-04', NULL)
  INTO Borrowing (BorrowID, CopyID, MemberID, StaffID, BorrowDate,   DueDate,      ReturnDate)
    VALUES (4, 1020,  8, 4, DATE '2024-03-28', DATE '2024-05-27', DATE '2024-04-07')
  INTO Borrowing (BorrowID, CopyID, MemberID, StaffID, BorrowDate,   DueDate,      ReturnDate)
    VALUES (5, 1015,  6, 5, DATE '2024-02-28', DATE '2024-03-29', DATE '2024-03-10')
SELECT * FROM DUAL;
-- ========================
-- 5 Remainder rows
-- ========================
INSERT ALL
  INTO Remainder (RemainderID, MemberId, RemainderDate, RType,     RMessage,                               CopyID)
    VALUES (1,           2,        DATE '2024-04-15', 'Overdue', 'Your borrowed book is overdue. Please return.',       1002)
  INTO Remainder (RemainderID, MemberId, RemainderDate, RType,     RMessage,                               CopyID)
    VALUES (2,           5,        DATE '2024-04-20', 'Overdue', 'Reminder: overdue book return ASAP.',              1005)
  INTO Remainder (RemainderID, MemberId, RemainderDate, RType,     RMessage,                               CopyID)
    VALUES (3,          10,        DATE '2024-04-22', 'Overdue', 'Alert: book not yet returned.',                        1010)
  INTO Remainder (RemainderID, MemberId, RemainderDate, RType,     RMessage,                               CopyID)
    VALUES (4,           3,        DATE '2024-08-01', 'Renewal','Your membership is up for renewal.',                     NULL)
  INTO Remainder (RemainderID, MemberId, RemainderDate, RType,     RMessage,                               CopyID)
    VALUES (5,           7,        DATE '2024-09-01', 'Renewal','Please renew your library membership.',                  NULL)
SELECT * FROM DUAL;
-- ========================
-- 15 MembershipCard rows
-- ========================
INSERT ALL
  INTO MembershipCard (CardID, MemberId, IssueDate,      ExpiryDate,     Photo, IsActive)
    VALUES (1,      1,        DATE '2022-09-01', DATE '2023-09-01', NULL, 'Y')
  INTO MembershipCard (CardID, MemberId, IssueDate,      ExpiryDate,     Photo, IsActive)
    VALUES (2,      2,        DATE '2023-01-15', DATE '2024-01-15', NULL, 'Y')
  INTO MembershipCard (CardID, MemberId, IssueDate,      ExpiryDate,     Photo, IsActive)
    VALUES (3,      3,        DATE '2021-08-20', DATE '2022-08-20', NULL, 'N')
  INTO MembershipCard (CardID, MemberId, IssueDate,      ExpiryDate,     Photo, IsActive)
    VALUES (4,      4,        DATE '2024-02-10', DATE '2025-02-10', NULL, 'Y')
  INTO MembershipCard (CardID, MemberId, IssueDate,      ExpiryDate,     Photo, IsActive)
    VALUES (5,      5,        DATE '2022-11-05', DATE '2023-11-05', NULL, 'N')
  INTO MembershipCard (CardID, MemberId, IssueDate,      ExpiryDate,     Photo, IsActive)
    VALUES (6,      6,        DATE '2023-05-18', DATE '2024-05-18', NULL, 'Y')
  INTO MembershipCard (CardID, MemberId, IssueDate,      ExpiryDate,     Photo, IsActive)
    VALUES (7,      7,        DATE '2024-03-12', DATE '2025-03-12', NULL, 'Y')
  INTO MembershipCard (CardID, MemberId, IssueDate,      ExpiryDate,     Photo, IsActive)
    VALUES (8,      8,        DATE '2019-01-15', DATE '2020-01-15', NULL, 'N')
  INTO MembershipCard (CardID, MemberId, IssueDate,      ExpiryDate,     Photo, IsActive)
    VALUES (9,      9,        DATE '2020-06-30', DATE '2021-06-30', NULL, 'N')
  INTO MembershipCard (CardID, MemberId, IssueDate,      ExpiryDate,     Photo, IsActive)
    VALUES (10,    10,        DATE '2018-09-05', DATE '2019-09-05', NULL, 'N')
  INTO MembershipCard (CardID, MemberId, IssueDate,      ExpiryDate,     Photo, IsActive)
    VALUES (11,    11,        DATE '2021-02-22', DATE '2022-02-22', NULL, 'N')
  INTO MembershipCard (CardID, MemberId, IssueDate,      ExpiryDate,     Photo, IsActive)
    VALUES (12,    12,        DATE '2017-11-11', DATE '2018-11-11', NULL, 'N')
  INTO MembershipCard (CardID, MemberId, IssueDate,      ExpiryDate,     Photo, IsActive)
    VALUES (13,    13,        DATE '2021-05-20', DATE '2022-05-20', NULL, 'N')
  INTO MembershipCard (CardID, MemberId, IssueDate,      ExpiryDate,     Photo, IsActive)
    VALUES (14,    14,        DATE '2022-07-08', DATE '2023-07-08', NULL, 'N')
  INTO MembershipCard (CardID, MemberId, IssueDate,      ExpiryDate,     Photo, IsActive)
    VALUES (15,    15,        DATE '2023-10-01', DATE '2024-10-01', NULL, 'Y')
SELECT * FROM DUAL;