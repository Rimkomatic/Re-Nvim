return {
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      'echasnovski/mini.snippets',
    },
    version = '*', -- Comma added here

    opts = {

      keymap = {
        preset = 'none',
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-l>'] = { 'hide' },
        ['<C-.>'] = { 'select_and_accept' },
        ['<C-p>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-m>'] = { 'scroll_documentation_down', 'fallback' },
        ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
        ['<Tab>'] = { 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'normal',
      },
      signature = { enabled = true },

      -- Moved completion inside opts
      completion = {
        ghost_text = {
          enabled = true,
        },
        menu = {
          border = vim.g.border_style,
          scrolloff = 1,
          scrollbar = false,
          draw = {
            columns = {
              { "label",     "label_description", gap = 2 },
              { "kind_icon", "kind" }
            },
          }
        },
        documentation = {
          auto_show_delay_ms = 0,
          auto_show = true,
          window = {
            border = ""
          },
        },
      },
    },
  }
}
