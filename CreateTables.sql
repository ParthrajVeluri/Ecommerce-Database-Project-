CREATE TABLE customer (
    userid    INTEGER,
    phone_num INTEGER,
    name      VARCHAR2(20),
    email     VARCHAR2(30),
    password  VARCHAR2(30),
    PRIMARY KEY ( userid )
);

CREATE TABLE paymentInfo (
    customerid INTEGER REFERENCES customer(userid) ON DELETE CASCADE,
    cardNum INTEGER, 
    cardType VARCHAR2(15),
    PRIMARY KEY (customerid)
);

CREATE TABLE shipper (
    shipperid    INTEGER,
    companyname  VARCHAR2(20) NOT NULL,
    shippingplan VARCHAR2(20) NOT NULL,
    PRIMARY KEY ( shipperid )
);

CREATE TABLE shippingdetails (
    trackingid   INTEGER,
    deliveryinst VARCHAR2(50),
    packagetype  VARCHAR2(30) NOT NULL,
    PRIMARY KEY ( trackingid )
);

CREATE TABLE seller (
    userid    INTEGER,
    phone_num INTEGER,
    name      VARCHAR2(20),
    email     VARCHAR2(30),
    password  VARCHAR2(30),
    reputation NUMBER (2,1), 
    location VARCHAR2(15),
    PRIMARY KEY ( userid )
);

CREATE TABLE orderinfo (
    orderid INTEGER UNIQUE,
    customerid INTEGER
        REFERENCES customer ( userid ),
    trackingid INTEGER 
        REFERENCES shippingdetails( trackingid ),
    PRIMARY KEY ( orderid, customerid )
);

CREATE TABLE orderstatus (
    orderid INTEGER REFERENCES orderinfo(orderid),
    ordertype  VARCHAR2(20) NOT NULL,
    status     VARCHAR(15) NOT NULL,

    PRIMARY KEY ( orderid )
);

CREATE TABLE ordertracker (
    trackingid INTEGER 
        REFERENCES shippingdetails( trackingid ),
    ordertype  VARCHAR2(20) NOT NULL,
    status     VARCHAR(15) NOT NULL,

    PRIMARY KEY ( trackingid )
);


CREATE TABLE product (
    productid   INTEGER,
    productname VARCHAR2(60) NOT NULL,
    price       NUMBER (15, 2) NOT NULL,
    rating      NUMBER (2,1),
    PRIMARY KEY ( productid )
);

CREATE TABLE shoppingcart (
    shoppingcartid INTEGER UNIQUE,
    customerid
        REFERENCES customer ( userid ) ON DELETE CASCADE,
    PRIMARY KEY (shoppingcartid, customerid)
);

CREATE TABLE specifications (
    productid INTEGER
        REFERENCES product ( productid ) ON DELETE CASCADE,
    type      VARCHAR2(30) NOT NULL,
    color     VARCHAR2(20) NOT NULL,
    brand     VARCHAR2(20) NOT NULL,
    model     VARCHAR2(30) NOT NULL,
    PRIMARY KEY ( productid )
);

CREATE TABLE specificAddress(
    trackingID INTEGER
        REFERENCES shippingdetails(trackingid),
    postalcode VARCHAR2(6),
    aptno INTEGER NOT NULL,
    PRIMARY KEY (trackingID)
);

CREATE TABLE generalAddress(
    postalcode VARCHAR2(6) NOT NULL,
    country VARCHAR2(30) NOT NULL,
    street VARCHAR2(30) NOT NULL,
    PRIMARY KEY (postalcode)
);

CREATE TABLE productBelongsTo(
    productid INTEGER 
		REFERENCES product(productid),
    quantity INTEGER DEFAULT 1,
    shoppingcartid INTEGER 
		REFERENCES shoppingcart(shoppingcartid) ON DELETE CASCADE,
    orderid INTEGER 
		REFERENCES orderinfo(orderid) ON DELETE CASCADE,
    PRIMARY KEY (productid, shoppingcartid)
);

CREATE TABLE rates (
    sellerid   INTEGER
        REFERENCES seller ( userid ) ON DELETE CASCADE,
    customerid INTEGER
        REFERENCES customer ( userid ) ON DELETE CASCADE,
    rating     NUMBER (2,1),
    PRIMARY KEY ( sellerid,
                  customerid )
);

CREATE TABLE lists (
    sellerid     INTEGER
        REFERENCES seller ( userid ) ON DELETE CASCADE NOT NULL,
    productid    INTEGER
        REFERENCES product ( productid ) ON DELETE CASCADE,
    productstock INTEGER NOT NULL,
    PRIMARY KEY (sellerid, productid)
);

CREATE TABLE pay (
    sellerid      INTEGER
        REFERENCES seller ( userid )ON DELETE CASCADE NOT NULL ,
    customerid    INTEGER
        REFERENCES customer ( userid ) ON DELETE CASCADE NOT NULL,
    paymentamount NUMBER (15, 2) NOT NULL,
    typeofpayment VARCHAR2(15) NOT NULL,
    paymentdate   TIMESTAMP NOT NULL,
    PRIMARY KEY ( sellerid,
                  customerid )
);

CREATE TABLE deliveryto (
    shipperid    INTEGER NOT NULL
        REFERENCES shipper ( shipperid ) ON DELETE CASCADE,
    trackingid   INTEGER NOT NULL
        REFERENCES shippingdetails ( trackingid ) ON DELETE CASCADE,
    orderid      INTEGER NOT NULL
        REFERENCES orderinfo ( orderid ) ON DELETE CASCADE,
    expecteddate DATE,
    arrivaldate  DATE,
    PRIMARY KEY ( shipperid,
                  trackingid,
                  orderid )
);