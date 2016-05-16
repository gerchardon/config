export CONFIG_PATH=$(dirname $(readlink -f $BASH_SOURCE))
for FILE in ~/.alias.d/*; do
  source $FILE
done
