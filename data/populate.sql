-- ===================================================================
-- INSERT INGREDIENTS
-- ===================================================================
INSERT INTO Ingredient (name)
VALUES ('Sweetened condensed milk'),
    ('Cocoa powder'),
    ('Unsalted butter'),
    ('Chocolate sprinkles'),
    ('Wheat flour'),
    ('Water'),
    ('Salt'),
    ('Sugar'),
    ('Fresh yeast'),
    ('Canned corn kernels'),
    ('Coconut milk'),
    ('Eggs'),
    ('Baking powder');
-- ===================================================================
--
-- ===================================================================
-- INSERT CURRENT INGREDIENT COSTS (R$/gram)
-- ===================================================================
INSERT INTO IngredientCost (
        ingredient_id,
        start_date,
        end_date,
        cost_per_gram
    )
VALUES -- Prices in Brazilian Real (R$) per gram - updated July 2024
    (
        (
            SELECT ingredient_id
            FROM Ingredient
            WHERE name = 'Sweetened condensed milk'
        ),
        '2024-01-01',
        NULL,
        0.015
    ),
    -- R$15/kg
    (
        (
            SELECT ingredient_id
            FROM Ingredient
            WHERE name = 'Cocoa powder'
        ),
        '2024-01-01',
        NULL,
        0.045
    ),
    -- R$45/kg
    (
        (
            SELECT ingredient_id
            FROM Ingredient
            WHERE name = 'Unsalted butter'
        ),
        '2024-01-01',
        NULL,
        0.032
    ),
    -- R$32/kg
    (
        (
            SELECT ingredient_id
            FROM Ingredient
            WHERE name = 'Chocolate sprinkles'
        ),
        '2024-01-01',
        NULL,
        0.055
    ),
    -- R$55/kg
    (
        (
            SELECT ingredient_id
            FROM Ingredient
            WHERE name = 'Wheat flour'
        ),
        '2024-01-01',
        NULL,
        0.004
    ),
    -- R$4/kg
    (
        (
            SELECT ingredient_id
            FROM Ingredient
            WHERE name = 'Water'
        ),
        '2024-01-01',
        NULL,
        0.000004
    ),
    -- R$4/m³
    (
        (
            SELECT ingredient_id
            FROM Ingredient
            WHERE name = 'Salt'
        ),
        '2024-01-01',
        NULL,
        0.002
    ),
    -- R$2/kg
    (
        (
            SELECT ingredient_id
            FROM Ingredient
            WHERE name = 'Sugar'
        ),
        '2024-01-01',
        NULL,
        0.006
    ),
    -- R$6/kg
    (
        (
            SELECT ingredient_id
            FROM Ingredient
            WHERE name = 'Fresh yeast'
        ),
        '2024-01-01',
        NULL,
        0.12
    ),
    -- R$120/kg
    (
        (
            SELECT ingredient_id
            FROM Ingredient
            WHERE name = 'Canned corn kernels'
        ),
        '2024-01-01',
        NULL,
        0.018
    ),
    -- R$18/kg
    (
        (
            SELECT ingredient_id
            FROM Ingredient
            WHERE name = 'Coconut milk'
        ),
        '2024-01-01',
        NULL,
        0.022
    ),
    -- R$22/kg
    (
        (
            SELECT ingredient_id
            FROM Ingredient
            WHERE name = 'Eggs'
        ),
        '2024-01-01',
        NULL,
        0.024
    ),
    -- R$0.60/egg (25g)
    (
        (
            SELECT ingredient_id
            FROM Ingredient
            WHERE name = 'Baking powder'
        ),
        '2024-01-01',
        NULL,
        0.085
    );
-- R$85/kg
-- ===================================================================
--
-- ===================================================================
-- INSERT DISHES WITH BRAZILIAN MARKET PRICES (R$)
-- ===================================================================
INSERT INTO Dish (name, price, weight_in_grams)
VALUES ('Brigadeiro', 12.00, 480),
    -- R$12 for ~30 units (R$0.40 each)
    ('Pão Francês', 6.00, 840),
    -- R$6 for 12 units (R$0.50 each)
    ('Bolo de Milho Verde', 25.00, 1150);
-- R$25 per cake
-- ===================================================================
--
-- ===================================================================
-- INSERT INGREDIENT USAGE
-- ===================================================================
-- Brigadeiro
WITH brigadeiro_id AS (
    SELECT dish_id
    FROM Dish
    WHERE name = 'Brigadeiro'
)
INSERT INTO Usage (dish_id, ingredient_id, weight_in_grams)
SELECT (
        SELECT dish_id
        FROM brigadeiro_id
    ),
    ingredient_id,
    CASE
        name
        WHEN 'Sweetened condensed milk' THEN 395
        WHEN 'Cocoa powder' THEN 30
        WHEN 'Unsalted butter' THEN 15
        WHEN 'Chocolate sprinkles' THEN 40
    END
FROM Ingredient
WHERE name IN (
        'Sweetened condensed milk',
        'Cocoa powder',
        'Unsalted butter',
        'Chocolate sprinkles'
    );
-- Pão Francês
WITH pao_frances_id AS (
    SELECT dish_id
    FROM Dish
    WHERE name = 'Pão Francês'
)
INSERT INTO Usage (dish_id, ingredient_id, weight_in_grams)
SELECT (
        SELECT dish_id
        FROM pao_frances_id
    ),
    ingredient_id,
    CASE
        name
        WHEN 'Wheat flour' THEN 500
        WHEN 'Water' THEN 300
        WHEN 'Salt' THEN 10
        WHEN 'Sugar' THEN 20
        WHEN 'Fresh yeast' THEN 10
        WHEN 'Unsalted butter' THEN 20
    END
FROM Ingredient
WHERE name IN (
        'Wheat flour',
        'Water',
        'Salt',
        'Sugar',
        'Fresh yeast',
        'Unsalted butter'
    );
-- Bolo de Milho Verde
WITH bolo_milho_id AS (
    SELECT dish_id
    FROM Dish
    WHERE name = 'Bolo de Milho Verde'
)
INSERT INTO Usage (dish_id, ingredient_id, weight_in_grams)
SELECT (
        SELECT dish_id
        FROM bolo_milho_id
    ),
    ingredient_id,
    CASE
        name
        WHEN 'Canned corn kernels' THEN 400
        WHEN 'Coconut milk' THEN 250
        WHEN 'Sugar' THEN 200
        WHEN 'Eggs' THEN 100
        WHEN 'Unsalted butter' THEN 50
        WHEN 'Wheat flour' THEN 120
        WHEN 'Baking powder' THEN 10
    END
FROM Ingredient
WHERE name IN (
        'Canned corn kernels',
        'Coconut milk',
        'Sugar',
        'Eggs',
        'Unsalted butter',
        'Wheat flour',
        'Baking powder'
    );
-- ===================================================================
--
