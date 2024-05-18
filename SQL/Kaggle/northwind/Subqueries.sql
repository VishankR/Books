/* Subquery - Subquery is simple a query which is used inside another query. */
/* There are 3 types of subqueries 1. Scalar Subquery 2. Multiple Row Subquery 3. Correlated Subquery */

    /*1. Scalar Subquery - Always return 1 Row & 1 Column  */

        SELECT *
        FROM products p
        WHERE p.unitprice > (SELECT AVG(p2.unitprice)
                             FROM products p2 );

    /*2. Multiple Subquery - (i) - Multiple Columns & Multiple Rows (ii) - 1 Column & Multiple Rows */

        SELECT o.shipname, o.orderdate
        FROM orders o
        WHERE (o.orderid)
                  IN (SELECT od.orderid, od.productid, MAX(od.quantity)
                      FROM `order details` od
                      GROUP BY od.productid)