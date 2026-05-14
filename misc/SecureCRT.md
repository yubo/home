# SecureCRT 颜色方案导入

## 操作步骤

1. 关闭 SecureCRT
2. 打开配置文件：
   ```
   Windows: %APPDATA%\VanDyke\Config\Global.ini
   ```
3. 找到 `Z:"ANSI Color Palettes"` 行，将计数加 1：
   ```ini
   Z:"ANSI Color Palettes"=00000011
   ```
4. 在该行下方追加颜色方案定义行
5. 保存文件，重启 SecureCRT
6. `Session Options → Terminal → Appearance → Color Scheme` 中选择新方案

## 颜色方案格式

```
名称,ANSI0,ANSI1,...,ANSI15
```

每个颜色为 `RRGGBBAA` 格式（8 位十六进制），`AA` 固定为 `00`（不透明）。

## Kanagawa 方案

```
Kanagawa,16161D00,C3404300,76947600,C0A36E00,7E9CD800,957FB800,6A958900,C8C09300,72716900,E8242400,98BB6C00,E6C38400,7FB4CA00,938AA900,7AA8A800,DCD7BA00
```

| 槽位 | 颜色 | 说明 |
|------|------|------|
| ANSI 0 | `#16161D` | Black |
| ANSI 1 | `#C34043` | Red |
| ANSI 2 | `#769476` | Green |
| ANSI 3 | `#C0A36E` | Yellow |
| ANSI 4 | `#7E9CD8` | Blue |
| ANSI 5 | `#957FB8` | Magenta |
| ANSI 6 | `#6A9589` | Cyan |
| ANSI 7 | `#C8C093` | White |
| ANSI 8 | `#727169` | Bright Black |
| ANSI 9 | `#E82424` | Bright Red |
| ANSI 10 | `#98BB6C` | Bright Green |
| ANSI 11 | `#E6C384` | Bright Yellow |
| ANSI 12 | `#7FB4CA` | Bright Blue |
| ANSI 13 | `#938AA9` | Bright Magenta |
| ANSI 14 | `#7AA8A8` | Bright Cyan |
| ANSI 15 | `#DCD7BA` | Bright White |
