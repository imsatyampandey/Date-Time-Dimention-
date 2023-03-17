# Date Dimension Table by Satyam Pandey

## Introduction
This repository contains a SQL script to create a date dimension table and a stored procedure to populate it.

## Schema
The following schema is used for the `DateDimension` table:

| Column name | Data type |
|-------------|-----------|
| DateKey | NVARCHAR(50) |
| FullDateUSA | NVARCHAR(50) |
| DayOfMonth | NVARCHAR(50) |
| DaySuffix | NVARCHAR(50) |
| DayName | NVARCHAR(50) |
| WeekEnding | NVARCHAR(50) |
| DayOfWeekUSA | NVARCHAR(50) |
| DayOfYear | NVARCHAR(50) |
| WeekOfYear | NVARCHAR(50) |
| HalfYear | NVARCHAR(50) |
| MonthName | NVARCHAR(50) |
| MonthOfQuarter | NVARCHAR(50) |
| Quarter | NVARCHAR(50) |
| QuarterName | NVARCHAR(50) |
| YearName | NVARCHAR(50) |
| MonthYear | NVARCHAR(50) |
| IsWeekday | BIT |
| FiscalDayOfYear | NVARCHAR(50) |
| FiscalPeriod | NVARCHAR(50) |
| FiscalQuarter | NVARCHAR(50) |
| FiscalQuarterName | NVARCHAR(50) |
| FiscalYear | NVARCHAR(50) |
| FiscalYearName | NVARCHAR(50) |
| FiscalPeriodYYYY | NVARCHAR(50) |

## Usage
To create the `DateDimension` table, run the following SQL script:

```sql
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
