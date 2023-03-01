local telescope = require'telescope.builtin'

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local lsp = require 'lspconfig'

-- This maps each of the language server names that are configured as part of `lspconfig`
-- to the settings that are used for each; many do not require additional settings but others
-- may have more involved overrides
local lsp_configs = {
  ansiblels = {},
  bashls = {},
  jsonls = {},
  powershell_es = {},
  tsserver = {
    commands = {
      OrganizeImports = {
        function()
          vim.lsp.buf.execute_command {
            command = "_typescript.organizeImports",
            arguments = { vim.api.nvim_buf_get_name(0) },
            title = ""
          }
        end,
        description = "Organize Imports"
      }
    }
  },
  jdtls = {
    root_dir = function()
      return vim.fn.getcwd()
    end
  },
  lua_ls = {},
  dockerls = {},
  yamlls = {
    settings = {
      yaml = {
        hover = true,
        completion = true,
        validate = true,
      },
    },
  },
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local base_lsp_config = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = capabilities,
  on_attach = on_attach,
}

lsp.util.default_config = vim.tbl_deep_extend(
  'force',
  lsp.util.default_config,
  base_lsp_config
)

for server, settings in pairs(lsp_configs) do
  lsp[server].setup(settings)
end

local cmp = require "cmp";
local luasnip = require "luasnip"
local lspkind = require "lspkind"
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
--local select_opts = { behavior = cmp.SelectBehavior.Select }
local select_opts = { behavior = cmp.SelectBehavior.Insert }

cmp.setup {
  enabled = function ()
    -- disable completion in comments
    local context = require 'cmp.config.context'
    if vim.api.nvim_get_mode().mode == 'c' then
      return true
    else
      return not context.in_treesitter_capture('comment')
        and not context.in_syntax_group('comment')
    end
  end,
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'buffer', keyword_length = 2, },
    { name = 'nvim_lua' },
  },
  window = {
    documentation = cmp.config.window.bordered()
  },
  view = {
    entries = { name = 'custom', selection_order = 'near_cursor' }
  },
  completion = {
    keyword_length = 1,
  },
  formatting = {
    fields = { 'menu', 'abbr', 'kind' },
    format = lspkind.cmp_format {
      mode = "symbol_text",
      menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        nvim_lua = "[nvim]",
      }),
    },
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping(function(fallback)
      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and (
            vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            )
      end

      if cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  experimental = {
    ghost_text = true,
  },
}
cmp.setup.cmdline({ '/', '?'}, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
    {{ name = 'path' }},
    {{ name = 'cmdline' }}
  )
})
cmp.setup.filetype('neo-tree', {
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),
  sources = cmp.config.sources(
    { name = 'path' }
  )
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  function ()
    cmp_autopairs.on_confirm_done()
  end
)

local null_ls = require "null-ls";
null_ls.setup {
  sources = {
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.diagnostics.alex,
    -- JavaScript/TypeScript
    --null_ls.builtins.code_actions.eslint_d,
    --null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.formatting.prettier,
    -- Shell
    null_ls.builtins.code_actions.shellcheck,
    null_ls.builtins.diagnostics.shellcheck,
    -- Markdown
    null_ls.builtins.diagnostics.markdownlint,
    null_ls.builtins.formatting.markdownlint,
  }
}
