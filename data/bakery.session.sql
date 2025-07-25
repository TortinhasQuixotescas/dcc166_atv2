-- ===================================================================
-- SAMPLE DATA VERIFICATION QUERIES
-- ===================================================================
-- Verify dishes and their ingredients
SELECT d.name AS dish,
    i.name AS ingredient,
    u.weight_in_grams
FROM DISH d
    JOIN USAGE u ON d.dish_id = u.dish_id
    JOIN INGREDIENT i ON u.ingredient_id = i.ingredient_id
ORDER BY d.dish_id;
-- View cost analysis
SELECT *
FROM vw_DISH_COST_ANALYSIS;
-- View which ingredients are used in multiple dishes
SELECT *
FROM vw_INGREDIENT_USAGE
WHERE used_in_dishes_count > 1;
-- ===================================================================
--
