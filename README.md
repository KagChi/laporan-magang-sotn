# Laporan Magang STMIK Kuwera (SOTN) — Template LaTeX

Template LaTeX satu kolom untuk laporan magang sesuai Pedoman Penulisan
Laporan Magang Bab 4.1 (format halaman dan huruf) dan Bab 4.3 (urutan isi).
Isi laporan masih kosong: semua bab dan bagian awal sudah tersedia sebagai
kerangka dengan penanda `% TODO`.

## Prasyarat

- TeX Live dengan **XeLaTeX** dan `latexmk` (sudah tersedia di mesin ini).
- Font **Times New Roman** terpasang di sistem (macOS menyediakannya).
- Tidak perlu memasang paket LaTeX tambahan: template hanya memakai paket
  yang ada di TeX Live Basic.
- Pola pemenggalan kata bahasa Indonesia dipasang di tingkat pengguna
  (lihat bagian berikut). Tanpa langkah ini, TeX memakai pola bahasa Inggris
  dan memotong kata di tempat yang salah, misalnya "kemuda-han".

## Memasang pola pemenggalan kata Indonesia

TeX Live Basic tidak memuat `hyph-id.tex`, dan pola pemenggalan hanya dapat
dimuat saat format dibuat (tidak bisa lewat `\usepackage` atau `\input`).
Karena itu pola dipasang ke pohon `texmf` pengguna tanpa perlu hak admin.

```sh
mkdir -p ~/Library/texmf/tex/generic/hyph-utf8/patterns/tex
mkdir -p ~/Library/texmf/tex/generic/config
# ambil hyph-id.tex dari https://github.com/hyphenation/tex-hyphen
cp hyph-id.tex ~/Library/texmf/tex/generic/hyph-utf8/patterns/tex/
cp "$(kpsewhich language.dat)" ~/Library/texmf/tex/generic/config/language.dat
printf 'indonesian hyph-id.tex\n' >> ~/Library/texmf/tex/generic/config/language.dat
fmtutil-user --byfmt xelatex
```

Setelah itu `make` tidak lagi memberi peringatan
`No hyphenation patterns were preloaded` untuk bahasa Indonesia. Karena format
pengguna kini menggantikan format sistem, jalankan `fmtutil-user --byfmt
xelatex` lagi setiap kali TeX Live diperbarui.

## Cara kompilasi

Jalankan dari akar repo:

```sh
make          # build laporan lengkap -> main.pdf
make watch    # build ulang otomatis setiap file disimpan
make sampul   # hanya halaman sampul -> sampul-only.pdf
make clean    # hapus file bantu build
```

Perintah `make` memakai `latexmk` sehingga daftar isi, daftar tabel,
daftar gambar, daftar grafik, daftar lampiran, dan daftar pustaka terisi
otomatis (beberapa kali kompilasi dijalankan sendiri).

## Struktur

```
main.tex                 urutan dokumen (bagian awal, bab 1-6, bagian akhir)
laporan.sty              seluruh gaya format (Pedoman 4.1 dan 4.3)
config/metadata.tex      identitas laporan: judul, nama, NIM, prodi, kampus, dst.
frontmatter/             sampul, halaman judul, pengesahan, kata pengantar,
                         abstrak, daftar isi/tabel/grafik/gambar/singkatan/lampiran
chapters/                bab1-pendahuluan ... bab6-kesimpulan
backmatter/              daftar-pustaka.tex, lampiran.tex, references.bib
assets/                  logo STMIK Kuwera dan gambar laporan
sampul-only.tex          build khusus halaman sampul
```

## Mengisi laporan

1. **Identitas** — ubah `config/metadata.tex`: judul (10-14 kata), nama tanpa
   gelar, NIM, program studi, kampus, kota, tahun, nama dan gelar dosen
   pembimbing dan ketua program studi beserta NIDN masing-masing, serta
   tanggal pengesahan. Nama setiap penanda tangan
   ditulis di makro terpisah dari gelarnya karena baris nama pada lembar
   pengesahan bergaris bawah dan tidak boleh pindah baris.
2. **Judul sampul** — bentuk piramida terbalik dibuat dengan `\\` (pindah baris)
   di dalam `\JudulLaporan`; panjang tiap baris diatur manual.
3. **Bab** — isi tiap file di `chapters/` mengikuti penanda `% TODO`.
   Gaya penulisan: satu alinea 4-5 kalimat, satu gagasan per alinea, rata
   kiri-kanan, istilah asing ditulis `\asing{open source}`.
4. **Daftar singkatan** — isi `frontmatter/daftar-singkatan.tex`, urut abjad:
   `\singkatan{NIM}{Nomor Induk Mahasiswa}`.
5. **Lampiran** — tulis `\lampiranentry{Lampiran 1. Judul}` lalu isinya di
   `backmatter/lampiran.tex`; entri otomatis muncul di Daftar Lampiran.
6. **Daftar pustaka** — tambahkan entri `BibTeX` di
   `backmatter/references.bib`, lalu sitasi dengan `\citep{kunci}` atau
   `\citet{kunci}`.

  Urutan pemakaian rujukan: paper Indonesia lebih dahulu, paper luar negeri
  sebagai pendukung kedua. Setiap entri jurnal wajib memuat artikel aslinya
  (penulis, judul, jurnal, volume(nomor), halaman, tahun, DOI) dan sudah
  diperiksa ke OpenAlex. Artikel jurnal harus terbit dalam empat tahun
  terakhir, yaitu 2023--2026 untuk laporan 2026; rujukan yang lebih lama
  hanya boleh dipakai sebagai rujukan dasar dengan catatan `% TODO`.
  Rincian aturannya ada di `AGENTS.md`.

## Makro yang tersedia

| Makro | Kegunaan |
| --- | --- |
| `\asing{kata}` | istilah asing (italic) |
| `\singkatan{SIM}{Sistem Informasi}` | entri Daftar Singkatan dan Akronim |
| `\lampiranentry{Lampiran 1. Judul}` | judul lampiran + entri Daftar Lampiran |
| `\begin{grafik}...\end{grafik}` | grafik/chart, masuk ke Daftar Grafik |
| `\begin{daftarsingkatan}...\end{daftarsingkatan}` | wadah Daftar Singkatan (spasi 1,5) |
| `\babfrontmatter{Judul}` | halaman bab tanpa nomor + entri daftar isi |
| `\citep{kunci}` / `\citet{kunci}` | sitasi nama-tahun (apalike) |

Label sitasi dan Daftar Pustaka memakai salinan gaya lokal
`backmatter/apalike-id.bst`, yaitu `apalike.bst` yang diterjemahkan. Dua
penulis dipisah "dan", lebih dari dua memakai "dkk.", prosiding diawali
"Dalam", dan halaman ditulis "hlm.". Jangan mengembalikan
`\bibliographystyle{apalike}` bawaan karena akan memunculkan kembali
"and", "et al.", dan "pages".

Bentuk tabel, gambar, grafik, dan kutipan kode program sudah tersedia sebagai
contoh yang dikomentari di `chapters/bab4-pembahasan.tex`.

## Memeriksa rujukan lewat OpenAlex

Setiap DOI di `backmatter/references.bib` diperiksa dulu ke OpenAlex supaya
tidak ada sitasi karangan. Pemeriksaan memakai MCP `openalex`
([openalex-research-mcp](https://github.com/oksure/openalex-research-mcp))
yang terpasang di `/Volumes/SSD/Mcp/mcp-openalex` dan terdaftar di
`~/.codex/config.toml`. Alat yang dipakai: `get_work` (argumen `id`) untuk
satu DOI dan `batch_resolve_references` (argumen `ids`) untuk banyak DOI
sekaligus. DOI yang tidak ditemukan dilaporkan sebagai tidak terpecahkan,
sehingga sitasi karangan langsung ketahuan.

Kunci API OpenAlex hanya disimpan di berkas konfigurasi lokal itu, tidak di
dalam repo. Untuk memasang ulang di mesin lain:

```sh
mkdir -p /Volumes/SSD/Mcp/mcp-openalex
cd /Volumes/SSD/Mcp/mcp-openalex
npm init -y && npm install openalex-research-mcp@0.5.0
codex mcp add openalex --env OPENALEX_API_KEY=<kunci> \
  -- node /Volumes/SSD/Mcp/mcp-openalex/node_modules/openalex-research-mcp/build/index.js
```

MCP baru terbaca setelah aplikasi Codex dimulai ulang.

## Format yang sudah diterapkan

- Kertas A4 satu sisi; margin kiri 4 cm, atas 4 cm, kanan 3 cm, bawah 3 cm.
- Times New Roman 12 pt, isi rata kiri-kanan, spasi 2, awal alinea menjorok
  1,5 cm, jarak antaralinea satu gagasan per alinea.
- Judul bab 12 pt bold KAPITAL rata tengah spasi 1, dengan baris `BAB <n>` di
  atas judul; judul subbab 12 pt bold, Capitalize Each Word.
- Judul tabel, gambar, dan grafik 12 pt bold rata tengah spasi 1; penomoran
  per bab (Tabel 4.1, Gambar 4.1, Grafik 4.1).
- Nomor halaman di tengah bawah: sampul dan halaman judul tanpa nomor, bagian
  awal angka Romawi (mulai i di Lembar Pengesahan), Bab 1 dan seterusnya
  angka Arab, termasuk Daftar Pustaka dan Lampiran.
- Daftar isi, daftar tabel, daftar grafik, daftar gambar, daftar lampiran, dan
  daftar pustaka memakai spasi 1,5 dengan titik pengarah.

## Catatan sebelum dicetak

Catatan teknis: bila mesin lain belum memasang pola pemenggalan kata
Indonesia seperti dijelaskan di bagian Prasyarat, XeLaTeX akan memberi
peringatan `No hyphenation patterns were preloaded`. Build tetap berhasil,
tetapi kata Indonesia dapat terpotong mengikuti pola bahasa Inggris.

- Jumlah halaman minimal **45** halaman; periksa dengan `pdfinfo main.pdf`.
- Sampul dicetak pada kertas Omega **hijau daun** dengan tinta hitam
  (`make sampul` menghasilkan halaman sampul saja). Logo diukur 5 cm dengan rasio
  asli, jadi sisi terpanjangnya tepat 5 cm.
- Laporan dijilid hard cover dan digandakan **4 eksemplar**, setelah disetujui
  dosen pembimbing.
- **Bahasa laporan belum pasti.** Pedoman hanya menyebut proposal boleh
  berbahasa Inggris bila instansi mensyaratkan. Karena magang di NTUST,
  konfirmasi ke dosen pembimbing apakah isi laporan harus berbahasa Indonesia
  atau boleh Inggris. Bila harus Inggris, aktifkan halaman `Abstract` yang
  sudah dipersiapkan (dikomentari) di `frontmatter/abstrak.tex`.
- Abstrak di template ini memakai spasi 1 (kebiasaan umum). Bila pembimbing
  meminta spasi 2, ganti `\begin{singlespace}` menjadi `\begin{spacing}{2}` di
  `frontmatter/abstrak.tex` dan `frontmatter/kata-pengantar.tex`.

