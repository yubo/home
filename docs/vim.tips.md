# vim tips
```
	leader 设置为逗号，以下简称为l
	l-x 表示先按leader,再按x
	C-x 表示按住ctrl的同时，按下x

	<l-space>	打开/关闭NERD_tree
		t		在tab中打开
	<C-h/l>		tab间切换
	<l-h/j/k/l> wincmd 方向
	<l-u>		update diff
```

##### 块选择

| di" | 删除双引号内的字符          |
|-----|-----------------------------|
| yi" | 复制双引号内的字符          |
| vi" | 选取双引号内的字符          |

##### 缩进

|   | NORMAL | INSERT | VISUAL |
|---|--------|--------|--------|
| + | [n]>>  | c-t    | [n]>   |
| - | [n]<<  | N/A    | [n]<   |


## 插件

##### golang

|   map     | desc  |
|-----------|-------|
|`<leader>e`| rename|


##### EasyMotion

| map     | desc         |
|---------|--------------|
| `<c-f>` | forward      |
| `<c-b>` | back         |

##### 注释 The-NERD-Commenter

comment current line or text selected in visual mode

|        |  line        | block        |
|--------|--------------|--------------|
| add    | `<leader>cc` | `<leader>cm` |
| remove | `<leader>ci` | `<leader>cu` |

##### tablify
  - `<leader>tt`

##### ZoomWin
  - `c-w o`
