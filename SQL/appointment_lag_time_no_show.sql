WITH lead_time AS(
SELECT appointment_id, appointment_day - scheduled_day AS lead_time
FROM appointment_data
WHERE appointment_day - scheduled_day >= 0 
AND no_show = 'Yes')
SELECT
	COUNT(*) AS no_show,
	CASE
    WHEN lead_time = 0 THEN '01 Same Day'
    WHEN lead_time BETWEEN 1 AND 3 THEN '02 1-3 Days'
    WHEN lead_time BETWEEN 4 AND 7 THEN '03 4-7 Days'
    WHEN lead_time BETWEEN 8 AND 14 THEN '04 8-14 Days'
    WHEN lead_time BETWEEN 15 AND 30 THEN '05 15-30 Days'
    WHEN lead_time BETWEEN 31 AND 60 THEN '06 31-60 Days'
    WHEN lead_time BETWEEN 61 AND 90 THEN '07 61-90 Days'
    ELSE '08 91-179 Days'
END AS appointment_lead_time
FROM lead_time
GROUP BY appointment_lead_time
ORDER BY appointment_lead_time
