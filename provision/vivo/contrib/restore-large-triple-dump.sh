#TODO: Paramaterize this and take the mysqldump file as input
#Database Connection Information
#export STAGE_DB_USER=
#export STAGE_DB_PASS=
#export STAGE_DB_HOST=
#export STAGE_DB=

# splitting the backup file if its over a gig or 2 makes the restore run much faster
# assuming you have a splits directory and you ran this
# split -l 500 ../vivo_backup_09_13_2013.sql sql_ 



cat splits/sql_* | mysql --host localhost -uroot -pvivo vivodev
