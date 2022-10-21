import os

plugins=[{"name":"supertab", "tag":"2.1", "url":"https://github.com/ervandew/supertab.git"},
        {"name":"nerdtree", "tag":"5.0.0", "url":"https://github.com/scrooloose/nerdtree.git"},
        {"name":"command-t", "tag":"5.0.5", "url":"https://github.com/wincent/command-t.git"},
        {"name":"kotin-vim", "tag":"master", "url":"https://github.com/udalov/kotlin-vim.git"},
        {"name":"vim-fugitive", "tag":"v2.2", "url":"https://github.com/tpope/vim-fugitive.git"},
        {"name":"vim-java-unused-imports", "tag":"v1.0.0", "url":"https://github.com/akhaku/vim-java-unused-imports.git"},
        {"name":"vim-javascript", "tag":"v1.2.2", "url":"https://github.com/pangloss/vim-javascript.git"},
        {"name":"vim-jsx", "tag":"master", "url":"https://github.com/mxw/vim-jsx.git"},
        {"name":"vim-gitgutter", "tag":"master", "url":"https://github.com/airblade/vim-gitgutter.git"},
        {"name":"vim-gradle", "tag":"master", "url":"https://github.com/tfnico/vim-gradle.git"},
        {"name":"typescript-vim", "tag":"master", "url":"https://github.com/leafgarland/typescript-vim.git"},
        {"name":"vim-surround", "tag":"v2.1", "url":"https://github.com/tpope/vim-surround.git"}]

bundle_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'bundle/')

print('Removing all current plugins!')
os.system('rm -rf %s*' % bundle_dir)

for plugin in plugins:
    print(f'Downloading {plugin["name"]}')
    if os.system(f'git clone --branch {plugin["tag"]} {plugin["url"]} {bundle_dir}{plugin["name"]}') != 0:
      print(f'Error downloading {plugin["nlme"]}')
      exit(1)

os.system(f'rm -rf {bundle_dir}*.git')

# Command-t C-extension setup
command_t_ext_path = f'{bundle_dir}command-t/ruby/command-t/ext/command-t/'
old_path = os.getcwd()
os.chdir(command_t_ext_path)
os.system("ruby extconf.rb")
os.system("make")
os.chdir(old_path)

print('Got all plugins')
