
--1st Stored procedure for sale transaction table

GO

-- Sub-procedure to get PropertyID
CREATE PROCEDURE GetPropertyID
    @PropertyLocation VARCHAR(255),
    @PropertyID INT OUTPUT
AS
BEGIN
    SET @PropertyID = (SELECT PropertyID FROM Property WHERE PropertyLocation = @PropertyLocation);
    IF @PropertyID IS NULL
        THROW 56010, 'PropertyID could not be found.', 1;
END;
GO

-- Sub-procedure to get BuyerID
CREATE PROCEDURE GetBuyerID
    @BuyerFName VARCHAR(255),
    @BuyerLName VARCHAR(255),
    @BuyerID INT OUTPUT
AS
BEGIN
    SET @BuyerID = (SELECT BuyerID FROM Buyer WHERE FName = @BuyerFName AND LName = @BuyerLName);
    IF @BuyerID IS NULL
        THROW 56020, 'BuyerID could not be found.', 1;
END;
GO

-- Sub-procedure to get SellerID
CREATE PROCEDURE GetSellerID
    @SellerFName VARCHAR(255),
    @SellerLName VARCHAR(255),
    @SellerID INT OUTPUT
AS
BEGIN
    SET @SellerID = (SELECT SellerID FROM Seller WHERE FName = @SellerFName AND LName = @SellerLName);
    IF @SellerID IS NULL
        THROW 56030, 'SellerID could not be found.', 1;
END;
GO

-- Sub-procedure to get FinancingTypeID
CREATE PROCEDURE GetFinancingTypeID
    @FinancingTypeName VARCHAR(255),
    @FinancingTypeID INT OUTPUT
AS
BEGIN
    SET @FinancingTypeID = (SELECT FinancingTypeID FROM FinancingType WHERE FinancingTypeName = @FinancingTypeName);
    IF @FinancingTypeID IS NULL
        THROW 56040, 'FinancingTypeID could not be found.', 1;
END;
GO

-- Main procedure to insert into SaleTransaction
CREATE PROCEDURE InsertSaleTransaction
    @SaleDate DATE,
    @SalePrice DECIMAL(18, 2),
    @PropertyLocation VARCHAR(255),
    @BuyerFName VARCHAR(255),
    @BuyerLName VARCHAR(255),
    @SellerFName VARCHAR(255),
    @SellerLName VARCHAR(255),
    @FinancingTypeName VARCHAR(255)
AS
BEGIN
    DECLARE @PropertyID INT, @BuyerID INT, @SellerID INT, @FinancingTypeID INT;

    EXEC GetPropertyID @PropertyLocation, @PropertyID OUTPUT;
    EXEC GetBuyerID @BuyerFName, @BuyerLName, @BuyerID OUTPUT;
    EXEC GetSellerID @SellerFName, @SellerLName, @SellerID OUTPUT;
    EXEC GetFinancingTypeID @FinancingTypeName, @FinancingTypeID OUTPUT;

    IF @PropertyID IS NULL OR @BuyerID IS NULL OR @SellerID IS NULL OR @FinancingTypeID IS NULL
    BEGIN
        PRINT 'One or more IDs are NULL; check the input parameters.';
        RETURN;
    END

    INSERT INTO SaleTransaction (SaleDate, SalePrice, PropertyID, BuyerID, SellerID, FinancingTypeID)
    VALUES (@SaleDate, @SalePrice, @PropertyID, @BuyerID, @SellerID, @FinancingTypeID);
END;
GO


EXEC InsertSaleTransaction
    @SaleDate = '2023-01-01',
    @SalePrice = 350000.00,
    @PropertyLocation = '123 Maple St',
    @BuyerFName = 'John',
    @BuyerLName = 'Doe',
    @SellerFName = 'Alice',
    @SellerLName = 'Brown',
    @FinancingTypeName = 'Conventional Loan';


SELECT * FROM SaleTransaction


--2nd stored procedure on Sale transaction table

GO

-- Main procedure to update SaleTransaction
CREATE PROCEDURE UpdateSaleTransaction
    @TransactionID INT,
    @SaleDate DATE,
    @SalePrice DECIMAL(18, 2),
    @PropertyLocation VARCHAR(255),
    @BuyerFName VARCHAR(255),
    @BuyerLName VARCHAR(255),
    @SellerFName VARCHAR(255),
    @SellerLName VARCHAR(255),
    @FinancingTypeName VARCHAR(255)
AS
BEGIN
    DECLARE @PropertyID INT, @BuyerID INT, @SellerID INT, @FinancingTypeID INT;

    EXEC GetPropertyID @PropertyLocation, @PropertyID OUTPUT;
    EXEC GetBuyerID @BuyerFName, @BuyerLName, @BuyerID OUTPUT;
    EXEC GetSellerID @SellerFName, @SellerLName, @SellerID OUTPUT;
    EXEC GetFinancingTypeID @FinancingTypeName, @FinancingTypeID OUTPUT;

    IF @PropertyID IS NULL OR @BuyerID IS NULL OR @SellerID IS NULL OR @FinancingTypeID IS NULL
    BEGIN
        PRINT 'One or more IDs are NULL; check the input parameters.';
        RETURN;
    END

    -- Update the SaleTransaction
    UPDATE SaleTransaction
    SET SaleDate = @SaleDate, 
        SalePrice = @SalePrice, 
        PropertyID = @PropertyID, 
        BuyerID = @BuyerID, 
        SellerID = @SellerID, 
        FinancingTypeID = @FinancingTypeID
    WHERE TransactionID = @TransactionID;
END;
GO

EXEC UpdateSaleTransaction
    @TransactionID = 1,
    @SaleDate = '2023-10-01',
    @SalePrice = 375000.00,
    @PropertyLocation = '123 Maple St',
    @BuyerFName = 'John',
    @BuyerLName = 'Doe',
    @SellerFName = 'Alice',
    @SellerLName = 'Brown',
    @FinancingTypeName = 'Conventional Loan';

SELECT * FROM SaleTransaction



--1st trigger


CREATE TABLE SaleTransactionLog
(
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    TransactionID INT,
    SaleDate DATE,
    SalePrice DECIMAL,
    PropertyID INT,
    BuyerID INT,
    SellerID INT,
    FinancingTypeID INT,
    LogAction VARCHAR(100),
    LogTimestamp DATETIME
);
GO

CREATE OR ALTER TRIGGER trg_SaleTransactionAudit 
ON SaleTransaction
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- For Inserted and Updated records
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO SaleTransactionLog (TransactionID, SaleDate, SalePrice, PropertyID, BuyerID, SellerID, FinancingTypeID, LogAction, LogTimestamp)
        SELECT 
            i.TransactionID, i.SaleDate, i.SalePrice, i.PropertyID, i.BuyerID, i.SellerID, i.FinancingTypeID, 
            CASE WHEN d.TransactionID IS NULL THEN 'INSERT' ELSE 'UPDATE' END,
            GETDATE()
        FROM inserted i
        LEFT JOIN deleted d ON i.TransactionID = d.TransactionID;
    END

    -- For Deleted records
    IF EXISTS (SELECT * FROM deleted) AND NOT EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO SaleTransactionLog (TransactionID, SaleDate, SalePrice, PropertyID, BuyerID, SellerID, FinancingTypeID, LogAction, LogTimestamp)
        SELECT 
            d.TransactionID, d.SaleDate, d.SalePrice, d.PropertyID, d.BuyerID, d.SellerID, d.FinancingTypeID, 
            'DELETE',
            GETDATE()
        FROM deleted d;
    END
END;
GO

SELECT * FROM SaleTransactionLog;

INSERT INTO SaleTransaction (SaleDate, SalePrice, PropertyID, BuyerID, SellerID, FinancingTypeID) VALUES ('2023-01-01', 350000.00, 6, 7, 4, 1);



--2nd trigger

CREATE TABLE Buyer_Log
(
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    BuyerID INT,
    FName VARCHAR(255),
    LName VARCHAR(255),
    ContactInfo VARCHAR(255),
    CreditScore INT,
    Log_Action VARCHAR(100),
    Log_Timestamp DATETIME
);


GO
CREATE TRIGGER trg_BuyerAudit
ON Buyer
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Log Insert actions
    INSERT INTO Buyer_Log (BuyerID, FName, LName, ContactInfo, CreditScore, Log_Action, Log_Timestamp)
    SELECT i.BuyerID, i.FName, i.LName, i.ContactInfo, i.CreditScore, 'INSERT', GETDATE()
    FROM inserted i
    WHERE NOT EXISTS (SELECT 1 FROM deleted WHERE BuyerID = i.BuyerID);

    -- Log Update actions
    INSERT INTO Buyer_Log (BuyerID, FName, LName, ContactInfo, CreditScore, Log_Action, Log_Timestamp)
    SELECT i.BuyerID, i.FName, i.LName, i.ContactInfo, i.CreditScore, 'UPDATE', GETDATE()
    FROM inserted i
    INNER JOIN deleted d ON i.BuyerID = d.BuyerID;

    -- Log Delete actions
    INSERT INTO Buyer_Log (BuyerID, FName, LName, ContactInfo, CreditScore, Log_Action, Log_Timestamp)
    SELECT d.BuyerID, d.FName, d.LName, d.ContactInfo, d.CreditScore, 'DELETE', GETDATE()
    FROM deleted d;
END;


-- Example update command for the Buyer table
UPDATE Buyer
SET FName = 'Bernard',
    LName = 'Shaw',
    ContactInfo = 'bernard.shaw@example.com',
    CreditScore = 750
WHERE BuyerID = 1;  -- Assuming there is a record with BuyerID = 1

SELECT * FROM Buyer_Log;

--1st computed column - Full name in Buyer table

ALTER TABLE Buyer
ADD FullName AS FName + ' ' + LName;

select * from Buyer;


--2nd computed column - Monthly mortgage payment in MortgageDetails

ALTER TABLE MortgageDetails
ADD MonthlyPayment AS 
    (
        LoanAmount * (InterestRate / 1200) * POWER((1 + (InterestRate / 1200)), (LoanTerm * 12))
        /
        (POWER((1 + (InterestRate / 1200)), (LoanTerm * 12)) - 1)
    );


SELECT * FROM MortgageDetails;


--Complex Query 1: Top 5 most expensive properties sold

SELECT TOP 5 p.PropertyID, p.PropertyLocation, st.SalePrice
FROM Property p
JOIN SaleTransaction st ON p.PropertyID = st.PropertyID
ORDER BY st.SalePrice DESC;



--Complex Query 2: Average sale price by neighborhood

SELECT n.NeighborhoodName, AVG(st.SalePrice) AS AvgSalePrice
FROM SaleTransaction st
JOIN Property p ON st.PropertyID = p.PropertyID
JOIN Neighborhood n ON p.NeighborhoodID = n.NeighborhoodID
GROUP BY n.NeighborhoodName
