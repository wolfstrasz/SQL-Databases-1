SELECT SQ.country, COUNT (SQ.ordid)
FROM 	(SELECT *
	FROM customers C, orders O
	WHERE C.custid = O.ocust) as SQ
WHERE 	SQ.odate < '2017-01-01'
AND	SQ.odate >= '2016-01-01'
GROUP BY SQ.country;
