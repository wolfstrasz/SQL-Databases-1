SELECT	I.invid,I.issued,I.ordid,O.odate
FROM 	invoices I, orders O
WHERE 	I.ordid = O.ordid
AND	I.issued < O.odate;
