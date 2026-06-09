#!/bin/bash

# 1. Tentukan folder tujuan penyimpanan (sesuai username WSL Anda)
TARGET_DIR="/home/jaka/cron"

# 2. Pastikan direktori tujuan sudah ada. Jika belum, buat secara otomatis
mkdir -p "$TARGET_DIR"

# 3. Buat format tanggal (BulanTanggalTahun) dan waktu (Jam.Menit)
# Contoh hasil: 12192024 untuk tanggal, 15.00 untuk waktu
DATE_STR=$(date +"%m%d%Y")
TIME_STR=$(date +"%H.%M")

# 4. Tentukan nama file akhir dan path lengkapnya
FILE_NAME="cron_${DATE_STR}_${TIME_STR}.csv"
FILE_PATH="${TARGET_DIR}/${FILE_NAME}"

# 5. Eksekusi perintah curl untuk mengumpulkan data
# Parameter -s (silent) digunakan agar output proses unduhan tidak mengotori terminal
curl -s "https://rickandmortyapi.com/api" -o "$FILE_PATH"

# 6. Catat riwayat eksekusi (Log)
# Ini berguna untuk mengecek apakah crontab benar-benar mengeksekusi skrip ini
echo "[ SUCCESS ] Data terkumpul pada $(date) -> $FILE_PATH" >> "${TARGET_DIR}/cron_log.txt"