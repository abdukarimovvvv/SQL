SELECT id, NAME, 
    case 
        WHEN age >= 10 and age <= 20 THEN 'interval #1'
        WHEN age > 20 and age < 24 THEN 'interval #2'
        else 'interval #3'
    end as interval_info
FROM person
ORDER BY interval_info;