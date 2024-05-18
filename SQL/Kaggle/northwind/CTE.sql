/* WITH CLAUSE  - In below query avg_price is alias for a table that has a column named avg_unitPrice which is output
                  of Inner SELECT query. So output columns form Inner SELECT query will be parameter to our table that
                  has alias name avg_price. */

WITH avg_price(avg_unitPrice) AS
    (SELECT AVG(p.unitprice)
     FROM products p )
SELECT p.productid, p.productname, p.categoryid, p.unitprice, avg_unitprice
FROM products p, avg_price ap
WHERE p.unitprice > ap.avg_unitprice;

/* Recursive Query -
   SYNTAX -
   WITH RECURSIVE cte_name AS
    (SELECT (non_recursive_query or the_base_query)
     UNION [ALL]
     SELECT (recursive_query using cte_name [with a termination condition])
    )
   SELECT * FROM cte_name;
   */
/* Find the hierarchy of employees under a given manager "Asha". */
/* WITH RECURSIVE emp_hierarchy AS
   (SELECT id, name, manager_id, designation, 1 as lvl
    FROM emp_details WHERE name='Asha'
    UNION
    SELECT e.id, e.name, e.manager_id, e.designation, h.lvl + 1 as lvl
    FROM emp_hierarchy h JOIN emp_details e ON h.id=e.manager_id) */