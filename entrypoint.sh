#!/bin/bash

cd /app

mysqldump -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" -p"$DB_PASSWORD" -B "$DB_NAME" > dump.sql
if [[ $? -eq 0 ]]; then
    echo "** Database export completed successfully! **"
else
    echo "** Error: Failed to export database. **"
    exit 1
fi

myanon -f anon.conf < dump.sql > anon.sql
if [[ $? -eq 0 ]]; then
    echo "** Data anonymization completed successfully! **"
else
    echo "** Error: Failed to anonymize data. **"
    exit 1
fi

mv dump.sql /app/result
mv anon.sql /app/result