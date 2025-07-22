-- ===================================================================
-- INSERT INGREDIENTS
-- ===================================================================
INSERT INTO INGREDIENT (name)
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
INSERT INTO INGREDIENT_COST (
        ingredient_id,
        start_date,
        end_date,
        cost_per_gram
    )
VALUES -- Prices in Brazilian Real (R$) per gram - updated July 2024
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
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
            FROM INGREDIENT
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
            FROM INGREDIENT
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
            FROM INGREDIENT
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
            FROM INGREDIENT
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
            FROM INGREDIENT
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
            FROM INGREDIENT
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
            FROM INGREDIENT
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
            FROM INGREDIENT
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
            FROM INGREDIENT
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
            FROM INGREDIENT
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
            FROM INGREDIENT
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
            FROM INGREDIENT
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
-- INSERT HISTORICAL INGREDIENT COSTS (R$/gram) - 2022 to 2023
-- ===================================================================
-- Sweetened condensed milk price history (15% increase over 2 years)
INSERT INTO INGREDIENT_COST (
        ingredient_id,
        start_date,
        end_date,
        cost_per_gram
    )
VALUES (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Sweetened condensed milk'
        ),
        '2022-01-01',
        '2022-06-30',
        0.012
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Sweetened condensed milk'
        ),
        '2022-07-01',
        '2022-12-31',
        0.013
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Sweetened condensed milk'
        ),
        '2023-01-01',
        '2023-06-30',
        0.014
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Sweetened condensed milk'
        ),
        '2023-07-01',
        '2023-12-31',
        0.0145
    );
-- Cocoa powder price history (20% increase with seasonal variations)
INSERT INTO INGREDIENT_COST (
        ingredient_id,
        start_date,
        end_date,
        cost_per_gram
    )
VALUES (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Cocoa powder'
        ),
        '2022-01-01',
        '2022-04-30',
        0.038
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Cocoa powder'
        ),
        '2022-05-01',
        '2022-08-31',
        0.040
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Cocoa powder'
        ),
        '2022-09-01',
        '2022-12-31',
        0.042
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Cocoa powder'
        ),
        '2023-01-01',
        '2023-04-30',
        0.041
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Cocoa powder'
        ),
        '2023-05-01',
        '2023-08-31',
        0.043
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Cocoa powder'
        ),
        '2023-09-01',
        '2023-12-31',
        0.044
    );
-- Unsalted butter price history (significant 30% increase)
INSERT INTO INGREDIENT_COST (
        ingredient_id,
        start_date,
        end_date,
        cost_per_gram
    )
VALUES (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Unsalted butter'
        ),
        '2022-01-01',
        '2022-12-31',
        0.025
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Unsalted butter'
        ),
        '2023-01-01',
        '2023-06-30',
        0.028
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Unsalted butter'
        ),
        '2023-07-01',
        '2023-12-31',
        0.030
    );
-- Chocolate sprinkles price history (stable with small increases)
INSERT INTO INGREDIENT_COST (
        ingredient_id,
        start_date,
        end_date,
        cost_per_gram
    )
VALUES (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Chocolate sprinkles'
        ),
        '2022-01-01',
        '2022-12-31',
        0.050
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Chocolate sprinkles'
        ),
        '2023-01-01',
        '2023-12-31',
        0.052
    );
-- Wheat flour price history (volatile commodity)
INSERT INTO INGREDIENT_COST (
        ingredient_id,
        start_date,
        end_date,
        cost_per_gram
    )
VALUES (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Wheat flour'
        ),
        '2022-01-01',
        '2022-03-31',
        0.0035
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Wheat flour'
        ),
        '2022-04-01',
        '2022-06-30',
        0.0038
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Wheat flour'
        ),
        '2022-07-01',
        '2022-09-30',
        0.0032
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Wheat flour'
        ),
        '2022-10-01',
        '2022-12-31',
        0.0036
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Wheat flour'
        ),
        '2023-01-01',
        '2023-03-31',
        0.0038
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Wheat flour'
        ),
        '2023-04-01',
        '2023-06-30',
        0.0042
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Wheat flour'
        ),
        '2023-07-01',
        '2023-09-30',
        0.0039
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Wheat flour'
        ),
        '2023-10-01',
        '2023-12-31',
        0.0037
    );
-- Water price history (small municipal adjustments)
INSERT INTO INGREDIENT_COST (
        ingredient_id,
        start_date,
        end_date,
        cost_per_gram
    )
VALUES (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Water'
        ),
        '2022-01-01',
        '2022-12-31',
        0.0000035
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Water'
        ),
        '2023-01-01',
        '2023-12-31',
        0.0000038
    );
-- Salt price history (stable with one increase)
INSERT INTO INGREDIENT_COST (
        ingredient_id,
        start_date,
        end_date,
        cost_per_gram
    )
VALUES (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Salt'
        ),
        '2022-01-01',
        '2023-06-30',
        0.0018
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Salt'
        ),
        '2023-07-01',
        '2023-12-31',
        0.0019
    );
-- Sugar price history (commodity fluctuations)
INSERT INTO INGREDIENT_COST (
        ingredient_id,
        start_date,
        end_date,
        cost_per_gram
    )
VALUES (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Sugar'
        ),
        '2022-01-01',
        '2022-05-31',
        0.0055
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Sugar'
        ),
        '2022-06-01',
        '2022-11-30',
        0.0062
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Sugar'
        ),
        '2022-12-01',
        '2023-04-30',
        0.0058
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Sugar'
        ),
        '2023-05-01',
        '2023-12-31',
        0.0059
    );
-- Fresh yeast price history (significant increases)
INSERT INTO INGREDIENT_COST (
        ingredient_id,
        start_date,
        end_date,
        cost_per_gram
    )
VALUES (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Fresh yeast'
        ),
        '2022-01-01',
        '2022-06-30',
        0.10
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Fresh yeast'
        ),
        '2022-07-01',
        '2022-12-31',
        0.11
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Fresh yeast'
        ),
        '2023-01-01',
        '2023-06-30',
        0.115
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Fresh yeast'
        ),
        '2023-07-01',
        '2023-12-31',
        0.118
    );
-- Canned corn kernels price history
INSERT INTO INGREDIENT_COST (
        ingredient_id,
        start_date,
        end_date,
        cost_per_gram
    )
VALUES (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Canned corn kernels'
        ),
        '2022-01-01',
        '2022-12-31',
        0.016
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Canned corn kernels'
        ),
        '2023-01-01',
        '2023-12-31',
        0.017
    );
-- Coconut milk price history
INSERT INTO INGREDIENT_COST (
        ingredient_id,
        start_date,
        end_date,
        cost_per_gram
    )
VALUES (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Coconut milk'
        ),
        '2022-01-01',
        '2022-12-31',
        0.020
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Coconut milk'
        ),
        '2023-01-01',
        '2023-06-30',
        0.021
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Coconut milk'
        ),
        '2023-07-01',
        '2023-12-31',
        0.0215
    );
-- Eggs price history (volatile)
INSERT INTO INGREDIENT_COST (
        ingredient_id,
        start_date,
        end_date,
        cost_per_gram
    )
VALUES (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Eggs'
        ),
        '2022-01-01',
        '2022-04-30',
        0.020
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Eggs'
        ),
        '2022-05-01',
        '2022-08-31',
        0.022
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Eggs'
        ),
        '2022-09-01',
        '2022-12-31',
        0.023
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Eggs'
        ),
        '2023-01-01',
        '2023-05-31',
        0.0245
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Eggs'
        ),
        '2023-06-01',
        '2023-12-31',
        0.0238
    );
-- Baking powder price history
INSERT INTO INGREDIENT_COST (
        ingredient_id,
        start_date,
        end_date,
        cost_per_gram
    )
VALUES (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Baking powder'
        ),
        '2022-01-01',
        '2022-12-31',
        0.080
    ),
    (
        (
            SELECT ingredient_id
            FROM INGREDIENT
            WHERE name = 'Baking powder'
        ),
        '2023-01-01',
        '2023-12-31',
        0.082
    );
-- ===================================================================
--
-- ===================================================================
-- INSERT DISHES WITH BRAZILIAN MARKET PRICES (R$)
-- ===================================================================
INSERT INTO DISH (name, price, weight_in_grams)
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
    FROM DISH
    WHERE name = 'Brigadeiro'
)
INSERT INTO USAGE (dish_id, ingredient_id, weight_in_grams)
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
FROM INGREDIENT
WHERE name IN (
        'Sweetened condensed milk',
        'Cocoa powder',
        'Unsalted butter',
        'Chocolate sprinkles'
    );
-- Pão Francês
WITH pao_frances_id AS (
    SELECT dish_id
    FROM DISH
    WHERE name = 'Pão Francês'
)
INSERT INTO USAGE (dish_id, ingredient_id, weight_in_grams)
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
FROM INGREDIENT
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
    FROM DISH
    WHERE name = 'Bolo de Milho Verde'
)
INSERT INTO USAGE (dish_id, ingredient_id, weight_in_grams)
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
FROM INGREDIENT
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
