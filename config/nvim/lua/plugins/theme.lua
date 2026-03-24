return {
  {
    "NLKNguyen/papercolor-theme",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = "dark"
      vim.cmd("colorscheme PaperColor")
      
      -- Forzar transparencia sobre PaperColor para un look unificado y profesional
      local highlights = {
        "Normal", "NormalFloat", "FloatBorder", "LineNr", "Folded", 
        "NonText", "SpecialKey", "VertSplit", "SignColumn", "EndOfBuffer"
      }
      for _, group in ipairs(highlights) do
        vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
      end
    end,
  },
}
