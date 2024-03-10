CREATE DATABASE PropertyDatabase

CREATE TABLE PropertyType (
    PropertyTypeID INTEGER IDENTITY(1,1) PRIMARY KEY,
    TypeName VARCHAR(50) NOT NULL
);

INSERT INTO PropertyType (TypeName) VALUES ('Residential');
INSERT INTO PropertyType (TypeName) VALUES ('Commercial');
INSERT INTO PropertyType (TypeName) VALUES ('Industrial');
INSERT INTO PropertyType (TypeName) VALUES ('Agricultural');
INSERT INTO PropertyType (TypeName) VALUES ('Mixed-Use');
INSERT INTO PropertyType (TypeName) VALUES ('Retail');
INSERT INTO PropertyType (TypeName) VALUES ('Office');
INSERT INTO PropertyType (TypeName) VALUES ('Hospitality');
INSERT INTO PropertyType (TypeName) VALUES ('Vacant Land');
INSERT INTO PropertyType (TypeName) VALUES ('Multi-Family');
INSERT INTO PropertyType (TypeName) VALUES ('Special Purpose');
INSERT INTO PropertyType (TypeName) VALUES ('Residential');
INSERT INTO PropertyType (TypeName) VALUES ('Commercial');
INSERT INTO PropertyType (TypeName) VALUES ('Industrial');
INSERT INTO PropertyType (TypeName) VALUES ('Mixed-Use');

SELECT * FROM PropertyType




CREATE TABLE Neighborhood (
    NeighborhoodID INTEGER IDENTITY(1,1) PRIMARY KEY,
    NeighborhoodName VARCHAR(255) NOT NULL,
    NeighborhoodPopulation INTEGER NOT NULL,
    CrimeRate VARCHAR(255),
    SchoolDistrictQuality VARCHAR(255)
);

INSERT INTO Neighborhood (NeighborhoodName, NeighborhoodPopulation, CrimeRate, SchoolDistrictQuality) VALUES ('Greenwood', 10000, 'Low', 'High');
INSERT INTO Neighborhood (NeighborhoodName, NeighborhoodPopulation, CrimeRate, SchoolDistrictQuality) VALUES ('Maplewood', 8000, 'Medium', 'Average');
INSERT INTO Neighborhood (NeighborhoodName, NeighborhoodPopulation, CrimeRate, SchoolDistrictQuality) VALUES ('Sunnyvale', 12000, 'Low', 'High');
INSERT INTO Neighborhood (NeighborhoodName, NeighborhoodPopulation, CrimeRate, SchoolDistrictQuality) VALUES ('Brookside', 9000, 'Medium', 'Above Average');
INSERT INTO Neighborhood (NeighborhoodName, NeighborhoodPopulation, CrimeRate, SchoolDistrictQuality) VALUES ('Riverdale', 7500, 'High', 'Below Average');
INSERT INTO Neighborhood (NeighborhoodName, NeighborhoodPopulation, CrimeRate, SchoolDistrictQuality) VALUES ('Hillcrest', 11000, 'Low', 'High');
INSERT INTO Neighborhood (NeighborhoodName, NeighborhoodPopulation, CrimeRate, SchoolDistrictQuality) VALUES ('Lakewood', 9500, 'Medium', 'Average');
INSERT INTO Neighborhood (NeighborhoodName, NeighborhoodPopulation, CrimeRate, SchoolDistrictQuality) VALUES ('Pineview', 7000, 'High', 'Poor');
INSERT INTO Neighborhood (NeighborhoodName, NeighborhoodPopulation, CrimeRate, SchoolDistrictQuality) VALUES ('Oakridge', 10500, 'Low', 'Excellent');
INSERT INTO Neighborhood (NeighborhoodName, NeighborhoodPopulation, CrimeRate, SchoolDistrictQuality) VALUES ('Westwood', 8500, 'Medium', 'Good');
INSERT INTO Neighborhood (NeighborhoodName, NeighborhoodPopulation, CrimeRate, SchoolDistrictQuality) VALUES ('Easton', 13000, 'Low', 'Very High');
INSERT INTO Neighborhood (NeighborhoodName, NeighborhoodPopulation, CrimeRate, SchoolDistrictQuality) VALUES ('Cliffside', 9200, 'High', 'Average');
INSERT INTO Neighborhood (NeighborhoodName, NeighborhoodPopulation, CrimeRate, SchoolDistrictQuality) VALUES ('Meadowlands', 7800, 'Medium', 'Above Average');
INSERT INTO Neighborhood (NeighborhoodName, NeighborhoodPopulation, CrimeRate, SchoolDistrictQuality) VALUES ('Cedar Park', 13500, 'Low', 'High');
INSERT INTO Neighborhood (NeighborhoodName, NeighborhoodPopulation, CrimeRate, SchoolDistrictQuality) VALUES ('Stonebridge', 8600, 'Medium', 'Excellent');

SELECT * FROM Neighborhood




CREATE TABLE Property (
    PropertyID INTEGER IDENTITY(1,1) PRIMARY KEY,
    PropertyLocation VARCHAR(255) NOT NULL,
    PropertyArea DECIMAL NOT NULL,
    ListingStatus VARCHAR(50) NOT NULL,
    Price DECIMAL NOT NULL,
    NeighborhoodID INTEGER NOT NULL,
    PropertyTypeID INTEGER NOT NULL,
    -- Foreign key constraint will reference Neighborhood table
    FOREIGN KEY (NeighborhoodID) REFERENCES Neighborhood(NeighborhoodID),
    FOREIGN KEY (PropertyTypeID) REFERENCES PropertyType(PropertyTypeID)
);

INSERT INTO Property (PropertyLocation, PropertyArea, ListingStatus, Price, NeighborhoodID, PropertyTypeID) VALUES ('123 Maple St', 200.0, 'For Sale', 300000, 1, 1);
INSERT INTO Property (PropertyLocation, PropertyArea, ListingStatus, Price, NeighborhoodID, PropertyTypeID) VALUES ('456 Oak Ave', 150.0, 'For Rent', 250000, 2, 2);
INSERT INTO Property (PropertyLocation, PropertyArea, ListingStatus, Price, NeighborhoodID, PropertyTypeID) VALUES ('789 Pine Rd', 180.0, 'For Sale', 350000, 3, 1);
INSERT INTO Property (PropertyLocation, PropertyArea, ListingStatus, Price, NeighborhoodID, PropertyTypeID) VALUES ('321 Birch Ln', 220.0, 'For Rent', 200000, 4, 2);
INSERT INTO Property (PropertyLocation, PropertyArea, ListingStatus, Price, NeighborhoodID, PropertyTypeID) VALUES ('654 Elm St', 210.0, 'For Sale', 450000, 5, 1);
INSERT INTO Property (PropertyLocation, PropertyArea, ListingStatus, Price, NeighborhoodID, PropertyTypeID) VALUES ('987 Cedar Dr', 160.0, 'For Rent', 280000, 6, 2);
INSERT INTO Property (PropertyLocation, PropertyArea, ListingStatus, Price, NeighborhoodID, PropertyTypeID) VALUES ('135 Spruce Pl', 190.0, 'For Sale', 320000, 7, 1);
INSERT INTO Property (PropertyLocation, PropertyArea, ListingStatus, Price, NeighborhoodID, PropertyTypeID) VALUES ('246 Willow Way', 230.0, 'For Rent', 310000, 8, 2);
INSERT INTO Property (PropertyLocation, PropertyArea, ListingStatus, Price, NeighborhoodID, PropertyTypeID) VALUES ('369 Redwood Blvd', 170.0, 'For Sale', 400000, 9, 1);
INSERT INTO Property (PropertyLocation, PropertyArea, ListingStatus, Price, NeighborhoodID, PropertyTypeID) VALUES ('147 Sequoia St', 210.0, 'For Rent', 360000, 10, 2);
INSERT INTO Property (PropertyLocation, PropertyArea, ListingStatus, Price, NeighborhoodID, PropertyTypeID) VALUES ('258 Magnolia Ave', 195.0, 'For Sale', 330000, 11, 1);
INSERT INTO Property (PropertyLocation, PropertyArea, ListingStatus, Price, NeighborhoodID, PropertyTypeID) VALUES ('369 Aspen Rd', 240.0, 'For Rent', 290000, 12, 2);
INSERT INTO Property (PropertyLocation, PropertyArea, ListingStatus, Price, NeighborhoodID, PropertyTypeID) VALUES ('471 Poplar Ln', 175.0, 'For Sale', 410000, 13, 1);
INSERT INTO Property (PropertyLocation, PropertyArea, ListingStatus, Price, NeighborhoodID, PropertyTypeID) VALUES ('582 Sycamore Dr', 200.0, 'For Rent', 370000, 14, 2);
INSERT INTO Property (PropertyLocation, PropertyArea, ListingStatus, Price, NeighborhoodID, PropertyTypeID) VALUES ('693 Fir Pl', 185.0, 'For Sale', 340000, 15, 1);

SELECT * FROM Property




CREATE TABLE Buyer (
    BuyerID INTEGER IDENTITY(1,1) PRIMARY KEY,
    FName VARCHAR(255) NOT NULL,
    LName VARCHAR(255) NOT NULL,
    ContactInfo VARCHAR(255) NOT NULL,
    CreditScore INTEGER,
);

INSERT INTO Buyer (FName, LName, ContactInfo, CreditScore) VALUES ('John', 'Doe', 'john.doe@example.com', 720);
INSERT INTO Buyer (FName, LName, ContactInfo, CreditScore) VALUES ('Jane', 'Smith', 'jane.smith@example.com', 680);
INSERT INTO Buyer (FName, LName, ContactInfo, CreditScore) VALUES ('Michael', 'Johnson', 'michael.johnson@example.com', 710);
INSERT INTO Buyer (FName, LName, ContactInfo, CreditScore) VALUES ('Emily', 'Davis', 'emily.davis@example.com', 700);
INSERT INTO Buyer (FName, LName, ContactInfo, CreditScore) VALUES ('David', 'Martinez', 'david.martinez@example.com', 650);
INSERT INTO Buyer (FName, LName, ContactInfo, CreditScore) VALUES ('Maria', 'Garcia', 'maria.garcia@example.com', 730);
INSERT INTO Buyer (FName, LName, ContactInfo, CreditScore) VALUES ('James', 'Wilson', 'james.wilson@example.com', 690);
INSERT INTO Buyer (FName, LName, ContactInfo, CreditScore) VALUES ('Linda', 'Anderson', 'linda.anderson@example.com', 715);
INSERT INTO Buyer (FName, LName, ContactInfo, CreditScore) VALUES ('Robert', 'Thomas', 'robert.thomas@example.com', 745);
INSERT INTO Buyer (FName, LName, ContactInfo, CreditScore) VALUES ('Patricia', 'Taylor', 'patricia.taylor@example.com', 675);
INSERT INTO Buyer (FName, LName, ContactInfo, CreditScore) VALUES ('Daniel', 'Moore', 'daniel.moore@example.com', 705);
INSERT INTO Buyer (FName, LName, ContactInfo, CreditScore) VALUES ('Jennifer', 'Jackson', 'jennifer.jackson@example.com', 660);
INSERT INTO Buyer (FName, LName, ContactInfo, CreditScore) VALUES ('William', 'Harris', 'william.harris@example.com', 720);
INSERT INTO Buyer (FName, LName, ContactInfo, CreditScore) VALUES ('Elizabeth', 'Clark', 'elizabeth.clark@example.com', 740);
INSERT INTO Buyer (FName, LName, ContactInfo, CreditScore) VALUES ('Richard', 'Lewis', 'richard.lewis@example.com', 730);

SELECT * FROM Buyer




CREATE TABLE Seller (
    SellerID INTEGER IDENTITY(1,1) PRIMARY KEY,
    FName VARCHAR(255) NOT NULL,
    LName VARCHAR(255) NOT NULL,
    ContactInfo VARCHAR(255) NOT NULL,
    ReasonForSelling VARCHAR(MAX)
);

INSERT INTO Seller (FName, LName, ContactInfo, ReasonForSelling) VALUES ('Alice', 'Brown', 'alice.brown@example.com', 'Relocating for job');
INSERT INTO Seller (FName, LName, ContactInfo, ReasonForSelling) VALUES ('Bob', 'Wilson', 'bob.wilson@example.com', 'Upsizing to a larger home');
INSERT INTO Seller (FName, LName, ContactInfo, ReasonForSelling) VALUES ('Carol', 'Johnson', 'carol.johnson@example.com', 'Moving to another city');
INSERT INTO Seller (FName, LName, ContactInfo, ReasonForSelling) VALUES ('David', 'Smith', 'david.smith@example.com', 'Downsizing');
INSERT INTO Seller (FName, LName, ContactInfo, ReasonForSelling) VALUES ('Emma', 'Davis', 'emma.davis@example.com', 'Change in family situation');
INSERT INTO Seller (FName, LName, ContactInfo, ReasonForSelling) VALUES ('Frank', 'Garcia', 'frank.garcia@example.com', 'Retirement');
INSERT INTO Seller (FName, LName, ContactInfo, ReasonForSelling) VALUES ('Grace', 'Martinez', 'grace.martinez@example.com', 'Investment property');
INSERT INTO Seller (FName, LName, ContactInfo, ReasonForSelling) VALUES ('Henry', 'Miller', 'henry.miller@example.com', 'Relocating to a warmer climate');
INSERT INTO Seller (FName, LName, ContactInfo, ReasonForSelling) VALUES ('Isla', 'Taylor', 'isla.taylor@example.com', 'Moving closer to family');
INSERT INTO Seller (FName, LName, ContactInfo, ReasonForSelling) VALUES ('Jack', 'Anderson', 'jack.anderson@example.com', 'Buying a vacation home');
INSERT INTO Seller (FName, LName, ContactInfo, ReasonForSelling) VALUES ('Katie', 'Thomas', 'katie.thomas@example.com', 'Financial reasons');
INSERT INTO Seller (FName, LName, ContactInfo, ReasonForSelling) VALUES ('Liam', 'Harris', 'liam.harris@example.com', 'Home is too large after children moved out');
INSERT INTO Seller (FName, LName, ContactInfo, ReasonForSelling) VALUES ('Mia', 'Clark', 'mia.clark@example.com', 'Seeking a neighborhood with better schools');
INSERT INTO Seller (FName, LName, ContactInfo, ReasonForSelling) VALUES ('Noah', 'Lewis', 'noah.lewis@example.com', 'Health reasons');
INSERT INTO Seller (FName, LName, ContactInfo, ReasonForSelling) VALUES ('Olivia', 'Walker', 'olivia.walker@example.com', 'Upgrading to a newer property');

SELECT * FROM Seller




CREATE TABLE Agent (
    AgentID INTEGER IDENTITY(1,1) PRIMARY KEY,
    LicenseNumber VARCHAR(255) NOT NULL,
    FName VARCHAR(255) NOT NULL,
    LName VARCHAR(255) NOT NULL,
);

INSERT INTO Agent (LicenseNumber, FName, LName) VALUES ('LIC1001', 'Sarah', 'Miller');
INSERT INTO Agent (LicenseNumber, FName, LName) VALUES ('LIC1002', 'James', 'Brown');
INSERT INTO Agent (LicenseNumber, FName, LName) VALUES ('LIC1003', 'Emily', 'Davis');
INSERT INTO Agent (LicenseNumber, FName, LName) VALUES ('LIC1004', 'Michael', 'Wilson');
INSERT INTO Agent (LicenseNumber, FName, LName) VALUES ('LIC1005', 'Laura', 'Smith');
INSERT INTO Agent (LicenseNumber, FName, LName) VALUES ('LIC1006', 'Robert', 'Johnson');
INSERT INTO Agent (LicenseNumber, FName, LName) VALUES ('LIC1007', 'Jessica', 'Clark');
INSERT INTO Agent (LicenseNumber, FName, LName) VALUES ('LIC1008', 'William', 'Garcia');
INSERT INTO Agent (LicenseNumber, FName, LName) VALUES ('LIC1009', 'Sophia', 'Lopez');
INSERT INTO Agent (LicenseNumber, FName, LName) VALUES ('LIC1010', 'David', 'Martinez');
INSERT INTO Agent (LicenseNumber, FName, LName) VALUES ('LIC1011', 'Emma', 'Anderson');
INSERT INTO Agent (LicenseNumber, FName, LName) VALUES ('LIC1012', 'Daniel', 'Thomas');
INSERT INTO Agent (LicenseNumber, FName, LName) VALUES ('LIC1013', 'Olivia', 'Nguyen');
INSERT INTO Agent (LicenseNumber, FName, LName) VALUES ('LIC1014', 'Brian', 'Harris');
INSERT INTO Agent (LicenseNumber, FName, LName) VALUES ('LIC1015', 'Natalie', 'Moore');

SELECT * FROM Agent




CREATE TABLE FinancingType (
    FinancingTypeID INTEGER IDENTITY(1,1) PRIMARY KEY,
    FinancingTypeName VARCHAR(255) NOT NULL
);

INSERT INTO FinancingType (FinancingTypeName) VALUES ('Conventional Loan');
INSERT INTO FinancingType (FinancingTypeName) VALUES ('FHA Loan');
INSERT INTO FinancingType (FinancingTypeName) VALUES ('VA Loan');
INSERT INTO FinancingType (FinancingTypeName) VALUES ('USDA Loan');
INSERT INTO FinancingType (FinancingTypeName) VALUES ('Adjustable-Rate Mortgage');
INSERT INTO FinancingType (FinancingTypeName) VALUES ('Fixed-Rate Mortgage');
INSERT INTO FinancingType (FinancingTypeName) VALUES ('Interest-Only Mortgage');
INSERT INTO FinancingType (FinancingTypeName) VALUES ('Balloon Mortgage');
INSERT INTO FinancingType (FinancingTypeName) VALUES ('Jumbo Loan');
INSERT INTO FinancingType (FinancingTypeName) VALUES ('Cash');
INSERT INTO FinancingType (FinancingTypeName) VALUES ('Lease to Own');
INSERT INTO FinancingType (FinancingTypeName) VALUES ('Home Equity Loan');
INSERT INTO FinancingType (FinancingTypeName) VALUES ('Bridge Loan');
INSERT INTO FinancingType (FinancingTypeName) VALUES ('Hard Money Loan');
INSERT INTO FinancingType (FinancingTypeName) VALUES ('Reverse Mortgage');

SELECT * FROM FinancingType




CREATE TABLE SaleTransaction (
    TransactionID INTEGER IDENTITY(1,1) PRIMARY KEY,
    SaleDate DATE NOT NULL,
    SalePrice DECIMAL NOT NULL,
    PropertyID INTEGER NOT NULL,
    BuyerID INTEGER NOT NULL,
    SellerID INTEGER NOT NULL,
    FinancingTypeID INTEGER,  
    FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID),
    FOREIGN KEY (BuyerID) REFERENCES Buyer(BuyerID),
    FOREIGN KEY (SellerID) REFERENCES Seller(SellerID),
    FOREIGN KEY (FinancingTypeID) REFERENCES FinancingType(FinancingTypeID),
);

INSERT INTO SaleTransaction (SaleDate, SalePrice, PropertyID, BuyerID, SellerID, FinancingTypeID) VALUES ('2023-01-01', 300000.00, 5, 10, 3, 2);
INSERT INTO SaleTransaction (SaleDate, SalePrice, PropertyID, BuyerID, SellerID, FinancingTypeID) VALUES ('2023-01-02', 450000.00, 3, 1, 14, 5);
INSERT INTO SaleTransaction (SaleDate, SalePrice, PropertyID, BuyerID, SellerID, FinancingTypeID) VALUES ('2023-01-03', 250000.00, 10, 7, 6, 1);
INSERT INTO SaleTransaction (SaleDate, SalePrice, PropertyID, BuyerID, SellerID, FinancingTypeID) VALUES ('2023-01-04', 350000.00, 8, 2, 13, 3);
INSERT INTO SaleTransaction (SaleDate, SalePrice, PropertyID, BuyerID, SellerID, FinancingTypeID) VALUES ('2023-01-05', 275000.00, 2, 5, 9, 4);
INSERT INTO SaleTransaction (SaleDate, SalePrice, PropertyID, BuyerID, SellerID, FinancingTypeID) VALUES ('2023-01-06', 480000.00, 15, 3, 2, 6);
INSERT INTO SaleTransaction (SaleDate, SalePrice, PropertyID, BuyerID, SellerID, FinancingTypeID) VALUES ('2023-01-07', 320000.00, 1, 6, 5, 7);
INSERT INTO SaleTransaction (SaleDate, SalePrice, PropertyID, BuyerID, SellerID, FinancingTypeID) VALUES ('2023-01-08', 600000.00, 12, 4, 10, 8);
INSERT INTO SaleTransaction (SaleDate, SalePrice, PropertyID, BuyerID, SellerID, FinancingTypeID) VALUES ('2023-01-09', 400000.00, 7, 9, 8, 9);
INSERT INTO SaleTransaction (SaleDate, SalePrice, PropertyID, BuyerID, SellerID, FinancingTypeID) VALUES ('2023-01-10', 385000.00, 14, 8, 7, 10);
INSERT INTO SaleTransaction (SaleDate, SalePrice, PropertyID, BuyerID, SellerID, FinancingTypeID) VALUES ('2023-01-11', 415000.00, 6, 11, 4, 11);
INSERT INTO SaleTransaction (SaleDate, SalePrice, PropertyID, BuyerID, SellerID, FinancingTypeID) VALUES ('2023-01-12', 295000.00, 9, 15, 1, 12);
INSERT INTO SaleTransaction (SaleDate, SalePrice, PropertyID, BuyerID, SellerID, FinancingTypeID) VALUES ('2023-01-13', 560000.00, 4, 13, 11, 13);
INSERT INTO SaleTransaction (SaleDate, SalePrice, PropertyID, BuyerID, SellerID, FinancingTypeID) VALUES ('2023-01-14', 500000.00, 11, 12, 15, 14);
INSERT INTO SaleTransaction (SaleDate, SalePrice, PropertyID, BuyerID, SellerID, FinancingTypeID) VALUES ('2023-01-15', 340000.00, 13, 14, 12, 15);

SELECT * FROM SaleTransaction




CREATE TABLE MortgageDetails (
    MortgageID INTEGER IDENTITY(1,1) PRIMARY KEY,
    LoanAmount DECIMAL NOT NULL,
    InterestRate DECIMAL NOT NULL,
    LoanTerm INTEGER NOT NULL,
    TransactionID INTEGER NOT NULL
    FOREIGN KEY (TransactionID) REFERENCES SaleTransaction(TransactionID)
);

INSERT INTO MortgageDetails (LoanAmount, InterestRate, LoanTerm, TransactionID) VALUES (250000.00, 3.5, 30, 1);
INSERT INTO MortgageDetails (LoanAmount, InterestRate, LoanTerm, TransactionID) VALUES (200000.00, 3.7, 15, 2);
INSERT INTO MortgageDetails (LoanAmount, InterestRate, LoanTerm, TransactionID) VALUES (320000.00, 4.0, 30, 3);
INSERT INTO MortgageDetails (LoanAmount, InterestRate, LoanTerm, TransactionID) VALUES (275000.00, 3.6, 20, 4);
INSERT INTO MortgageDetails (LoanAmount, InterestRate, LoanTerm, TransactionID) VALUES (400000.00, 3.9, 30, 5);
INSERT INTO MortgageDetails (LoanAmount, InterestRate, LoanTerm, TransactionID) VALUES (150000.00, 4.1, 15, 6);
INSERT INTO MortgageDetails (LoanAmount, InterestRate, LoanTerm, TransactionID) VALUES (180000.00, 3.8, 25, 7);
INSERT INTO MortgageDetails (LoanAmount, InterestRate, LoanTerm, TransactionID) VALUES (350000.00, 3.95, 30, 8);
INSERT INTO MortgageDetails (LoanAmount, InterestRate, LoanTerm, TransactionID) VALUES (220000.00, 4.2, 15, 9);
INSERT INTO MortgageDetails (LoanAmount, InterestRate, LoanTerm, TransactionID) VALUES (360000.00, 3.85, 20, 10);
INSERT INTO MortgageDetails (LoanAmount, InterestRate, LoanTerm, TransactionID) VALUES (280000.00, 3.75, 30, 11);
INSERT INTO MortgageDetails (LoanAmount, InterestRate, LoanTerm, TransactionID) VALUES (450000.00, 3.65, 30, 12);
INSERT INTO MortgageDetails (LoanAmount, InterestRate, LoanTerm, TransactionID) VALUES (235000.00, 4.05, 25, 13);
INSERT INTO MortgageDetails (LoanAmount, InterestRate, LoanTerm, TransactionID) VALUES (310000.00, 4.3, 15, 14);
INSERT INTO MortgageDetails (LoanAmount, InterestRate, LoanTerm, TransactionID) VALUES (500000.00, 3.55, 30, 15);

SELECT * FROM MortgageDetails
