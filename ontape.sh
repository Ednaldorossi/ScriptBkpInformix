####################################
# PROCESSO DE BACKUP               #
# ONTAPE                           #
 ##################################
# Autor Ednaldo Rossi              #
# data 30/08/2016  versao 1.0      #
# alteracao 05/08/2018 versao 1.1  #
####################################
#variaveis
U_DATA=`date +%Y-%m-%d`
U_DATAI=`date +%s`

#criando arquivo de log
LOG=/var/log/ontape_$U_DATA.log
exec 1>>${LOG}
exec 2>&1

#Carregando váriaveis de ambiente
export INFORMIXDIR=/informix
export PATH=$INFORMIXDIR/bin:$PATH
export ONCONFIG=onconfig.prd
export INFORMIXSERVER=prdsoc
export DBDATE=dmy4/
export DBCENTURY=C
export DBMONEY=.

#inicio do backup
echo "Inicio do ontape $U_DATAI."
ontape -s -L 0
echo "Final do ontape"

#calculando tempo de duração.
U_DATAF=`date +%s`
chmod -R 777 /bkp/data/
resp=`expr $U_DATAF - $U_DATAI`
resultado=`expr 10800 + $resp`
tempo=`date -d @$resultado +%H:%M:%S`

echo "################################################################################################"
echo "# SCRIPT Iniciado em $U_DATAI, terminado em $U_DATAF duração $tempo - ONTAPE                   #"
echo "################################################################################################"
