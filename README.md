### About

This repository is a companion to the article I wrote about CGI!
You can check it out over at https://ethanclark.xyz/posts/cgi

### Usage

The `simplehttp` script is a two-for-one wrapper and config for [lighttpd](https://www.lighttpd.net/), a lightweight HTTP server with support for CGI.
If you can't get it from your distro of choice's repositories, there are downloads available on their website.

Running `./simplehttp` will start a lighttpd on port 8000 serving the current directory.
If you need a different port or directory, they can be specified as arguments: `./simplehttp [PORT] [ROOT_DIR]`

The `cgi-bin` directory has all the cgi scripts mentioned in the article in it.
Note that these scripts aren't meant for production use, so it's best not to expose them to the internet.