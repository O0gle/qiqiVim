-- 新增：在终端模式下，将 'jj' 映射为退出终端模式
vim.api.nvim_set_keymap('t', 'jj', '<C-\\><C-n>', { noremap = true, silent = true })


-- 新增：在终端模式下，使用 <Esc> 退出终端模式

-- 这也是一种非常直观的退出方式
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })


vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })



-- 将 <C-n> 映射为打开/关闭 nvim-tree

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })