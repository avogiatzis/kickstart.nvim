-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
--
return {
  {
    'nvim-neorg/neorg',
    lazy = false,
    version = '*',
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.concealer'] = {},
          ['core.dirman'] = {
            config = {
              workspaces = {
                notes = '~/notes',
              },
              default_workspace = 'notes',
            },
          },
        },
      }

      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
  },
  -- { 'windwp/nvim-autopairs', lazy = false },
  'roobert/tailwindcss-colorizer-cmp.nvim',
  {
    'windwp/nvim-ts-autotag',
    lazy = false,
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false,
  },
  {
    'OmniSharp/omnisharp-vim',
    lazy = false,
  },
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    keys = {
      { '<leader>xx', '<cmd>TroubleToggle<cr>', desc = 'Toggle Trouble' },
      { '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = 'Workspace Diagnostics' },
    },
  },
  {
    'nvimdev/lspsaga.nvim',
    event = 'LspAttach',
    config = function()
      require('lspsaga').setup {
        code_action = {
          show_server_name = true,
          extend_gitsigns = true,
        },
      }
      -- Use this mapping instead for better code action UI
      vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', { desc = 'Code actions' })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'mfussenegger/nvim-dap-python', -- Python-specific debug adapter
      'rcarriga/nvim-dap-ui', -- UI for debugging
    },
    config = function()
      require('dap-python').setup 'python' -- or path to your virtual env
      require('dapui').setup()

      vim.keymap.set('n', '<leader>db', '<cmd>DapToggleBreakpoint<CR>')
      vim.keymap.set('n', '<leader>dc', '<cmd>DapContinue<CR>')
      vim.keymap.set('n', '<leader>do', '<cmd>DapStepOver<CR>')
      vim.keymap.set('n', '<leader>di', '<cmd>DapStepInto<CR>')
      vim.keymap.set('n', '<leader>du', '<cmd>DapUIToggle<CR>')
    end,
  },
  {
    'jeetsukumaran/vim-pythonsense',
  },
  {
    'github/copilot.vim',
  },
  {
    'akinsho/bufferline.nvim',
    config = function()
      require('bufferline').setup {
        options = {
          mode = 'buffers', -- set to "tabs" to only show tabpages instead
          numbers = 'ordinal', -- "none" | "ordinal" | "buffer_id" | "both" | function
          close_command = 'bdelete! %d', -- can be a string | function
          right_mouse_command = 'bdelete! %d', -- can be a string | function
          left_mouse_command = 'buffer %d', -- can be a string | function
          indicator = {
            icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = 'icon', -- 'icon' | 'underline' | 'none'
          },
          buffer_close_icon = '',
          modified_icon = '●',
          close_icon = '',
          left_trunc_marker = '',
          right_trunc_marker = '',
          max_name_length = 18,
          max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
          truncate_names = true, -- whether or not tab names should be truncated
          tab_size = 18,
          diagnostics = 'nvim_lsp', -- | "nvim_lsp" | "coc" | false,
          diagnostics_update_in_insert = false,
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return '(' .. count .. ')'
          end,
          offsets = {
            {
              filetype = 'NvimTree',
              text = 'File Explorer',
              text_align = 'center',
              separator = true,
            },
          },
          color_icons = true, -- whether or not to add the filetype icon highlights
          show_buffer_icons = true, -- disable filetype icons for buffers
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
          persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
          separator_style = 'thin', -- | "thick" | "thin" | { 'any', 'any' },
          enforce_regular_tabs = false,
          always_show_bufferline = true,
          hover = {
            enabled = true,
            delay = 200,
            reveal = { 'close' },
          },
        },
      }

      -- Key mappings for bufferline
      vim.keymap.set('n', 'gt', '<Cmd>BufferLineCycleNext<CR>', {})
      vim.keymap.set('n', 'gT', '<Cmd>BufferLineCyclePrev<CR>', {})
      vim.keymap.set('n', '<leader>be', '<Cmd>BufferLineSortByExtension<CR>', {})
      vim.keymap.set('n', '<leader>bd', '<Cmd>BufferLineSortByDirectory<CR>', {})
      vim.keymap.set('n', '<leader>bp', '<Cmd>BufferLinePick<CR>', {})
      vim.keymap.set('n', '<leader>bc', '<Cmd>BufferLinePickClose<CR>', {})
      vim.keymap.set('n', '<leader>q', '<Cmd>bp|bd #<CR>', { noremap = true, silent = true, desc = 'Close current buffer' })
      vim.keymap.set('n', '<leader>w', '<Cmd>BufferLineCloseOthers<CR>', { noremap = true, silent = true, desc = 'Close other buffers' })
    end,
  },
}
