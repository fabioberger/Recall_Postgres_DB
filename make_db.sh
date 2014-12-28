gosu postgres postgres --single <<- EOSQL
    CREATE USER recall;
    CREATE DATABASE recall_dev;
    GRANT ALL PRIVILEGES ON DATABASE recall_dev TO recall;
    CREATE DATABASE recall_test;
    GRANT ALL PRIVILEGES ON DATABASE recall_test TO recall;
    CREATE DATABASE recall_prod;
    GRANT ALL PRIVILEGES ON DATABASE recall_prod TO recall;
EOSQL

# Edit Postgres Configs to allow connections from recall user
sed -i 's/host all "postgres" 0.0.0.0\/0 md5/host all "recall" 0.0.0.0\/0 trust/g' /var/lib/postgresql/data/pg_hba.conf