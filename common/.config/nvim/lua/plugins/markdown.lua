-- render-markdown.nvim (llega con el extra lang.markdown): aspecto parecido a
-- Obsidian y casillas de las listas de tareas visibles, que el extra desactiva.
-- LaTeX desactivado: necesitaría el parser latex de tree-sitter y utftex o
-- latex2text, y sin ellos :checkhealth avisa en cada revisión.
--
-- markdownlint-cli2 (lo activa el mismo extra) recibe como base
-- ~/.markdownlint-cli2.yaml: sin ella marca cada párrafo de una sola línea y
-- cada tabla sin alinear. El .markdownlint* de un repositorio se aplica encima.
local base = vim.fn.expand("~/.markdownlint-cli2.yaml")

return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      preset = "obsidian",
      checkbox = { enabled = true },
      latex = { enabled = false },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = vim.fn.filereadable(base) == 1 and { "--config", base, "-" } or { "-" },
        },
      },
    },
  },
}
