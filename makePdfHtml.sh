#!/bin/bash
# Script per a crear una web html i un pdf a partir d'un fitxer markdown
# Cada fitxer ha d'estar dins d'un directori amb una carpeta "images" amb les imatges
# Executar dins del directori indicant el nom del fitxer .md
# Ha d'existir una carpeta anomenada "web" al nivell superior, on es guradaran els fitxers generats
# També han d'existir al nivell superior les carpetes "template" i "web_template"
#
#Exemple:
# cd U01\ Introduction/
# ../makePdfHtml.sh U01-Introduction\ to\ server\ languages.md

if [ $# -lt 1 ]; then
    echo "Cal indicar un fitxer";
	exit;
fi

if [ $# -eq 1 ]; then
    FILENAME=$1
    BASENAME="${FILENAME%.*}"
else
    FILENAME="${*%${!#}}"
    BASENAME="${@:$#}"
fi

cur_dir=${PWD##*/}
cur_dir=${cur_dir// /_}
[ ! -d ../web/$cur_dir ] && mkdir ../web/$cur_dir

[ -d images ] && cp -r images ../web/$cur_dir

[ -d ../web/web_template ] && rm -r ../web/web_template
[ -d ../web_template ] && cp -r ../web_template ../web/

echo "Creant pdf..."
echo $FILENAME
pandoc "$FILENAME" -o "${BASENAME}.pdf" --template=../template/eisvogel.tex -N --highlight-style espresso
cp "${BASENAME}.pdf" ../web/$cur_dir/

echo "Creant html..."
echo ${1}
pandoc "${1}" -o "${BASENAME}.html" --toc -s --number-sections --highlight-style tango --template ../web_template/plantilla.html --css ../web_template/aqua.css --syntax-definition=../web_template/dart.xml
mv "${BASENAME}.html" ../web/$cur_dir/

ERROR=$?;
if [ ${ERROR} -eq 0 ]; then
	echo "FET."
else
    echo "Eixida amb error ${ERROR}";
	exit ${ERROR}
fi
