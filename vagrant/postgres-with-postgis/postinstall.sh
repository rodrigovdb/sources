# # Language Settings
# export LANGUAGE=pt_BR.UTF-8
# export LANG=pt_BR.UTF-8
# export LC_ALL=pt_BR.UTF-8
# locale-gen en_US.UTF-8
# locale-gen pt_BR.UTF-8
#
# aptitude update && aptitude safe-upgrade -y
#
# # Install basic unix packages
 aptitude install -y \
   bash-completion \
   build-essential \
   curl \
   git \
   postgresql \
   postgresql-contrib \
   postgis \
   postgresql-9.3-postgis-2.1 \
   tmux \
   vim \
   wget \
   rake \
   htop
#
# # Copy postgresql config files to proper dir
# DIR='/vagrant'/
# cp ${DIR}/samples/pg_hba.conf /etc/postgresql/9.3/main/
# cp ${DIR}/samples/postgresql.conf /etc/postgresql/9.3/main/
# service postgresql restart
#
# # Create postgresql user and database
# sudo su - postgres -c "echo \"CREATE USER desenv WITH SUPERUSER CREATEDB CREATEROLE ENCRYPTED PASSWORD 'rapadura';\" |psql -U postgres -d postgres" vagrant
# sudo su - postgres -c "echo \"CREATE DATABASE location;\" |psql -U postgres -d postgres" vagrant
# sudo su - postgres -c "echo \"GRANT ALL PRIVILEGES ON DATABASE location TO desenv;\" |psql -U postgres -d postgres" vagrant
sudo -u postgres psql -c "CREATE EXTENSION postgis; CREATE EXTENSION postgis_topology;" location
