MATCH (a:Item {itemId: 119736})-[s:SIMILAR]->(b:Item)
RETURN a, s, b ORDER BY s.score DESC LIMIT 5;