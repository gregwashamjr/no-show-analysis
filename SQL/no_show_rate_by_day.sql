SELECT 
    to_char(appointment_day, 'Day') AS day_of_week,
    COUNT(*) AS total_appointments,
    COUNT(*) FILTER (WHERE no_show = 'Yes') AS no_show_count,
    -- Ratio = (No Shows) / (Total)
    ROUND(
        COUNT(*) FILTER (WHERE no_show = 'Yes')::numeric / COUNT(*), 
        4
    ) AS no_show_ratio
FROM appointment_data
GROUP BY 1, extract(DOW FROM appointment_day)
ORDER BY extract(DOW FROM appointment_day);