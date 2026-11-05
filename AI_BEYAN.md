# Yapay Zekâ ve Araç Kullanımı Beyanı

- **ChatGPT:** Ödev yönergesini yapılandırma, senaryo/README/veri kartı/rapor taslağı oluşturma ve PostgreSQL sorgularını hazırlamada kullanıldı.
- **Python:** CSV örneği üretimi, veri indirme betiği ve gerçek kaynak için temizleme/özetleme betiği hazırlamada kullanıldı.
- **Sentetik veri:** `data/demo/recommendations_demo.csv` dosyasındaki 600 satır tamamen sentetik ve SQL denemesi içindir. Gerçek veriden türetilmiş değildir.
- **Gerçek veri:** İndirme betiği Harvard Dataverse'teki MOOC veri setinin orijinal İngilizce implicit ratings ve item metadata dosyalarını indirir. İndirme tarihi betik çalıştırıldığında kaydedilir. Ham dosyalar değiştirilmez.
- **Sınırlılık:** Gerçek kaynakta öneri gösterim kaydı, açıklama var/yok bilgisi veya LLM maliyeti yoktur. Bu alanlar gerçekmiş gibi uydurulmamıştır.
- **Doğrulama:** PostgreSQL çıktıları, gerçek veriyi indirdikten ve sorguları çalıştırdıktan sonra öğrenci tarafından doğrulanmalıdır. Bu pakette gerçek PostgreSQL çalıştırma ekran görüntüsü veya gerçek sorgu çıktısı iddia edilmemektedir.
