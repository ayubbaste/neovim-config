# neovim-config
NeoVIM configuration file

<p>Installation</p>
<pre>
sudo apt-get install libtool autoconf automake cmake libncurses5-dev g++
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
</pre>

<p>Configuration</p>

<pre>
mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim
</pre>

<p>Install Vim plugin manager</p>

<pre>
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
</pre>

<p>Put configs in to init.vim file</p>

<p>Apply configuration</p>

<pre>
source ~/.config/nvim/init.vim
</pre>

<p>Install plugins with Vim plugin manager</p>

<pre>
:PlugInstall
</pre>
