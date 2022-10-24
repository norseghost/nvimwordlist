local M = {}
local fn = vim.fn
local lists = {
    fn.getcompletion("", "command"),
    fn.getcompletion("", "option"),
    fn.getcompletion("", "event"),
    fn.getcompletion("", "highlight"),
    fn.getcompletion("", "filetype"),
}

local update_spell_file = function()
    local words = ""
    for _, list in pairs(lists) do
        for _, word in pairs(list) do
            words = words .. word .. "\n"
        end
    end
    local wordfile = "/tmp/vimwords.lst"
    local wordlist = io.open(wordfile, "w+")
    wordlist:write(words)
    wordlist:close()

    local spelldir = vim.call("spellfile#WritableSpellDir")

    vim.cmd("mkspell " .. spelldir .. "/vim " .. wordfile)
end

M.update = update_spell_file
