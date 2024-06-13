--------------------------------------------------------------------------------
-- ROLES
--------------------------------------------------------------------------------
DO
$do$
BEGIN
   IF EXISTS (
      SELECT FROM pg_catalog.pg_roles
      WHERE  rolname = 'admin_qdmedia'
      ) THEN

      RAISE NOTICE 'Role "admin_qdmedia" already exists. Skipping.';
   ELSE
      CREATE ROLE admin_qdmedia LOGIN PASSWORD '1931a38f-62b6-49f4-8d07-5d020a9eb104';
   END IF;
END
$do$;

--------------------------------------------------------------------------------
-- DATABASE
--------------------------------------------------------------------------------
SELECT 'CREATE DATABASE qdmedia_db'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'qdmedia_db')\gexec
GRANT ALL PRIVILEGES ON DATABASE qdmedia_db TO admin_qdmedia;
\c qdmedia_db

--------------------------------------------------------------------------------
-- TABLES
--------------------------------------------------------------------------------
CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    user_email VARCHAR(191) NOT NULL UNIQUE,
    user_type INTEGER NOT NULL,
    last_login TIMESTAMP,
    user_passw VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    updated_at TIMESTAMP
);

CREATE TABLE Posts (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users(id),
    title VARCHAR(100) NOT NULL,
    post_description TEXT NOT NULL,
    views INT NOT NULL,
    likes INT NOT NULL,
    dislikes INT NOT NULL,
    image_url VARCHAR(500),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE Comments (
   id SERIAL PRIMARY KEY,
   user_id INT REFERENCES Users(id),
   post_id INT REFERENCES Posts(id),
   post_owner_id INT REFERENCES Users(id),
   comment_description TEXT NOT NULL,
   comment_status VARCHAR(50) NOT NULL,
   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP 
);

--------------------------------------------------------------------------------
-- INDEXES
--------------------------------------------------------------------------------


--------------------------------------------------------------------------------
-- FUNCTIONS
--------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION update_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;


--------------------------------------------------------------------------------
-- TRIGGERS
--------------------------------------------------------------------------------
CREATE TRIGGER set_timestamp
BEFORE UPDATE ON users
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

CREATE TRIGGER set_timestamp
BEFORE UPDATE ON comments
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

CREATE TRIGGER set_timestamp
BEFORE UPDATE ON posts
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

