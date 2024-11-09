#!/bin/bash

# This script builds a boilerplate set of files for a Node.js web app, opens the relevant files in VS Code,
# launches the node server, and opens the web app in the browser.

PARENT=${1:-"WEBINIT_DIR"}
TITLE=${2:-"WEBINIT_TITLE"}
DESC=${3:-"WEBINIT_DESC"}

echo "Creating directory and files..."

mkdir $PARENT ./$PARENT/public ./$PARENT/public/images

cd $PARENT

echo "body {
background-color: darkslateblue;
color: ghostwhite;
}" > ./public/style.css

echo "<!DOCTYPE html>
<html>
  <head>
    <meta charset=\"utf-8\">
    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
    <title>$TITLE</title>
    <meta name=\"description\" content=\"$DESC\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
    <link rel=\"stylesheet\" type=\"text/css\" href=\"/style.css\">
  </head>
  <body>
    <h1>Hola, mundo!</h1>
    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js\"></script> 
    <script src=\"app.js\" async defer></script>
  </body>
</html>" > ./index.html

echo "const express = require('express');
const app = express();

const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(__dirname + '/public'));

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html');
});

app.listen(3000, () => {
  console.log('Server started on port 3000.');
});" > ./app.js

echo "Setting up npm dependencies..."

npm init -y
npm i express body-parser

echo "Initializing git repository..."

git init

echo "#Ignore all SQLite databases
db/*.sqlite3" > .gitignore

echo "Opening files in VS Code..."
code .
code index.html

sleep 2 && xdg-open http://localhost:3000 &

echo "Starting node server and launching app..."
nodemon app.js
