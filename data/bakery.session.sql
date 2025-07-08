-- ===================================================================
-- SAMPLE DATA VERIFICATION QUERIES
-- ===================================================================
-- Verify dishes and their ingredients
SELECT d.name AS dish,
    i.name AS ingredient,
    u.weight_in_grams
FROM Dish d
    JOIN Usage u ON d.dish_id = u.dish_id
    JOIN Ingredient i ON u.ingredient_id = i.ingredient_id
ORDER BY d.dish_id;
-- View cost analysis
SELECT *
FROM vw_DishCostAnalysis;
-- View which ingredients are used in multiple dishes
SELECT *
FROM vw_IngredientUsage
WHERE used_in_dishes_count > 1;
-- ===================================================================
--
