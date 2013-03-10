# Editing Clojure with Emacs

This gist will guide you to setting up a basic [emacs-starter-kit](https://github.com/technomancy/emacs-starter-kit)-based Emacs configuration for editing Clojure.

## Getting Emacs

The first step is to get Emacs. Whatever you do, just make sure you get Emacs 24.

To paraphrase [Install the right Emacs](http://david.rothlis.net/emacs/install.html):

* On a Mac?

    $ brew install emacs --cocoa
    
* On Linux?
    
    $ your-package-manager install emacs

* On Windows?
    * Download the latest version of emacs from [http://ftp.gnu.org/pub/gnu/emacs/windows/](http://ftp.gnu.org/pub/gnu/emacs/windows/).
    * Follow the rest of the instructions on [Install the right Emacs](http://david.rothlis.net/emacs/install.html).

Once you've installed Emacs verify you have the correct version with `emacs --version`

    ▸ emacs --version                                                                                                                                                                                  
    GNU Emacs 24.2.1
    Copyright (C) 2012 Free Software Foundation, Inc.
    GNU Emacs comes with ABSOLUTELY NO WARRANTY.
    You may redistribute copies of Emacs
    under the terms of the GNU General Public License.
    For more information about these matters, see the file named COPYING.

Now, for the config...

## Installing the config

To follow along with the contents of the presentation I would suggest you download and install the Emacs configuration bundled in this gist like so:

1. Clean out any existing Emacs configurations you have.
2. Clone this gist to `.emacs.d` with the command `git clone ...`
3. Launch emacs without any arguments like `$ emacs`. You'll see a number of messages fly by as Emacs installs all of the packages specified in init.el.
 
If you didn't encounter any errors you've likely arrived at a simple, stable Emacs configuration. The configuration is annotated, so feel free to read and edit as you see fit.

Enjoy

### A special note for Mac users

If you try to follow along into the Paredit sections you'll be sorely disappointed when you start trying to do things like `C-<Right>`. The problem is this: **every** Mac terminal sends the incorrect key codes to your terminal, and by-proxy, Emacs.

Fix this by following the excellent instructions of Cosmin Stejerean's [Emacs + paredit under terminal](http://offbytwo.com/2012/01/15/emacs-plus-paredit-under-terminal.html). His instructions address how to fix Terminal.app, iTerm and iTerm2 to send the proper key codes for using Paredit.