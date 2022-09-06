use ecommerce;
show tables;

insert into customers (Fname, Minit, Lname, CPF, Address)
	values('Sabrina', 'C', 'Silva', 21345647812, 'Rua Conselheiro Mafra, 1200, Centro, Florianopolis'),
		  ('Valeria', NULL, 'Pimentel', 12347891231, 'Rua Mauricio Spalding de Souza, 45, Corrego Grande, Florianopolis'),
          ('Ricardo', NULL, 'Bragaglia', 47219534801, 'Avenida Alameda Vinha, 109, Joao Paulo, Florianopolis'),
          ('Julia', 'M', 'Costa', 08754943802, 'Rua Delminda Silveira, 245, Agronomica, Florianopolis'),
          ('Maria', 'E', 'Costa', 07113249457, 'Rua Lauro Linhares, 1730, Trindade, Florianopolis'),
          ('Carolina', NULL, 'Palermo', 47987269752, 'Rua das Laranjeiras, 203, Jurere, Florianopolis');
          
insert into products (Pname, Classification_kids, Category, Review_score, Dimensions, Price)
	values('Understanding Criminal Law', false, 'Books', '3', null, 100),
		  ('Earphones', false, 'Electronics', '4', null, 150),
          ('Printer', false, 'Electronics', '5', null, 500),
          ('Barbie Elsa', true, 'Toys', '3', null, 90),
          ('Microphone Vedo - Youtuber', false, 'Electronics', '4', null, 150),
          ('Sofa bed', false, 'Furniture', '4', '280x90x85', 3500);
          
insert into suppliers(Sup_name, CNPJ, Address, Phone)
	values('Martins Fontes', 98110214000154, 'Avenida Madre Benvenuta, 840, Santa Monica, Florianopolis', 48994522020),
		  ('Multilaser', 18445243000122, 'Avenida Paulista, 1450, Centro, São Paulo', 11996608888),
          ('Epson', 2345678900112, 'Rua Nove de Julho, 245, Centro, São Paulo', 11988844000),
          ('Estrela', 4512345600145, 'Avenida Joaquim Lemos da Silva, 514, Centro, São José', 48999961936),
          ('Herval', 78456123000198, 'Avenida João Varela, 810, Centro, Porto Alegre', 51992234522);

insert into sellers(Sel_name, CPF, CNPJ, Address, Phone)
	values('Livraria Saraiva', null, 10416789000121, 'Avenida Madre Benvenuta, 840, Santa Monica, Florianopolis', 48994522020),
		  ('Multisom', null, 21456985000119, 'Avenida Paulista, 1450, Centro, São Paulo', 11996608888),
          ('Kalunga', null, 23456789000178, 'Rua Nove de Julho, 245, Centro, São Paulo', 11988844000),
          ('HiHappy', null, 47209750000154, 'Avenida Joaquim Lemos da Silva, 514, Centro, São José', 48999961936),
          ('Tok&Stok', null, 1587912300155, 'Avenida João Varela, 810, Centro, Porto Alegre', 51992234522);          

insert into shipping_companies(ship_name, CNPJ, Address, Phone)
	values('Jadlog', 54024514000112, 'Avenida Paulista, 1450, Centro, São Paulo', 11996608888),
          ('Total Express', 65925512000145, 'Avenida Joaquim Lemos da Silva, 514, Centro, São José', 48999961936),
          ('Rede Sul', 87217874000124, 'Avenida João Varela, 810, Centro, Porto Alegre', 51992234522);

insert into orders(Customer_id, Product_id, Quantity, Order_status, Order_description, Billing_price, Shipping_price, Tracking_number)
	values(1, 1, 1, default, 'web purchase', 100, 15, 789456123),
		  (2, 2, 1, default, 'app purchase', 150, 15, 456789321),
          (3, 3, 1, default, 'web purchase', 500, 10, 123456789),
          (4, 4, 1, 'Placed', 'app purchase', 90, 15, 147852963),
          (5, 5, 1, 'Shipped', 'web purchase', 150, 15, 459631478),
          (6, 6, 1, default, null, 3500, 75, 786541231);

insert into for_sale(Seller_id, Product_id, Quantity)
	values(1, 1, 20),
		  (2, 2, 50),
          (2, 5, 25),
		  (3, 3, 10),
          (4, 4, 50),
          (5, 6, 5);

insert into shipping(Order_id, Shipping_company_id, Shipping_date, Delivery_date)
	values(1, 2, '2022-08-30', '2022-09-04'),
		  (2, 3, '2022-09-01', '2022-09-05'),
          (3, 1, '2022-08-29', '2022-09-10'),
          (4, 2, '2022-08-27', '2022-09-02'),
          (5, 1, '2022-08-30', '2022-09-04'),
          (6, 3, '2022-08-27', '2022-09-15');

insert into warehouses(Supplier_id, Product_id, Address, Phone, Quantity)
	values(1, 1, 'Rua Francisco Tolentino, 290, Kobrasol, São José', 48996521110, 100),
		  (2, 2, 'Rua Tancredo Neves, 10, Centro, São Paulo', 11991101452, 300),
          (2, 5, 'Rua Tancredo Neves, 10, Centro, São Paulo', 11991101452, 300),
          (3, 3, 'Leopoldo Couto Magalhaes, 780, Pinheiros, São Paulo', 11998452000, 100),
          (4, 4, 'Avenida Mauro Ramos, 2400, Centro, Florianopolis', 4899600123, 200),
		  (5, 6, 'Rua Quinze de Novembro, 900, Centro, Porto Alegre', 5196521010, 50);

-- payment methods: 'Invoice', 'Pix', 'Credit_card', 'Debit_card', 'Paypal'
insert into payments(Customer_id, Payment_method, Payment_total)
	values(1, 'Credit_card', 115),
		  (2, 'Pix', 165),
          (3, 'Credit_card', 510),
          (4, 'Debit_card', 105),
          (5, 'Pix', 165),
          (6, 'Invoice', 3575); 