// =====================================================================
// UTS Graf Sains Data - kumpulan query Cypher
// Item acuan: 119736
// Catatan: file ini untuk dibaca (dokumentasi). Jalankan satu query per
// tab di Neo4j Aura, bukan sekaligus.
// =====================================================================

// ===== Soal 2.1 no. 3: Komposisi subgraph (dijalankan lewat Python) =====
MATCH (n) RETURN labels(n)[0] AS tipe, count(*) AS jumlah;
MATCH ()-[r]->() RETURN type(r) AS relasi, count(*) AS jumlah;

// ===== Soal 2.1 no. 7: Menulis similarity ke graf (hanya lewat Python) =====
// Memakai parameter $rows dan $ref yang diisi dari kode Python,
// sehingga TIDAK bisa dijalankan langsung di Neo4j Aura.
UNWIND $rows AS r
MATCH (a:Item {itemId: $ref}), (b:Item {itemId: r.item})
MERGE (a)-[s:SIMILAR]->(b) SET s.score = r.score;

// ===== Soal 2.1 no. 8: kondisi SEBELUM similarity (hanya relasi Visitor-Item) =====
MATCH (v:Visitor)-[r]->(a:Item {itemId: 119736})
RETURN v, r, a
LIMIT 15;

// ===== Soal 2.1 no. 7a dan 8: kondisi SESUDAH, 5 similarity tertinggi (graf) =====
MATCH (a:Item {itemId: 119736})-[s:SIMILAR]->(b:Item)
RETURN a, s, b ORDER BY s.score DESC LIMIT 5;

// ===== Soal 2.1 no. 7b: nilai similarity dalam bentuk tabel =====
MATCH (a:Item {itemId: 119736})-[s:SIMILAR]->(b:Item)
RETURN a.itemId AS acuan, b.itemId AS tetangga, s.score AS skor
ORDER BY skor DESC;
