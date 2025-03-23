return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local lualine = require('lualine')
      local colors = {
        bg       = '#0F1419', -- Ayu Dark background
        fg       = '#B3B1AD', -- Ayu Dark foreground
        yellow   = '#E6B450',
        cyan     = '#73b2ff',
        darkblue = '#1F2430',
        green    = '#7fd962',
        orange   = '#FF8F40',
        violet   = '#A37ACC',
        magenta  = '#E6BAA8',
        blue     = '#73B8F1',
        red      = '#F07178',
        white    = '#ffffff',
      }

      local conditions = {
        buffer_not_empty = function()
          return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
        end,
        hide_in_width = function()
          return vim.fn.winwidth(0) > 80
        end,
        check_git_workspace = function()
          local filepath = vim.fn.expand('%:p:h')
          local gitdir = vim.fn.finddir('.git', filepath .. ';')
          return gitdir and #gitdir > 0 and #gitdir < #filepath
        end,
      }

      -- Config
      local config = {
        options = {
          component_separators = '',
          section_separators = '',
          theme = {
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
          },
        },
        sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          lualine_c = {},
          lualine_x = {},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_y = {},
          lualine_z = {},
          lualine_c = {},
          lualine_x = {},
        },
      }

      local function ins_left(component)
        table.insert(config.sections.lualine_c, component)
      end

      local function ins_right(component)
        table.insert(config.sections.lualine_x, component)
      end



      --ins_left {
      --  'filesize',
      --  cond = conditions.buffer_not_empty,
      --  color = { fg = colors.yellow, bg = colors.darkblue },
      --}


      ins_left {
        'filename',
        cond = conditions.buffer_not_empty,
        color = { fg = '#000000', bg = colors.orange, gui = 'bold' },
        separator = { right = '' },
      }

      ins_left {
        'location',
        color = { fg = colors.red, bg = colors.darkblue },
        separator = { right = '' },
      }

      ins_left {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ' },
        diagnostics_color = {
          error = { fg = colors.red, bg = colors.darkblue },
          warn = { fg = colors.yellow, bg = colors.darkblue },
          info = { fg = colors.cyan, bg = colors.darkblue },
        },
        separator = { right = '' },
      }

      ins_left {
        'filetype',
        cond = conditions.buffer_not_empty,
        color = { fg = '#ffffff', bg = colors.bg },
        separator = { right = '' },
      }

      ins_left {
        function() return '' end,
        color = function()
          local mode_color = {
            n = colors.red,
            i = colors.green,
            v = colors.blue,
            [''] = colors.blue,
            V = colors.blue,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [''] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.red,
            t = colors.red
          }
          return { fg = mode_color[vim.fn.mode()], }
        end,
        separator = { right = '' },
        --padding = { right = 2, left = 2 },
      }
      ins_left { function() return '%=' end }

      ins_right {
        function()
          local msg = 'No Active Lsp'
          local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
          local clients = vim.lsp.get_clients()
          if next(clients) == nil then return msg end
          for _, client in ipairs(clients) do
            if client.config.filetypes and vim.fn.index(client.config.filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        icon = '',
        color = { fg = colors.fg, },
        separator = { left = '' },
      }

      ins_right {
        'branch',
        icon = '',
        color = { fg = colors.orange, gui = 'bold' },
        separator = { left = '' },
        left_padding = 2
      }

      ins_right {
        'diff',
        symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
        diff_color = {
          added = { fg = colors.green, bg = colors.darkblue },
          modified = { fg = colors.orange, bg = colors.darkblue },
          removed = { fg = colors.red, bg = colors.darkblue },
        },
        separator = { left = '' },
        cond = conditions.hide_in_width,
      }

      lualine.setup(config)
    end
  }
}
