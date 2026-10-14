# Laporan Magang STMIK Kuwera (SOTN) — Template LaTeX

Template LaTeX satu kolom untuk laporan magang sesuai Pedoman Penulisan
Laporan Magang Bab 4.1 (format halaman dan huruf) dan Bab 4.3 (urutan isi).
Isi laporan masih kosong: semua bab dan bagian awal sudah tersedia sebagai
kerangka dengan penanda `% TODO`.

## Prasyarat

- TeX Live dengan **XeLaTeX** dan `latexmk` (sudah tersedia di mesin ini).
- Font **Times New Roman** terpasang di sistem (macOS menyediakannya).
- Tidak perlu memasang paket tambahan: template hanya memakai paket yang ada
  di TeX Live Basic.

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

Bentuk tabel, gambar, grafik, dan kutipan kode program sudah tersedia sebagai
contoh yang dikomentari di `chapters/bab4-pembahasan.tex`.

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

Catatan teknis: saat kompilasi, XeLaTeX memberi peringatan
`Package babel Warning: No hyphenation patterns were preloaded` karena
TeX Live Basic tidak memuat pola pemenggalan kata bahasa Indonesia. Peringatan
itu tidak menggagalkan build; paragraf justify sudah diberi toleransi lebih
longgar di `laporan.sty` agar tidak berlubang.

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

