-- Create databases
CREATE DATABASE IF NOT EXISTS builderdb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS clientdb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS appdb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


-- Grant full privileges to builderuser on both DBs
GRANT ALL PRIVILEGES ON builderdb.* TO 'builderuser'@'%';
GRANT ALL PRIVILEGES ON clientdb.* TO 'builderuser'@'%';
GRANT ALL PRIVILEGES ON appdb.* TO 'builderuser'@'%';


FLUSH PRIVILEGES;

-- Switch to builderdb and run the core script
USE builderdb;
SOURCE /docker-entrypoint-initdb.d/builder-core.sql;

-- Switch to clientdb and run the core script
USE clientdb;
SOURCE /docker-entrypoint-initdb.d/client-core.sql;