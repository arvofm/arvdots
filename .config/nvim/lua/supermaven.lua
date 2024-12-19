require("supermaven-nvim").setup({
  keymaps = {
    accept_suggestion = '<C-;>',
    clear_suggestion = '<C-]>',
    accept_word = '<C-l>',
  },
  log_level = "off",
  disable_inline_completion = true, -- disables inline completion for use with cmp
  disable_keymaps = false -- disables built in keymaps for more manual control
})

