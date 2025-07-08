-- Create tables
CREATE TABLE IF NOT EXISTS Ingredient (
    ingredient_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    created_at TEXT DEFAULT (datetime('now', 'localtime')),
    updated_at TEXT DEFAULT (datetime('now', 'localtime'))
);
CREATE TABLE IF NOT EXISTS IngredientCost (
    cost_id INTEGER PRIMARY KEY AUTOINCREMENT,
    ingredient_id INTEGER NOT NULL,
    start_date TEXT NOT NULL,
    -- SQLite uses TEXT for dates
    end_date TEXT NULL,
    -- NULL means currently active cost
    cost_per_gram REAL NOT NULL,
    created_at TEXT DEFAULT (datetime('now', 'localtime')),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredient(ingredient_id),
    CHECK (
        end_date IS NULL
        OR start_date <= end_date
    )
);
CREATE TABLE IF NOT EXISTS Dish (
    dish_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    price REAL NOT NULL,
    weight_in_grams REAL NOT NULL,
    created_at TEXT DEFAULT (datetime('now', 'localtime')),
    updated_at TEXT DEFAULT (datetime('now', 'localtime'))
);
CREATE TABLE IF NOT EXISTS Usage (
    usage_id INTEGER PRIMARY KEY AUTOINCREMENT,
    dish_id INTEGER NOT NULL,
    ingredient_id INTEGER NOT NULL,
    weight_in_grams REAL NOT NULL,
    created_at TEXT DEFAULT (datetime('now', 'localtime')),
    updated_at TEXT DEFAULT (datetime('now', 'localtime')),
    FOREIGN KEY (dish_id) REFERENCES Dish(dish_id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredient(ingredient_id)
);
-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS IX_IngredientCost_Ingredient ON IngredientCost(ingredient_id);
CREATE INDEX IF NOT EXISTS IX_IngredientCost_Dates ON IngredientCost(start_date, end_date);
CREATE INDEX IF NOT EXISTS IX_Usage_Dish ON Usage(dish_id);
CREATE INDEX IF NOT EXISTS IX_Usage_Ingredient ON Usage(ingredient_id);
