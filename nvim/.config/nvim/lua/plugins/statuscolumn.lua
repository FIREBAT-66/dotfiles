local function statusBorderBump()
  local cursorline = vim.fn.line(".")
  if vim.v.lnum == cursorline then
    return "%#StatusColumnBorder#┠ "
  else
    return "%#StatusColumnBorder#┠  "
  end

end

return {
  "luukvbaal/statuscol.nvim", config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      -- configuration goes here, for example:
      relculright = true,
      segments = {
        -- { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        { text = {"%#StatusColumnBorder#%s" }, click = "v:lua.ScSa", hl = "Monoglow" },
        { text = { "%=", builtin.lnumfunc , ' '}, hl = "LineNr" },
        { text = {statusBorderBump}, hl = "MonoGlowStatusColumnBorder" },
        {
          sign = { namespace = { "diagnostic/signs" }, maxwidth = 2, auto = true },
          click = "v:lua.ScSa"
        },
        -- {
        --   sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
        --   click = "v:lua.ScSa"
        -- },
      }
    })
  end,
}




-- vim.o.statuscolumn = '%= %{%v:lnum %} %#StatusColumnBorder#▍%s'
