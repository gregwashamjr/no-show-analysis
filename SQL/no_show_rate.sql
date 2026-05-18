WITH count AS(
	SELECT 
		COUNT(*) AS appointment_count,
		(SELECT COUNT(*) FROM appointment_data
		WHERE no_show = 'Yes') AS no_show_count
	FROM appointment_data

)
SELECT 
	(no_show_count::FLOAT/appointment_count::FLOAT) AS no_show_rate
FROM count