CREATE TABLE recipes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(120) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO recipes (title) VALUES
('Ancho-Orange Chicken'),
('Beef Medallions & Mushroom Sauce'),
('Broccoli & Basil Pesto Sandwiches');