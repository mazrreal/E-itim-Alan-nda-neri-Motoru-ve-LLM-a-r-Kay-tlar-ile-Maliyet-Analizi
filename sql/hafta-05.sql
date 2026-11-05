-- Sorgu 1 — Ders kategorisine göre öneri sayısı ve açıklamalı öneri oranı.
-- Beklenti: Her kategoride toplam öneri ve açıklama üretilen önerilerin yüzdesi görülür.
-- Yorum: Oranlar kategoriler arasında farklıysa açıklama üretimi bazı ders türlerinde yoğunlaşmış olabilir.
SELECT course_category,
       COUNT(*) AS onerı_sayisi,
       ROUND(100.0 * COUNT(*) FILTER (WHERE has_explanation = 'yes') / NULLIF(COUNT(*), 0), 2) AS aciklamali_oran_yuzde
FROM recommendations
GROUP BY course_category
ORDER BY onerı_sayisi DESC;

-- Sorgu 2 — Açıklamalı ve açıklamasız önerilerin tıklanma oranlarını karşılaştır.
-- Beklenti: Her grupta yalnızca bilinen yes/no tıklamalar paydaya girer; NULL bilinmeyen kabul edilir.
-- Yorum: Fark ilişki gösterir, tek başına açıklamanın tıklamaya neden olduğunu kanıtlamaz.
SELECT has_explanation,
       COUNT(*) FILTER (WHERE was_clicked IN ('yes','no')) AS bilinen_tiklama_kaydi,
       COUNT(*) FILTER (WHERE was_clicked = 'yes') AS tiklanan,
       ROUND(100.0 * COUNT(*) FILTER (WHERE was_clicked = 'yes')
             / NULLIF(COUNT(*) FILTER (WHERE was_clicked IN ('yes','no')), 0), 2) AS tiklanma_orani_yuzde
FROM recommendations
GROUP BY has_explanation
ORDER BY has_explanation;

-- Sorgu 3 — Açıklama maliyeti toplamı 3 USD üstünde olan ders kategorileri (HAVING).
-- Beklenti: Yalnızca maliyet alanı bilinen açıklamaların maliyeti toplanır; NULL maliyetler sayılmaz.
-- Yorum: Eşiği aşan kategori, açıklama maliyetinin ayrıca incelenmesini gerektirebilir.
SELECT course_category,
       ROUND(SUM(cost_usd), 4) AS toplam_maliyet_usd,
       COUNT(cost_usd) AS maliyeti_bilinen_aciklama
FROM recommendations
GROUP BY course_category
HAVING SUM(cost_usd) > 3
ORDER BY toplam_maliyet_usd DESC;

-- Sorgu 4 — Tıklanma durumu NULL olan öneriler ve COUNT farkı.
-- Beklenti: COUNT(*) tüm satırları, COUNT(was_clicked) ise NULL olmayan tıklama alanlarını sayar.
-- Yorum: Fark, tıklanma durumunun bilinmediği kayıt sayısıdır; bunlar otomatik olarak 'no' sayılamaz.
SELECT COUNT(*) AS toplam_oneri,
       COUNT(was_clicked) AS tıklama_durumu_bilinen,
       COUNT(*) - COUNT(was_clicked) AS tıklama_durumu_bilinmeyen
FROM recommendations;

-- Sorgu 5 — Haftalık tıklanma oranı trendi (date_trunc).
-- Beklenti: Her hafta için bilinen tıklama kayıtları üzerinden oran hesaplanır.
-- Yorum: Haftalık değişimler örneklem hacmiyle birlikte yorumlanmalı; tek başına nedensellik göstermez.
SELECT date_trunc('week', generated_at)::date AS hafta,
       COUNT(*) FILTER (WHERE was_clicked IN ('yes','no')) AS bilinen_kayit,
       COUNT(*) FILTER (WHERE was_clicked = 'yes') AS tiklanan,
       ROUND(100.0 * COUNT(*) FILTER (WHERE was_clicked = 'yes')
             / NULLIF(COUNT(*) FILTER (WHERE was_clicked IN ('yes','no')), 0), 2) AS tiklanma_orani_yuzde,
       ROUND(SUM(cost_usd), 4) AS toplam_aciklama_maliyeti_usd
FROM recommendations
GROUP BY date_trunc('week', generated_at)::date
ORDER BY hafta;
