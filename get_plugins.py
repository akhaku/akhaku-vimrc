import os

plugins=[{"name":"supertab", "url":"git://github.com/tsaleh/vim-supertab.git"},
        {"name":"nerdtree", "url":"git://github.com/scrooloose/nerdtree.git"},
        {"name":"command-t", "url":"git://git.wincent.com/command-t.git"},
        {"name":"vim-css-color", "url":"git://github.com/skammer/vim-css-color.git"},
        {"name":"vim-less", "url":"https://github.com/groenewege/vim-less.git"},
        {"name":"rails", "url":"git://github.com/tpope/vim-rails.git"}]

bundle_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'bundle/')

print "Removing all current plugins!"
os.system('rm -rf %s*' % bundle_dir)

for plugin in plugins:
    print "Downloading %s" % plugin['name']
    os.system("git clone %s %s%s" % ( plugin['url'], bundle_dir, plugin['name'] ) )

os.system("rm -rf %s*.git" % bundle_dir)

# Command-t C-extension setup
command_t_ext_path = "%scommand-t/ruby/command-t/" % bundle_dir
old_path = os.getcwd()
os.chdir(command_t_ext_path)
os.system("ruby extconf.rb")
os.system("make")
os.chdir(old_path)

# vim-css-color setup
old_path = os.getcwd()
os.chdir(bundle_dir)
os.system("mv vim-css-color/after ../")
os.chdir(old_path)

print "Got all plugins"
