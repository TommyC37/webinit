# webinit
This script builds a boilerplate set of files for a webpage, initiates a git repo, opens it in VS Code, and opens the index.html file in a browser.

## Table of Contents
1. [How it works](#how-it-works)
2. [File structure](#file-structure)
3. [Incidental code](#incidental-code)
4. [VS Code initiation](#vs-code-initiation)
5. [Additional set up (optional)](#additional-set-up)
6. [Example](#example)

## How it works
The script takes three positional arguments:
1. Parent directory name
2. HTML title tag value
3. HTML meta tag description

The HTML values are injected into the HTML code when it's produced.

## File structure
* `parent` directory (named based on first positional argument)
    - `src` directory
      + `images` directory
      + `app.js` file
      + `style.css` file
    - `index.html` file
    - `.gitignore` file

## Incidental code
In addition to the boilerplate code, some incidental tags and selectors were added to the HTML and CSS files as a sort of test to ensure that all of the files are set up correctly. These include:
| File | Tag/Selector | Value |
| ---- | ------- | ----- |
| CSS | body | darkslateblue |
| CSS | color | ghostwhite |
| HTML | h1 | "Hola, mundo!" |
| HTML | script | Google hosted jQuery library |

## VS Code initiation
The last few lines of the script include the following code:
`code index.html`
This `code` command is what opens up the newly created parent directory and index.html file in VS Code.
However, in order for this to work, you need to have the `code` set up via VS Code. Here's how to do it:
1. Open VS Code
2. Press `ctrl + shift + P` (`cmd + shift + P` for Mac)
3. Type `shell`
4. Select `Shell Command: Install 'code' command in PATH

And that's it! Now you can type `code $FILE_NAME` in the terminal to open a file in VS Code.

## Additional set up
### (optional)
On my machine, I created a custom alias called `webinit` to execute this script on the fly. If you'd like to do the same, here's how:
#### PLEASE NOTE: These instructions are for Ubuntu. This may not work for other Linux distros or Mac.
1. In the terminal, type `nano ~/.bashrc`
2. Be *VERY* careful editing this file. Go all the way to the bottom and add this line: `alias webinit="source ~/$FILE_PATH`. Be sure to replace `$FILE_PATH` with the full file path to the location of where you have saved the webinit shell script (including the name of the script file itself).
3. To save and exit, hit:
    1. `ctrl + x`
    2. `y`
    3. `enter`
    4. `enter`

## Example
Here's an example of the script being exeucted (using the alias in the [Additional set up](additional-set-up) section):
>webinit test-directory "Test Title" "This is a test description."
This should:
1. Spin up the files
2. Open up the new parent directory in VS Code
3. Open up index.html in VS Code (see image below)
4. Open index.html in a browser (see image below)
