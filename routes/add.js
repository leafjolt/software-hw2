var express = require('express');
var router = express.Router();
const db = require('../database/connection');  

router.get('/', async (req, res, next) => {
  try {
    const [ingredients] = await db.query('SELECT * FROM ingredients ORDER BY name');
    res.render('add', { 
      title: 'Add Recipe',
      currentPage: 'add',
      ingredients 
    });
  } catch (err) {
    console.error('Error loading ingredients:', err);
    res.status(500).send('Server error');
  }
});

router.post('/', async (req, res) => {
  console.log(req.body);
  const { title, description, instructions, main_protein, ingredients } = req.body;

  if (!title || !main_protein || !ingredients) {
    return res.status(400).send('Missing required fields');
  }

  try {
    const [recipeResult] = await db.query(
      'INSERT INTO recipes (title, description, instructions, main_protein) VALUES (?, ?, ?, ?)',
      [title, description, instructions, main_protein]
    );

    const recipeId = recipeResult.insertId;

    for (let i = 0; i < ingredients.length; i++) {
      const ingredientId = ingredients[i];
      await db.query(
        'INSERT INTO recipe_ingredients (recipe_id, ingredient_id) VALUES (?, ?)',
        [recipeId, ingredientId]
      );
    }

    res.redirect(`/recipes/${recipeId}`);
  } catch (err) {
    console.error('Error saving recipe:', err);
    res.status(500).send('Failed to save recipe');
  }
});

module.exports = router;
