SELECT	O.ordid,O.odate,SQ2.tot
FROM 	orders O, (SELECT SQ1.ordid AS ordid, SUM(SQ1.qtyprice) AS tot
		   FROM		(SELECT D.ordid, (D.qty * P.price) AS qtyprice
				FROM details D, products P
				WHERE D.pcode = P.pcode) AS SQ1
		   GROUP BY SQ1.ordid ) AS SQ2
WHERE	O.ordid NOT IN ( SELECT I.ordid
			 FROM invoices I)
AND	O.ordid = SQ2.ordid;






