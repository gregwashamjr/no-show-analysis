WITH count AS(
SELECT
	COUNT(*) AS no_show_text_received,
	(SELECT COUNT(*) FROM appointment_data) AS appointment_count,
	(SELECT COUNT(*) FROM appointment_data
	WHERE sms_received = 'No' AND no_show = 'Yes') AS no_show_text_not_received
FROM appointment_data
WHERE sms_received = 'Yes' AND no_show = 'Yes'

)

SELECT
	no_show_text_received::FLOAT/appointment_count::FLOAT AS no_show_text_rate,
	no_show_text_not_received::FLOAT/appointment_count::FLOAT AS no_show_no_text_rate
FROM count