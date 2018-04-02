SELECT *
FROM	orders O
WHERE	O.odate < '2016-09-06'
AND	O.ordid NOT IN ( SELECT D.ordid
			 FROM details D );
