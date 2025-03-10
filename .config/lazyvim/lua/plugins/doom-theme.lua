return {
  {
    "GustavoPrietoP/doom-themes.nvim",
    lazy = false, -- Load immediately to apply the theme
    priority = 1000, -- Ensure it loads early
    config = function()
      -- Apply one of the available themes (e.g., doom-dracula)
      vim.cmd("colorscheme doom-gruvbox")
    end,
  },
}
