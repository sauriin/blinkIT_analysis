------------------------------------------------------------
-- BLINKIT SQL ANALYTICS PROJECT
-- Phase 6 : SQL Analytics
------------------------------------------------------------


------------------------------------------------------------
-- Query 1: Product Revenue Analysis
-- Business Question:
-- Which product categories generate highest revenue?
------------------------------------------------------------

SELECT
Item_Type,
SUM(Item_Outlet_Sales) AS TotalSales
FROM blinkit
GROUP BY Item_Type
ORDER BY TotalSales DESC;

-- Insight:
-- Fruits & Vegetables generated highest revenue
-- Seafood generated lowest revenue



------------------------------------------------------------
-- Query 2: Outlet Type Revenue Analysis
------------------------------------------------------------

SELECT
Outlet_Type,
SUM(Item_Outlet_Sales) AS TotalSales
FROM blinkit
GROUP BY Outlet_Type
ORDER BY TotalSales DESC;

-- Insight:
-- Supermarket Type1 generated highest revenue
-- Grocery Stores generated lowest revenue



------------------------------------------------------------
-- Query 3: Location Tier Analysis
------------------------------------------------------------

SELECT
Outlet_Location_Type,
SUM(Item_Outlet_Sales) AS TotalSales
FROM blinkit
GROUP BY Outlet_Location_Type
ORDER BY TotalSales DESC;

-- Insight:
-- Tier 3 generated highest total revenue



------------------------------------------------------------
-- Query 4: Outlet Size Analysis
------------------------------------------------------------

SELECT
Outlet_Size,
AVG(Item_Outlet_Sales) AS AvgSales
FROM blinkit
GROUP BY Outlet_Size
ORDER BY AvgSales DESC;

-- Insight:
-- High-size outlets generated highest average sales



------------------------------------------------------------
-- Query 5: Fat Content Analysis
------------------------------------------------------------

SELECT
Item_Fat_Content,
AVG(Item_Outlet_Sales) AS AvgSales
FROM blinkit
GROUP BY Item_Fat_Content
ORDER BY AvgSales DESC;

-- Insight:
-- Regular products slightly outperform Low Fat products



------------------------------------------------------------
-- Query 6: Top Products Analysis
------------------------------------------------------------

SELECT
Item_Identifier,
SUM(Item_Outlet_Sales) AS TotalSales
FROM blinkit
GROUP BY Item_Identifier
ORDER BY TotalSales DESC
LIMIT 10;



------------------------------------------------------------
-- Query 7: Product Category + Product Analysis
------------------------------------------------------------

SELECT
Item_Type,
Item_Identifier,
SUM(Item_Outlet_Sales) AS TotalSales
FROM blinkit
GROUP BY Item_Type,Item_Identifier
ORDER BY TotalSales DESC
LIMIT 10;



------------------------------------------------------------
-- Query 8: Outlet Revenue Analysis
------------------------------------------------------------

SELECT
Outlet_Identifier,
SUM(Item_Outlet_Sales) AS TotalSales
FROM blinkit
GROUP BY Outlet_Identifier
ORDER BY TotalSales DESC;



------------------------------------------------------------
-- Query 9: Outlet Performance Details
------------------------------------------------------------

SELECT
Outlet_Identifier,
Outlet_Type,
Outlet_Location_Type,
Outlet_Size,
SUM(Item_Outlet_Sales) AS TotalSales
FROM blinkit
GROUP BY Outlet_Identifier
ORDER BY TotalSales DESC;



------------------------------------------------------------
-- Query 10: Average Outlet Performance
------------------------------------------------------------

SELECT
Outlet_Identifier,
AVG(Item_Outlet_Sales) AS AvgSales
FROM blinkit
GROUP BY Outlet_Identifier
ORDER BY AvgSales DESC;



------------------------------------------------------------
-- Query 11: Ranking Outlets Using Window Function
------------------------------------------------------------

SELECT
Outlet_Identifier,
AvgSales,

RANK() OVER(
ORDER BY AvgSales DESC
) AS SalesRank

FROM
(
SELECT
Outlet_Identifier,
AVG(Item_Outlet_Sales) AS AvgSales
FROM blinkit
GROUP BY Outlet_Identifier
);



------------------------------------------------------------
-- Query 12: Top 3 Performing Outlets
------------------------------------------------------------

SELECT *
FROM
(
SELECT
Outlet_Identifier,
AvgSales,

RANK() OVER(
ORDER BY AvgSales DESC
) AS SalesRank

FROM
(
SELECT
Outlet_Identifier,
AVG(Item_Outlet_Sales) AS AvgSales
FROM blinkit
GROUP BY Outlet_Identifier
) temp1

) temp2

WHERE SalesRank <=3;



------------------------------------------------------------
-- Query 13: Bottom 3 Performing Outlets
------------------------------------------------------------

SELECT *
FROM
(
SELECT
Outlet_Identifier,
AvgSales,

RANK() OVER(
ORDER BY AvgSales ASC
) AS SalesRank

FROM
(
SELECT
Outlet_Identifier,
AVG(Item_Outlet_Sales) AS AvgSales
FROM blinkit
GROUP BY Outlet_Identifier
) temp1

) temp2

WHERE SalesRank <=3;



------------------------------------------------------------
-- Query 14: Product Sales Classification
------------------------------------------------------------

SELECT
Item_Identifier,
SUM(Item_Outlet_Sales) AS TotalSales,

CASE

WHEN SUM(Item_Outlet_Sales)>30000
THEN 'High Sales'

WHEN SUM(Item_Outlet_Sales)>15000
THEN 'Medium Sales'

ELSE 'Low Sales'

END AS SalesCategory

FROM blinkit
GROUP BY Item_Identifier
ORDER BY TotalSales DESC
LIMIT 15;

-- Insight:
-- Products classified as High, Medium and Low Sales



------------------------------------------------------------
-- Query 15: CTE Example
------------------------------------------------------------

WITH OutletSales AS
(
SELECT
Outlet_Identifier,
AVG(Item_Outlet_Sales) AS AvgSales
FROM blinkit
GROUP BY Outlet_Identifier
)

SELECT *
FROM OutletSales
ORDER BY AvgSales DESC;



------------------------------------------------------------
-- Query 16: CTE + Ranking
------------------------------------------------------------

WITH OutletSales AS
(
SELECT
Outlet_Identifier,
AVG(Item_Outlet_Sales) AS AvgSales
FROM blinkit
GROUP BY Outlet_Identifier
),

RankedOutlets AS
(
SELECT
Outlet_Identifier,
AvgSales,

RANK() OVER(
ORDER BY AvgSales DESC
) AS SalesRank

FROM OutletSales
)

SELECT *
FROM RankedOutlets
WHERE SalesRank <=3;



------------------------------------------------------------
-- Query 17: Outlet Type Ranking
------------------------------------------------------------

SELECT
Outlet_Type,
AVG(Item_Outlet_Sales) AS AvgSales,

RANK() OVER(
ORDER BY AVG(Item_Outlet_Sales) DESC
) AS SalesRank

FROM blinkit
GROUP BY Outlet_Type;



------------------------------------------------------------
-- Query 18: Location Ranking
------------------------------------------------------------

SELECT
Outlet_Location_Type,
AVG(Item_Outlet_Sales) AS AvgSales,

RANK() OVER(
ORDER BY AVG(Item_Outlet_Sales) DESC
) AS SalesRank

FROM blinkit
GROUP BY Outlet_Location_Type;



------------------------------------------------------------
-- Query 19: Item Type Ranking
------------------------------------------------------------

SELECT
Item_Type,
AVG(Item_Outlet_Sales) AS AvgSales,

RANK() OVER(
ORDER BY AVG(Item_Outlet_Sales) DESC
) AS SalesRank

FROM blinkit
GROUP BY Item_Type;



------------------------------------------------------------
-- Query 20: Rank vs Dense Rank vs Row Number
------------------------------------------------------------

SELECT
Item_Type,
AVG(Item_Outlet_Sales) AS AvgSales,

RANK() OVER(
ORDER BY AVG(Item_Outlet_Sales) DESC
) AS Rank_Value,

DENSE_RANK() OVER(
ORDER BY AVG(Item_Outlet_Sales) DESC
) AS Dense_Rank_Value,

ROW_NUMBER() OVER(
ORDER BY AVG(Item_Outlet_Sales) DESC
) AS Row_Num

FROM blinkit
GROUP BY Item_Type;



------------------------------------------------------------
-- Query 21: Final Business Recommendation
------------------------------------------------------------

SELECT
Item_Type,
SUM(Item_Outlet_Sales) AS TotalSales,
AVG(Item_Outlet_Sales) AS AvgSales,

CASE

WHEN SUM(Item_Outlet_Sales)>2000000
AND AVG(Item_Outlet_Sales)>2200

THEN 'Priority Category'

ELSE 'Normal Category'

END AS Recommendation

FROM blinkit
GROUP BY Item_Type
ORDER BY TotalSales DESC;

-- Insight:
-- Fruits & Vegetables, Snack Foods, and Household
-- were identified as Priority Categories.

-- Reason:
-- These categories showed both:
-- 1. High Total Revenue
-- 2. Strong Average Sales

-- Business Recommendation:

-- Increase Inventory:
-- ✔ Fruits & Vegetables
-- ✔ Snack Foods
-- ✔ Household

-- Maintain:
-- ✔ Dairy
-- ✔ Canned
-- ✔ Frozen Foods

-- Investigate:
-- ✔ Seafood
-- ✔ Starchy Foods

-- Reason:
-- High AvgSales but low total revenue indicates
-- strong transaction value with lower purchase volume.

-- Final Conclusion:
-- Priority decisions should consider both
-- Total Sales and Average Sales instead of
-- relying on a single metric.