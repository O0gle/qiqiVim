require("core")
require("plugins")

require("nvim-treesitter.install").prefer_git = false
require("nvim-treesitter.install").compilers = { "zig" }

local im_select_path = "E:\\Downloads\\im-select.exe"
local english_im = "1033"
local last_im = english_im

local function get_current_im()
    if vim.fn.executable(im_select_path) ~= 1 then
        return nil
    end

    local result = vim.fn.system(im_select_path)
    if vim.v.shell_error ~= 0 then
        return nil
    end

    result = vim.trim(result)
    if result == "" then
        return nil
    end

    return result
end

local function switch_im(im)
    if not im or im == "" then
        return
    end

    if vim.fn.executable(im_select_path) ~= 1 then
        return
    end

    vim.fn.jobstart({ im_select_path, im })
end

local im_select_group = vim.api.nvim_create_augroup("im-select", { clear = true })

vim.api.nvim_create_autocmd("InsertLeave", {
    group = im_select_group,
    pattern = "*",
    callback = function()
        last_im = get_current_im() or english_im
        switch_im(english_im)
    end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
    group = im_select_group,
    pattern = "*",
    callback = function()
        switch_im(last_im)
    end,
})

vim.api.nvim_create_autocmd("VimEnter", {
    group = im_select_group,
    pattern = "*",
    callback = function()
        switch_im(english_im)
    end,
})
