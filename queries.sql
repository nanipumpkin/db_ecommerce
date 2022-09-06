use ecommerce;
show tables;

--  returns which product category has the largest number of orders overall;
SELECT 
    Category, COUNT(Category) AS Number_of_orders
FROM
    products
GROUP BY Category
ORDER BY Number_of_orders DESC
LIMIT 1;

-- returns which product category has the largest budget;
SELECT DISTINCT
    Category, SUM(Price) AS Budget_by_category
FROM
    products
GROUP BY Category
ORDER BY Budget_by_category DESC;

-- returns which product category has the best avg review score;
SELECT DISTINCT
    Category, AVG(Review_score) AS Average_review_score
FROM
    products
GROUP BY Category
ORDER BY Average_review_score DESC;

-- returns a list of orders are placed and waiting for shipment
SELECT 
    *
FROM
    orders
WHERE
    order_status = 'Placed';

-- returns a list of sellers located in the city of Sao Paulo
SELECT 
    *
FROM
    sellers
WHERE
    Address LIKE '%Sao Paulo%';

-- returns list of products by seller
SELECT 
    Seller_id, Product_id
FROM
    for_sale
GROUP BY Seller_id;


-- returns which seller has the largest bill
SELECT 
    Sel_name, Billing_price
FROM
    for_sale
        INNER JOIN
    orders USING (Product_id)
        INNER JOIN
    sellers USING (Seller_id)
ORDER BY Billing_price DESC;
 