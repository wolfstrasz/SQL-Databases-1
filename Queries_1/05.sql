SELECT DISTINCT FINAL.cid, FINAL.cn, FINAL.od
FROM (

	(SELECT CU.custid AS cid, CU.cname AS cn, ORD.odate AS od
	FROM customers CU, orders ORD
	WHERE CU.custid = ORD.ocust) AS GENERAL 

LEFT JOIN

	(SELECT SQ1.custid,SQ1.odate
	FROM 		(SELECT  C.custid, O.odate
			FROM	customers C, orders O
			WHERE C.custid = O.ocust) AS SQ1, 
			
			(SELECT  C.custid, O.odate
			FROM	customers C, orders O
			WHERE C.custid = O.ocust) AS SQ2
	WHERE SQ1.odate <= SQ2.odate AND SQ1.custid = SQ2.custid) AS NONMAX

ON (GENERAL.cid = NONMAX.custid AND GENERAL.od < NONMAX.odate)) AS FINAL

WHERE FINAL.odate IS NULL;
