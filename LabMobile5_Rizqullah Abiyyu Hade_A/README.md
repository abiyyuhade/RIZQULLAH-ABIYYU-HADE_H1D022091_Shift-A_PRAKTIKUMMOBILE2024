# Toko Kita

## Proses Register
### 1. Frontend - Flutter Model Registrasi: 

    Model Registrasi di Flutter digunakan untuk merepresentasikan data yang diterima dari API. Model ini memiliki tiga properti, yaitu code, status, dan data, yang diisi berdasarkan respons JSON dari API.

    Halaman Registrasi:
    Halaman ini berisi formulir untuk pengguna mengisi informasi registrasi. Ada empat field input yang harus diisi:
    - Nama: Minimal harus 3 karakter.
    - Email: Wajib diisi dan harus menggunakan format email yang valid.
    - Password: Minimal harus 6 karakter.
    - Konfirmasi Password: Harus cocok dengan field Password.

    Proses Registrasi:
    Setelah pengguna mengisi form dan menekan tombol "Registrasi", validasi form dilakukan. Jika ada input yang tidak valid, pesan kesalahan akan ditampilkan. Validasi menggunakan:
    - validator: (value)
    - if (value!.isEmpty) untuk memeriksa apakah field terisi.
    - if (!regex.hasMatch(value)) untuk memeriksa apakah format email sesuai dengan aturan regex.

    Mengirim Data:
    Jika semua field valid, method _submit() dipanggil. Data dari form (nama, email, dan password) dikirim ke RegistrasiBloc untuk diproses dan diteruskan ke API. Saat proses berlangsung, indikator loading diaktifkan dengan mengatur _isLoading menjadi true.

    Menangani Respons:
    Jika registrasi berhasil, dialog sukses akan muncul, memberi tahu pengguna bahwa registrasi berhasil dan mereka bisa login. Jika terjadi kesalahan (misalnya, email sudah digunakan), dialog peringatan akan ditampilkan.

    Mengatur Status Loading:
    Setelah pengiriman data selesai, indikator loading dinonaktifkan dengan mengatur _isLoading kembali menjadi false.
### 2. Backend - API (CodeIgniter) Model MRegistrasi:

    Model MRegistrasi digunakan untuk berinteraksi dengan tabel member dalam database, di mana hanya tiga kolom yang diperbolehkan untuk diisi, yaitu: nama, email, dan password.

    Pada RegistrasiController, method registrasi() bertugas menerima data yang dikirim melalui permintaan dari aplikasi Flutter. Data yang diterima mencakup nama, email, dan password (password di-hash menggunakan password_hash demi keamanan). Setelah data diolah, MRegistrasi dipakai untuk menyimpan informasi tersebut ke database. Jika penyimpanan berhasil, sistem mengembalikan respons dengan status 200 dan pesan "Registrasi Berhasil".

## Proses Login
### 1. Frontend - Flutter Model Login:
    Model Login di Flutter berfungsi untuk merepresentasikan data respons dari API saat proses login berlangsung. Model ini memiliki beberapa properti, yaitu code, status, token, userID, dan userEmail. Method fromJson() digunakan untuk mengonversi respons JSON menjadi objek Login.

    Halaman Login:
    Halaman ini digunakan untuk menerima input dari pengguna. Terdapat dua field input:
    1. Email: Divalidasi untuk memastikan tidak kosong.
    2. Password: Divalidasi untuk memastikan tidak kosong.
    
    Proses Login:
    Setelah pengguna mengisi form dan menekan tombol "Login", form akan divalidasi. Jika ada field yang tidak valid, pesan kesalahan akan muncul.

    Mengirim Data:
    Jika validasi berhasil, method _submit() dipanggil. Data dari form (email dan password) dikirim ke LoginBloc untuk diteruskan ke API. Saat proses berlangsung, indikator loading diaktifkan dengan mengubah nilai _isLoading menjadi true.

    Menangani Respons:
    Jika login berhasil (status code 200), token dan ID pengguna akan disimpan menggunakan UserInfo untuk menjaga sesi pengguna. Setelah login berhasil, pengguna diarahkan ke halaman ProdukPage. Jika login gagal, dialog peringatan akan muncul dengan pesan "Login gagal, silahkan coba lagi".

    Mengatur Status Loading:
    Setelah pengiriman data selesai, indikator loading dinonaktifkan dengan mengubah nilai _isLoading menjadi false.

    Bloc LoginBloc:
    Method login():
    - Mengambil URL API untuk login.
    - Mengirim permintaan POST ke API dengan body berisi email dan password.
    - Mengonversi respons JSON menjadi objek Login menggunakan method fromJson().
### 2. Backend - API (CodeIgniter) Model MLogin:
    Model MLogin digunakan untuk berinteraksi dengan tabel member_token di database. Kolom yang diizinkan untuk diisi adalah member_id dan auth_key.

    Controller LoginController:
    Dalam method login(), data email dan password diambil dari permintaan (request). Proses login dimulai dengan mencari pengguna berdasarkan email menggunakan model MMember. Jika email tidak ditemukan, respons akan diberikan dengan status 400 dan pesan "Email tidak ditemukan". Jika email ditemukan tetapi password tidak valid (diperiksa menggunakan password_verify), respons juga dikembalikan dengan status 400 disertai pesan "Password tidak valid".

    Jika login berhasil, token otentikasi (auth_key) akan dibuat menggunakan method RandomString(). Kemudian, member_id dan auth_key disimpan ke dalam tabel member_token. Terakhir, respons dikembalikan dengan informasi berupa token, ID, dan email pengguna.

## Halaman Register 
![Lampiran Register](Register.png)

## Pop Up Notif Berhasil
![Lampiran Pop Up](PopUp.png)

## Halaman Login
![Lampiran Login](Login.png)

## Halaman Tambah Produk
![Lampiran Tambah Produk](TambahProduk.png)

## Halaman List Produk
![Lampiran List Produk](ListProduk.png)

## Halaman Detail Produk
![Lampiran Detail Produk](DetailProduk.png)

## Halaman Ubah Produk
![Lampiran Ubah Produk](UbahProduk.png)