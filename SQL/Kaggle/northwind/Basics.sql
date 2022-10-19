/* Combination of WHERE, GROUP BY, Having, Order BY  */

		SELECT c.country, c.city, COUNT(*) As cnt
		FROM customers c
		where c.country LIKE '%a%'
		GROUP BY c.country, c.city
		Having cnt < 3
		ORDER BY cnt DESC;

/* Functions for DATE/DATETIME/TIMESTAMP */

		SELECT HOUR(OrderDate) AS hour, MINUTE(OrderDate) AS minutes, SECOND(OrderDate) AS seconds, DAY(OrderDate) AS day, MONTH(OrderDate) AS month,
		       YEAR(OrderDate) AS year
		FROM orders;

        SELECT DATE_ADD(SYSDATE(), INTERVAL 10 DAY );
/* Loops in MySQL - By default, for a CREATE FUNCTION statement to be accepted, at least one of DETERMINISTIC, NO SQL, or READS SQL DATA
                    must be specified explicitly. Otherwise an error occurs*/
    /* Loop */
        DELIMITER $$
        DROP FUNCTION IF EXISTS fact_loop;
        CREATE FUNCTION fact_loop(n INT)
            RETURNS INT
            READS SQL DATA
            DETERMINISTIC
            BEGIN
                DECLARE result INT DEFAULT 1;
                myLoop : LOOP
                    IF n > 0 THEN
                        SET result = result * n;
                        SET n = n - 1;
                    ELSE LEAVE myloop;
                    END IF;
                END LOOP myloop;
                RETURN result;
            END $$
        SELECT fact_loop(5);
    /* WHILE */
        DELIMITER $$
        DROP FUNCTION IF EXISTS fact_loop;
        CREATE FUNCTION fact_loop(n INT)
            RETURNS INT
            READS SQL DATA
            DETERMINISTIC
            BEGIN
                DECLARE result INT DEFAULT 1;
                myLoop : WHILE
                    n > 0 DO
                        SET result = result * n;
                        SET n = n - 1;
                END WHILE myloop;
                RETURN result;
            END $$
        SELECT fact_loop(6);
    /* REPEAT */
        DELIMITER $$
        DROP FUNCTION IF EXISTS fact_loop;
        CREATE FUNCTION fact_loop3(n INT)
            RETURNS INT
            READS SQL DATA
            DETERMINISTIC
            BEGIN
                DECLARE result INT DEFAULT 1;
                myLoop : REPEAT
                        SET result = result * n;
                        SET n = n - 1;
                        UNTIL n <= 0
                END REPEAT myloop;
                RETURN result;
            END $$
        SELECT fact_loop(7);