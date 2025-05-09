# nvim

## install from source
```sh
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

## install plugin
```
:PackerSync
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
`<c-w><t/b/p>`| wincmd top/bottom/previous
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
