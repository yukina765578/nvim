return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = {"hrsh7th/nvim-cmp"},
  config = function()
    local autopairs = require("nvim-autopairs")
    autopairs.setup({
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
        javascriptreact = { "template_string" },
        typescript = { "template_string" },
        typescriptreact = { "template_string" },
        html = { "template_string" },
        python = { "string" },
      },
    })
  end,
}
