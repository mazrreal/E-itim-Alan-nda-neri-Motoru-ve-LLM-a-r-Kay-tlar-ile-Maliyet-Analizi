# Veritabanı Yönetim Sistemleri — Vize Projesi

**Öğrenci no:** 202607131012  
**Kura:** #13 — YZO / Eğitim / Öneri motoru / LLM çağrı kayıtları ve maliyet

## Ana soru
Açıklaması olan öneriler, olmayanlara göre daha çok tıklanıyor mu ve bu fark açıklama maliyetini karşılıyor mu?

## Önemli dürüstlük notu
Bu paket, hocanın veri şartını göz ardı ederek sentetik veriyi gerçekmiş gibi sunmaz. `data/demo/recommendations_demo.csv` ve `data/cleaned/recommendations_demo_clean.csv` yalnızca SQL'i çalıştırıp denemek için **600 satırlık sentetik örnek** içerir. Bunlardan çıkan sayılar gerçek araştırma bulgusu olarak raporlanamaz.

Gerçek kaynak olarak Harvard Dataverse'teki **E-learning Recommender System Dataset** seçildi. İngilizce platform için `implicit_ratings_en.csv` dosyası 21.908 gerçek sayfa görüntüleme kaydı içerir; `items_en.csv` 1.167 eğitim içeriği kaydı içerir. Ancak gerçek kaynak sayfa görüntülemelerini içerir, öneri kartının kullanıcıya gösterildiği tüm gösterim kayıtlarını içermez; ayrıca açıklama var/yok ve LLM maliyeti alanları da yoktur. Dolayısıyla bu veri tek başına “açıklama tıklanmayı artırdı mı?” sorusunu kanıtlayamaz. Bu sınırlılık gizlenmemiştir.

## Klasörler
- `SCENARIO.md`: Hafta 3 senaryo, problem, tablo adayları ve kaynak adayları
- `scripts/download_real_data.py`: gerçek veri dosyalarını Dataverse API üzerinden indirir; indirilen ham dosyalar değiştirilmez
- `scripts/prepare_data.py`: ham veriden ayrı temizlenmiş/incelemeye hazır gerçek etkileşim tablosu üretir
- `data/raw/`: indirme betiği çalışınca oluşacak orijinal kaynak dosyaları
- `data/demo/`: SQL alıştırması için sentetik veri; gerçek veri değildir
- `data/cleaned/`: temizlenmiş demo örneği; gerçek kaynak işleme betiği çalışınca `course_interactions_real.csv` de buraya yazılır
- `data/README.md`: veri kartı
- `sql/hafta-04-demo.sql`: SELECT/WHERE/NULL alıştırmaları
- `sql/hafta-04-real-data.sql`: gerçek kaynak verisi içe aktarıldıktan sonra kullanılacak ilk sorgular
- `sql/hafta-05.sql`: istenen beş analiz sorgusu; yalnızca sentetik demo tablosu için
- `AI_BEYAN.md`: yapay zekâ ve araç kullanımı beyanı
- `report/tek_sayfa_rapor.md`: tek sayfalık rapor; gerçek bulgular uydurulmamıştır

## Windows'ta gerçek veriyi hazırlama
1. Python 3.10 veya üstünü kur.
2. Proje klasöründe terminal aç.
3. `python scripts/download_real_data.py` komutunu çalıştır.
4. Ardından `python scripts/prepare_data.py` komutunu çalıştır.
5. `data/README.md` içinde oluşturulan indirme tarihi, gerçek satır/sütun sayıları ve temizleme bilgilerini kontrol et.
6. PostgreSQL/pgAdmin'e CSV dosyalarını aktar. SQL dosyalarındaki tablo adları içe aktardığın tablo adlarıyla aynı olmalı.

## PostgreSQL sorguları
`sql/hafta-05.sql` dosyası `recommendations_demo` tablosunu bekler. `data/demo/recommendations_demo.csv` dosyasını pgAdmin ile bu tabloya aktararak sorguları test edebilirsin. Sorguların çıktıları sentetik demo çıktılarıdır; raporda gerçek sonuç gibi gösterme.

`sql/hafta-04-real-data.sql` dosyası `course_interactions_real` tablosu içe aktarıldıktan sonra çalışır. Bu tablo gerçek MOOC sayfa görüntülemelerini ifade eder, öneri gösterimlerini değil.

## Teslimden önce mutlaka tamamla
- Betikleri çalıştırıp gerçek kaynak dosyalarını indir.
- PostgreSQL'de sorguları gerçekten çalıştır ve gerçek çıktılarını kaydet.
- Öğretim elemanının istediği gerçek öneri-gösterim logları mevcut değilse bunu açıkça yaz; sayfa görüntülemelerini öneri tıklaması diye yeniden adlandırma.
- Tek sayfalık raporu gerçek sonuçlarla güncelle. Demo sonuçlarını kullanma.
