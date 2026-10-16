CREATE TABLE recipes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(120) NOT NULL,
  ingredients TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO recipes (title, ingredients) VALUES
('Ancho-Orange Chicken', '¾ cup Jasmine Rice
¾ lb Carrots
2 cloves Garlic
1 bunch Kale
1 Lime
1 Orange
2 Tbsps Butter
4 Boneless, Skinless Chicken Breasts
1 Tbsp Ancho Chile Paste
2 Tbsps Crème Fraîche
3 Tbsps Golden Raisins'),

('Beef Medallions & Mushroom Sauce', '2 Beef Medallions
2 cloves Garlic
1 Shallot
1 bunch Kale
2 Tbsps Butter
1 Tbsp Dijon Mustard
2 Tbsps Verjus Blanc
4 oz Cremini Mushrooms
¾ lb Yukon Gold Potatoes'),

('Broccoli & Basil Pesto Sandwiches', '2 oz Asiago Cheese
1 Piece Focaccia Bread
1 8-Ounce Can Tomato Sauce
½ lb Fresh Mozzarella Cheese
2 Clementines
2 cloves Garlic
2 Romaine Lettuce Hearts
1 lb Broccoli
1 oz Golden Or Red Sweet Piquante Peppers
2 Tbsps Crème Fraîche
1 Tbsp Dijon Mustard
½ cup Basil & Cashew Pesto
⅓ cup Shaved Parmesan Cheese
1 Tbsp Italian Seasoning');