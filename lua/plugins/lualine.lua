-- Statusline setup using lualine with fancy custom separators
return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        component_separators = '',
        section_separators = { left = '', right = '' },
        inactive_section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '' }, right_padding = 2 }
        },
        lualine_b = { 'filename', 'branch' },
        lualine_c = { 'diff', 'diagnostics' },
        lualine_x = { },
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 }
        },
      },
      inactive_sections = {
        lualine_a = {
          { 'filename', separator = { left = '', right = '' }, right_padding = 2 }
        },
        lualine_b = { },
        lualine_c = { },
        lualine_x = { },
        lualine_y = { },
        lualine_z = {
          { 'location', separator = { right = '', left = '' }, left_padding = 2 }
        },
      },
      tabline = { },
      extensions = { },
    })
  end
}

