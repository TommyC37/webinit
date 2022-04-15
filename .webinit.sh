#!/bin/bash

# This script builds a boilerplate set of files for a webpage and opens it in VS Code.

PARENT=$1
TITLE=$2
DESC=$3

mkdir $PARENT ./$PARENT/src ./$PARENT/src/images

touch ./$PARENT/src/app.js

echo "body {
background-color: darkslateblue;
color: ghostwhite;
}" > ./$PARENT/src/style.css

echo "<!DOCTYPE html>
<html>
  <head>
    <meta charset=\"utf-8\">
    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
    <title>$TITLE</title>
    <meta name=\"description\" content=\"$DESC\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
    <link rel=\"stylesheet\" href=\"src/style.css\">
  </head>
  <body>
    <h1>Hola, mundo!</h1>
    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js\"></script> 
    <script src=\"app.js\" async defer></script>
  </body>
</html>" > ./$PARENT/index.html

cd $PARENT

git init

echo "#Ignore all SQLite databases
db/*.sqlite3" > .gitignore

code ../$PARENT
code index.html
xdg-open index.html
