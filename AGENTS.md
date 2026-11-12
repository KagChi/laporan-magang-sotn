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
Peringatan `babel: No hyphenation patterns` untuk bahasa Indonesia **tidak
boleh** muncul. Pola pemenggalan kata Indonesia sudah dipasang di
`~/Library/texmf` (lihat README). Bila peringatan itu kembali, pola belum
termuat: jalankan `fmtutil-user --byfmt xelatex` lalu `make clean && make`.

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
- Di dalam Lampiran, nomor tabel, gambar, grafik, dan kode memakai huruf
  lampiran (Tabel A.1, Gambar B.1, Kode C.1) agar tidak bertabrakan dengan
  nomor bab terakhir. Nomor lampiran dinaikkan oleh `\lampiranentry{...}`.
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
- **Kata penghubung dan istilah baku wajib berbahasa Indonesia.** Tulis
  "dan", bukan "and"; "dengan", bukan "with"; "hlm.", bukan "pages"/"p.";
  "dkk.", bukan "et al."; "Dalam", bukan "In" pada judul prosiding. Diksi
  formal akademis dipakai di naskah maupun pada bagian yang dihasilkan
  mesin, termasuk label sitasi dan Daftar Pustaka; jangan membiarkan
  istilah Inggris bocor lewat gaya pustaka atau templat. Nama resmi
  lembaga, nama jurnal, dan judul artikel asing tetap disalin apa adanya,
  dengan \asing{...} bila muncul di dalam kalimat.
- Setiap alinea harus bersambung dengan alinea sebelumnya; kalimat pertama
  tidak boleh meloncat topik.
- Bab 1 sampai Bab 2 ditulis dari sudut pandang orang pertama. Pengalaman
  magang memakai kata ganti "saya", bukan "penulis". Kata "penulis" hanya
  dipakai pada Kata Pengantar dan bagian administratif lain yang memang
  menyebut identitas penulis, seperti halaman pengesahan.
- Abstrak 200--300 kata, satu paragraf atau dua paragraf yang mengalir,
  memuat tujuan, cara kerja, dan hasil. Jangan menumpuk nama teknologi:
  sebut cara kerjanya, bukan daftar *framework*.
- Setiap klaim yang bukan pengalaman pribadi wajib bertumpu pada sitasi
  `\citep{kunci}` atau `\citet{kunci}` dengan entri di
  `backmatter/references.bib` (gaya apalike, nama-tahun).
- Semua bagian yang belum ditulis tetap ditandai `% TODO`. Jangan mengisi
  naskah dengan kalimat contoh yang terlihat seperti isi jadi.

## Aturan sumber rujukan

- **Rujukan Indonesia lebih dahulu, rujukan luar negeri menyusul.** Setiap
  klaim yang memungkinkan didukung paper Indonesia lebih dahulu; setelah itu
  baru paper luar negeri sebagai pendukung. Paper Indonesia diutamakan yang
  terbit di jurnal nasional bereputasi dan berbahasa Indonesia. Bila klaim
  hanya dapat didukung literatur luar negeri, tulis alasannya di komentar
  `% TODO` agar dapat ditinjau pembimbing.
- **Jurnal harus disertakan asli.** Setiap rujukan jurnal wajib memuat
  identitas artikel aslinya secara lengkap: nama penulis, judul artikel,
  nama jurnal, volume(nomor), halaman, tahun, dan DOI. Rujukan yang hanya
  menyebut nama jurnal, nama penulis, atau judul buku tanpa artikelnya
  tidak boleh dipakai.
- **Jurnal harus terbit dalam empat tahun terakhir.** Dihitung dari tahun
  laporan dipertahankan, sehingga untuk laporan 2026 artikel jurnal yang
  boleh dipakai terbit pada 2023--2026. Artikel jurnal yang lebih lama tidak
  boleh ditambahkan ke `backmatter/references.bib`; ganti dengan artikel
  yang lebih baru atau hapus klaimnya. Periksa tahun terbit pada metadata
  DOI, bukan pada tanggal unggah halaman jurnal. Bila sebuah klaim hanya
  dapat didukung artikel jurnal yang lebih lama, tulis `% TODO` berisi
  alasan akademiknya agar dapat ditinjau pembimbing; tanpa alasan itu,
  rujukan lama tidak boleh dipakai. Prosiding dan *preprint* yang menjadi
  rujukan dasar (misalnya paper asal sebuah metode) boleh dipakai meskipun
  lebih lama, dengan catatan `% TODO` yang menyebutkan statusnya sebagai
  rujukan dasar.
- Artikel yang dikutip harus artikel asli penerbit, bukan halaman
  agregator, repositori skripsi, blog, atau salinan tanpa identitas
  bibliografis. Bila hanya versi *preprint* yang tersedia, tulis
  *preprint*-nya secara eksplisit beserta DOI-nya dan sebutkan statusnya.
- **Setiap klaim harus berdasarkan paper asli.** Baca sumber primernya
  (abstrak dan isi artikel), bukan ringkasan sekunder, ulasan blog, atau
  keluaran model bahasa. Kutipan yang hanya bersumber dari rangkuman pihak
  ketiga tidak boleh dipakai sebagai dasar pernyataan.
- Jangan mengutip paper yang belum diverifikasi. Periksa setiap DOI lewat
  OpenAlex (MCP `openalex`, alat `get_work` atau
  `batch_resolve_references`) sebelum menambahkannya ke
  `backmatter/references.bib`. Bila DOI tidak ditemukan atau metadata
  tidak cocok, jangan masukkan entri itu; tandai `% TODO` pada klaim yang
  bergantung padanya.
- Jangan mengarang sitasi, DOI, nama penulis, volume, atau nomor halaman.
  Bila sumber tidak dapat dipastikan, hilangkan klaimnya atau tulis
  ketidakpastian itu secara terbuka di naskah.
- Kunci API OpenAlex hanya disimpan di konfigurasi lokal
  (`~/.codex/config.toml`). Jangan menuliskan kunci itu ke dalam repo,
  `AGENTS.md`, `references.bib`, naskah, atau riwayat Git.

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
- Gaya pustaka memakai `backmatter/apalike-id.bst`, salinan lokal
  `apalike.bst` yang string tercetaknya sudah diterjemahkan. Jangan
  memakai `\bibliographystyle{apalike}` bawaan karena label akan
  kembali ke "and", "et al.", "In", dan "pages". Bila perlu menambah
  istilah baru, ubah salinan lokal itu, bukan berkas di `texmf`.
- Pola pemenggalan kata Indonesia (`hyph-id.tex`) hanya dapat dimuat saat
  format dibuat, bukan dari `laporan.sty`. Jangan mencoba menyisipkannya
  sebagai `\patterns` di dalam paket; TeX akan menolak dengan
  "Patterns can be loaded only by INITEX". Pasang di tingkat pengguna dan
  bangun ulang format XeLaTeX.

## Verifikasi sebelum menyatakan selesai

1. `make clean && make`, lalu pastikan exit 0 dan tidak ada `! LaTeX Error`.
2. `pdfinfo main.pdf`: ukuran halaman 595.28 x 841.89 pt (A4) dan jumlah
   halaman sesuai target.
3. Periksa visual halaman yang berubah dengan `pdftoppm`. Binari ada di
   `/Users/kagchi/.cache/codex-runtimes/codex-primary-runtime/dependencies/bin/override/`
   (`pdftoppm`, `pdfinfo`); `pdftotext` tidak tersedia di mesin ini.
4. Untuk perubahan yang menyentuh sampul, periksa juga `make sampul`.

## Git

- **Jangan pernah menjalankan `git commit` atau `git push` tanpa izin
  eksplisit dari pengguna pada permintaan yang sedang berjalan.** Selesai
  menulis naskah bukan izin untuk commit. Tunjukkan ringkasan perubahan
  (`git status`, `git diff --stat`), lalu tunggu pengguna memutuskan.
  Kalimat seperti "kerjakan", "tulis bab 1", atau "perbaiki" hanya berarti
  mengubah berkas, bukan menyimpan riwayat Git.
- Izin sekali pakai hanya berlaku untuk permintaan itu. Jangan menganggap
  izin commit dari percakapan sebelumnya berlaku untuk perubahan berikutnya.
- Pesan commit memakai prefiks `docs:`, `feat:`, atau `fix:`, ditulis
  dalam bahasa Indonesia, ringkas, dan menjelaskan hasil akhir.
- Untuk pesan lebih dari satu baris, tulis ke berkas lalu
  `git commit -F <berkas>`; tanda kutip di dalam `-m` pernah merusak
  perintah.
- Jangan commit berkas hasil build (`*.aux`, `*.log`, `*.pdf`, dst.);
  semuanya sudah tercantum di `.gitignore`.
- Jangan pernah memakai `git push --force` ke `main`. Bila sebuah commit
  yang sudah ter-push harus dibatalkan, tanyakan lebih dahulu apakah pengguna
  menghendaki `git revert` (menambah commit pembatal) atau penulisan ulang
  riwayat, lalu jalankan pilihan itu setelah disetujui.
