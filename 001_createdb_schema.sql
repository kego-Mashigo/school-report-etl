-- Create the staging database for raw data.
USE master;
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE name = N'kathu_college_stg'
)
BEGIN
    CREATE DATABASE kathu_college_stg;
END;
GO

-- Create the bronze schema for raw, uncleaned data.
USE kathu_college_stg;
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = N'bronze'
)
BEGIN
    EXEC(N'CREATE SCHEMA bronze AUTHORIZATION dbo;');
END;
GO

-- Create the data warehouse database.
USE master;
GO

IF NOT EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE name = N'kathu_college_dwh'
)
BEGIN
    CREATE DATABASE kathu_college_dwh;
END;
GO

USE kathu_college_dwh;
GO

-- Create the silver schema for cleaned and validated data.
IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = N'silver'
)
BEGIN
    EXEC(N'CREATE SCHEMA silver AUTHORIZATION dbo;');
END;
GO

-- Create the gold schema for reporting-ready data.
IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = N'gold'
)
BEGIN
    EXEC(N'CREATE SCHEMA gold AUTHORIZATION dbo;');
END;
GO