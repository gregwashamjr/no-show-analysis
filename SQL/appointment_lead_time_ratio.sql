SELECT 
    CASE 
        WHEN (appointment_day - scheduled_day) = 0 THEN '01 Same Day'
        WHEN (appointment_day - scheduled_day) BETWEEN 1 AND 3 THEN '02 1-3 Days'
        WHEN (appointment_day - scheduled_day) BETWEEN 4 AND 7 THEN '03 4-7 Days'
        WHEN (appointment_day - scheduled_day) BETWEEN 8 AND 14 THEN '04 8-14 Days'
        WHEN (appointment_day - scheduled_day) BETWEEN 15 AND 30 THEN '05 15-30 Days'
        ELSE '06 31+ Days'
    END AS lead_time_bucket,
    COUNT(*) AS total_appointments,
    COUNT(*) FILTER (WHERE no_show = 'Yes') AS no_show_count,
    ROUND(COUNT(*) FILTER (WHERE no_show = 'Yes')::numeric / COUNT(*), 4) AS no_show_ratio
FROM appointment_data
GROUP BY 1
ORDER BY 1;