!/bin/sh
#Création d'une variable contenant la date
OUTDIR=`date +%Y-%m-%d`

#Création du dossier de backup avec comme nom la date du jour
mkdir /backup/$OUTDIR

#Copie des fichiers du répertoire www vers le dossier Backup
cp -r /var/www/ /backup/$OUTDIR

#Création du dossier qui contiendra les .conf des virtual hosts
mkdir /backup/$OUTDIR/vhost

#Copie des fichiers de virtual host vers le nouveau dossier
cp -r /etc/apache2/sites-available /backup/$OUTDIR/vhost

#Duplication de la base de donnée vers le dossier Backup
mysqldump -u root -p root  --all-databases > /backup/$OUTDIR/db_$OUTDIR.sql

#Archivage en tar du dossier Backup en entier
tar zcvf /backup/$OUTDIR/$OUTDIR.tar.gz /backup/$OUTDIR
