---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls", -- Lua
        "tailwindcss", -- Tailwind
        "tsserver", -- Typescript
        "taplo", -- TOML
        "yamlls", -- YAML
        "nil-ls", -- Nix
        "pyright", -- Python
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "stylua",
      },
    },
  },
  -- use mason-nvim-dap for debugging protocols
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = {
        "python",
      },
    },
  },
}
