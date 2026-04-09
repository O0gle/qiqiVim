# qiqiVim

一个偏向日常编码使用的 Neovim 配置，包含文件树、模糊搜索、Buffer 管理、Git、LSP 和浮动终端等常用能力。

## 安装

### Windows

1. 打开 PowerShell。
2. 进入 `C:\Users\<用户名>\AppData\Local`。
3. 如果已经有 `nvim` 配置，先备份：

```powershell
Rename-Item nvim old_nvim
```

4. 克隆本仓库：

```powershell
git clone https://github.com/O0gle/qiqiVim.git nvim
```

5. 启动 Neovim：

```powershell
nvim
```

### Linux / macOS

1. 进入 `~/.config`。
2. 如果已经有 `nvim` 配置，先备份：

```bash
mv nvim old_nvim
```

3. 克隆本仓库：

```bash
git clone https://github.com/O0gle/qiqiVim.git nvim
```

4. 启动 Neovim：

```bash
nvim
```

## 常用命令

- `:Lazy` 查看和管理插件
- `:Mason` 查看和管理 LSP / 开发工具
- `:ImLog` 打开输入法切换日志

## 快捷键指南

- `Leader` 键是 `Space`
- 下表只记录当前配置里显式定义的快捷键
- LSP 快捷键仅在语言服务器附加到当前缓冲区时生效
- 未列出的插件当前没有在本仓库中显式配置快捷键，通常使用默认行为

### 常用与插件快捷键

| 模式 | 快捷键 | 功能 | 来源 |
| --- | --- | --- | --- |
| Normal | `<C-p>` | 查找文件 | Telescope |
| Normal | `<leader>fg` | 全局文本搜索 | Telescope |
| Normal | `<leader>fb` | 查找已打开的 Buffer | Telescope |
| Normal | `<leader>fh` | 查找帮助文档标签 | Telescope |
| Normal | `<C-n>` | 打开或关闭文件树 | nvim-tree |
| Normal | `<leader><leader>f` | 单字符跳转 | Hop |
| Normal | `<leader><leader>w` | 单词跳转 | Hop |
| Normal | `<leader><leader>t` | 打开或关闭浮动终端 | ToggleTerm |
| Normal | `<leader>gs` | 打开 Neogit 状态面板 | Neogit |
| Normal | `<leader>1` | 跳转到第 1 个 Buffer | Bufferline |
| Normal | `<leader>2` | 跳转到第 2 个 Buffer | Bufferline |
| Normal | `<leader>3` | 跳转到第 3 个 Buffer | Bufferline |
| Normal | `<leader>4` | 跳转到第 4 个 Buffer | Bufferline |
| Normal | `<leader>5` | 跳转到第 5 个 Buffer | Bufferline |
| Normal | `<leader>6` | 跳转到第 6 个 Buffer | Bufferline |
| Normal | `<leader>7` | 跳转到第 7 个 Buffer | Bufferline |
| Normal | `<leader>8` | 跳转到第 8 个 Buffer | Bufferline |
| Normal | `<leader>9` | 跳转到第 9 个 Buffer | Bufferline |
| Normal | `<leader>0` | 关闭当前 Buffer | Bufferline |

### LSP 快捷键

| 模式 | 快捷键 | 功能 | 说明 |
| --- | --- | --- | --- |
| Normal | `gd` | 跳转到定义 | 当前 Buffer 已挂载 LSP 时生效 |
| Normal | `K` | 查看悬浮信息 | 当前 Buffer 已挂载 LSP 时生效 |
| Normal | `gr` | 查看引用 | 当前 Buffer 已挂载 LSP 时生效 |
| Normal | `<leader>rn` | 重命名符号 | 当前 Buffer 已挂载 LSP 时生效 |
| Normal | `<leader>ca` | 代码操作 | 当前 Buffer 已挂载 LSP 时生效 |

### 模式切换与终端内快捷键

| 模式 | 快捷键 | 功能 | 说明 |
| --- | --- | --- | --- |
| Insert | `jj` | 退出到 Normal 模式 | 自定义映射 |
| Terminal | `jj` | 退出终端输入模式 | 回到 Terminal-Normal 模式 |
| Terminal | `<Esc>` | 退出终端输入模式 | 回到 Terminal-Normal 模式 |
| Telescope Insert | `<C-n>` | 选中下一项 | 仅在 Telescope 面板中生效 |
| Telescope Insert | `<C-p>` | 选中上一项 | 仅在 Telescope 面板中生效 |

## 当前启用的主要插件

- `bufferline.nvim`
- `hop.nvim`
- `lualine.nvim`
- `mason.nvim`
- `mason-lspconfig.nvim`
- `neogit`
- `nvim-surround`
- `nvim-tree.lua`
- `nvim-treesitter`
- `telescope.nvim`
- `toggleterm.nvim`
- `render-markdown.nvim`
