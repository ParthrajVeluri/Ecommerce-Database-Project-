INSERT INTO customer VALUES (
    1, 5126546298, 'John Doe', 'John@gmail.com', 'JohnsPass'
);

INSERT INTO customer VALUES (
    2, 6145635115, 'Bob', 'Bob@gmail.com', 'BobsPass'
);

INSERT INTO customer VALUES (
    3, 5921856218, 'Don', 'Don@gmail.com', 'DonsPass'
);

INSERT INTO customer VALUES (
    4, 6131562218, 'Jimbo', 'Jimbo@gmail.com', 'JimbosPass'
);

INSERT INTO seller VALUES (
    1, 9052345678, 'Jackie', 'jack@gmail.com', 'password1', 4.3, 'location1'
);

INSERT INTO seller VALUES (
    2, 9052345677, 'Jill', 'jill@gmail.com', 'password2', 3.3, 'location2'
);

INSERT INTO seller VALUES (
    3, 9052345677, 'Mark', 'mark@gmail.com', 'password3', 4.7, 'location5'
);

INSERT INTO shipper VALUES (
    1, 'UPS', 'one day'
);

INSERT INTO shipper VALUES (
    2, 'FEDEX', 'one day'
);

INSERT INTO shipper VALUES (
    3, 'CANPOST', 'three days'
);

INSERT INTO shippingdetails VALUES (
    1, 'place on door', 'fragile'
);

INSERT INTO shippingdetails VALUES (
    2, 'ring the doorbell', 'heavy'
);

INSERT INTO shippingdetails VALUES (
    3, 'deliver to backdoor', 'regular'
);

INSERT INTO shippingdetails VALUES (
    4, 'deliver to backdoor', 'fragile'
);

INSERT INTO shippingdetails VALUES (
    5, 'deliver to backdoor', 'fragile'
);

INSERT INTO orderinfo VALUES (
    1, 1, 1
);

INSERT INTO orderinfo VALUES (
    2, 2, 2
);

INSERT INTO orderinfo VALUES (
    3, 3, 3
);

INSERT INTO orderstatus VALUES (
    1, 'Purchase', 'On the way'
);

INSERT INTO orderstatus VALUES (
    2, 'Purchase', 'Processing'
);

INSERT INTO orderstatus VALUES (
    3, 'Purchase', 'Delivered'
);

INSERT INTO ordertracker VALUES (
    1, 'Purchase', 'On the way'
);

INSERT INTO ordertracker VALUES (
    2, 'Purchase', 'Processing'
);

INSERT INTO ordertracker VALUES (
    3, 'Purchase', 'Delivered'
);

INSERT INTO product VALUES (
    1, 'Ryzen5 AMD 3600x', 300, 5.0
);

INSERT INTO product VALUES (
    2, 'Ryzen5 AMD 5600x', 320, 4.7
);

INSERT INTO product VALUES (
    3, 'Ryzen7 AMD 5500', 400, 1.2
);

INSERT INTO product VALUES (
    4, 'Iphone 14', 900, 4.1
);

INSERT INTO product VALUES (
    5, 'Samsung Galaxy 18', 600, 3.9
);

INSERT INTO shoppingcart VALUES (
    1, 1
);

INSERT INTO shoppingcart VALUES (
    2, 2
);

INSERT INTO shoppingcart VALUES (
    3, 3
);
    
INSERT INTO lists VALUES (
    1, 1, 5
);

INSERT INTO lists VALUES (
    2, 2, 10
);

INSERT INTO lists VALUES (
    3, 3, 9
);

INSERT INTO lists VALUES (
    3, 4, 2
);

INSERT INTO lists VALUES (
    3, 5, 3
);

INSERT INTO specifications VALUES (
    1, 'ryzen5', 'white', 'AMD', '3600x'
);

INSERT INTO specifications VALUES (
    2, 'ryzen5', 'black', 'AMD', '5600x'
);

INSERT INTO specifications VALUES (
    3, 'ryzen7', 'grey', 'AMD', '5500'
);

INSERT INTO specificAddress VALUES (
    1, 'L9X2W5', '200'
);

INSERT INTO specificAddress VALUES (
    2, 'L9X2W7', '201'
);

INSERT INTO specificAddress VALUES (
    3, 'L9X2W9', '202'
);

INSERT INTO generalAddress VALUES (
    'L9X2W5', 'CANADA', 'Yonge street'
);

INSERT INTO generalAddress VALUES (
    'L9X2W7', 'CANADA', 'Bloor street'
);

INSERT INTO generalAddress VALUES (
    'L9X2W9', 'CANADA', 'Dundas street'
);

INSERT INTO rates VALUES (
    1, 1, 4.3
);

INSERT INTO rates VALUES (
    2, 2, 5.0
);

INSERT INTO rates VALUES (
    3, 3, 1.1
);

INSERT INTO productBelongsTo VALUES (
    1, 1, 1, 1
);

INSERT INTO productBelongsTo VALUES (
    3, 3, 1, 1
);

INSERT INTO productBelongsTo VALUES (
    2, 1, 2, 2
);

INSERT INTO productBelongsTo VALUES (
    3, 1, 3, 3
);

INSERT INTO pay VALUES (
    1, 1, 300, 'Visa', TO_TIMESTAMP('2022-07-02 06:14:00', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO pay VALUES (
    2, 1, 320, 'MasterCard', TO_TIMESTAMP('2022-08-02 06:14:00', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO pay VALUES (
    3, 1, 400, 'AmExpress', TO_TIMESTAMP('2022-09-02 06:14:00', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO deliveryto VALUES (
    1, 1, 1, TO_DATE('2022-03-07', 'YYYY-MM-DD'), NULL
);

INSERT INTO deliveryto VALUES (
    1, 1, 2, TO_DATE('2022-11-06', 'YYYY-MM-DD'), NULL
);

INSERT INTO deliveryto VALUES (
    1, 1, 3, TO_DATE('2022-6-21', 'YYYY-MM-DD'), NULL
);

INSERT INTO paymentinfo VALUES (
    1, 123456785696321, 'Visa'
);

INSERT INTO paymentinfo VALUES (
    2, 123853123576321, 'MasterCard'
);

INSERT INTO paymentinfo VALUES (
    3, 1312345678912321, 'AmExpress'
);