-- Extras de LazyVim para el stack de trabajo
return {
  { import = "lazyvim.plugins.extras.lang.python" },
  { import = "lazyvim.plugins.extras.lang.docker" },
  -- Markdown: render-markdown.nvim (render en el búfer), markdown-preview.nvim
  -- (vista en el navegador) y markdownlint. Ajustes propios en plugins/markdown.lua
  { import = "lazyvim.plugins.extras.lang.markdown" },
  -- Bash/Shell (instala bashls + shellcheck via Mason)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {},
      },
    },
  },
}
