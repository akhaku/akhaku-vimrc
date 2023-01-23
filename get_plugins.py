import os

plugins=[{"name":"supertab", "tag":"2.1", "url":"https://github.com/ervandew/supertab.git"},
        {"name":"nerdtree", "tag":"6.10.16", "url":"https://github.com/preservim/nerdtree.git"},
        {"name":"vim-fugitive", "tag":"v3.7", "url":"https://github.com/tpope/vim-fugitive.git"},
        {"name":"vim-java-unused-imports", "tag":"v1.2.0", "url":"https://github.com/akhaku/vim-java-unused-imports.git"},
        {"name":"vim-javascript", "tag":"v1.2.2", "url":"https://github.com/pangloss/vim-javascript.git"},
        {"name":"vim-gitgutter", "tag":"master", "url":"https://github.com/airblade/vim-gitgutter.git"},
        {"name":"typescript-vim", "tag":"master", "url":"https://github.com/leafgarland/typescript-vim.git"},
        {"name":"fzf", "tag":"master", "url":"https://github.com/junegunn/fzf.git"},
        {"name":"fzf.vim", "tag":"master", "url":"https://github.com/junegunn/fzf.vim.git"}]

pack_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'pack/')

print('Removing all current plugins!')
os.system(f'rm -rf {pack_dir}*')

for plugin in plugins:
    print(f'Downloading {plugin["name"]}')
    if os.system(f'git clone --depth 1 --branch {plugin["tag"]} {plugin["url"]} {pack_dir}{plugin["name"]}/start/{plugin["name"]}') != 0:
      print(f'Error downloading {plugin["name"]}')
      exit(1)

os.system(f'rm -rf {pack_dir}*.git')
print('Got all plugins')
