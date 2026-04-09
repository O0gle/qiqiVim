# 安装

## Windows：
1. 打开PowerShell
2. cd到目录`C:\Users\用户名\AppData\Local\`下
3. 备份nvim目录，如果没有该目录可以忽略该步骤
4. `git clone https://github.com/O0gle/qiqiVim.git nvim`
5. 示例 `C:\Users\用户名\AppData\Local\nvim`

## Linux or Mac：
1. cd到目录`/home/用户名/.config/`
2. 备份nvim目录 ` mv nvim old_nvim `，如果没有该目录可以忽略该步骤
3. git clone https://github.com/O0gle/qiqiVim.git nvim
4. 示例 `/home/用户名/.config/nvim`

# 卸载

## Windows：
1. 打开PowerShell
1. cd到目录`C:\Users\用户名\AppData\Local\`下
2. `rm -r nvim`
3. `mv old_nvim nvim` 如果没有old_nvim可以忽略

## Windows、Linux or Mac：
1. cd到目录`/home/用户名/.config/`
1. `rm -r nvim`
2. `mv old_nvim nvim` 如果没有old_nvim可以忽略

# 运行
- 在终端上输入nvim
- 在normal模式下输入:Lazy 可以查看安装的插件
- 在normal模式下输入:Mason 可以查看、安装开发的插件

# 快捷键
ctrl+p 查找文件

