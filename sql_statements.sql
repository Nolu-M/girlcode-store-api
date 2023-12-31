CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    cat_name TEXT NOT NULL UNIQUE,
    slug TEXT NOT NULL UNIQUE,
    cat_desc TEXT
);

--Insert Initial Categories
INSERT INTO categories (cat_name, slug)
VALUES ('Furniture', 'furniture'),
('Hand Bag', 'hand-bag'),
('Books', 'books'),
('Tech','tech'),
('Sneakers', 'sneakers'),
('Travel', 'travel');

-- Add cat_img column on categories
ALTER TABLE categories
ADD cat_img TEXT;

--Updated cat_img column for all rows
UPDATE categories 
SET cat_img= 'cats_img.jpg';


--Create Products table
CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	prod_name TEXT NOT NULL UNIQUE,
	prod_img TEXT NOT NULL UNIQUE,
	prod_desc TEXT,
	prod_slug TEXT NOT NULL UNIQUE,
	prod_price DOUBLE PRECISION NOT NULL
);

INSERT INTO products (prod_name, prod_img, prod_desc, prod_slug, prod_price)
VALUES ('Insta Mini 9', 'insta-mini-9.png', 'Selfie mode and selfie mirror, macro mode',
	   'insta-mini-9', 99.85);
	   
INSERT INTO products (prod_name, prod_img, prod_desc, prod_slug, prod_price)
VALUES ('Base Camp Duffel M', 'duffel.png', 'Black and yellow, huge duffel bag with handles',
	   'Base Camp Duffel M', 159.99);
	   
CREATE TABLE categories_products (
	id SERIAL PRIMARY KEY,
	cat_id INT NOT NULL,
	prod_id INT NOT NULL,
	UNIQUE (cat_id, prod_id),
	FOREIGN KEY(cat_id) REFERENCES categories(id),
	FOREIGN KEY(prod_id) REFERENCES products(id)
);

INSERT INTO categories_products (cat_id, prod_id)
VALUES (4, 1);

SELECT * FROM categories
FULL OUTER JOIN categories on categories_products.cat_id=categories.id
FULL OUTER JOIN products on categories_products.prod_id=products.id
WHERE categories.slug='tech'

