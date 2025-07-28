CREATE PROCEDURE PopulateDateDimension
    @inputDate DATE
AS
BEGIN
    DECLARE @startDate DATE = DATEFROMPARTS(YEAR(@inputDate), 1, 1);
    DECLARE @endDate DATE = DATEFROMPARTS(YEAR(@inputDate), 12, 31);

    ;WITH DateSeries AS (
        SELECT @startDate AS [Date]
        UNION ALL
        SELECT DATEADD(DAY, 1, [Date])
        FROM DateSeries
        WHERE [Date] < @endDate
    )
    INSERT INTO DateDimension (
        SKDate, KeyDate, [Date], CalendarDay, CalendarMonth, CalendarQuarter,
        CalendarYear, DayNameLong, DayNameShort, DayNumberOfWeek, DayNumberOfYear,
        DaySuffix, FiscalWeek, FiscalPeriod, FiscalQuarter, FiscalYear, FiscalYearPeriod
    )
    SELECT 
        CONVERT(INT, CONVERT(CHAR(8), [Date], 112)) AS SKDate,
        [Date] AS KeyDate,
        [Date],
        DAY([Date]) AS CalendarDay,
        MONTH([Date]) AS CalendarMonth,
        DATEPART(QUARTER, [Date]) AS CalendarQuarter,
        YEAR([Date]) AS CalendarYear,
        DATENAME(WEEKDAY, [Date]) AS DayNameLong,
        LEFT(DATENAME(WEEKDAY, [Date]), 3) AS DayNameShort,
        DATEPART(WEEKDAY, [Date]) AS DayNumberOfWeek,
        DATEPART(DAYOFYEAR, [Date]) AS DayNumberOfYear,
        CAST(DAY([Date]) AS VARCHAR) +
            CASE 
                WHEN DAY([Date]) IN (11,12,13) THEN 'th'
                WHEN RIGHT(CAST(DAY([Date]) AS VARCHAR),1) = '1' THEN 'st'
                WHEN RIGHT(CAST(DAY([Date]) AS VARCHAR),1) = '2' THEN 'nd'
                WHEN RIGHT(CAST(DAY([Date]) AS VARCHAR),1) = '3' THEN 'rd'
                ELSE 'th'
            END AS DaySuffix,
        DATEPART(WEEK, [Date]) AS FiscalWeek,
        MONTH([Date]) AS FiscalPeriod,
        DATEPART(QUARTER, [Date]) AS FiscalQuarter,
        YEAR([Date]) AS FiscalYear,
        CAST(YEAR([Date]) AS VARCHAR) + RIGHT('0' + CAST(MONTH([Date]) AS VARCHAR), 2) AS FiscalYearPeriod
    FROM DateSeries
    OPTION (MAXRECURSION 366);  -- To ensure we cover up to 366 days
END;

EXEC PopulateDateDimension '2020-07-14';

SELECT * FROM DateDimension;
