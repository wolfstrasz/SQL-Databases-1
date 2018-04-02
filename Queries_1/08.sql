SELECT	P.pcode,P.price
FROM	products P, 	(SELECT    D.pcode, AVG(D.qty) AS average
			 FROM	   details D
			 GROUP BY  D.pcode ) AS subdetails
WHERE	P.pcode = subdetails.pcode
AND	subdetails.average >= 8;
