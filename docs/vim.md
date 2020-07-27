# vim

## install plugin
```
:BundleInstall
```

## install ycm plugin
```shell
echo "Bundle 'Valloric/YouCompleteMe'" >> ~/.vim_local

#open a vim and reinstall BundleInstall 
:BundleInstall

cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer --go-completer
```

## vim tips
```
leader 设置为逗号，以下简称为l
l-x 表示先按leader,再按x
C-x 表示按住ctrl的同时，按下x
```

map           | desc
--            | --
`<l-space>`   | 打开/关闭NERD_tree
`<C-h/l>`     | tab间切换
`<l-h/j/k/l>` | wincmd 方向
`<l-u>`       | update diff

##### 块选择

map    | desc
--     | --
`di"`  | 删除双引号内的字符          
`yi"`  | 复制双引号内的字符          
`vi"`  | 选取双引号内的字符          

##### 缩进

|   | NORMAL | INSERT | VISUAL |
|---|--------|--------|--------|
| + | [n]>>  | C-t    | [n]>   |
| - | [n]<<  | N/A    | [n]<   |


## 插件

##### golang

map    | desc
--     | --
`<l-e>`| rename


##### EasyMotion

map     | desc
--      | --
`<C-f>` | forward
`<C-b>` | backward

##### 注释 The-NERD-Commenter

comment current line or text selected in visual mode

map    |  line    | block
--     | --       | --
add    | `<l-cc>` | `<l-cm>`
remove | `<l-ci>` | `<l-cu>`

##### tablify
  - `<l-tt>`

##### ZoomWin
  - `C-w o`
