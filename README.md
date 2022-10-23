# OpenBytes Markdown Site

## What is this project?

This is the repository for the OpenBytes Site that uses Publish to generate the HTML using Markdown content.

## How can I contribute?

All site content contributions should be made in the [Content](https://github.com/0xOpenBytes/Site/tree/main/Content) folder. All functionality contributions should be made in the [Sources/Site](https://github.com/0xOpenBytes/Site/tree/main/Sources/Site). 

All contributions should be brached off the latest version of main and merged back into main.

## Setup

This projects uses [Publish](https://github.com/JohnSundell/Publish) and you will need to have it as a command line tool. You can install it from source or use Homebrew.

### Install from Brew (Recommended)

```
brew install publish
```

### Install from Source

```
$ git clone https://github.com/JohnSundell/Publish.git
$ cd Publish
$ make
```

### Run the site locally

Now that you have the Publish command line tool installed, you can now run the site locally! Just go to the root folder of the project and run the following command.

```
publish run
```

