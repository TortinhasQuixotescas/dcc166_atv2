-- Increase all ingredient costs by 5%
BEGIN TRANSACTION;
-- Create new cost entries with 5% increase
INSERT INTO IngredientCost (
        ingredient_id,
        start_date,
        end_date,
        cost_per_gram
    )
SELECT ic.ingredient_id,
    date('now') AS start_date,
    NULL AS end_date,
    ROUND(ic.cost_per_gram * 1.05, 4) AS cost_per_gram
FROM IngredientCost ic
WHERE ic.end_date IS NULL;
-- Close previous active costs
UPDATE IngredientCost
SET end_date = date('now', '-1 day')
WHERE end_date IS NULL
    AND cost_id NOT IN (
        SELECT MAX(cost_id)
        FROM IngredientCost
        GROUP BY ingredient_id
    );
COMMIT;
-- Verify update
SELECT i.name,
    ic.cost_per_gram AS new_price
FROM IngredientCost ic
    JOIN Ingredient i ON ic.ingredient_id = i.ingredient_id
WHERE ic.end_date IS NULL;
