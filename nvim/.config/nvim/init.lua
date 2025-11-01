-- require("core.mason-path")
-- require("core.lsp")
require("config.autocmds")
-- require("config.mason-verify")
-- require("config.health-check")
vim.g.mapleader = " "					-- change leader to a space
vim.g.maplocalleader = " "				-- change localleader to a space
require("core.lazy")
require("config.options")
require("config.keymaps")

--[[ -- Define a function to open Oil in the current working directory
local function open_oil_on_startup()
    -- Check if Neovim started without any file arguments
    if #vim.api.nvim_list_bufs() == 1 and vim.bo.buftype == "" and vim.fn.argc() == 0 then
        -- The first buffer is an empty, unlisted buffer, so open Oil
        -- require("Fyler").open()
        vim.cmd("Fyler")
    end
end

-- Execute the function after Neovim has finished starting up
vim.api.nvim_create_autocmd("VimEnter", {
    callback = open_oil_on_startup,
}) ]]
