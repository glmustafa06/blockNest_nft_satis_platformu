<?php
session_start();
include 'includes/db.php';

// Giriş yapılmamışsa engelle
if (!isset($_SESSION['kullanici_id'])) {
    header("Location: giris.php");
    exit;
}

// Formdan gelen veriler
$ad         = $_POST['ad'] ?? '';
$aciklama   = $_POST['aciklama'] ?? '';
$fiyat      = $_POST['fiyat'] ?? '';
$kategori_id = $_POST['kategori_id'] ?? '';
$sahip_id   = $_SESSION['kullanici_id'];
$tarih      = date('Y-m-d');

// Dosya yükleme işlemi
if (isset($_FILES['resim']) && $_FILES['resim']['error'] === UPLOAD_ERR_OK) {
    $resim_adi = uniqid() . '_' . basename($_FILES['resim']['name']);
    $hedef_dosya = __DIR__ . '/img/' . $resim_adi;

    // Geçerli uzantılar
    $gecerli_uzantilar = ['jpg', 'jpeg', 'png', 'gif', 'webp'];
    $dosya_uzantisi = strtolower(pathinfo($resim_adi, PATHINFO_EXTENSION));

    if (!in_array($dosya_uzantisi, $gecerli_uzantilar)) {
        echo "<p style='color:red; padding: 20px;'>Geçersiz dosya formatı. Yalnızca JPG, PNG, GIF, WEBP uzantılı dosyalar desteklenir.</p>";
        exit;
    }

    // Dosyayı taşı
    if (move_uploaded_file($_FILES['resim']['tmp_name'], $hedef_dosya)) {
        // Veritabanına ekle
        $sql = "INSERT INTO nftler (ad, aciklama, fiyat, kategori_id, sahip_id, tarih, resim)
                VALUES (:ad, :aciklama, :fiyat, :kategori_id, :sahip_id, :tarih, :resim)";
        $stmt = $conn->prepare($sql);
        $stmt->execute([
            'ad' => $ad,
            'aciklama' => $aciklama,
            'fiyat' => $fiyat,
            'kategori_id' => $kategori_id,
            'sahip_id' => $sahip_id,
            'tarih' => $tarih,
            'resim' => $resim_adi
        ]);

        header("Location: index.php?yukleme=basarili");
        exit;
    } else {
        echo "<p style='color:red; padding: 20px;'>Resim yüklenirken bir hata oluştu.</p>";
        exit;
    }
} else {
    echo "<p style='color:red; padding: 20px;'>Lütfen bir görsel dosyası seçin.</p>";
    exit;
}
