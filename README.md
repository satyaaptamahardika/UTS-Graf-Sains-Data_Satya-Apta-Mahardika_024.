# UTS Graf Sains Data – Rekomendasi Berbasis Graf (RetailRocket + Neo4j)

Sistem rekomendasi item-based dari dataset e-commerce RetailRocket menggunakan Neo4j AuraDB dan Python.

## Periode (UTC)
| | Mulai | Selesai | Unix timestamp (ms) |
|---|---|---|---|
| P1 (training) | 2015-05-18 00:00:00 | 2015-05-25 23:59:59 | 1431907200000 – 1432598399000 |
| P2 (testing)  | 2015-05-26 00:00:00 | 2015-06-08 23:59:59 | 1432598400000 – 1433807999000 |

## Isi repository
| Berkas | Keterangan |
|---|---|
| `UTS_Graf_Sains_Data.ipynb` | Notebook utama: kode, output, dan penjelasan |
| `events_p1.csv`, `events_p2.csv` | Data hasil filter periode P1 (176.376 baris) dan P2 (285.340 baris) |
| `8_sebelum_similarity.cypher` | Query graf sebelum similarity (soal 8) |
| `7a_sesudah_similarity_top5_graf.cypher` | Query top-5 similarity, graf (soal 7a dan 8) |
| `7b_tabel_similarity.cypher` | Query nilai similarity, tabel (soal 7b) |
| `queries.cypher` | Gabungan seluruh Cypher (dokumentasi, tidak untuk dijalankan sekaligus) |
| `Tabel_similarity.csv` | Hasil query 7b |
| `images/` | Graf sebelum dan sesudah similarity |

`events.csv` asli (90 MB) tidak disertakan karena melebihi batas unggah GitHub. Unduh dari Kaggle: https://www.kaggle.com/datasets/retailrocket/ecommerce-dataset, lalu letakkan di folder yang sama dengan notebook.

## Hasil ringkas
- Graf: 96.733 Visitor dan 58.530 Item; relasi VIEWED 171.139, ADDED_TO_CART 3.998, BOUGHT 1.239.
- Proyeksi terpilih: Item–Item (58.530 simpul, 632.145 sisi, densitas 0,000369) dibanding User–User (96.733 simpul, 626.103 sisi, densitas 0,000134); cosine similarity.
- Item acuan: 119736 (2.171 tetangga); top-5: 215201, 424548, 437778, 359177, 422327.
- User acak (seed 42): 264713; Hit@5 = 1, NDCG@5 = 0,3392.
- Rata-rata 1.168 user: Hit@5 = 0,0325; NDCG@5 = 0,011.

## Menjalankan ulang
Python 3.10+, paket `neo4j>=5.20 pandas numpy scipy scikit-learn networkx matplotlib tqdm`, dan instance Neo4j AuraDB. Password dimasukkan lewat `getpass` (tidak disimpan di repo).
