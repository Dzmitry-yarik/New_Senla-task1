CREATE INDEX idx_order_user_id ON orders (user_id);

EXPLAIN
SELECT *
FROM orders o
         INNER JOIN users u ON o.user_id = u.id
WHERE u.id = 1;


EXPLAIN
SELECT *
FROM credentials c
         INNER JOIN users u ON c.user_id = u.id
         INNER JOIN role r ON c.role_id = r.id
WHERE c.role_id = 1
  and c.user_id = 4;


EXPLAIN
SELECT *
FROM order_product op
         INNER JOIN orders o ON op.order_id = o.id
         INNER JOIN product p ON op.product_id = p.id
where p.id = 2;