CREATE TABLE Book
(
    ISBN        VARCHAR2(20) PRIMARY KEY,
    Title       VARCHAR2(200),
    Author      VARCHAR2(100),
    SubjectArea VARCHAR2(100),
    IsLendable  CHAR(1) CHECK (IsLendable IN ('Y', 'N')),
    Binding     VARCHAR2(50),
    Language    VARCHAR2(50),
    Edition     VARCHAR2(50)
);

CREATE TABLE BookCopy
(
    CopyID          INT PRIMARY KEY,
    ISBN            VARCHAR2(20) NOT NULL,
    Status          VARCHAR2(50),
    AcquisitionDate DATE,
    FOREIGN KEY (ISBN) REFERENCES Book (ISBN)
);

CREATE TABLE Catalog
(
    CatalogID   INT PRIMARY KEY,
    ISBN        VARCHAR2(20) NOT NULL UNIQUE,
    Description CLOB,
    FOREIGN KEY (ISBN) REFERENCES Book (ISBN)
);

CREATE TABLE LibraryStaff
(
    StaffID    INT PRIMARY KEY,
    Name       VARCHAR2(100),
    Phone      VARCHAR2(20),
    Email      VARCHAR2(100),
    Role       VARCHAR2(30) NOT NULL CHECK (
        Role IN (
                 'ChiefLibrarian',
                 'AssociateLibrarian',
                 'ReferenceLibrarian',
                 'AssistantLibrarian',
                 'CheckOutStaff'
            )
        )
);

CREATE TABLE AcquisitionInterestList
(
    InterestID INT PRIMARY KEY,
    ISBN       VARCHAR2(20),
    RequestedByStaffID INT,
    Author     VARCHAR2(100),
    Title      VARCHAR2(200),
    Reason     VARCHAR2(4000),
    FOREIGN KEY (RequestedByStaffID) REFERENCES LibraryStaff (StaffID)
);

CREATE TABLE Member
(
    MemberId            INT PRIMARY KEY,
    SSN                 VARCHAR2(11) UNIQUE,
    MembershipStartDate DATE          NOT NULL,
    Name                VARCHAR2(100) NOT NULL,
    CampusAddress       VARCHAR2(200),
    HomeAddress         VARCHAR2(200),
    Phone               VARCHAR2(20),
    LoanPeriodDays      INT,
    GracePeriodDays     INT,
    Type                VARCHAR2(30)  NOT NULL
        CHECK (Type IN ('Student', 'Professor', 'Non Academic Staff'))
);

CREATE TABLE Borrowing
(
    BorrowID   INT PRIMARY KEY,
    MemberID   INT NOT NULL,
    CopyID     INT NOT NULL,
    StaffID    INT NOT NULL,
    BorrowDate DATE,
    DueDate    DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Member (MemberID),
    FOREIGN KEY (StaffID) REFERENCES LibraryStaff (StaffID),
    FOREIGN KEY (CopyID) REFERENCES BookCopy (CopyID)
);

CREATE TABLE Remainder
(
    RemainderID   INT PRIMARY KEY,
    MemberId      INT NOT NULL,
    RemainderDate DATE,
    RType         VARCHAR2(50),
    RMessage      CLOB,
    CopyID        INT NULL,
    FOREIGN KEY (MemberId) REFERENCES Member (MemberId)
);

CREATE TABLE MembershipCard
(
    CardID     INT PRIMARY KEY,
    MemberId   INT NOT NULL UNIQUE,
    IssueDate  DATE,
    ExpiryDate DATE,
    Photo      BLOB,
    IsActive   CHAR(1) CHECK (IsActive IN ('Y', 'N')),
    FOREIGN KEY (MemberId) REFERENCES Member (MemberId)
);

