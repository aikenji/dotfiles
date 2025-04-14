local M = {}

local mac = {}

mac.cn = "com.apple.inputmethod.SCIM.ITABC"
mac.en = "com.apple.keylayout.US"

local getChangeIM = function()
  local mode = vim.fn.mode()
  if mode == "i" then
    return mac.cn
  else
    return mac.en
  end
end

-- the event when focusing neovim on mac
M.macFocusGained = function()
  vim.cmd(":silent :!im-select " .. getChangeIM())
end
-- the event when leaving neovim on mac
M.macFocusLost = function()
  vim.cmd(":silent :!im-select " .. mac.en)
end
-- the event when entering insert mode in neovim
M.macInsertEnter = function()
  vim.cmd(":silent :!im-select " .. mac.cn)
end
-- the event when leaving insert mode in neovim
M.macInsertLeave = function()
  vim.cmd(":silent :!im-select " .. mac.en)
end
return M
