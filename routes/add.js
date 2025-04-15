var express = require('express');
var router = express.Router();
const db = require('../database/connection');  

router.get('/', function(req, res, next) {
  res.render('add', { 
    title: 'Add Recipe',
    currentPage: 'add'
  });
});

router.post('/recipes', async (req, res) => {
  const { title, description, instructions, main_protein, ingredient_ids, quantities } = req.body;

  if (!title || !main_protein || !ingredient_ids || !quantities) {
    return res.status(400).send('Missing required fields');
  }

  try {
    const [recipeResult] = await db.query(
      'INSERT INTO recipes (title, description, instructions, main_protein) VALUES (?, ?, ?, ?)',
      [title, description, instructions, main_protein]
    );

    const recipeId = recipeResult.insertId;

    for (let i = 0; i < ingredient_ids.length; i++) {
      const ingredientId = ingredient_ids[i];
      const quantity = quantities[i];
      await db.query(
        'INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity) VALUES (?, ?, ?)',
        [recipeId, ingredientId, quantity]
      );
    }

    res.redirect(`/recipes/${recipeId}`);
  } catch (err) {
    console.error('Error saving recipe:', err);
    res.status(500).send('Failed to save recipe');
  }
});

module.exports = router;
