local M = {}
local fn = vim.fn

local function getcompletions()
    to_complete = { "command", "option" }
    completions = {}
    for _, subcomplete in pairs(to_complete) do
        for _, opt in pairs(vim.fn.getcompletion("", subcomplete)) do
            for _, compl in pairs(vim.fn.getcompletion(opt .. "", "cmdline")) do
                table.insert(completions, compl)
            end
        end
    end
end

local function getshortopts()
    local shortopts = {}
    local options = vim.api.nvim_get_all_options_info()
    for _, option in pairs(options) do
        if option.shortname then
            table.insert(shortopts, option.shortname)
        end
    end
    return shortopts
end

local lists = {
    fn.getcompletion("", "command"),
    fn.getcompletion("", "option"),
    fn.getcompletion("", "event"),
    fn.getcompletion("", "highlight"),
    fn.getcompletion("", "filetype"),
    fn.getcompletion("", "color"),
    fn.getcompletion("", "environment"),
    fn.getcompletion("", "function"),
    getshortopts(),
    getcompletions()
}

function M.update_spell_file()
    local words = ""
    for _, list in pairs(lists) do
        for _, word in pairs(list) do
            words = words .. word .. "\n"
        end
    end
    local wordfile = "/tmp/vimwords.lst"
    local wordlist = io.open(wordfile, "w")
    wordlist:write(words)
    wordlist:close()

    local spelldir = vim.call("spellfile#WritableSpellDir")

    vim.cmd("mkspell! " .. spelldir .. "/vim " .. wordfile)
end

return M
