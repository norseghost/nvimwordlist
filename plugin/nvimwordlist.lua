-- make sure this file is loaded only once
if vim.g.loaded_nvimwordlist == 1 then
    return
end
vim.g.loaded_nvimwordlist = 1

-- create any global command that does not depend on user setup
-- usually it is better to define most commands/mappings in the setup function
-- Be careful to not overuse this file!
local nvimwordlist = require("nvimwordlist")

vim.api.nvim_create_user_command(
    "NvimWordlistUpdate",
    nvimwordlist.update_spell_file,
    { desc = "Update spellfile for Neovim words" })
