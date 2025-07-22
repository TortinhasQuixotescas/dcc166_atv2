-- ===================================================================
-- CREATE TABLES
-- ===================================================================
CREATE TABLE IF NOT EXISTS INGREDIENT (
    ingredient_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT (now()),
    updated_at TIMESTAMP DEFAULT (now())
);
CREATE TABLE IF NOT EXISTS INGREDIENT_COST (
    cost_id SERIAL PRIMARY KEY,
    ingredient_id INTEGER NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NULL,
    -- NULL means currently active cost
    cost_per_gram DECIMAL NOT NULL,
    created_at TIMESTAMP DEFAULT (now()),
    FOREIGN KEY (ingredient_id) REFERENCES INGREDIENT(ingredient_id),
    CHECK (
        end_date IS NULL
        OR start_date <= end_date
    )
);
CREATE TABLE IF NOT EXISTS DISH (
    dish_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    price DECIMAL NOT NULL,
    weight_in_grams DECIMAL NOT NULL,
    created_at TIMESTAMP DEFAULT (now()),
    updated_at TIMESTAMP DEFAULT (now())
);
CREATE TABLE IF NOT EXISTS USAGE (
    usage_id SERIAL PRIMARY KEY,
    dish_id INTEGER NOT NULL,
    ingredient_id INTEGER NOT NULL,
    weight_in_grams DECIMAL NOT NULL,
    created_at TIMESTAMP DEFAULT (now()),
    updated_at TIMESTAMP DEFAULT (now()),
    FOREIGN KEY (dish_id) REFERENCES DISH(dish_id),
    FOREIGN KEY (ingredient_id) REFERENCES INGREDIENT(ingredient_id)
);
-- ===================================================================
--
-- ===================================================================
-- CREATE INDEXES
-- ===================================================================
CREATE INDEX IF NOT EXISTS IX_INGREDIENT_COST_INGREDIENT ON INGREDIENT_COST(ingredient_id);
CREATE INDEX IF NOT EXISTS IX_INGREDIENT_COST_DATES ON INGREDIENT_COST(start_date, end_date);
CREATE INDEX IF NOT EXISTS IX_USAGE_DISH ON USAGE(dish_id);
CREATE INDEX IF NOT EXISTS IX_USAGE_INGREDIENT ON USAGE(ingredient_id);
-- ===================================================================
--
