-- Este archivo se carga automáticamente por LazyVim
-- Aquí puedes poner atajos (keymaps) personalizados

local map = vim.keymap.set

-- Atajo para abrir la terminal central flotante abajo (estilo panel)
map("n", "<leader>t", function()
  Snacks.terminal.toggle()
end, { desc = "Toggle Terminal flotante inferior" })

-- Atajo alternativo para abrir en split si alguna vez lo necesitas
map("n", "<leader>T", function()
  Snacks.terminal.toggle(nil, { win = { position = "bottom", relative = "editor", height = 0.3 } })
end, { desc = "Toggle Terminal split inferior" })

-- NOTA: También puedes usar <c-/> (Control + /) que viene por defecto en LazyVim.
