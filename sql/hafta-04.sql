-- İlk kayıtları incele: SELECT
SELECT *
FROM recommendations
ORDER BY recommendation_id
LIMIT 10;

-- Programlama kategorisindeki önerileri filtrele: WHERE
SELECT recommendation_id, course_category, generated_at, has_explanation, was_clicked
FROM recommendations
WHERE course_category = 'Programlama'
ORDER BY generated_at
LIMIT 25;

-- NULL değerlerini gör: açıklama üretilmeyen önerilerde maliyet alanları boş olabilir.
SELECT recommendation_id, has_explanation, total_tokens, cost_usd
FROM recommendations
WHERE cost_usd IS NULL
LIMIT 20;

-- Ham veri kaynağı işaretini kontrol et.
SELECT data_origin, COUNT(*) AS satir_sayisi
FROM recommendations
GROUP BY data_origin;
