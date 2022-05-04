#!/bin/bash

# This script builds a boilerplate set of files for a Node.js web app, opens the relevant files in VS Code,
# launches the node server, and opens the web app in the browser.

PARENT=$1
TITLE=$2
DESC=$3

echo "Creating directory and files..."

mkdir $PARENT ./$PARENT/src ./$PARENT/src/images

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

echo "
const express = require('express');
const app = express();

const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended: true}));

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html');
});

app.listen(3000, () => {
  console.log('Server started on port 3000.');
});
" > ./$PARENT/app.js

echo "Setting up npm dependencies..."

npm init -y
npm i express body-parser

echo "Initializing git repository..."

git init

echo "#Ignore all SQLite databases
db/*.sqlite3" > .gitignore

echo "Starting node server and launching app..."

nodemon app.js

code ../$PARENT
code index.html
xdg-open index.html
