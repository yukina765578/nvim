-- lua/config/unity.lua
-- Unity-specific development configuration

-- C# indentation settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cs",
  callback = function()
    -- Set C# tab spacing
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true

    -- C# comment style
    vim.opt_local.commentstring = "// %s"

    -- Unity-specific keybindings (only in C# files)
    local keymap = vim.keymap
    local opts = { buffer = true, silent = true }

    keymap.set("n", "<leader>ud", function()
      local word = vim.fn.expand("<cword>")
      local url = "https://docs.unity3d.com/ScriptReference/" .. word .. ".html"
      vim.fn.system("open '" .. url .. "'")
    end, { desc = "Unity Documentation" })

    keymap.set("n", "<leader>uc", function()
      local class_name = vim.fn.input("Class name: ")
      if class_name ~= "" then
        local lines = {
          "using UnityEngine;",
          "",
          "public class " .. class_name .. " : MonoBehaviour",
          "{",
          "    void Start()",
          "    {",
          "        ",
          "    }",
          "",
          "    void Update()",
          "    {",
          "        ",
          "    }",
          "}"
        }
        vim.api.nvim_put(lines, "l", true, true)
      end
    end, { desc = "Create MonoBehaviour class" })
  end,
})

-- Unity project detection
vim.api.nvim_create_autocmd({ "BufEnter", "VimEnter" }, {
  pattern = "*",
  callback = function()
    local path = vim.fn.expand("%:p:h")
    if vim.fn.isdirectory(path .. "/Assets") == 1 and vim.fn.isdirectory(path .. "/ProjectSettings") == 1 then
      vim.g.unity_project = true
      -- Set file associations for Unity files
      vim.cmd("autocmd BufNewFile,BufRead *.meta setfiletype json")
      vim.cmd("autocmd BufNewFile,BufRead *.asset setfiletype yaml")
      vim.cmd("autocmd BufNewFile,BufRead *.prefab setfiletype yaml")
      vim.cmd("autocmd BufNewFile,BufRead *.unity setfiletype yaml")
    end
  end,
})
