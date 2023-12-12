#!/bin/bash

INIT_SQL_DIR="/docker-entrypoint-initdb.d/sql"
SCHEMA_SQL_FILE=`ls ${INIT_SQL_DIR}/*-schema.sql`
DATA_SQL_FILE=`ls ${INIT_SQL_DIR}/*-data.sql`

# DDLでテーブルを作成する
mysql -u root -proot sakila < "${INIT_SQL_DIR}/${SCHEMA_SQL_FILE}"
# データを流し込む
mysql -u root -proot sakila < "${INIT_SQL_DIR}/${DATA_SQL_FILE}"