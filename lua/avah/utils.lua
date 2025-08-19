local M = {}

local function trim_whitespace(s)
	return s:match("^%s*(.-)%s*$")
end

M.get_theme = function()
	local file = io.open(os.getenv("THEME_FILE") or vim.fn.expand("~/.theme"), "r")
	if file then
		local theme = trim_whitespace(file:read("*all") or "light") -- default light
		file:close()
		return theme
	else
		print("Cannot find theme file at $THEME_FILE")
	end

	-- light theme by default
	return "light"
end

M.get_word_count = function()
	if vim.fn.getfsize(vim.fn.expand("%")) > 1 * 1000 * 1000 then
		return "too many words"
	end
	local word_count = vim.fn.wordcount()
	if word_count.visual_words then
		return word_count.visual_words .. " words"
	else
		return word_count.words .. " words"
	end
end

return M
