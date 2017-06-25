# About

This is in alpha. Test on your own. Don't dare using this if you don't use <code>zsh</code>.

# Install

The easy way is running <code>./install.sh</code>, found in this directory. The DIY mode is:

. Install powerline following the instructions in this post: https://blog.codefront.net/2013/10/27/installing-powerline-on-os-x-homebrew/
. Install https://github.com/jaspernbrouwer/powerline-gitstatus following the instructions

# Configure

You don't need to configure nothing manually if you have used the install.sh, but just in case...

When you install Powerline, don't forget to call it on ~/.zshrc by invoking <code>source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh #Powerline here we go!</code>

Once you install <code>powerline-gitstatus</code>, the files will be copied to <code>/usr/local/lib/python2.7/site-packages</code> and that's it, pip will just copy a bunch of files. Now to configure, you have to edit the themes and colorschemas, the <powerline-gitstatus</code> page asks you to edit these files, but Powerline creates multiple files (it's kinda chaotic) and the thing is *which* file to change. In my laptop I could put things to work by editing the files inside the "shell" folder, precisely these ones:  

- <code>/usr/local/lib/python2.7/site-packages/powerline/config_files/themes/shell/default.json</code>
- <code>/usr/local/lib/python2.7/site-packages/powerline/config_files/colorschemes/default.json</code>
