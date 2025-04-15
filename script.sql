-- Create the database and use it
CREATE DATABASE IF NOT EXISTS recipe_site;
USE recipe_site;

-- TABLES
CREATE TABLE ingredients (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  info TEXT
);

CREATE TABLE recipes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  instructions TEXT,
  main_protein ENUM('Chicken', 'Beef', 'Tofu', 'Grains') NOT NULL
);

CREATE TABLE recipe_ingredients (
  recipe_id INT,
  ingredient_id INT,
  PRIMARY KEY (recipe_id, ingredient_id),
  FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE,
  FOREIGN KEY (ingredient_id) REFERENCES ingredients(id) ON DELETE CASCADE
);

INSERT INTO ingredients (name, info) VALUES
('Chicken Breast', 'Lean protein, cooks quickly.'),
('Ground Beef', 'Flavorful and filling.'),
('Tofu', 'Plant-based protein that absorbs flavor.'),
('Rice', 'Basic grain, good for bowls and sides.'),
('Bell Pepper', 'Sweet and crunchy.'),
('Spinach', 'Nutrient-rich leafy green.'),
('Garlic', 'Bold flavor, used everywhere.'),
('Onion', 'Staple aromatic for depth.'),
('Soy Sauce', 'Salty and savory seasoning.'),
('Olive Oil', 'Common cooking oil, heart-healthy.');

INSERT INTO recipes (title, description, instructions, main_protein) VALUES
-- Chicken
('Simple Chicken Stir-Fry', 'A quick stir-fry with chicken and bell peppers.', 'Sauté chicken in olive oil. Add peppers and garlic. Stir-fry until cooked.', 'Chicken'),
('Garlic Chicken Bowl', 'Grilled chicken with garlic and rice.', 'Grill chicken and serve over rice with garlic-infused oil.', 'Chicken'),

-- Beef
('Beef & Peppers', 'Easy beef and bell pepper sauté.', 'Cook beef with peppers and soy sauce.', 'Beef'),
('Beef Rice Bowl', 'Comforting rice bowl with savory beef.', 'Brown beef, mix with soy sauce and serve over rice.', 'Beef'),

-- Tofu
('Tofu Stir-Fry', 'Quick tofu dish with spinach and soy.', 'Fry tofu, add spinach and soy sauce.', 'Tofu'),
('Garlic Tofu', 'Tofu pan-fried in garlic and oil.', 'Crisp tofu in garlic and olive oil.', 'Tofu'),

-- Grains
('Spinach Rice', 'Simple rice with sautéed spinach.', 'Cook rice. Sauté spinach with garlic and mix.', 'Grains'),
('Veggie Fried Rice', 'Fried rice with mixed veggies.', 'Fry rice with peppers, onion, soy sauce.', 'Grains');

INSERT INTO recipe_ingredients (recipe_id, ingredient_id) VALUES
-- Simple Chicken Stir-Fry
(1, 1), (1, 5), (1, 7), (1, 10),

-- Garlic Chicken Bowl
(2, 1), (2, 4), (2, 7),

-- Beef & Peppers
(3, 2), (3, 5), (3, 9),

-- Beef Rice Bowl
(4, 2), (4, 4), (4, 9),

-- Tofu Stir-Fry
(5, 3), (5, 6), (5, 9),

-- Garlic Tofu
(6, 3), (6, 7), (6, 10),

-- Spinach Rice
(7, 4), (7, 6), (7, 7),

-- Veggie Fried Rice
(8, 4), (8, 5), (8, 8), (8, 9);
