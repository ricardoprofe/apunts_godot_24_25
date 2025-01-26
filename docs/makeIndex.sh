#!/bin/bash

DIRS=$(echo U*/)

##### Header
echo "<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DWES IES Jaume II El Just 2023-24</title>
    <link rel="stylesheet" href="web_template/aqua.css">
</head>
<body> 
<div id="content">
<header id="title-block-header">
<h1>Server-side Web Development - IES Jaume II El Just - 2024-25</h1>
</header>
<main>
" > index.html

### Body
for dir in $DIRS
do
    echo "<h2>$dir</h2>" >> index.html

    FILES="$dir*.html"
    for file in $FILES
    do
        echo "<p><a href='$file'>$file</a></p>" >> index.html
    done

    FILES="$dir*.pdf"
    for file in $FILES
    do
        echo "<p><a href='$file'>$file</a></p>" >> index.html
    done
done

#### Footer
echo "</main>
</div>
</body>
</html> " >> index.html
