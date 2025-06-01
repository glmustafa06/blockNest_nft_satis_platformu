-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 01 Haz 2025, 17:40:12
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `blocknest_database`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `favoriler`
--

CREATE TABLE `favoriler` (
  `id` int(11) NOT NULL,
  `kullanici_id` int(11) NOT NULL,
  `nft_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `favoriler`
--

INSERT INTO `favoriler` (`id`, `kullanici_id`, `nft_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 4),
(5, 2, 5),
(6, 2, 6),
(7, 3, 7),
(8, 3, 8),
(9, 3, 9),
(10, 4, 10),
(11, 4, 11),
(12, 4, 12),
(13, 5, 13),
(14, 5, 14),
(15, 5, 15),
(16, 6, 16),
(17, 6, 17),
(18, 6, 18),
(19, 7, 19),
(20, 7, 20),
(21, 7, 21),
(22, 8, 22),
(23, 8, 23),
(24, 8, 24),
(25, 9, 25),
(26, 9, 26),
(27, 9, 27),
(28, 10, 28),
(29, 10, 29),
(30, 10, 30),
(31, 11, 31),
(32, 11, 32),
(33, 11, 33),
(34, 12, 34),
(35, 12, 35),
(36, 12, 36),
(37, 13, 37),
(38, 13, 38),
(39, 13, 39),
(40, 14, 40),
(41, 14, 41),
(42, 14, 42),
(43, 15, 43),
(44, 15, 44),
(45, 15, 45),
(46, 16, 73),
(47, 16, 72),
(49, 16, 64),
(50, 16, 62),
(51, 16, 66),
(52, 16, 59),
(53, 16, 78),
(54, 1, 72);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoriler`
--

CREATE TABLE `kategoriler` (
  `id` int(11) NOT NULL,
  `ad` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `kategoriler`
--

INSERT INTO `kategoriler` (`id`, `ad`) VALUES
(10, '3D Modelleme'),
(7, 'Fotoğrafçılık'),
(6, 'GIF & Animasyon'),
(2, 'Koleksiyon'),
(5, 'Metaverse'),
(3, 'Müzik'),
(4, 'Oyun İçeriği'),
(1, 'Sanat'),
(8, 'Ticari Lisanslar'),
(9, 'Video & Sinema');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanicilar`
--

CREATE TABLE `kullanicilar` (
  `id` int(11) NOT NULL,
  `isim` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `sifre_hash` varchar(255) NOT NULL,
  `kayit_tarihi` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `kullanicilar`
--

INSERT INTO `kullanicilar` (`id`, `isim`, `email`, `sifre_hash`, `kayit_tarihi`) VALUES
(1, 'Ali Demir', 'ali.demir@example.com', 'asdasd', '2025-03-24 15:12:49'),
(2, 'Zeynep Yılmaz', 'zeynep.yilmaz@example.com', 'abcdef', '2025-03-24 15:12:49'),
(3, 'Mustafa Kara', 'mustafa.kara@example.com', 'pass123', '2025-03-24 15:12:49'),
(4, 'Elif Çetin', 'elif.cetin@example.com', 'qwerty', '2025-03-24 15:12:49'),
(5, 'Burak Aydın', 'burak.aydin@example.com', 'nftmaster', '2025-03-24 15:12:49'),
(6, 'Mert Can', 'mert.can@example.com', 'mert123', '2025-03-24 15:13:54'),
(7, 'Ayşe Kaplan', 'ayse.kaplan@example.com', 'ayse456', '2025-03-24 15:13:54'),
(8, 'Eren Özdemir', 'eren.ozdemir@example.com', 'eren789', '2025-03-24 15:13:54'),
(9, 'Gizem Şahin', 'gizem.sahin@example.com', 'gizem000', '2025-03-24 15:13:54'),
(10, 'Emre Yıldırım', 'emre.yildirim@example.com', 'emre321', '2025-03-24 15:13:54'),
(11, 'Buse Kılıç', 'buse.kilic@example.com', 'buse654', '2025-03-24 15:13:54'),
(12, 'Kerem Tunç', 'kerem.tunc@example.com', 'kerem987', '2025-03-24 15:13:54'),
(13, 'Dilan Aksoy', 'dilan.aksoy@example.com', 'dilan555', '2025-03-24 15:13:54'),
(14, 'Fatih Bozkurt', 'fatih.bozkurt@example.com', 'fatih999', '2025-03-24 15:13:54'),
(15, 'Selin Öztürk', 'selin.ozturk@example.com', 'selin777', '2025-03-24 15:13:54'),
(16, 'Mustafa Gül', 'glmustafa0606@gmail.com', '123123', '2025-05-21 16:26:22');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `nftler`
--

CREATE TABLE `nftler` (
  `id` int(11) NOT NULL,
  `ad` varchar(150) NOT NULL,
  `aciklama` text DEFAULT NULL,
  `fiyat` decimal(10,2) NOT NULL CHECK (`fiyat` >= 0),
  `sahip_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `tarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `resim` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `nftler`
--

INSERT INTO `nftler` (`id`, `ad`, `aciklama`, `fiyat`, `sahip_id`, `kategori_id`, `tarih`, `resim`) VALUES
(1, 'Ethereal Visions', 'Soyut renk patlamalarından oluşan bir dijital sanat eseri.', 3.50, 1, 1, '2025-03-24 15:21:30', 'nft_images/ethereal_visions.jpg'),
(2, 'Neon Dreams', 'Fütüristik neon tonlarıyla tasarlanmış modern bir sanat eseri.', 2.80, 2, 1, '2025-03-24 15:21:30', 'nft_images/neon_dreams.jpg'),
(3, 'Surreal Galaxy', 'Gerçeküstü galaksi manzarası.', 4.20, 3, 1, '2025-03-24 15:21:30', 'nft_images/surreal_galaxy.jpg'),
(4, 'Dark Horizon', 'Karanlık tonlarda soyut bir manzara.', 5.10, 4, 1, '2025-03-24 15:21:30', 'nft_images/dark_horizon.jpg'),
(5, 'Cyber Queen', 'Siberpunk tarzında portre NFT.', 3.90, 5, 1, '2025-03-24 15:21:30', 'nft_images/cyber_queen.jpg'),
(6, 'Pixelated Future', 'Retro pikselli sanatsal NFT.', 2.30, 6, 1, '2025-03-24 15:21:30', 'nft_images/pixelated_future.jpg'),
(7, 'Dreamscape', 'Pastel tonlarla hayal dünyasına yolculuk.', 4.50, 7, 1, '2025-03-24 15:21:30', 'nft_images/dreamscape.jpg'),
(8, 'Abstract Reality', 'Gerçeküstü şekiller ve geometrik desenler.', 3.70, 8, 1, '2025-03-24 15:21:30', 'nft_images/abstract_reality.jpg'),
(9, 'Liquid Gold', 'Erimiş altın efektli modern sanat.', 6.00, 9, 1, '2025-03-24 15:21:30', 'nft_images/liquid_gold.jpg'),
(10, 'Metaverse Aesthetics', 'Metaverse sanat dünyasına ait benzersiz NFT.', 5.80, 10, 1, '2025-03-24 15:21:30', 'nft_images/metaverse_aesthetics.jpg'),
(11, 'Crypto Samurai', 'Dijital koleksiyon NFT savaşçısı.', 4.20, 1, 2, '2025-03-24 15:21:30', 'nft_images/crypto_samurai.png'),
(12, 'Pixel Punks #245', 'Özel bir pixel art koleksiyon eseri.', 3.10, 2, 2, '2025-03-24 15:21:30', 'nft_images/pixel_punks_245.jpg'),
(13, 'Ancient Relics #12', 'Tarihi eserlerden ilham alınarak oluşturulan koleksiyon.', 5.70, 3, 2, '2025-03-24 15:21:30', 'nft_images/ancient_relics_12.jpg'),
(14, 'Digital Beasts #88', 'Dijital canavar serisinin özel NFT’si.', 6.90, 4, 2, '2025-03-24 15:21:30', 'nft_images/digital_beasts_88.jpg'),
(15, 'Cyber Avatars #22', 'Metaverse kullanıcıları için özel avatar koleksiyonu.', 2.80, 5, 2, '2025-03-24 15:21:30', 'nft_images/cyber_avatars_22.jpg'),
(16, 'Crypto Legends #7', 'Ünlü tarihi figürlerden esinlenilmiş NFT serisi.', 7.30, 6, 2, '2025-03-24 15:21:30', 'nft_images/crypto_legends_7.jpg'),
(17, 'Mythic Creatures #42', 'Efsanevi yaratıklardan oluşan koleksiyon.', 5.50, 7, 2, '2025-03-24 15:21:30', 'nft_images/mythic_creatures_42.jpg'),
(18, 'NFT Rings #56', 'Yüzük koleksiyon NFT’si.', 3.00, 8, 2, '2025-03-24 15:21:30', 'nft_images/nft_rings_56.jpg'),
(19, 'Retro Cards #99', 'Klasik retro koleksiyon kartlarından biri.', 2.60, 9, 2, '2025-03-24 15:21:30', 'nft_images/retro_cards_99.jpg'),
(20, 'Virtual Artifacts #3', 'Sanal dünyaya ait koleksiyon NFT’si.', 4.00, 10, 2, '2025-03-24 15:21:30', 'nft_images/virtual_artifacts_3.jpg'),
(21, 'Pixel Melody', 'Blok zincir tabanlı müzik NFT.', 1.10, 1, 3, '2025-03-24 15:21:30', 'nft_images/pixel_melody.jpg'),
(22, 'Synthwave Anthem', '80’ler synthwave tarzı müzik NFT.', 2.30, 2, 3, '2025-03-24 15:21:30', 'nft_images/synthwave_anthem.jpg'),
(23, 'Chill Beats', 'Lo-fi chill müzik NFT.', 1.80, 3, 3, '2025-03-24 15:21:30', 'nft_images/chill_beats.jpg'),
(24, 'Digital Symphony', 'Tamamen yapay zeka ile üretilmiş senfonik müzik NFT.', 3.50, 4, 3, '2025-03-24 15:21:30', 'nft_images/digital_symphony.jpg'),
(25, 'Metaverse Club Mix', 'Metaverse partileri için özel müzik NFT.', 2.90, 5, 3, '2025-03-24 15:21:30', 'nft_images/metaverse_club_mix.jpg'),
(26, 'Space Jazz', 'Uzay temalı caz NFT.', 4.10, 6, 3, '2025-03-24 15:21:30', 'nft_images/space_jazz.jpg'),
(27, 'Deep House Groove', 'Elektronik deep house müzik NFT.', 2.70, 7, 3, '2025-03-24 15:21:30', 'nft_images/deep_house_groove.jpg'),
(28, 'Cyber Rap', 'Siberpunk rap müzik NFT.', 3.90, 8, 3, '2025-03-24 15:21:30', 'nft_images/cyber_rap.jpg'),
(29, 'Orchestral Fusion', 'Klasik ve elektronik müzik birleşimi NFT.', 5.00, 9, 3, '2025-03-24 15:21:30', 'nft_images/orchestral_fusion.jpg'),
(30, 'Bass Drop Vol. 1', 'Ağır bass ve dubstep içeren müzik NFT.', 2.40, 10, 3, '2025-03-24 15:21:30', 'nft_images/bass_drop_vol1.jpg'),
(31, 'Legendary Sword #001', 'RPG oyunları için özel efsanevi kılıç NFT.', 8.50, 1, 4, '2025-03-24 15:23:46', 'nft_images/legendary_sword_001.png'),
(32, 'Cyber Shield', 'Metaverse tabanlı oyunlarda kullanılabilen özel kalkan NFT.', 5.70, 2, 4, '2025-03-24 15:23:46', 'nft_images/cyber_shield.png'),
(33, 'Dragon Mount', 'Online oyunlar için ejderha bineği NFT.', 10.20, 3, 4, '2025-03-24 15:23:46', 'nft_images/dragon_mount.png'),
(34, 'Virtual Armor Set', 'Sanal dünyalarda özel zırh seti NFT.', 7.40, 4, 4, '2025-03-24 15:23:46', 'nft_images/virtual_armor_set.png'),
(35, 'Magic Spell Book', 'Blok zincir tabanlı büyü kitabı NFT.', 6.10, 5, 4, '2025-03-24 15:23:46', 'nft_images/magic_spell_book.png'),
(36, 'Epic Battle Axe', 'Fantezi oyunları için devasa savaş baltası NFT.', 9.30, 6, 4, '2025-03-24 15:23:46', 'nft_images/epic_battle_axe.png'),
(37, 'Crypto Racer Car', 'Yarış oyunları için NFT tabanlı süper araba.', 12.50, 7, 4, '2025-03-24 15:23:46', 'nft_images/crypto_racer_car.png'),
(38, 'Stealth Suit', 'Siberpunk tarzı oyun karakterleri için görünmezlik kıyafeti NFT.', 8.10, 8, 4, '2025-03-24 15:23:46', 'nft_images/stealth_suit.png'),
(39, 'Alien Blaster', 'Uzay temalı oyunlar için enerji silahı NFT.', 7.70, 9, 4, '2025-03-24 15:23:46', 'nft_images/alien_blaster.png'),
(40, 'Metaverse Battle Pass', 'Özel oyun içeriklerine erişim sağlayan NFT bileti.', 4.90, 10, 4, '2025-03-24 15:23:46', 'nft_images/metaverse_battle_pass.png'),
(41, 'Virtual Penthouse', 'Metaverse içinde sanal lüks çatı katı NFT.', 25.00, 1, 5, '2025-03-24 15:24:00', 'nft_images/virtual_penthouse.png'),
(42, 'Metaverse Island', 'Özel sanal ada NFT, yalnızca sahiplerine özel.', 40.20, 2, 5, '2025-03-24 15:24:00', 'nft_images/metaverse_island.png'),
(43, 'Digital Art Gallery', 'Sanat eserleri sergilemek için sanal galeri NFT.', 18.50, 3, 5, '2025-03-24 15:24:00', 'nft_images/digital_art_gallery.png'),
(44, 'Crypto Billboard', 'Metaverse içinde reklam panosu NFT.', 12.70, 4, 5, '2025-03-24 15:24:00', 'nft_images/crypto_billboard.png'),
(45, 'Virtual Office Space', 'Metaverse içinde toplantı yapabileceğiniz sanal ofis.', 15.30, 5, 5, '2025-03-24 15:24:00', 'nft_images/virtual_office_space.png'),
(46, 'NFT Land Parcel', 'Sanal dünyada arazi satın almak için kullanılan NFT.', 30.80, 6, 5, '2025-03-24 15:24:00', 'nft_images/nft_land_parcel.png'),
(47, 'Cyber Cafe', 'Metaverse içinde buluşma noktası olarak kullanılabilecek NFT.', 10.10, 7, 5, '2025-03-24 15:24:00', 'nft_images/cyber_cafe.png'),
(48, 'Floating Skyscraper', 'Havada süzülen sanal gökdelen NFT.', 28.40, 8, 5, '2025-03-24 15:24:00', 'nft_images/floating_skyscraper.png'),
(49, 'Private VR Club', 'Özel sanal kulüp NFT, yalnızca sahiplerine özel erişim sağlar.', 22.60, 9, 5, '2025-03-24 15:24:00', 'nft_images/private_vr_club.png'),
(50, 'Futuristic Dome House', 'Metaverse içinde lüks, fütüristik ev NFT.', 17.90, 10, 5, '2025-03-24 15:24:00', 'nft_images/futuristic_dome_house.png'),
(51, 'Glitch Loop', 'Eşsiz, tekrarlayan glitch animasyonu NFT.', 3.20, 1, 6, '2025-03-24 15:24:06', 'nft_images/glitch_loop.jpg'),
(52, 'Neon Wave', 'Neon dalga efektli GIF NFT.', 2.80, 2, 6, '2025-03-24 15:24:06', 'nft_images/neon_wave.jpg'),
(53, 'Cyberpunk City Loop', 'Sonsuz döngüde siberpunk şehir manzarası NFT.', 4.60, 3, 6, '2025-03-24 15:24:06', 'nft_images/cyberpunk_city_loop.jpg'),
(54, 'Pixel Rain', 'Retro pixel yağmur animasyonu NFT.', 2.10, 4, 6, '2025-03-24 15:24:06', 'nft_images/pixel_rain.jpg'),
(55, 'Quantum Fractal', 'Kuantum fiziği temalı fraktal animasyonu NFT.', 5.30, 5, 6, '2025-03-24 15:24:06', 'nft_images/quantum_fractal.jpg'),
(56, 'Fire Aura', 'Alev efektleriyle oluşturulmuş özel animasyon NFT.', 3.90, 6, 6, '2025-03-24 15:24:06', 'nft_images/fire_aura.jpg'),
(57, 'Hypnotic Spiral', 'Hipnotize edici spiral hareketli GIF NFT.', 4.20, 7, 6, '2025-03-24 15:24:06', 'nft_images/hypnotic_spiral.jpg'),
(58, 'Digital Explosion', 'Fütüristik dijital patlama animasyonu NFT.', 6.50, 8, 6, '2025-03-24 15:24:06', 'nft_images/digital_explosion.jpg'),
(59, 'Ethereal Smoke', 'Şekil değiştiren dijital duman animasyonu NFT.', 5.70, 9, 6, '2025-03-24 15:24:06', 'nft_images/ethereal_smoke.jpg'),
(60, 'Infinity Tunnel', 'Sonsuz döngüde hareket eden 3D tünel NFT.', 4.40, 10, 6, '2025-03-24 15:24:06', 'nft_images/infinity_tunnel.jpg'),
(61, 'Golden Hour', 'Büyüleyici gün batımı manzarası fotoğraf NFT.', 4.20, 1, 7, '2025-03-24 12:21:30', 'nft_images/golden_hour.jpg'),
(62, 'Urban Shadows', 'Gece şehir ışıklarının soyut görüntüsü.', 3.10, 2, 7, '2025-03-24 12:21:30', 'nft_images/urban_shadows.jpg'),
(63, 'Nature\'s Palette', 'Sonbahar renklerinde bir orman manzarası.', 5.30, 3, 7, '2025-03-24 12:21:30', 'nft_images/natures_palette.jpg'),
(64, 'Frozen Memories', 'Buzlu bir gölün sakin manzarası.', 4.60, 4, 7, '2025-03-24 12:21:30', 'nft_images/frozen_memories.jpg'),
(65, 'Ocean Whispers', 'Deniz kenarında bir dalga manzarası.', 3.90, 5, 7, '2025-03-24 12:21:30', 'nft_images/ocean_whispers.jpg'),
(66, 'City Lights', 'Şehirde parlayan neon ışıkları.', 2.80, 6, 7, '2025-03-24 12:21:30', 'nft_images/city_lights.jpg'),
(67, 'Misty Forest', 'Sisli bir ormanda doğa fotoğrafı.', 5.10, 7, 7, '2025-03-24 12:21:30', 'nft_images/misty_forest.jpg'),
(68, 'Sunrise Bliss', 'Doğanın uyandığı anı yansıtan gün doğumu.', 3.50, 8, 7, '2025-03-24 12:21:30', 'nft_images/sunrise_bliss.jpg'),
(69, 'Urban Reflections', 'Cam yüzeylerde yansıyan şehir görüntüleri.', 4.30, 9, 7, '2025-03-24 12:21:30', 'nft_images/urban_reflections.jpg'),
(70, 'Ethereal Fog', 'Sis içinde gizemli dağ manzarası.', 4.90, 10, 7, '2025-03-24 12:21:30', 'nft_images/ethereal_fog.jpg'),
(71, 'Crystal Cave', 'İçinde parıldayan kristallerle dolu bir mağaranın 3D modeli.', 8.70, 1, 10, '2025-03-24 12:21:30', 'nft_images/crystal_cave.jpg'),
(72, 'Sci-Fi Mecha #1', 'Bilimkurgu temalı mekanik tasarım.', 12.30, 2, 10, '2025-03-24 12:21:30', 'nft_images/sci_fi_mecha.jpg'),
(73, 'Fantasy Castle', 'Fantezi dünyasına ait devasa kale modeli.', 10.50, 3, 10, '2025-03-24 12:21:30', 'nft_images/fantasy_castle.jpg'),
(74, 'Alien Landscape', 'Uzaylı bir gezegenin manzarası.', 9.20, 4, 10, '2025-03-24 12:21:30', 'nft_images/alien_landscape.jpg'),
(75, 'Virtual Sculpture', 'Dijital ortamda tasarlanmış sanat heykeli.', 6.80, 5, 10, '2025-03-24 12:21:30', 'nft_images/virtual_sculpture.jpg'),
(76, 'Cyber Habitat', 'Siber dünyaya ait konut modeli.', 7.50, 6, 10, '2025-03-24 12:21:30', 'nft_images/cyber_habitat.jpg'),
(77, 'Digital Spaceship', 'Uzay gemisi modelleme NFT.', 11.40, 7, 10, '2025-03-24 12:21:30', 'nft_images/digital_spaceship.jpg'),
(78, 'Metaverse Landmark', 'Metaverse simgesel bir yapı modeli.', 8.90, 8, 10, '2025-03-24 12:21:30', 'nft_images/metaverse_landmark.jpg'),
(79, 'Fantasy Beasts', 'Fantastik yaratık tasarımı.', 7.20, 9, 10, '2025-03-24 12:21:30', 'nft_images/fantasy_beasts.jpg'),
(80, 'Virtual Gateway', 'Sanal portal modeli.', 5.60, 10, 10, '2025-03-24 12:21:30', 'nft_images/virtual_gateway.jpg'),
(81, 'Corporate Branding Pack', 'Şirket logoları ve marka öğeleri için ticari lisanslı NFT.', 12.00, 1, 8, '2025-03-24 12:24:06', 'nft_images/corporate_branding_pack.jpg'),
(82, 'Exclusive Typography #1', 'Yalnızca sahipleri için tasarlanmış özel tipografi NFT.', 8.50, 2, 8, '2025-03-24 12:24:06', 'nft_images/exclusive_typography_1.jpg'),
(83, 'Business Mascot', 'Kurumsal maskot tasarımı için ticari lisanslı NFT.', 6.40, 3, 8, '2025-03-24 12:24:06', 'nft_images/business_mascot.jpg'),
(84, '3D Product Mockup', 'Ürün prototipleri için ticari lisanslı 3D model NFT.', 15.30, 4, 8, '2025-03-24 12:24:06', 'nft_images/3d_product_mockup.jpg'),
(85, 'Social Media Assets', 'Sosyal medya için lisanslı görseller ve şablonlar.', 9.20, 5, 8, '2025-03-24 12:24:06', 'nft_images/social_media_assets.jpg'),
(86, 'Exclusive Soundtrack', 'Markaların reklamları için özel müzik NFT.', 7.80, 6, 8, '2025-03-24 12:24:06', 'nft_images/exclusive_soundtrack.jpg'),
(87, 'Advertisement Package', 'Reklam kampanyaları için tasarlanmış ticari lisanslı görseller.', 13.50, 7, 8, '2025-03-24 12:24:06', 'nft_images/advertisement_package.jpg'),
(88, 'Custom Icon Set', 'Kurumsal kullanım için özel ikon tasarımları.', 5.90, 8, 8, '2025-03-24 12:24:06', 'nft_images/custom_icon_set.jpg'),
(89, 'Virtual Storefront', 'Sanal mağazalar için ticari lisanslı tasarım paketi.', 10.70, 9, 8, '2025-03-24 12:24:06', 'nft_images/virtual_storefront.jpg'),
(90, 'Metaverse Shop Design', 'Metaverse mağaza tasarımı için ticari lisans NFT.', 18.40, 10, 8, '2025-03-24 12:24:06', 'nft_images/metaverse_shop_design.jpg'),
(91, 'Cinematic Trailer', 'Yapımcılar için ticari sinematik fragman NFT.', 25.00, 1, 9, '2025-03-24 12:24:06', 'nft_images/cinematic_trailer.jpg'),
(92, 'Drone Masterpiece', 'Havadan çekilen bir doğa videosu NFT.', 12.30, 2, 9, '2025-03-24 12:24:06', 'nft_images/drone_masterpiece.jpg'),
(93, 'Timelapse Wonder', 'Şehirde hızlandırılmış gün batımı çekimi NFT.', 8.90, 3, 9, '2025-03-24 12:24:06', 'nft_images/timelapse_wonder.jpg'),
(94, 'Animated Storyboard', 'Film yapımcıları için animasyonlu sahne taslakları.', 14.50, 4, 9, '2025-03-24 12:24:06', 'nft_images/animated_storyboard.jpg'),
(95, 'Exclusive Short Film', 'Sadece NFT sahiplerine özel kısa film.', 20.00, 5, 9, '2025-03-24 12:24:06', 'nft_images/exclusive_short_film.jpg'),
(96, 'Virtual Cinematic Scene', 'Sanal dünyada kullanıma uygun sinematik sahne.', 9.80, 6, 9, '2025-03-24 12:24:06', 'nft_images/virtual_cinematic_scene.jpg'),
(97, 'Epic Battle Sequence', 'Film yapımları için ticari savaş sahnesi NFT.', 18.40, 7, 9, '2025-03-24 12:24:06', 'nft_images/epic_battle_sequence.jpg'),
(98, 'Virtual Reality Film', 'VR teknolojisine özel kısa film NFT.', 22.60, 8, 9, '2025-03-24 12:24:06', 'nft_images/vr_film.jpg'),
(99, 'Exclusive B-Roll Footage', 'Profesyonel video yapımları için ham görüntüler.', 7.90, 9, 9, '2025-03-24 12:24:06', 'nft_images/b_roll_footage.jpg'),
(100, 'Holographic Cinema Experience', 'Hologram tabanlı sinema deneyimi NFT.', 30.20, 10, 9, '2025-03-24 12:24:06', 'nft_images/holographic_cinema_experience.jpg'),
(104, 'Deneme NFT\'si', 'Deneme Nft\'Si Düzenlenmiş', 0.90, 1, 7, '2025-05-31 21:00:00', '683c726545d7d_header.png');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `odeme_gecmisi`
--

CREATE TABLE `odeme_gecmisi` (
  `id` int(11) NOT NULL,
  `kullanici_id` int(11) NOT NULL,
  `miktar` decimal(10,2) NOT NULL CHECK (`miktar` >= 0),
  `odeme_tarihi` timestamp NOT NULL DEFAULT current_timestamp(),
  `odeme_yontemi` enum('Kredi Kartı','Kripto','PayPal') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `satislar`
--

CREATE TABLE `satislar` (
  `id` int(11) NOT NULL,
  `nft_id` int(11) NOT NULL,
  `alici_id` int(11) NOT NULL,
  `satis_tarihi` timestamp NOT NULL DEFAULT current_timestamp(),
  `fiyat` decimal(10,2) NOT NULL CHECK (`fiyat` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `favoriler`
--
ALTER TABLE `favoriler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kullanici_id` (`kullanici_id`),
  ADD KEY `nft_id` (`nft_id`);

--
-- Tablo için indeksler `kategoriler`
--
ALTER TABLE `kategoriler`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ad` (`ad`);

--
-- Tablo için indeksler `kullanicilar`
--
ALTER TABLE `kullanicilar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Tablo için indeksler `nftler`
--
ALTER TABLE `nftler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sahip_id` (`sahip_id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Tablo için indeksler `odeme_gecmisi`
--
ALTER TABLE `odeme_gecmisi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kullanici_id` (`kullanici_id`);

--
-- Tablo için indeksler `satislar`
--
ALTER TABLE `satislar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nft_id` (`nft_id`),
  ADD KEY `alici_id` (`alici_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `favoriler`
--
ALTER TABLE `favoriler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- Tablo için AUTO_INCREMENT değeri `kategoriler`
--
ALTER TABLE `kategoriler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `kullanicilar`
--
ALTER TABLE `kullanicilar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Tablo için AUTO_INCREMENT değeri `nftler`
--
ALTER TABLE `nftler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- Tablo için AUTO_INCREMENT değeri `odeme_gecmisi`
--
ALTER TABLE `odeme_gecmisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `satislar`
--
ALTER TABLE `satislar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `favoriler`
--
ALTER TABLE `favoriler`
  ADD CONSTRAINT `favoriler_ibfk_1` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanicilar` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favoriler_ibfk_2` FOREIGN KEY (`nft_id`) REFERENCES `nftler` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `nftler`
--
ALTER TABLE `nftler`
  ADD CONSTRAINT `nftler_ibfk_1` FOREIGN KEY (`sahip_id`) REFERENCES `kullanicilar` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `nftler_ibfk_2` FOREIGN KEY (`kategori_id`) REFERENCES `kategoriler` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `odeme_gecmisi`
--
ALTER TABLE `odeme_gecmisi`
  ADD CONSTRAINT `odeme_gecmisi_ibfk_1` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanicilar` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `satislar`
--
ALTER TABLE `satislar`
  ADD CONSTRAINT `satislar_ibfk_1` FOREIGN KEY (`nft_id`) REFERENCES `nftler` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `satislar_ibfk_2` FOREIGN KEY (`alici_id`) REFERENCES `kullanicilar` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
