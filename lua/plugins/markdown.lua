-- Set up filetype detection for MDX files
vim.filetype.add {
  extension = { mdx = "markdown.mdx" },
}

-- Plugin configurations using Packer
-- Replace 'use' with your preferred plugin manager's syntax (e.g., for lazy.nvim use {'plugin/name'})
return {
  -- Formatting with conform.nvim
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup {
        formatters = {
          ["markdown-toc"] = {
            condition = function(_, ctx)
              for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
                if line:find "<!%-%- toc %-%->" then return true end
              end
            end,
          },
          ["markdownlint-cli2"] = {
            condition = function(_, ctx)
              local diag = vim.tbl_filter(
                function(d) return d.source == "markdownlint" end,
                vim.diagnostic.get(ctx.buf)
              )
              return #diag > 0
            end,
          },
        },
        formatters_by_ft = {
          ["markdown"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
          ["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
        },
      }
    end,
  },

  -- Mason for installing tools
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
      local mason_registry = require "mason-registry"
      for _, tool in ipairs { "markdownlint-cli2", "markdown-toc" } do
        if not mason_registry.is_installed(tool) then mason_registry.get_package(tool):install() end
      end
    end,
  },

  -- None-ls for additional functionality
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local nls = require "null-ls"
      nls.setup {
        sources = {
          nls.builtins.diagnostics.markdownlint_cli2,
        },
      }
    end,
  },

  -- Nvim-lint configuration
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters_by_ft = {
        markdown = { "markdownlint-cli2" },
      }
    end,
  },

  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    config = function() require("lspconfig").marksman.setup {} end,
  },

  -- Markdown preview

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
      -- Create an autocommand to set up the keymap only for markdown files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          vim.keymap.set("n", "<leader>cp", "<cmd>MarkdownPreviewToggle<cr>", {
            desc = "Markdown Preview",
            buffer = true, -- Make the mapping local to the buffer
          })
        end,
      })
    end,
  },

  -- Render markdown
  {
    "MeanderingProgrammer/render-markdown.nvim",
    config = function()
      require("render-markdown").setup {
        code = {
          sign = false,
          width = "block",
          right_pad = 1,
        },
        heading = {
          sign = false,
          icons = {},
        },
        checkbox = {
          enabled = false,
        },
      }

      -- Optional: Add your own toggle functionality
      local enabled = false
      vim.keymap.set("n", "<leader>um", function()
        enabled = not enabled
        local m = require "render-markdown"
        if enabled then
          m.enable()
        else
          m.disable()
        end
      end, { desc = "Toggle Markdown Rendering" })
    end,
    ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
  },
}
