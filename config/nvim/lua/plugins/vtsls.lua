return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = { vtsls = { settings = { vtsls = {
      autoUseWorkspaceTsdk = false,
    } } } },
  },
}
