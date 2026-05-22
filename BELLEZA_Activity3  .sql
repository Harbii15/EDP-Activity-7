DROP DATABASE IF EXISTS minimart_db;
CREATE DATABASE minimart_db;
USE minimart_db;

CREATE TABLE suppliers (
    supplier_id   INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100),
    contact_name  VARCHAR(100),
    phone         VARCHAR (15),
    address       VARCHAR(150),
    city          VARCHAR(50)
);

INSERT INTO suppliers (supplier_name, contact_name, phone, address, city) VALUES
('Nestle Philippines',      'Mark Dela Cruz',	'09171234567', '123 Ayala Ave',        'Makati'),
('San Miguel Corp.',        'Rosa Santos',   	'09282345678', '40 San Miguel Ave',    'Mandaluyong'),
('Universal Robina Corp.',  'Jun Reyes',     	'09393456789', '110 E. Rodriguez Ave', 'Quezon City'),
('Monde Nissin',            'Anna Lim',      	'09154567890', '25 Scout Chuatoco',    'Quezon City'),
('Magnolia Inc.',           'Carlo Tan',       	'09265678901', '7 Magnolia St',        'San Juan'),
('Lucky Me Noodles',        'Diana Cruz',       '09376789012', '88 Ortigas Ave',       'Pasig'),
('Del Monte Philippines',   'Edwin Bautista',   '09187890123', '12 Del Monte Ave',     'Quezon City'),
('Rebisco Corporation',     'Fiona Garcia',     '09298901234', '56 Bohol Ave',         'Quezon City'),
('Alaska Milk Corp.',       'George Mendoza',   '09309012345', '7th Ave BGC',          'Taguig'),
('Local Fresh Farms',       'Helen Villanueva', '09221023456', 'Brgy. Laging Handa',   'Quezon City');

CREATE TABLE categories (
    category_id   INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100),
    description   VARCHAR(255)
);

INSERT INTO categories (category_name, description) VALUES
('Beverages',       'Juices, softdrinks, water, and other drinks'),
('Canned Goods',    'Canned meat, fish, vegetables, and fruits'),
('Dairy',           'Milk, cheese, butter, and dairy products'),
('Snacks',          'Chips, crackers, biscuits, and junk food'),
('Noodles & Pasta', 'Instant noodles, pasta, and related products'),
('Rice & Grains',   'Rice, oats, and other grain products'),
('Condiments',      'Sauces, seasonings, vinegar, and cooking oil'),
('Frozen Goods',    'Frozen meat, hotdogs, nuggets, and ice cream'),
('Fresh Produce',   'Vegetables, fruits, and fresh farm products'),
('Personal Care',   'Soap, shampoo, toothpaste, and hygiene products');

CREATE TABLE products (
    product_id        INT PRIMARY KEY AUTO_INCREMENT,
    product_name      VARCHAR(200),
    barcode           VARCHAR(50),
    category_id       INT NOT NULL,
    supplier_id       INT NOT NULL,
    buying_price      DECIMAL(10,2),
    selling_price     DECIMAL(10,2),
    quantity_in_stock INT DEFAULT 0,
    reorder_level     INT DEFAULT 20,
    unit              VARCHAR(20) DEFAULT 'pcs',
    expiry_date       DATE,
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

INSERT INTO products (product_name, barcode, category_id, supplier_id, buying_price, selling_price, quantity_in_stock, reorder_level, unit, expiry_date) VALUES
('Milo 3-in-1 (10 sachets)',    'BAR-001', 1,  1,  65.00,   85.00,   120, 30, 'box',   '2025-12-31'),
('Argentina Corned Beef 150g',  'BAR-002', 2,  3,  42.00,   58.00,   200, 50, 'can',   '2026-06-30'),
('Alaska Evap Milk 370ml',      'BAR-003', 3,  9,  28.00,   38.00,   150, 40, 'can',   '2026-03-15'),
('Pringles Original 107g',      'BAR-004', 4,  3,  95.00,   115.00,  80,  20, 'can',   '2025-09-30'),
('Lucky Me Pancit Canton',      'BAR-005', 5,  6,  9.00,    13.00,   300, 80, 'pack',  '2025-11-30'),
('NFA Rice 1kg',                'BAR-006', 6,  10, 45.00,   52.00,   500, 100,'kg',    NULL),
('Datu Puti Vinegar 1L',        'BAR-007', 7,  3,  28.00,   38.00,   90,  25, 'bottle','2026-01-31'),
('Magnolia Chicken Hotdog 250g','BAR-008', 8,  5,  68.00,   88.00,   60,  20, 'pack',  '2025-04-15'),
('Ripe Tomatoes (per kg)',       'BAR-009', 9,  10, 30.00,   45.00,   40,  15, 'kg',    '2025-02-20'),
('Colgate Toothpaste 75ml',     'BAR-010', 10, 1,  38.00,   52.00,   110, 30, 'tube',  '2027-01-01');

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name  VARCHAR(50),
    last_name   VARCHAR(50),
    role        VARCHAR(50),
    email       VARCHAR(100),
    hire_date   DATE,
    salary      DECIMAL(10,2)
);

INSERT INTO employees (first_name, last_name, role, email, hire_date, salary) VALUES
('Jorge',   'Licup',       'Store Manager',        'jorgelicup@gmail.com',    '2018-05-01', 35000.00),
('Rhona',    'Pancho',        'Inventory Officer',    'rhonapancho@gmail.com',     '2019-08-12', 25000.00),
('Ana',     'Lin',          'Cashier',              'analin@gmail.com',      '2020-02-01', 18000.00),
('Carlos',  'Caabay',         'Stock Clerk',          'carloscaabay@gmail.com',   '2020-06-15', 16000.00),
('Ervin',   'Macatingrao',          'Cashier',              'ervinmacatingrao@gmail.com',    '2021-01-10', 18000.00),
('Erl',   'Macatingrao',       'Stock Clerk',          'erlmacatingrao@gmail.com',    '2021-07-20', 16000.00),
('Abby',   'DelaCruz',     'Purchasing Staff',     'abbydelacruz@gmail.com',    '2022-03-05', 20000.00),
('Asif',  'Moral',   'Stock Clerk',          'asifmoral@gmail.com',   '2022-09-18', 16000.00),
('Vince',   'Manaman',      'Cashier',              'vincemanaman@gmail.com',    '2023-02-14', 18000.00),
('Ivan',    'Till',    'Security Guard',       'ivantill@gmail.com',     '2023-06-01', 15000.00);


CREATE TABLE transactions (
    transaction_id   INT PRIMARY KEY AUTO_INCREMENT,
    product_id       INT NOT NULL,
    employee_id      INT NOT NULL,
    transaction_type ENUM('IN', 'OUT') NOT NULL,
    quantity         INT NOT NULL,
    transaction_date DATE NOT NULL,
    price_per_unit   DECIMAL(10,2) NOT NULL,
    total_amount     DECIMAL(12,2),
    remarks          VARCHAR(255),
    FOREIGN KEY (product_id)  REFERENCES products(product_id),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO transactions (product_id, employee_id, transaction_type, quantity, transaction_date, price_per_unit, total_amount, remarks) VALUES
(1,  2, 'IN',  150, '2024-01-05', 65.00, 9750.00, 'Delivery from Nestle'),
(2,  2, 'IN',  250, '2024-01-10', 42.00, 10500.00, 'Delivery from URC'),
(3,  4, 'OUT', 30,  '2024-01-15', 38.00, 1140.00, 'Sold at counter'),
(4,  4, 'OUT', 20,  '2024-01-20', 115.00, 2300.00, 'Sold at counter'),
(5,  2, 'IN',  400, '2024-02-01', 9.00, 3600.00,  'Bulk delivery from Lucky Me'),
(6,  4, 'OUT', 100, '2024-02-05', 52.00, 5200.00, 'Sold at counter'),
(7,  2, 'IN',  100, '2024-02-10', 28.00, 2800.00, 'Delivery from URC'),
(8,  4, 'OUT', 15,  '2024-02-14', 88.00, 1320.00, 'Sold at counter'),
(9,  4, 'OUT', 20,  '2024-02-20', 45.00, 900.00, 'Sold at counter'),
(10, 2, 'IN',  130, '2024-03-01', 38.00, 4940.00, 'Delivery from Nestle');

CREATE VIEW vw_stock_levels AS
SELECT
    p.product_id,
    p.product_name,
    p.barcode,
    c.category_name,
    s.supplier_name,
    p.quantity_in_stock,
    p.reorder_level,
    p.unit,
    p.buying_price,
    p.selling_price,
    ROUND(((p.selling_price - p.buying_price) / p.buying_price) * 100, 2) AS profit_margin_pct,
    p.expiry_date,
    CASE
        WHEN p.quantity_in_stock = 0                        THEN 'Out of Stock'
        WHEN p.quantity_in_stock <= p.reorder_level         THEN 'Low Stock'
        ELSE                                                     'Stock OK'
    END AS stock_status
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN suppliers  s ON p.supplier_id  = s.supplier_id;


CREATE VIEW vw_sales_report AS
SELECT
    t.transaction_id,
    t.transaction_date,
    p.product_name,
    p.barcode,
    c.category_name,
    t.quantity         AS qty_sold,
    t.price_per_unit   AS unit_price,
    t.total_amount     AS sales_amount,
    CONCAT(e.first_name, ' ', e.last_name) AS handled_by
FROM transactions t
JOIN products  p ON t.product_id  = p.product_id
JOIN categories c ON p.category_id = c.category_id
JOIN employees e ON t.employee_id = e.employee_id
WHERE t.transaction_type = 'OUT'
ORDER BY t.transaction_date DESC;


CREATE VIEW vw_restock_report AS
SELECT
    t.transaction_id,
    t.transaction_date,
    s.supplier_name,
    p.product_name,
    p.barcode,
    t.quantity         AS qty_received,
    t.price_per_unit   AS buying_price,
    t.total_amount     AS total_cost,
    CONCAT(e.first_name, ' ', e.last_name) AS received_by
FROM transactions t
JOIN products  p ON t.product_id  = p.product_id
JOIN suppliers s ON p.supplier_id  = s.supplier_id
JOIN employees e ON t.employee_id  = e.employee_id
WHERE t.transaction_type = 'IN'
ORDER BY t.transaction_date DESC;

DELIMITER //

CREATE PROCEDURE restock_product (
    IN p_product_id  INT,
    IN p_quantity    INT,
    IN p_employee_id INT,
    IN p_remarks     VARCHAR(255)
)
BEGIN
    DECLARE v_buying_price DECIMAL(10,2);

    SELECT buying_price
    INTO   v_buying_price
    FROM   products
    WHERE  product_id = p_product_id;

    UPDATE products
    SET    quantity_in_stock = quantity_in_stock + p_quantity
    WHERE  product_id = p_product_id;

    INSERT INTO transactions (product_id, employee_id, transaction_type, quantity, transaction_date, price_per_unit, remarks)
    VALUES (p_product_id, p_employee_id, 'IN', p_quantity, CURDATE(), v_buying_price, p_remarks);

END; //

DELIMITER ;

DELIMITER //

CREATE FUNCTION get_total_stock_value ()
RETURNS DECIMAL(15,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(15,2);

    SELECT IFNULL(SUM(buying_price * quantity_in_stock), 0.00)
    INTO   total
    FROM   products;

    RETURN total;
END; //

DELIMITER ;

CREATE TRIGGER trg_after_insert_transaction
    AFTER INSERT
    ON transactions
FOR EACH ROW
    UPDATE products 
    SET quantity_in_stock = quantity_in_stock + IF(NEW.transaction_type = 'IN', NEW.quantity, -NEW.quantity) 
    WHERE product_id = NEW.product_id;

CREATE TRIGGER trg_after_update_transaction
    AFTER UPDATE
    ON transactions
FOR EACH ROW
    UPDATE products 
    SET quantity_in_stock = quantity_in_stock - IF(OLD.transaction_type = 'IN', OLD.quantity, -OLD.quantity) + IF(NEW.transaction_type = 'IN', NEW.quantity, -NEW.quantity) 
    WHERE product_id = NEW.product_id;

CREATE TRIGGER trg_before_delete_transaction
    BEFORE DELETE
    ON transactions
FOR EACH ROW
    UPDATE products 
    SET quantity_in_stock = quantity_in_stock - IF(OLD.transaction_type = 'IN', OLD.quantity, -OLD.quantity) 
    WHERE product_id = OLD.product_id;
