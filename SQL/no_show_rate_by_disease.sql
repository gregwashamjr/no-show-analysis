WITH count AS(
SELECT
	SUM(CASE WHEN scholarship = 'Yes' THEN 1 ELSE 0 END) 
	AS government_assisted_count,
	SUM(CASE WHEN hypertension = 'Yes' THEN 1 ELSE 0 END) 
	AS hypertension_count,
	SUM(CASE WHEN diabetes = 'Yes' THEN 1 ELSE 0 END)
	AS diabetes_count,
	SUM(CASE WHEN alcoholism = 'Yes' THEN 1 ELSE 0 END)
	AS alcoholism_count,
	SUM(CASE WHEN handicap = 'Yes' THEN 1 ELSE 0 END)
	AS handicap_count,
	(SELECT COUNT (*) FROM appointment_data
	WHERE no_show = 'Yes') AS no_show_count
FROM appointment_data

)
SELECT
	government_assisted_count::FLOAT/no_show_count::FLOAT 
	AS government_assisted_no_show_rate,
	hypertension_count::FLOAT/no_show_count::FLOAT 
	AS hypertenstion_no_show_rate,
	diabetes_count::FLOAT/no_show_count::FLOAT 
	AS diabetes_no_show_rate,
	alcoholism_count::FLOAT/no_show_count::FLOAT 
	AS alcoholism_no_show_rate,
	handicap_count::FLOAT/no_show_count::FLOAT 
	AS handicap_no_show_rate
FROM count