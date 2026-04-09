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

### Neogit 快捷键速查

- 以下 git 命令是便于理解的近似对应，不代表 Neogit 内部一定逐字执行相同命令
- `Leader` 键是 `Space`，所以 `<leader>gs` 实际按法是 `Space gs`

| 场景 | 快捷键 | 功能 | 近似对应的 git 命令 |
| --- | --- | --- | --- |
| 打开面板 | `<leader>gs` | 打开 Neogit 状态面板 | `:Neogit` |
| 面板内 | `?` | 打开帮助 | 无直接对应 |
| 面板内 | `q` | 关闭当前 Neogit 窗口 | 无直接对应 |
| 面板内 | `Tab` | 折叠或展开当前区块 | 无直接对应 |
| 面板内 | `Enter` | 打开光标所在文件 | 无直接对应 |
| 面板内 | `s` | 暂存当前文件或当前 hunk | `git add <file>` / `git add -p` |
| 面板内 | `S` | 暂存所有已跟踪文件的修改和删除 | `git add -u` |
| 面板内 | `<C-s>` | 暂存全部改动，包括新文件 | `git add --all` |
| 面板内 | `u` | 取消暂存当前文件或当前 hunk | `git restore --staged <file>` / `git reset HEAD <file>` |
| 面板内 | `U` | 取消暂存全部内容 | `git reset` |
| 面板内 | `x` | 丢弃当前文件或当前 hunk 的改动 | `git restore <file>` |
| 提交 | `c c` | 创建提交 | `git commit` |
| 提交 | `c a` | 修改上一次提交 | `git commit --amend` |
| 提交 | `c w` | 只修改上一次提交信息 | `git commit --amend --only` |
| 提交窗口 | `<C-c><C-c>` | 确认提交信息并提交 | `git commit` |
| 提交窗口 | `<C-c><C-k>` | 放弃本次提交 | 放弃提交 |
| 推送 | `P p` | 推送到 pushRemote 或默认远端 | `git push` |
| 推送 | `P u` | 推送到当前分支的 upstream | `git push` |
| 拉取 | `p u` | 从 upstream 拉取到当前分支 | `git pull` |
| 拉取 | `p p` | 从 pushRemote 拉取到当前分支 | `git pull <remote> <branch>` |
| 拉取 | `p e` | 从其他分支或远端拉取 | `git pull <remote> <branch>` |
| 分支 | `b l` | 切换到本地分支 | `git switch <branch>` |
| 分支 | `b c` | 新建并切换到分支 | `git switch -c <branch>` |
| 分支 | `b n` | 只新建分支，不切换 | `git branch <branch>` |
| 分支 | `b m` | 重命名分支 | `git branch -m <new-branch>` |
| 分支 | `b D` | 删除分支 | `git branch -D <branch>` |
| Stash | `Z z` | stash 当前工作区和暂存区改动 | `git stash push` |
| Stash | `Z p` | 应用并移除一个 stash | `git stash pop` |
| Stash | `Z a` | 应用一个 stash 但不移除 | `git stash apply` |
| Stash | `Z d` | 删除一个 stash | `git stash drop` |
| Stash | `Z l` | 查看 stash 列表 | `git stash list` |

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
