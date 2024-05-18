    /* Window Functions(Analytics Functions) - A window function performs an aggregate-like operation on a set of query rows. However,
                                               whereas an aggregate operation groups query rows into a single result row, a window function produces
                                               a result for each query row*/
    /* 1.OVER() - OVER clause that specifies how to partition query rows into groups for processing by the window function.
                  -If OVER clause is empty, which treats the entire set of query rows as a single partition. The window function thus produces a global
                  sum, but does so for each row.
                  -If we use PARTITION BY clause with OVER function like OVER(PARTITION BY column_name) then for every distinct value of column_name it
                  will create a window and then it will apply aggregate function on each of those windows separately.
                  -If we use ORDER BY clause as well with OVER function like OVER(PARTITION BY column1_name ORDER BY column2_name) then it will sort
                  all the records in each window separately by column2_name. */

        SELECT p.productid, p.productname, p.unitprice,
               MAX(p.unitprice) OVER() as max_price
        FROM products p;

        SELECT p.productid, p.productname, p.unitprice, p.categoryid,
               MAX(p.unitprice) OVER(PARTITION BY p.categoryid) as max_price
        FROM products p;

        SELECT p.productid, p.productname, p.unitprice, p.categoryid,
               MAX(p.unitprice) OVER(PARTITION BY p.categoryid) as max_price
        FROM products p
        ORDER BY p.productid ;



	/* 2.ROW_NUMBER() - First it partition the table on basis of column ContactTitle and then assigns the row number in a partition. */

		SELECT CustomerID, CompanyName, ContactName, ContactTitle,  
		ROW_NUMBER() OVER(partition by ContactTitle order by contactname) as rn
		FROM customers
        ORDER BY ContactTitle;

	/* 3.LEAD(c1, offset, defaultValue) - when we are processing ith row then this function will populate  value of column c1 of (current row + offset)th
	                                      row in front of current row and if there is next row then it will print default value.  */

	    SELECT o.customerid, o.shipname, o.shipcity, o.shipcountry, o.employeeid,
	           LEAD(o.EmployeeID, 2) OVER(ORDER BY o.CustomerID) AS nextToNext_record_empId
		FROM orders o;

		SELECT  C.CustomerID, X.three_times_repeated, C.ContactName, C.ContactTitle
		FROM
			(SELECT DISTINCT CustomerID, 
			CASE WHEN EmployeeID = LEAD(EmployeeID) OVER(ORDER BY CustomerID)
					AND EmployeeID = LEAD(EmployeeID, 2) OVER(ORDER BY CustomerID)
					THEN CustomerID
					ELSE NULL
			END AS three_times_repeated
			FROM orders) X
		LEFT JOIN customers C ON X.CustomerID = C.CustomerID
		WHERE X.three_times_repeated IS NOT NULL;

	/* 4.LAG(c1, offset, defaultValue) - when we are processing ith row then this function will populate  value of column c1 of (current row - offset)th
	                                     row in front of current row and if there is previous row then it will print default value. */

	    SELECT o.customerid, o.shipname, o.shipcity, o.shipcountry, o.employeeid,
	           LAG(o.EmployeeID, 2) OVER(ORDER BY o.CustomerID) AS secondPrev_record_empId
		FROM orders o;

		SELECT  C.CustomerID, X.three_times_repeated, C.ContactName, C.ContactTitle
		FROM
			(SELECT DISTINCT CustomerID, 
			CASE WHEN EmployeeID = LAG(EmployeeID) OVER(ORDER BY CustomerID)
					AND EmployeeID = LAG(EmployeeID, 2) OVER(ORDER BY CustomerID)
					THEN CustomerID
					ELSE NULL
			END AS three_times_repeated
			FROM orders) X
		LEFT JOIN customers C ON X.CustomerID = C.CustomerID
		WHERE X.three_times_repeated IS NOT NULL;

	/* 5.MAX() - gives the max in a partition --this query is for which product was sold maximum per month on the basis of orders. */

		SELECT maxfreq.month, maxFreq.ProductID,
		MAX(maxFreq.maxrnk)
		FROM
			(SELECT DISTINCT rnks.ProductID, rnks.month,
			COUNT(rnks.rnk) OVER(PARTITION BY rnks.month, rnks.rnk) maxrnk
			FROM
				(SELECT *,
				DENSE_RANK() OVER(PARTITION BY prodid.month ORDER BY prodid.ProductID) as rnk
				FROM (SELECT o.OrderID, od.ProductID, o.OrderDate, MONTH(o.OrderDate) month
						FROM orders o LEFT JOIN `order details` od ON o.OrderID = od.OrderID) prodid) rnks) maxFreq
		GROUP BY maxFreq.month;

    /* 6.RANK() - It produces ranks with gaps. If we use RANK function like this RANK() OVER(PARTITION BY c1 OREDR BY c2) then on the basis of c2 it will
                  assign ranks to the records in a window(Partition) and if it founds duplicate value in c2 column then it will assign the same rank
                  to this record as well and (current rank + records) to next record. */

        SELECT CustomerID, CompanyName, ContactName, ContactTitle, City,
		RANK() OVER(partition by ContactTitle order by city) as ranks
		FROM customers;

    /* 7.DENSE_RANK() - It produces ranks without gaps. If we use DENSE_RANK function like this DENSE_RANK() OVER(PARTITION BY c1 OREDR BY c2) then on
                        the basis of c2 it will assign ranks to the records in a window and if it founds duplicate value in c2 column then it will assign
                        the same rank to this record as well and (current rank + 1) to next record. */

        SELECT CustomerID, CompanyName, ContactName, ContactTitle, City,
		DENSE_RANK() OVER(partition by ContactTitle order by city) as ranks
		FROM customers;

    /* 8.FIRST_VALUE(c1) - It gives the very first record of every window.
         LAST_VALUE(c1)  - It gives the very last record of every window.
         NTH_VALUE(c1)   - It gives the nth record of every window.
         Frame Clause    - It is a subset of window(Partition) and aggregate function on a frame at a time.
                           Default Frame - range between unbounded preceding and current row
                           Fix - range between unbounded preceding and unbounded following
                           - rows between unbounded preceding and current row - It will consider current row as current row whether those rows
                                                                                are duplicate or not.
                           - range between unbounded preceding and current row - It will not consider current row as current row if there are duplicate
                                                                                 rows. It will take last duplicated record as a current row in a frame.

                           - range between r1 preceding and r2 following - It will take r1(eg. 1/2/3...) previous record from current row and
                                                                           r2(eg. Any INT value) next row from current row in its frame. */

        SELECT p.productid, p.productname, p.categoryid, p.unitprice,
               FIRST_VALUE(p.unitprice) over(PARTITION BY p.categoryid ORDER BY p.unitprice DESC) as first,
               LAST_VALUE(p.unitprice) OVER (PARTITION BY p.categoryid ORDER BY p.unitprice DESC
                                                RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as last,
               NTH_VALUE(p.unitprice, 2) OVER (PARTITION BY p.categoryid ORDER BY p.unitprice DESC
                                                RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as second
        FROM products p;

        /* Instead of repeating over class again and again we can create a alias for our OVER condition like -
           window w as (PARTITION BY p.categoryid ORDER BY p.unitprice DESC RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) */

        SELECT p.productid, p.productname, p.categoryid, p.unitprice,
               FIRST_VALUE(p.unitprice) over w as first,
               LAST_VALUE(p.unitprice) OVER w as last,
               NTH_VALUE(p.unitprice, 2) OVER w as second
        FROM products p
        WINDOW w AS (PARTITION BY p.categoryid ORDER BY p.unitprice DESC RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING);

        SELECT p.productid, p.productname, p.categoryid, p.unitprice,
               LAST_VALUE(p.unitprice) OVER (PARTITION BY p.categoryid ORDER BY p.unitprice DESC
                                                ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) as last
        FROM products p;

        SELECT p.productid, p.productname, p.categoryid, p.unitprice,
               LAST_VALUE(p.unitprice) OVER (PARTITION BY p.categoryid ORDER BY p.unitprice DESC
                                                RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW ) as last
        FROM products p;

    /* 9.NTILE(N) - Divides a partition into N groups (buckets) (it tries its best to divide records groups evenly), assigns each row in the partition
                    its bucket number, and returns the bucket number of the current row within its partition. For example, if N is 4, NTILE()
                    divides rows into four buckets. If N is 100, NTILE() divides rows into 100 buckets. */
        SELECT p.productid, p.productname, p.categoryid, p.unitprice,
               NTILE(5) OVER (ORDER BY p.unitprice) AS bucketNumber
        FROM products p;

    /* 10.CUME_DIST() - Returns the cumulative distribution of a value within a group of values. It basically shows how much contributionn a row and its
                        preceding rows have in its partition. eg . Below query shows all products which are constituting first 75% of the data in products
                        table based on unitprice.(only 38 records show ~50% data). It means if we take first 38 records from the table, we have taken ~50%
                        of data of this whole table. */

        SELECT p.productid, p.productname, p.categoryid, p.unitprice,
               CUME_DIST() OVER (ORDER BY p.unitprice) AS cume_distribution,
               ROUND(CUME_DIST() OVER (ORDER BY p.unitprice) * 100, 2) AS cume_dist_percentage
        FROM products p;

    /* 11.PERCENT_RANK() - Returns the percentage of partition values less than the value in the current row, excluding the highest value. eg. If we
                           want to know that how much percentage more expensive "Vegie-spread" product is when compare to all products. 87.01% more
                           expensive than all other products in the table. */

        SELECT p.productid, p.productname, p.categoryid, p.unitprice,
               PERCENT_RANK() OVER (ORDER BY p.unitprice) AS cume_distribution,
               ROUND(CUME_DIST() OVER (ORDER BY p.unitprice) * 100, 2) AS cume_dist_percentage
        FROM products p;