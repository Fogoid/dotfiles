function ColorMyPencils(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)
    LineNumberColors()
end

function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#f5c2e7', bold=false })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { fg='#89dceb', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#f5c2e7', bold=false })
end

ColorMyPencils()

