--##DIMENSION TABLE BY SATYAM PANDEY 

--##HERE IS CREATE QUERY TO DEFINE SCHEMA OF DATE DIMENSION TABLE

CREATE TABLE DateDimension (
  DateKey NVARCHAR(50) ,
  FullDateUSA NVARCHAR(50),
  DayOfMonth NVARCHAR(50),
  DaySuffix NVARCHAR(50),
  DayName NVARCHAR(50),
  WeekEnding NVARCHAR(50),
  DayOfWeekUSA NVARCHAR(50),
  DayOfYear NVARCHAR(50),
  WeekOfYear NVARCHAR(50),
  HalfYear NVARCHAR(50),
  MonthName NVARCHAR(50),
  MonthOfQuarter NVARCHAR(50),
  Quarter NVARCHAR(50),
  QuarterName NVARCHAR(50),
  YearName NVARCHAR(50),
  MonthYear NVARCHAR(50),
  IsWeekday BIT,
  FiscalDayOfYear NVARCHAR(50),
  FiscalPeriod NVARCHAR(50),
  FiscalQuarter NVARCHAR(50),
  FiscalQuarterName NVARCHAR(50),
  FiscalYear NVARCHAR(50),
  FiscalYearName NVARCHAR(50),
  FiscalPeriodYYYY NVARCHAR(50)
);


--## TO POPULATE THIS TABLE WE HAVE THIS STORED PROCEDURE WITH 1 INPUT THAT IS CURRENT DATE 
CREATE OR ALTER PROC spDATE (@currDate date)
As
declare @yrr INT;
set @yrr = datepart(YYYY,@currDate)
DECLARE @FISCALDATE DATE;
IF DATEPART(MONTH,@currDate)>=10
    SET @FISCALDATE=CAST(yEAR (@CURRDATE) AS VARCHAR) + '-10-01';
ELSE
    SET @FISCALDATE = CAST(YEAR(@CURRDATE) - 1 AS VARCHAR) + '-10-01'; 
while (@yrr >= DATEPART(year,@currDate))
	begin 
		insert into DateDimension
		values(
		CONVERT(VARCHAR(10), @currDate, 112),
		CONVERT(VARCHAR(10), @currDate, 101),
		DATEPART(DAY,@currDate),
		CASE WHEN DAY(@currDate) IN ('1','21','31') THEN 'st'
            WHEN DAY(@currDate) IN ('2','22') THEN 'nd'
            WHEN DAY(@currDate) IN ('3','23') THEN 'rd'
            ELSE 'th'
       END,
	   DATENAME(weekday,@currDate),
DATEADD(DAY, '8' - DATEPART(WEEKDAY, @currDate), CAST(@currDate AS DATE)),--week ending
		 DATEpart(WEEKDAY, @currDate),--DayOfWeekUSA
		 DATEpart(DAYOFYEAR, @currDate),--DayOfYear
		 DATEPART (ISO_WEEK,@currDate),--WeekOfYear
		CASE WHEN DATEPART(MONTH, @currDate) <= 6 THEN '1stHalf'
            ELSE '2ndHalf'
       END,--HALF YEAR
 DATENAME(MONTH,@currDate),--MONTH NAME
      DATEPART(MONTH, @currDate) - 3 * (DATEPART(QUARTER, @currDate) - 1),--MONTH OF QUATER
      DATEPART(QUARTER,@CURRDATE),--QUARTER
      CASE 
        WHEN DATEPART(QUARTER,@CURRDATE) = 1 THEN 'Q1'
        WHEN DATEPART(QUARTER,@CURRDATE) = 2 THEN 'Q2'
        WHEN DATEPART(QUARTER,@CURRDATE) = 3 THEN 'Q3'
        ELSE 'Q4' END,-- QUATER NAME
DATENAME(MONTH, @CurrDate) ,--YEAR NAME
        CONCAT(DATEPART(month,@currDate),'-', DATEPART(YEAR,@currDate)),--MONTHYEAR
        CASE WHEN DATEPART(WEEKDAY, @currDate) BETWEEN '2' AND '6' THEN 1 
    ELSE 0 END,
 DATEDIFF(DAY, @FISCALDATE, @CurrDate)+1,--FISCAL DAY
DATEDIFF(MONTH, @FISCALDATE, @CurrDate)+1,-- FISCAL PERIOD
DATEPART(QUARTER, DATEADD(MONTH, 3, @CurrDate)),--FISACAL QUATER
    DATEPART(QUARTER, DATEADD(MONTH, 3,@CurrDate)),--FiscalQuarterName
    DATEPART(YEAR,@FISCALDATE),--FISCAL YEAR
    DATEPART(YEAR,@FISCALDATE),--FISCAL YEAR NAME
CONCAT(DATEDIFF(MONTH, @FISCALDATE, @CurrDate)+1,DATEPART(YEAR,@FISCALDATE))

		)
		 set @currDate=DATEADD(day,1,@currDate) ;
		 end

--##END OF SP

--##FOR EXECUTION OF ABOVE STORED PROCEDURE 
 --------------------------------
 --------------------------------
		 exec spdate '2023-03-16'
--------------------------------
--------------------------------
--##TO GET RESULT SET FROM ABOVE POPULATION
--------------------------------
		 SELECT * FROM DATEDIMENSION
--------------------------------
--------------------------------

--##THANKYOU 
		 
