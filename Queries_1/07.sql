SELECT	subdetails.pcode,subdetails.total
FROM	( SELECT    D.pcode, SUM(D.qty) AS total
	  FROM	    details D
	  GROUP BY  D.pcode ) AS subdetails
WHERE	subdetails.total > 10;
