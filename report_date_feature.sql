DROP TABLE IF EXISTS  lt_basic_feature4to8_baseline12;
CREATE TABLE IF NOT EXISTS  lt_basic_feature4to8_baseline12 AS
SELECT   t1.report_date
        ,t1.dayfMonth  dayMonth
        ,CASE WHEN (t1.report_date>=20140405 AND t1.report_date<=20140407) OR 
        (t1.report_date>=20140501 AND t1.report_date<=20140503) OR
        (t1.report_date>=20140531 AND t1.report_date<=20140602) OR 
        (t1.report_date>=20140906 AND t1.report_date<=20140908)THEN  1 ELSE 0 END AS holiday
        ,CASE WHEN t1.dayfWeek=2 THEN  1 ELSE 0 END AS monday
        ,CASE WHEN t1.dayfWeek=3 THEN  1 ELSE 0 END AS tuesday
        ,CASE WHEN t1.dayfWeek=4 THEN  1 ELSE 0 END AS wednesday
        ,CASE WHEN t1.dayfWeek=5 THEN  1 ELSE 0 END AS thursday
        ,CASE WHEN t1.dayfWeek=6 THEN  1 ELSE 0 END AS friday
        ,CASE WHEN t1.dayfWeek=7 THEN  1 ELSE 0 END AS saturday
        ,CASE WHEN t1.dayfWeek=1 THEN  1 ELSE 0 END AS sunday
        ,t1.dayfWeek  dayweek
FROM (
    SELECT a.report_date
         ,a.report_date%100 dayfMonth
         ,DAYOFWEEK(a.report_date) dayfWeek
    FROM report_date_csv a
) t1;