# Labirinth Exploration Game

![logo](assets/logo.png)

## Tentang
Labirinth Exploration Game adalah game eksplorasi labirin 3D yang dibuat menggunakan Ursina (Panda3D). Pemain mengendalikan karakter first-person untuk menjelajahi labirin, mengumpulkan item, menghadapi monster, dan menikmati efek visual sederhana.

## Creator
- Bayu
- Rafly
- Fatur
- Zidan
- Sobar

## Setup (Windows, PowerShell)
1. Buat dan aktifkan virtual environment (di repo root):
```powershell
python -m venv activate
. .\activate\Scripts\Activate.ps1   # PowerShell (dot-source)
```
Atau gunakan script helper yang sudah ada:
```powershell
. .\activate_venv.ps1
```
2. Install dependency:
```powershell
pip install -r requirements.txt
```
3. Jalankan game:
```powershell
python main.py
```

## Setup (Unix / WSL / macOS)
1. Buat & aktifkan venv:
```bash
python3 -m venv activate
source activate/bin/activate
```
2. Atau gunakan helper script:
```bash
source activate_venv.sh
```
3. Install dependency dan jalankan:
```bash
pip install -r requirements.txt
python main.py
```

## Build (Windows) — membuat release
1. Pastikan `pyinstaller` ter-install (sudah ada di `requirements.txt`).
2. Jalankan build (sudah ter-tested di repo ini):
```powershell
pyinstaller --noconfirm --distpath build --workpath build\work --add-data "assets;assets" --hidden-import numpy --name "labirinth-exploration-game" main.py
```
3. Setelah build selesai, hasil terletak di `build\labirinth-exploration-game\`.
4. Untuk distribusi, zip folder tersebut dan upload ke release.

> Note: Jika mengalami masalah missing assets/models/font saat menjalankan exe, pastikan folder `assets` dan folder internal Ursina ikut disimpan di samping executable. Build yang disertakan pada repo sudah meng-handle bundling tersebut.

## Release
- Link release: (tambah link di sini)

---
Jika butuh saya bisa bantu membuat release zip atau menambahkan instruksi platform spesifik.

## Screenshot
Berikut beberapa screenshot dari permainan:

![screenshot1](assets/screenshots/1.png)
![screenshot2](assets/screenshots/2.png)
![screenshot3](assets/screenshots/3.png)
# labirinth-exploration