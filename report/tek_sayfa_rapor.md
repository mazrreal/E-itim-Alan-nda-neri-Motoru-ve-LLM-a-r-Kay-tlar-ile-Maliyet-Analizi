# Vize Proje Raporu — 202607131012

**Proje:** Eğitim platformunda öneri açıklamalarının tıklanma ve LLM maliyetleriyle ilişkisi  
**Kura #13:** Eğitim × Öneri motoru × LLM çağrı kayıtları ve maliyet

## Amaç
Bu projenin amacı, çevrimiçi kurs önerilerinde dil modeli tarafından üretilen açıklamaların tıklanma oranıyla ilişkisini ve açıklama üretim maliyetini incelemektir. Temel soru, açıklamalı önerilerin açıklamasız önerilerden daha fazla tıklanıp tıklanmadığı ve gözlenen farkın maliyeti karşılayıp karşılamadığıdır.

## Veri ve sınırlılıklar
Bu teslim paketinde SQL sorgularını test etmek amacıyla 600 satırlık sentetik demo veri bulunmaktadır. Bu veri gerçek kaynak koşulunu karşılamaz; final teslimden önce açık lisanslı gerçek veriyle değiştirilmesi ve veri kartının tamamlanması gerekir. OULAD gerçek çevrimiçi öğrenme materyali etkileşimleri içerir; ancak bu etkileşimler öneri tıklaması veya LLM maliyeti olarak adlandırılamaz. Bu nedenle gerçek veriyle senaryonun doğrudan ölçülemeyen alanları açıkça sınırlılık olarak raporlanmalıdır.

## Yöntem
PostgreSQL sorguları `GROUP BY`, `COUNT`, `ROUND`, `HAVING`, `CASE WHEN`, `NULL` kontrolü ve `date_trunc` kullanarak kategori bazında açıklama oranını, açıklamalı/açıklamasız grupların tıklanma oranını, maliyeti yüksek kategorileri, eksik tıklama kayıtlarını ve haftalık trendi inceler. Boş maliyet ve tıklama değerleri sıfır kabul edilmez.

## Beklenen katkı ve yorum
Sorgular, hangi kategorilerin daha çok açıklama aldığına, tıklanma oranlarının gruplar arasında nasıl değiştiğine ve maliyetin nerelerde biriktiğine dair betimleyici bulgular üretir. Açıklamalı ve açıklamasız öneriler farklı kullanıcı gruplarına gösterilmiş olabilir; bu nedenle gözlemsel fark nedensellik kanıtı değildir. Maliyet/fayda kararı için tıklama artışının yanında maliyet, örneklem büyüklüğü ve eksik veri oranı birlikte değerlendirilmelidir.

**Teslim öncesi:** Gerçek veri, gerçek indirme tarihi/lisans/satır-sütun sayısı, SQL çalıştırma çıktıları ve öğrencinin doğruladığı sonuçlarla bu rapor güncellenmelidir.
