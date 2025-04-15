-- Create the database and use it
CREATE DATABASE IF NOT EXISTS recipe_site;
USE recipe_site;

-- Ingredients table
CREATE TABLE ingredients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    info TEXT NOT NULL
);

-- Recipes table (no image_url field)
CREATE TABLE recipes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    instructions TEXT,
    main_protein ENUM('Chicken', 'Beef', 'Tofu', 'Grains') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Join table for recipe-ingredient many-to-many relationship
CREATE TABLE recipe_ingredients (
    recipe_id INT,
    ingredient_id INT,
    quantity VARCHAR(50),
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES recipes(id) ON DELETE CASCADE,
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(id) ON DELETE CASCADE
);

-- Sample data for ingredients
INSERT INTO ingredients (name, info) VALUES
('Garlic', 'Used worldwide, garlic can reduce blood pressure.'),
('Cumin', 'A spice commonly used in Indian and Middle Eastern cuisine.'),
('Olive Oil', 'Healthy fat from olives, mainly used in Mediterranean diets.'),
('Carrot', 'Rich in beta-carotene, great for vision and skin.'),
('Broccoli', 'High in fiber and vitamin C, supports immunity.'),
('Bell Pepper', 'Colorful and sweet, loaded with antioxidants.'),
('Spinach', 'Leafy green high in iron and calcium.'),
('Onion', 'Adds depth of flavor, can be eaten raw or cooked.');

-- Sample data for recipes
INSERT INTO recipes (title, description, instructions, main_protein) VALUES
('Garlic Chicken', 'A flavorful garlic-infused chicken dish.', '1. Marinate chicken in garlic.\n2. Bake at 375°F for 25 minutes.', 'Chicken'),
('Tofu Stir Fry', 'A vegetarian stir fry with tofu and vegetables.', '1. Fry tofu until golden.\n2. Add veggies and sauce.', 'Tofu'),
('Veggie Power Bowl', 'A grain-based bowl with roasted vegetables.', '1. Roast carrots and broccoli.\n2. Serve over quinoa with olive oil.', 'Grains'),
('Spinach & Bell Pepper Tofu Scramble', 'A savory plant-based scramble.', '1. Sauté spinach and peppers.\n2. Add crumbled tofu and spices.', 'Tofu'),
('Carrot & Onion Grains Medley', 'A simple and healthy grain salad.', '1. Cook grains.\n2. Mix with grated carrot, sautéed onion, and olive oil.', 'Grains');

-- Sample data for recipe-ingredients relationships
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity) VALUES
-- Garlic Chicken
(1, 1, '3 cloves'),
(1, 3, '2 tbsp'),
-- Tofu Stir Fry
(2, 2, '1 tsp'),
(2, 3, '1 tbsp'),
-- Veggie Power Bowl
(3, 4, '1 cup sliced'),
(3, 5, '1 cup florets'),
(3, 3, '2 tbsp'),
-- Spinach & Bell Pepper Tofu Scramble
(4, 7, '1 cup chopped'),
(4, 6, '1/2 cup sliced'),
(4, 2, '1 tsp'),
-- Carrot & Onion Grains Medley
(5, 4, '1/2 cup shredded'),
(5, 8, '1/2 cup chopped'),
(5, 3, '1 tbsp');
