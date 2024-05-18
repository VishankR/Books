-- Combination of WHERE, GROUP BY, Having, Order BY 
    SELECT COUNT(ae.Name) count, ae.NOC, ae.Games
    FROM athlete_events ae
    WHERE ae.NOC LIKE '%U%'
    GROUP BY ae.NOC, ae.Games
    HAVING count > 7
    ORDER BY count ASC;