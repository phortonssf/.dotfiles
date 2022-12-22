local M = {}

local toggle = function()
  local qf_exists = false
  print("hello")
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd "cclose"
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    -- vim.cmd "copen"
     vim.diagnostic.setqflist()
  end
end

vim.keymap.set("n", "<leader>qt", function() toggle() end)
return toggle

