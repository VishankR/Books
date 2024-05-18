/* SYNTEX -
   DELIMITER any_symbol
   DROP PROCEDURE IF EXISTS procedure_name();
   CREATE OR REPLACE PROCEDURE procedure_name(p1_name DATA_TYPE, p2_name DATA_TYPE)
   BEGIN
   DECLARE var_name DATA_TYPE;
   procedure_body(all the statements)
   END any_symbol */
/* Without parameter procedure */
   DELIMITER $$
   DROP PROCEDURE IF EXISTS getOrdersNumber;
   CREATE PROCEDURE getOrdersNumber()
   BEGIN
    DECLARE totalOrders INT;
    SELECT COUNT(o.orderID) INTO totalorders
    FROM orders o;
    SELECT totalorders;
   END $$

/* How do we call the procedure */
    CALL getOrdersNumber();

/* With parameter procedure */
   DELIMITER $$
   DROP PROCEDURE IF EXISTS getOrdersNumberForCustomer;
   CREATE PROCEDURE getOrdersNumberForCustomer(IN customerID VARCHAR(5))
   BEGIN
    DECLARE totalOrders INT ;
    SELECT COUNT(o.orderID) INTO totalorders
    FROM orders o
    WHERE o.customerID = customerID;
    SELECT totalorders, CustomerID;
   END $$

/* How do we call the procedure */
   SET @customerCode = 'VINET';
    CALL getOrdersNumberForCustomer(@customerCode);