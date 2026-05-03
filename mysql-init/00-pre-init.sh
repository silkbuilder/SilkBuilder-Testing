#!/bin/bash

apt-get update
apt-get install -y git curl

curl -L -o /docker-entrypoint-initdb.d/builder-core.sql https://raw.githubusercontent.com/silkbuilder/SilkBuilderCore/refs/heads/main/WEB-INF/sql/SilkBuilder-core-mysql.sql

curl -L -o /docker-entrypoint-initdb.d/client-core.sql https://raw.githubusercontent.com/silkbuilder/SilkClientCore/refs/heads/main/WEB-INF/sql/SilkClient-core-mysql.sql

