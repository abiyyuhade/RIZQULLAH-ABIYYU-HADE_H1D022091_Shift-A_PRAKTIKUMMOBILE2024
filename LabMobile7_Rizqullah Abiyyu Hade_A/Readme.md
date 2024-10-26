# Tugas Pertemuan 7

### Nama: Rizqullah Abiyyu Hade
### NIM: H1D022091

## Cara Untuk Menambahkan Komponen di Halaman Ionic

### 1. Membuat Page Baru 
    ionic generate page <namapage>
### 2. Edit Halaman HTML yang Baru
### Disini saya menambahkan komponen card kedalam halaman HTML saya
    <ion-card class="custom-card">
        <ion-card-header>
            <ion-card-title>Praktikum Pemrograman Mobile</ion-card-title>
            <ion-card-subtitle>Tugas Pertemuan 7</ion-card-subtitle>
        </ion-card-header>

        <ion-card-content>
            <p>Hello, Nama: <strong>Rizqullah Abiyyu Hade</strong></p>
            <p>NIM: <strong>H1D022091</strong></p>
            <p>
                As an active 5th semester Informatics student at Jenderal Soedirman University, I am passionate about
                cybersecurity, with a specific interest in penetration testing. I am motivated to continuously learn and develop
                skills in identifying, analyzing, and mitigating security vulnerabilities within networks and systems. With a
                critical-thinking approach, I aim to simulate real-world attacks to strengthen the security posture of
                organizations.
            </p>
        </ion-card-content>
    </ion-card>
## 3. Edit Halaman CSS yang baru
    .custom-card {
        background: linear-gradient(145deg, #e0e0e0, #ffffff);
        border-radius: 15px;
        box-shadow: 5px 5px 15px #aaaaaa, -5px -5px 15px #ffffff;
        margin: 20px;
        padding: 15px;
        text-align: center;
    }

    ion-card-title {
        font-size: 1.5em;
        color: #007acc;
        font-weight: bold;
    }

    ion-card-subtitle {
        font-size: 1.2em;
        color: #555;
        font-style: italic;
    }

    ion-card-content p {
        font-size: 1.1em;
        color: #333;
        margin: 5px 0;
    }

    ion-card-content strong {
        color: #ff6f61;
        font-weight: bold;
    }
## 4. Menambahkan Komponen Button pada Halaman Tabs
### Disini saya menambahkan komponen button pada halaman tabs1 agar lebih mudah untuk mengarahkan ke halaman Home
    <ion-button routerLink="/home">Go to Home</ion-button>
## 5. Jalankan Ionic
    ionic serve