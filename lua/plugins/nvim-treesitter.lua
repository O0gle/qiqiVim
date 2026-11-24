return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local mingw_bin = "C:\\msys64\\mingw64\\bin"
    local gcc_path = mingw_bin .. "\\gcc.exe"
    if vim.fn.executable(gcc_path) == 1 then
      if not vim.env.CC or vim.env.CC == "" then
        vim.env.CC = gcc_path
      end
      if not (vim.env.PATH or ""):find(mingw_bin, 1, true) then
        vim.env.PATH = (vim.env.PATH or "") .. ";" .. mingw_bin
      end
    end

    require("nvim-treesitter").install({ "c", "cpp", "c_sharp", "kotlin", "markdown", "markdown_inline" })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "c", "cpp", "cs", "kotlin", "markdown" },
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}