-- ===================================================================
-- CREATE REPORTING VIEWS
-- ===================================================================
CREATE VIEW IF NOT EXISTS vw_DishCostAnalysis AS WITH CurrentCosts AS (
    SELECT ingredient_id,
        cost_per_gram
    FROM IngredientCost
    WHERE end_date IS NULL
)
SELECT d.dish_id,
    d.name AS dish_name,
    d.price,
    d.weight_in_grams,
    SUM(u.weight_in_grams * cc.cost_per_gram) AS total_ingredient_cost,
    d.price - SUM(u.weight_in_grams * cc.cost_per_gram) AS gross_profit,
    (
        (
            d.price - SUM(u.weight_in_grams * cc.cost_per_gram)
        ) / d.price
    ) * 100 AS gross_margin_percentage
FROM Dish d
    JOIN Usage u ON d.dish_id = u.dish_id
    JOIN CurrentCosts cc ON u.ingredient_id = cc.ingredient_id
GROUP BY d.dish_id,
    d.name,
    d.price,
    d.weight_in_grams;
--
CREATE VIEW IF NOT EXISTS vw_IngredientUsage AS
SELECT i.ingredient_id,
    i.name AS ingredient_name,
    COUNT(DISTINCT u.dish_id) AS used_in_dishes_count,
    SUM(u.weight_in_grams) AS total_usage_grams
FROM Ingredient i
    LEFT JOIN Usage u ON i.ingredient_id = u.ingredient_id
GROUP BY i.ingredient_id,
    i.name;
-- ===================================================================
--
