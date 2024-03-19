CREATE TABLE order_product
(
    order_id   INTEGER REFERENCES orders (id),
    product_id INTEGER REFERENCES product (id),
    quantity   INTEGER,
    sale_price numeric(10, 2),
    PRIMARY KEY (order_id, product_id)
);
