-- create database for E-commerce scenario
create database ecommerce;
use ecommerce;
-- drop database ecommerce;
-- create tables

CREATE TABLE customers (
    Customer_id INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10),
    Minit VARCHAR(3),
    Lname VARCHAR(10),
    CPF CHAR(11),
    CNPJ CHAR(14),
    Address VARCHAR(100),
    Bdate DATE,
    Credit_card CHAR(16),
    Debit_card CHAR(16),
    CONSTRAINT unique_cpf_customer UNIQUE (CPF),
    CONSTRAINT unique_cnpj_customer UNIQUE (CNPJ),
    CONSTRAINT unique_ccard_customer UNIQUE (Credit_card),
    CONSTRAINT unique_dcard_customer UNIQUE (Debit_card)
);

alter table customers auto_increment=1;

CREATE TABLE products (
    Product_id INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(30),
    Classification_kids BOOL DEFAULT FALSE,
    Category ENUM('Electronics', 'Clothes', 'Toys', 'Food', 'Furniture', 'Books') NOT NULL,
    Review_score FLOAT DEFAULT 0,
    Dimensions VARCHAR(10),
    Price FLOAT NOT NULL
);

CREATE TABLE suppliers (
    Supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    Sup_name VARCHAR(50) NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    Address VARCHAR(100),
    Phone CHAR(11) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE (CNPJ)
);

CREATE TABLE sellers (
    Seller_id INT AUTO_INCREMENT PRIMARY KEY,
    Sel_name VARCHAR(50) NOT NULL,
    CNPJ CHAR(14),
    CPF CHAR(9),
    Address VARCHAR(100),
    Phone CHAR(11) NOT NULL,
    CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ),
    CONSTRAINT unique_cpf_seller UNIQUE (CPF)
);

CREATE TABLE shipping_companies (
    Shipping_company_id INT AUTO_INCREMENT PRIMARY KEY,
    Ship_Name VARCHAR(50) NOT NULL,
    CNPJ CHAR(14),
    Address VARCHAR(100),
    Phone CHAR(11) NOT NULL,
    CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ)
);

-- to be continued on challenge: finish implementing this table and create the required links
-- these updates should be included in the conceptual schema
CREATE TABLE payments (
    Payment_id INT AUTO_INCREMENT,
    Customer_id INT,
    Payment_method ENUM('Invoice', 'Pix', 'Credit_card', 'Debit_card', 'Paypal'),
    Payment_total FLOAT NOT NULL,
    PRIMARY KEY (Payment_id , Customer_id),
    CONSTRAINT fk_payment_customer FOREIGN KEY (Customer_id)
        REFERENCES customers (Customer_id)
);

CREATE TABLE orders (
    Order_id INT AUTO_INCREMENT PRIMARY KEY,
    Customer_id INT,
    Product_id INT,
    Quantity INT DEFAULT 1,
    Order_status ENUM('Processing', 'Placed', 'Shipped', 'Delivered') DEFAULT 'Processing',
    Order_description VARCHAR(300),
    Billing_price FLOAT NOT NULL,
    Shipping_price FLOAT NOT NULL,
    Tracking_number VARCHAR(50),
    CONSTRAINT fk_order_customer_id FOREIGN KEY (Customer_id)
        REFERENCES customers (Customer_id),
    CONSTRAINT fk_order_product_id FOREIGN KEY (Product_id)
        REFERENCES products (Product_id)
);


CREATE TABLE warehouses (
    Warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
    Supplier_id INT,
    Product_id INT,
    Address VARCHAR(100) NOT NULL,
    Phone CHAR(11) NOT NULL,
    Quantity INT DEFAULT 0,
    CONSTRAINT fk_warehouse_supplier FOREIGN KEY (Supplier_id)
        REFERENCES suppliers (Supplier_id),
    CONSTRAINT fk_warehouse_product FOREIGN KEY (Product_id)
        REFERENCES products (Product_id)
);



CREATE TABLE for_sale (
    Seller_id INT,
    Product_id INT,
    Quantity INT DEFAULT 1,
    PRIMARY KEY (Seller_id , Product_id),
    CONSTRAINT fk_for_sale_sellers FOREIGN KEY (Seller_id)
        REFERENCES sellers (Seller_id),
    CONSTRAINT fk_for_sale_products FOREIGN KEY (Product_id)
        REFERENCES products (Product_id)
);


CREATE TABLE shipping (
    Shipping_company_id INT,
    Order_id INT,
    Shipping_date DATE,
    Delivery_date DATE,
    PRIMARY KEY (Shipping_company_id , Order_id),
    CONSTRAINT fk_shipping_companies FOREIGN KEY (Shipping_company_id)
        REFERENCES shipping_companies (Shipping_company_id),
    CONSTRAINT fk_shipping_orders FOREIGN KEY (Order_id)
        REFERENCES orders (Order_id)
);


