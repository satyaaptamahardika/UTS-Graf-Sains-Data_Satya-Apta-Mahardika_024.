MATCH (a:Item {itemId: 119736})-[s:SIMILAR]->(b:Item)
RETURN a.itemId AS acuan, b.itemId AS tetangga, s.score AS skor
ORDER BY skor DESC;