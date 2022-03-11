-- Combination of WHERE, GROUP BY, Having, Order BY 
		SELECT c.country, c.city, COUNT(*) As cnt
		FROM customers c
		where c.country LIKE '%a%'
		GROUP BY c.country, c.city
		Having cnt < 3
		ORDER BY cnt DESC;
-- Functions for DATE/DATETIME/TIMESTAMP
		SELECT HOUR(OrderDate) AS hour, MINUTE(OrderDate) AS minutes, SECOND(OrderDate) AS seconds, DAY(OrderDate) AS day, MONTH(OrderDate) AS month, YEAR(OrderDate) AS year  
		FROM orders;
--  Window Functions
	-- 1.ROW_NUMBER() - First it partition the table on basis of column ContactTitle and then assigns the row number in a partition.
		SELECT CustomerID, CompanyName, ContactName, ContactTitle,  
		ROW_NUMBER() OVER(partition by ContactTitle order by ContactTitle) as rn
		FROM customers
        ORDER BY ContactTitle;

	-- 2.LEAD(columnName, offset) - when we are processing ith row then this function allows us to know the data in subsequent rows. 
		SELECT  C.CustomerID, X.3_times_repeated, C.ContactName, C.ContactTitle
		FROM
			(SELECT DISTINCT CustomerID, 
			CASE WHEN EmployeeID = LEAD(EmployeeID) OVER(ORDER BY CustomerID)
					AND EmployeeID = LEAD(EmployeeID, 2) OVER(ORDER BY CustomerID)
					THEN CustomerID
					ELSE NULL
			END AS 3_times_repeated
			FROM orders) X
		LEFT JOIN customers C ON X.CustomerID = C.CustomerID
		WHERE X.3_times_repeated IS NOT NULL;

	-- 2.LAG(columnName, offset) - when we are processing ith row then this function allows us to know the data in previous rows. 
		SELECT  C.CustomerID, X.3_times_repeated, C.ContactName, C.ContactTitle
		FROM
			(SELECT DISTINCT CustomerID, 
			CASE WHEN EmployeeID = LAG(EmployeeID) OVER(ORDER BY CustomerID)
					AND EmployeeID = LAG(EmployeeID, 2) OVER(ORDER BY CustomerID)
					THEN CustomerID
					ELSE NULL
			END AS 3_times_repeated
			FROM orders) X
		LEFT JOIN customers C ON X.CustomerID = C.CustomerID
		WHERE X.3_times_repeated IS NOT NULL;
	-- 3.MAX() - gives the max in a partition
		--this query is for which product was sold maximum per month on the basis of orders
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
		GROUP BY maxFreq.month