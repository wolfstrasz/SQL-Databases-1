SELECT *
FROM customers C
WHERE C.custid NOT IN 
		(SELECT  C.custid
		  FROM	customers C, orders O
		  WHERE	C.custid = O.ocust
		  AND	O.odate < '2017-01-01'
		  AND	O.odate >= '2016-01-01');
