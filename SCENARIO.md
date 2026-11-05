# SCENARIO.md — Hafta 3

- **Öğrenci numarası:** 202607131012
- **Kura:** #13
- **Program:** Yapay Zekâ Operatörlüğü (YZO)
- **Alan × Sistem × YZ:** Eğitim × Öneri motoru × LLM çağrı kayıtları ve maliyet

## Hikâye ve problem
Çevrimiçi kurs platformu öğrencilere sonraki dersi öneren bir öneri motoru kullanır. Motor bazı önerilere bir dil modeliyle gerekçe/açıklama üretir. Platform, açıklama üretim maliyetini izlemek ve açıklamalı öneriler ile açıklamasız önerilerin tıklanma oranlarını karşılaştırmak ister.

## Ana soru
Açıklaması olan öneriler, olmayanlara göre daha çok tıklanıyor mu ve bu fark açıklama maliyetini karşılıyor mu?

## Hedef kullanıcılar
- Eğitim platformunun ürün ve analitik ekibi
- Ders tasarımcıları
- LLM çağrı maliyetini izleyen teknik ekip

## Hafta 3 tablo adayları
1. `recommendations(id, student_group, course_category, generated_at)`
2. `aciklamalar(id, recommendation_id, model_name, total_tokens, cost_usd)`
3. `clicks(id, recommendation_id, was_clicked, click_time)`

Bunlar senaryodaki tablo adaylarıdır. Vize kapsamı tam ilişkisel model/ERD veya DDL tasarlamak değildir; asıl vize çıktıları Hafta 3–5 çalışmalarının tek depoda toplanmasıdır.

## Veri kaynağı adayları ve doğruluk sınırı
- Mounir Hafsa ve arkadaşlarının **E-learning Recommender System Dataset** kaynağı: https://doi.org/10.7910/DVN/BMY3UD
- Bu kaynak gerçek MOOC sayfa görüntüleme ve içerik metaverisi sağlar. Kaynakta öneri gösterimi, açıklama üretimi veya LLM token/maliyet kaydı yoktur.
- Bu nedenle kaynak etkileşimleri `page_view` olarak adlandırılır. Bunlar `recommendation_impression` veya `was_clicked` diye yeniden etiketlenmez.
- Açıklama/tıklama deneyini gerçekten analiz etmek için platformdan öneri gösterimi (impression) + tıklama + açıklama + token/maliyet logları gerekir. Bu loglar yoksa senaryo için kesin cevap verilemez; sınırlılık raporda belirtilmelidir.

## Hafta 4'te beklenen veri sorunları
- Kaynak dosyaları tab-delimited biçimde sunulabilir; dosya uzantısına güvenmek yerine ayraç kontrol edilir.
- `created_at` tarih alanı metin biçiminde gelebilir; geçersiz değerler ayrı raporlanır.
- Kullanıcı ve içerik kimlikleri kategorik tanımlayıcılardır; sayısal ölçüm gibi yorumlanmaz.
- Kaynak `items` dosyasındaki `nb_views` ve `duration` sayısal alanlarında boş veya sayısal olmayan değerler bulunabilir.
- Ham dosya `data/raw/` altında değiştirilmez; temizlenmiş çıktı ayrı dosyaya yazılır.

## Hafta 5 analiz planı
Öğretim elemanının verdiği beş soru, öneri-gösterim logları üzerinde çalıştırılmalıdır: (1) kategoriye göre öneri sayısı ve açıklamalı oranı, (2) açıklamalı/açıklamasız tıklanma oranı, (3) maliyeti 3 USD üstü kategoriler, (4) `was_clicked` NULL kayıtları ve COUNT farkı, (5) haftalık tıklanma oranı. Paketteki `hafta-05.sql` sorguları yalnızca sentetik demo tablosunda teknik deneme içindir; gerçek bulgu olarak kullanılamaz.
