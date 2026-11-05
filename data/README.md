# Veri kartı — güncellenmesi zorunlu

## Bu paketteki demo dosyası
- Dosya: `raw/recommendations_demo.csv`
- Satır: 600 (başlık hariç)
- Sütun: 10
- Kaynak: Bu proje için sentetik olarak üretilmiştir; gerçek veri değildir.
- Lisans: Gerçek bir dış veri lisansı uygulanmaz; yalnızca ödev SQL denemesi için.
- Oluşturulma tarihi: 2026-11-05
- Üretilen satırlar: %100 sentetik demo. Hocanın en az %70 gerçek veri koşulunu karşılamaz.

## Önerilen gerçek kaynak
OULAD, UCI Machine Learning Repository, https://archive.ics.uci.edu/dataset/349/open+university+learning+analytics+dataset
- Dataset: anonimleştirilmiş çevrimiçi öğrenme etkileşimleri; VLE materyal tıklamaları, zaman ve ders/modül bilgisi.
- Lisans: CC BY 4.0 (atıf gerekir; lisans sayfasını indirme tarihinde yeniden kontrol edin).
- Atıf: Kuzilek, J., Hlosta, M., & Zdrahal, Z. (2017). Open University Learning Analytics dataset. Scientific Data, 4, 170171. https://doi.org/10.1038/sdata.2017.171
- İndirme tarihi: gerçek dosyayı indirince doldurulmalı.
- Gerçek satır/sütun sayısı: kullanılacak dosya ve filtreler belirlendikten sonra doldurulmalı.

## Temizleme adımları (demo)
1. Kategori metninin baş/son boşlukları alındı.
2. `has_explanation` ve `was_clicked` küçük harfe normalize edildi.
3. Bilinmeyen maliyet/token alanları boş bırakıldı; sıfıra çevrilmedi.
4. `data_origin=SIMULATED_DEMO_NOT_REAL` ile her satır işaretlendi.
5. Ham dosya değiştirilmedi; normalize edilmiş sürüm `cleaned/` altında saklandı.

## Veri sınırlaması
OULAD tıklamaları gerçek VLE materyal etkileşimleridir, öneri motoru tarafından gösterilen önerilere tıklama değildir. OULAD verisini kullanırken bu olaylar doğru adlandırılmalı; LLM token ve maliyet alanları gerçek kaynaktan gelmiyorsa türetilmiş/simüle edilmiş olarak açıkça işaretlenmelidir.
