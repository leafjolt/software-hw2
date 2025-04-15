var express = require('express');
var router = express.Router();
const db = require('../database/connection');  

router.get('/', async (req, res, next) => {
    const [rows] = await db.query('SELECT * FROM recipes ORDER BY main_protein, title');

    let proteinGroups = {
        Chicken: [],
        Beef: [],
        Tofu: [],
        Grains: [],
    };

    for (recipe of rows) {
        proteinGroups[recipe.main_protein].push(recipe);
    }

    res.render('recipes', { 
        title: 'Recipes',
        currentPage: 'recipes',
        proteinGroups
    });
});

router.get('/:id', async (req, res) => {
    const recipeId = req.params.id;
  
    try {
      const [recipeRows] = await db.query(
        'SELECT * FROM recipes WHERE id = ?',
        [recipeId]
      );
  
      if (recipeRows.length === 0) {
        return res.status(404).send('Recipe not found');
      }
  
      const recipe = recipeRows[0];
  
      const [ingredientRows] = await db.query(
        `SELECT i.name, i.info
         FROM recipe_ingredients ri
         JOIN ingredients i ON ri.ingredient_id = i.id
         WHERE ri.recipe_id = ?`,
        [recipeId]
      );
  
      res.render('recipe', {
        recipe,
        ingredients: ingredientRows
      });
    } catch (err) {
      console.error('Error fetching recipe:', err);
      res.status(500).send('Server error');
    }
});

module.exports = router;
