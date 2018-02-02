import os

plugins=[{"name":"supertab", "tag":"2.1", "url":"git://github.com/ervandew/vim-supertab.git"},
        {"name":"nerdtree", "tag":"5.0.0", "url":"git://github.com/scrooloose/nerdtree.git"},
        {"name":"command-t", "tag":"5.0.2", "url":"git://git.wincent.com/command-t.git"},
        {"name":"vim-fugitive", "tag":"2.2", "url":"git@github.com:tpope/vim-fugitive.git"},
        {"name":"vim-java-unused-imports", "tag":"v1.0.0", "url":"git://github.com/akhaku/vim-java-unused-imports.git"},
        {"name":"vim-javascript", "tag":"v1.2.2", "url":"git://github.com/pangloss/vim-javascript.git"},
        {"name":"vim-jsx", "tag":"master", "url":"git://github.com/mxw/vim-jsx.git"},
        {"name":"vim-gitgutter", "tag":"master", "url":"git://github.com/airblade/vim-gitgutter.git"},
        {"name":"vim-surround", "tag":"v2.1", "url":"https://github.com/tpope/vim-surround.git"}]

bundle_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'bundle/')

print "Removing all current plugins!"
os.system('rm -rf %s*' % bundle_dir)

for plugin in plugins:
    print "Downloading %s" % plugin['name']
    os.system("git clone --branch %s %s %s%s" % (plugin['tag'], plugin['url'], bundle_dir, plugin['name']) )

os.system("rm -rf %s*.git" % bundle_dir)

# Command-t C-extension setup
command_t_ext_path = "%scommand-t/ruby/command-t/" % bundle_dir
old_path = os.getcwd()
os.chdir(command_t_ext_path)
os.system("ruby extconf.rb")
os.system("make")
os.chdir(old_path)

print "Got all plugins"
