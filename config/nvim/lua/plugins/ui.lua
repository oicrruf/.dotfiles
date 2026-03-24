return {
  -- Configurar el explorador de snacks (por defecto en LazyVim) a la derecha
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = true },
      picker = {
        sources = {
          explorer = {
            layout = { layout = { position = "right" } },
            win = {
              list = {
                keys = {
                  ["<BS>"] = false,
                },
              },
            },
          },
        },
      },
    }
  },

  -- Desactivar Neo-tree por completo
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  
  -- Desactivar dashboards y evitar netrw
  { "nvimdev/dashboard-nvim", enabled = false },
  { "goolord/alpha-nvim", enabled = false },
  { "nvim-mini/mini.starter", enabled = false },
}
