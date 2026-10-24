# AGENTS.md — laporan-magang-sotn

Template dan naskah Laporan Magang Program Studi Sistem Informasi, STMIK
Kuwera, mengikuti Pedoman Penulisan Laporan Magang Bab 4.1 (format halaman
dan huruf) dan Bab 4.3 (urutan isi). Satu penulis: Samuel (NIM 2231010010).
Magang di Broadband Multimedia Wireless Laboratory, NTUST, periode
12 Januari -- 28 September 2026.

## Perintah kerja

```sh
make            # build lengkap: main.tex -> main.pdf (XeLaTeX + BibTeX)
make watch      # build ulang otomatis saat file disimpan
make sampul     # hanya sampul -> sampul-only.pdf (kertas hijau daun)
make clean      # hapus berkas bantu build
make cleanall   # hapus berkas bantu dan PDF hasil build
```

Setiap perubahan naskah atau gaya wajib diakhiri `make` yang bersih. Baca
`main.log` dan pastikan tidak ada `! LaTeX Error` maupun `Overfull` baru.
Peringatan `babel: No hyphenation patterns` selalu muncul dan bukan masalah
(TeX Live Basic tidak memuat pola pemenggalan kata Indonesia).

## Tempat mengubah

- `config/metadata.tex` — satu-satunya tempat identitas: judul, nama, NIM,
  program studi, kampus, kota, tahun, dosen pembimbing, ketua program studi,
  NIDN, tanggal pengesahan, dan penutup kata pengantar.
- `laporan.sty` — seluruh gaya format (margin, spasi, judul, caption, nomor
  halaman, daftar, float `grafik`). Jangan menaruh gaya di `main.tex`.
- `main.tex` — hanya urutan dokumen dan peralihan `\pagenumbering`.
- `frontmatter/`, `chapters/`, `backmatter/` — isi per bagian.
- `assets/` — logo dan gambar laporan.

## Aturan format yang tidak boleh dilanggar

- A4 satu sisi; margin kiri 4 cm, atas 4 cm, kanan 3 cm, bawah 3 cm.
- Times New Roman 12 pt; isi rata kiri-kanan, spasi 2, awal alinea menjorok
  1,5 cm, satu gagasan per alinea (4--5 kalimat).
- Judul bab 12 pt bold KAPITAL rata tengah spasi 1, didahului baris `BAB <n>`.
  Judul subbab 12 pt bold Capitalize Each Word, rata kiri.
- Judul tabel, gambar, dan grafik 12 pt bold rata tengah spasi 1; penomoran
  per bab (Tabel 4.1, Gambar 4.1, Grafik 4.1).
- Daftar isi, daftar tabel/grafik/gambar, daftar lampiran, dan daftar pustaka
  memakai spasi 1,5.
- Nomor halaman di tengah bawah: sampul dan halaman judul tanpa nomor dan
  tidak dihitung; Romawi mulai `i` di Lembar Pengesahan; Arab mulai `1` di
  Bab 1 dan berlanjut sampai Daftar Pustaka serta Lampiran.
- Istilah asing ditulis miring dengan `\asing{...}`, bukan italic manual.
- Jumlah halaman minimal 45; periksa dengan `pdfinfo main.pdf`.

## Aturan penulisan isi

- Bahasa Indonesia baku sesuai EYD. Hindari diksi lisan: "dikarang",
  "menebak", "membuang", "dicacah", "canggih banget", dan sejenisnya.
- Setiap alinea harus bersambung dengan alinea sebelumnya; kalimat pertama
  tidak boleh meloncat topik.
- Abstrak 200--300 kata, satu paragraf atau dua paragraf yang mengalir,
  memuat tujuan, cara kerja, dan hasil. Jangan menumpuk nama teknologi:
  sebut cara kerjanya, bukan daftar *framework*.
- Setiap klaim yang bukan pengalaman pribadi wajib bertumpu pada sitasi
  `\citep{kunci}` atau `\citet{kunci}` dengan entri di
  `backmatter/references.bib` (gaya apalike, nama-tahun).
- Semua bagian yang belum ditulis tetap ditandai `% TODO`. Jangan mengisi
  naskah dengan kalimat contoh yang terlihat seperti isi jadi.

## Identitas yang sudah ditetapkan

- Judul: "Perancangan dan Implementasi Sistem Pencarian Data Riset Berbantuan
  AI pada Broadband Multimedia Wireless Laboratory, NTUST". Nama laboratorium
  harus ditulis lengkap; jangan disingkat menjadi "BMW Lab" pada sampul.
  Judul ini 15 kata, sedangkan pedoman membatasi 10--14 kata; konfirmasikan
  pengecualiannya kepada dosen pembimbing sebelum laporan dicetak.
- Sampul: `LAPORAN MAGANG` 16 pt, judul 14 pt, logo 5 cm, satu penulis.
  Judul dipecah manual dengan `\\` menjadi tiga baris berbentuk piramida
  terbalik; periksa hasilnya dengan merender halaman 1.
- Pembimbing hanya satu: Dr. Lulu Setiawati, S.E., M.Bus., D.Th., CFP, CSA
  (NIDN 0323087303). Ketua Program Studi: D. Dedy Prasetya Kristiadi,
  S.Kom., M.Kom. (NIDN 0311127402).
- Blok Ketua STMIK pada lembar pengesahan sudah dihapus atas permintaan
  penulis. Jangan menambahkannya kembali.
- Tahun sampul mengikuti tahun laporan dipertahankan (2026), bukan tahun
  pelaksanaan magang.
- Sampul dan Halaman Judul memang dua halaman dengan isi sama: sampul untuk
  kertas hijau daun, halaman judul untuk kertas biasa di dalam jilidan. Ini
  sesuai pedoman, bukan duplikasi yang perlu dihapus.

## Batasan teknis

- Mesin XeLaTeX (`-pdfxe`), karena memakai Times New Roman asli lewat
  `fontspec`. Jangan beralih ke pdfLaTeX.
- Paket yang tersedia hanya BasicTeX: `fontspec, babel, geometry, setspace,
  fancyhdr, float, graphicx, caption, booktabs, array, longtable, tabularx,
  listings, natbib, hyperref, indentfirst, ulem`. Jangan memakai
  `tocloft`, `titlesec`, `enumitem`, atau `biblatex`; gaya daftar dan
  judul sudah dibuat manual di `laporan.sty`.
- Gunakan `\input`, bukan `\include`. `\include` memutus deteksi
  `\bibdata`/`\citation` oleh BibTeX sehingga daftar pustaka kosong.
- Nama penanda tangan dipisah dari gelarnya (`\NamaPembimbing` dan
  `\GelarPembimbing`) karena `ulem` tidak memenggal baris di dalam
  `\uline{\makro}`.
- `\bibname` dipaksa "Daftar Pustaka" karena `babel` bahasa Indonesia
  menghasilkan "Bibliografi".

## Verifikasi sebelum menyatakan selesai

1. `make clean && make`, lalu pastikan exit 0 dan tidak ada `! LaTeX Error`.
2. `pdfinfo main.pdf`: ukuran halaman 595.28 x 841.89 pt (A4) dan jumlah
   halaman sesuai target.
3. Periksa visual halaman yang berubah dengan `pdftoppm`. Binari ada di
   `/Users/kagchi/.cache/codex-runtimes/codex-primary-runtime/dependencies/bin/override/`
   (`pdftoppm`, `pdfinfo`); `pdftotext` tidak tersedia di mesin ini.
4. Untuk perubahan yang menyentuh sampul, periksa juga `make sampul`.

## Git

- Pesan commit memakai prefiks `docs:`, `feat:`, atau `fix:`, ditulis
  dalam bahasa Indonesia, ringkas, dan menjelaskan hasil akhir.
- Untuk pesan lebih dari satu baris, tulis ke berkas lalu
  `git commit -F <berkas>`; tanda kutip di dalam `-m` pernah merusak
  perintah.
- Jangan commit berkas hasil build (`*.aux`, `*.log`, `*.pdf`, dst.);
  semuanya sudah tercantum di `.gitignore`.
- Commit dan push hanya setelah diminta, dan jangan pernah memakai
  `git push --force` ke `main`.
