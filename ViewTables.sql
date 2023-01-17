SELECT * FROM paymentinfo;
SELECT * FROM shoppingcart;
SELECT * FROM productBelongsTo;
SELECT * FROM customer;
SELECT * FROM shipper;
SELECT * FROM shippingdetails;
SELECT * FROM seller;
SELECT * FROM orderinfo;
SELECT * FROM orderstatus;
SELECT * FROM ordertracker;
SELECT * FROM specifications; 
SELECT * FROM product;
SELECT * FROM specificaddress;
SELECT * FROM generaladdress;
SELECT * FROM rates;
SELECT * FROM lists;
SELECT * FROM pay;
SELECT * FROM deliveryto;

SELECT c.userid, c.name, c.email, o.orderid, o.trackingid, d.expecteddate, p.productname, b.quantity 
FROM customer c, orderinfo o, product p, deliveryto d, productBelongsTo b 
WHERE c.userid = o.customerid AND 
    o.orderid = d.orderid AND 
    o.orderid = b.orderid AND
    b.productid = p.productid AND
    d.expecteddate >= TO_DATE('2022-1-1', 'YYYY-MM-DD')
    ORDER BY userid;

CREATE VIEW customerInfo AS (
    SELECT userid, phone_num, name, email 
    FROM customer
) WITH READ ONLY;
SELECT * FROM customerInfo;
DROP VIEW customerInfo;

SELECT c.name, c.phone_num, cardNum 
FROM paymentinfo p, customer c, pay, seller s 
WHERE p.customerid = c.userid 
    AND c.userid = pay.customerid 
    AND pay.sellerid = s.userid
    AND typeofpayment = 'Visa';
    
CREATE VIEW productsearch AS (
	SELECT product.* FROM specifications,product,lists
	WHERE productstock>3 
		AND specifications.productid = lists.productid
		AND product.productid = lists.productid 
		AND specifications.type='ryzen5'
) WITH READ ONLY;
SELECT * FROM productsearch;
DROP VIEW productsearch;

SELECT p.productname, o.ordertype, s.packagetype
 FROM product p, orderstatus o, shippingdetails s, seller 
WHERE p.productid = o.orderid 
    AND o.orderid = s.trackingid
    AND s.trackingid = seller.userid 
    AND reputation > 4;

CREATE VIEW Shippinginfo AS (
	SELECT shippingdetails.* FROM shippingdetails, generaladdress, specificaddress, shipper
	WHERE shipper.companyname = 'UPS'
		AND generaladdress.postalcode = 'L9X2W5'
		AND shippingdetails.trackingid = specificaddress.trackingid
		AND  specificaddress.trackingid = shipper.shipperid
) WITH READ ONLY;
SELECT * FROM Shippinginfo;
DROP VIEW Shippinginfo;

SELECT c.userid, COUNT(p.productid),SUM(p.price)
 FROM Customer c, Product p, productBelongsTo pbt, shoppingcart s
 WHERE pbt.productid=p.productid
    AND pbt.shoppingcartid = s.shoppingcartid
    AND s.customerid = c.userid
    GROUP BY userid;

SELECT productname, SUM(quantity) FROM product, productBelongsTo
 WHERE EXISTS (SELECT s.shoppingcartid FROM shoppingcart s,product p, productBelongsTo pts
    WHERE s.shoppingcartid = pts.shoppingcartid 
        AND pts.productid = p.productid
        AND p.productname='Ryzen5 AMD 5600x'
        ) 
    AND productBelongsTo.productid=product.productid
    AND productname='Ryzen5 AMD 5600x'
    group by productname;

SELECT country, street, count(postalcode)
	FROM generaladdress
	WHERE postalcode = 'L9X2W5'
	GROUP BY country, street
	UNION
	SELECT country, street, count(postalcode)
	FROM generaladdress
	WHERE postalcode != 'L9X2W5'
	GROUP BY country, street;

SELECT country,street,COUNT(*) 
FROM generaladdress  
WHERE NOT EXISTS (
    (SELECT country, street FROM generaladdress 
    WHERE country = 'United States'
    AND street = 'Hollywood Boulevard')
    UNION 
    (SELECT country, street FROM generaladdress 
    WHERE country = 'Canada'
    AND street = 'Dundas street')
)
GROUP BY country,street;

(SELECT t.sellerid, s.reputation, p.productname,p.rating, t.productstock, p.price 
FROM lists t, seller s, product p
 WHERE t.sellerid = s.userid     
AND t.productid = p.productid  
AND p.rating > 4)
MINUS
(
    SELECT t1.sellerid, s1.reputation, p1.productname,p1.rating, t1.productstock, p1.price 
    FROM lists t1, seller s1, product p1
    WHERE p1.price >400
    AND t1.sellerid = s1.userid 
    AND t1.productid = p1.productid
);

SELECT sd.packagetype, COUNT(*) 
    FROM deliveryto d, shipper s, shippingdetails sd  
    WHERE d.shipperid = s.shipperid
    AND sd.trackingid = d.trackingid
    AND s.shippingplan = 'one day'
    GROUP BY packagetype
    HAVING COUNT(*) >= 3;
    
SELECT DISTINCT country, postalcode FROM generaladdress;

SELECT rating, sellerid FROM rates ORDER BY rating;

SELECT * FROM lists WHERE productstock <= 5;

SELECT * FROM pay WHERE typeofpayment = 'visa' OR typeofpayment = 'AmExpress' ORDER BY paymentdate;

SELECT orderid, expecteddate FROM deliveryto ORDER BY expecteddate;

SELECT deliveryinst, packagetype FROM shippingdetails;

SELECT DISTINCT phone_num FROM seller;

SELECT phone_num, AVG(reputation) FROM seller GROUP BY phone_num;

SELECT * FROM orderinfo WHERE orderid = 1;

SELECT * FROM specifications WHERE color = 'black' OR color = 'white'; 

SELECT * FROM product WHERE price >= 320;

SELECT * FROM product ORDER BY rating;

SELECT cardNum FROM paymentinfo WHERE customerid<=10 AND cardType = 'Visa' ORDER BY cardNum DESC;

SELECT shoppingcartid FROM shoppingcart WHERE customerid=3;

SELECT shoppingcartid FROM productBelongsTo WHERE productid>=2;

SELECT userid, name FROM CUSTOMER WHERE phone_num BETWEEN 5120000000 AND 5129999999;

SELECT companyname FROM SHIPPER WHERE shippingplan LIKE 'one %';