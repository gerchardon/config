# -*-Shell-script-*-
export CONFIG_PATH=$(dirname $(readlink -f $BASH_SOURCE))
for FILE in $CONFIG_PATH/.alias.d/*; do
  source $FILE
done
