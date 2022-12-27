# webinit

Written for Ubuntu, this script creates the base files for a Node.js web app. Specifically, it:

1. Creates directories with boilerplate index.html, app.js, and css files.
2. Initiates npm.
3. Installs npm express and body-parser.
4. Initiates a git repo with .gitignore file.
5. Opens the parent directory in VS Code.
6. Starts the server on localhost:3000.
7. Opens localhost:3000 in the browser.

## Table of Contents

1. [How it works](#how-it-works)
2. [File structure](#file-structure)
3. [Incidental code](#incidental-code)
4. [Dependencies](#dependencies)
5. [Additional set up (optional)](#additional-set-up)
6. [Example](#example)

## How it works

The script takes three positional arguments:

1. Parent directory name
2. HTML title tag value
3. HTML meta tag description

The HTML values are injected into the `index.html` file when it's created (see the [example](#example) below for more).

## File structure

* `parent` directory (named based on first positional argument)
  * `node_modules` directory
  * `public` directory
    * `images` directory
    * `style.css` file
  * `index.html` file
  * `app.js` file
  * `.gitignore` file
  * `package.json` files

## Incidental code

In addition to the boilerplate code, some incidental tags and selectors were added to the HTML and CSS files as a sort of test to ensure that all of the files are set up correctly. These include:
| File | Tag/Selector | Value |
| ---- | ------- | ----- |
| CSS | body | darkslateblue |
| CSS | color | ghostwhite |
| HTML | h1 | "Hola, mundo!" |
| HTML | script | Google hosted jQuery library |

## Dependencies

### Ubuntu

This script was written for Ubuntu. It is not meant for Windows or Mac. You may encounter errors on other Linux distros (see the [xdg-util dependency](#xdg-util-package) below).

### VS Code & the `code` command

This script opens your files in VS Code. Therefore, you must have VS Code installed for it to work properly.

Additionally, the last few lines of the script include the following code:

```bash
code index.html
```

This `code` command is what opens up the newly created parent directory and index.html file in VS Code.
However, in order for this to work, you need to have the `code` command set up via VS Code. Here's how to do it:

1. Open VS Code
2. Press `ctrl + shift + P` (`cmd + shift + P` for Mac)
3. Type `shell`
4. Select `Shell Command: Install 'code' command in PATH`

And that's it! Now you can type `code $FILE_NAME` in the terminal to open a file in VS Code.

### xdg-util package

One of the last lines of the script uses the `xdg-open` command to open the `localhost:3000` file in the browser. However, it should be noted that the xdg-util package is not installed by default on some instances of Linux (Ubuntu, Fedora, and Debian should have it installed by default).

Furthermore, if you're using Mac or Windows, this command won't work.

To install the xdg-util package on your Linux machine, enter the following two commands in the terminal:

```bash
sudo apt-get update
sudo apt-get install xdg-utils
```

### Nodemon

Instead of launch the node app with `node app.js`, this script uses nodemon.

So what is nodemon?

Nodemon is an NPM package that automatically restarts node apps when file changes in the directory are detected.

To install nodemon globally to your system path, type the following command into the terminal:

```bash
npm install -g nodemon # or using yarn: yarn global add nodemon
```

Once installed, you can run any node.js app with the command:

```bash
nodemon <app_name>
```

## Additional set up (optional)

To make this script easily executable, you can create a custom alias called `webinit`. Here's how:

### PLEASE NOTE: These instructions are for Ubuntu. This may not work for other Linux distros, Mac, or WSL

1. In the terminal, type `nano ~/.bashrc`
2. Be *VERY* careful editing this file. Go all the way to the bottom and add this line: `alias webinit="source ~/$FILE_PATH`. Be sure to replace `$FILE_PATH` with the full file path to the location of where you have saved the webinit shell script (including the name of the script file itself).
3. To save and exit, hit:
    1. `ctrl + x`
    2. `y`
    3. `enter`
    4. `enter`

## Example

Here's an example of the script being exeucted (using the alias in the [Additional set up](additional-set-up) section):

```bash
webinit test-directory "Test Title" "This is a test description."
```

This should:

1. Spin up the files
2. Open up the new parent directory in VS Code
3. Open up index.html in VS Code
4. Start the app.js file with nodemon on localhost:3000
5. Open localhost:3000 in a browser (see image below)

<img src="https://github.com/TommyC37/webinit/blob/main/images/boilerplate-page-example.png" alt="Screenshot of the index.html file appearing in the browser" height="225px">
