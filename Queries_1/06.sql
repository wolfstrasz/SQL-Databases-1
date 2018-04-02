SELECT 	I.invid, (SQ.total - I.amount) AS reimburse
FROM 	invoices I, 	(SELECT P.invid, SUM(P.amount) AS total
			FROM payments P
			GROUP BY P.invid) AS SQ
WHERE 	I.invid = SQ.invid
AND	I.amount < SQ.total;


