require("core")
require("plugins")

require("nvim-treesitter.install").prefer_git = false
require("nvim-treesitter.install").compilers = { "zig" }

local im_select_path = "E:\\Downloads\\im-select.exe"
local english_im = "1033"
local last_im = english_im
local im_log_file = vim.fs.joinpath(vim.fn.stdpath("cache"), "im.log")

local function log_im(message)
    local ok, err = pcall(vim.fn.writefile, {
        string.format("%s %s", os.date("%Y-%m-%d %H:%M:%S"), message),
    }, im_log_file, "a")

    if not ok then
        vim.schedule(function()
            vim.notify("failed to write im log: " .. tostring(err), vim.log.levels.WARN)
        end)
    end
end

local function get_current_im()
    if vim.fn.executable(im_select_path) ~= 1 then
        log_im("get_current_im skipped: im-select.exe not found at " .. im_select_path)
        return nil
    end

    local result = vim.fn.system(im_select_path)
    if vim.v.shell_error ~= 0 then
        log_im("get_current_im failed: shell_error=" .. tostring(vim.v.shell_error))
        return nil
    end

    result = vim.trim(result)
    if result == "" then
        log_im("get_current_im returned empty result")
        return nil
    end

    log_im("get_current_im -> " .. result)
    return result
end

local function switch_im(im)
    if not im or im == "" then
        log_im("switch_im skipped: empty input method")
        return
    end

    if vim.fn.executable(im_select_path) ~= 1 then
        log_im("switch_im skipped: im-select.exe not found at " .. im_select_path)
        return
    end

    log_im("switch_im -> " .. im)
    vim.fn.jobstart({ im_select_path, im })
end

local im_select_group = vim.api.nvim_create_augroup("im-select", { clear = true })

vim.api.nvim_create_autocmd("InsertLeave", {
    group = im_select_group,
    pattern = "*",
    callback = function()
        log_im("InsertLeave")
        last_im = get_current_im() or english_im
        log_im("saved last_im -> " .. tostring(last_im))
        switch_im(english_im)
    end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
    group = im_select_group,
    pattern = "*",
    callback = function()
        log_im("InsertEnter")
        switch_im(last_im)
    end,
})

vim.api.nvim_create_autocmd("VimEnter", {
    group = im_select_group,
    pattern = "*",
    callback = function()
        log_im("VimEnter")
        switch_im(english_im)
    end,
})

vim.api.nvim_create_user_command("ImLog", function()
    vim.cmd("edit " .. vim.fn.fnameescape(im_log_file))
end, {})
