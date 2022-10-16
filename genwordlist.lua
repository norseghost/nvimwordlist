local commands = vim.api.nvim_get_commands({})
local options = vim.api.nvim_get_all_options_info()
local lists = {
    "commands"; vim.fn.getcompletion("", "command"),
    "options"; vim.fn.getcompletion("", "option"),
    "events"; vim.fn.getcompletion("", "event"),
    "hilites"; vim.fn.getcompletion("", "highlight"),
    "filetypes"; vim.fn.getcompletion("", "filetype"),
}
local words = {}
for index, list in ipairs(lists) do
    for _, word in pairs(list) do
        words.insert(word)
    end
end
