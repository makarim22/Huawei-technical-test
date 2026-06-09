# Express.js Backend Server

Ini adalah *backend server* sederhana yang dibangun menggunakan **Node.js** dan **Express.js**. Server ini mengimplementasikan struktur arsitektur dasar yang memisahkan antara rute (*Routes*), pengendali logika (*Controllers*), dan penyimpan data (*Models*).

Saat ini, server menggunakan **penyimpanan memori sementara (In-Memory Storage)** menggunakan struktur data Array. Server ini sangat cocok untuk keperluan *testing*, *prototyping*, dan belajar alur kerja Express.js.

---

## 🛠️ Persyaratan Prasyarat (Prerequisites)

Sebelum menjalankan aplikasi ini, pastikan kamu sudah menginstal:
- [Node.js](https://nodejs.org/) (Direkomendasikan versi 18 atau lebih baru)

---

## 🚀 Cara Instalasi & Menjalankan Server

1. **Buka terminal** dan pastikan kamu berada di dalam direktori proyek ini (`huawei-test`).
2. **Instal semua dependensi (packages)** yang dibutuhkan dengan menjalankan perintah:
   ```bash
   npm install
   ```
3. **Jalankan server** menggunakan salah satu perintah berikut:

   - **Mode Development (Disarankan saat *coding*):**
     Menjalankan server dan otomatis me-*restart* server setiap kali ada file yang disimpan (menggunakan `node --watch`).
     ```bash
     npm run dev
     ```

   - **Mode Production:**
     Menjalankan server secara normal.
     ```bash
     npm start
     ```

4. Server akan menyala di **http://localhost:3000** (atau port lain jika kamu menyetel environment variable `PORT`).

---

## 📂 Struktur Folder (Architecture)

Proyek ini disusun dengan memisahkan *concern* (tanggung jawab) masing-masing bagian:

```text
huawei-test/
├── package.json          # Berisi konfigurasi proyek dan script NPM
├── .gitignore            # Daftar file yang diabaikan oleh Git
└── src/
    ├── server.js         # Entry point aplikasi (Menjalankan server di port tertentu)
    ├── app.js            # Konfigurasi Express.js (Middleware, CORS, Body Parser)
    ├── routes/           # Mendefinisikan endpoint/URL API
    │   └── data.routes.js 
    ├── controllers/      # Logika utama (Menerima Request, mengirim Response)
    │   └── data.controller.js
    └── models/           # Tempat berinteraksi dengan Data (saat ini menggunakan Array)
        └── data.model.js
```

---

## 📡 Dokumentasi API (Endpoints)

Base URL untuk semua endpoint ini adalah: `http://localhost:3000`

### 1. Mengambil Semua Data
*   **URL:** `/api/data`
*   **Method:** `GET`
*   **Response Sukses (200 OK):**
    ```json
    {
      "message": "Data retrieved successfully",
      "data": [
        {
          "id": 1690000000000,
          "nama": "Jaka",
          "createdAt": "2023-10-01T12:00:00.000Z"
        }
      ]
    }
    ```

### 2. Menyimpan Data Baru
*   **URL:** `/api/data`
*   **Method:** `POST`
*   **Headers:** `Content-Type: application/json`
*   **Body (Contoh):**
    ```json
    {
      "nama": "Budi",
      "umur": 25
    }
    ```
*   **Response Sukses (201 Created):**
    ```json
    {
      "message": "Data successfully saved",
      "data": {
        "id": 1690000000123,
        "nama": "Budi",
        "umur": 25,
        "createdAt": "2023-10-01T12:05:00.000Z"
      }
    }
    ```
*   **Response Gagal (400 Bad Request):** Jika tidak ada data yang dikirimkan.

---

## 💡 Catatan Penting
- Proyek ini menggunakan **ES Modules** (`import` / `export`), sehingga tertulis `"type": "module"` di dalam `package.json`.
- Karena menggunakan *in-memory storage*, maka semua data yang kamu kirim via method `POST` akan **terhapus** jika kamu me-restart atau mematikan terminal server.
