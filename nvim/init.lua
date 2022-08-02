-- Vanilla Config
require('modules.plugins')
require('modules.settings')
require('modules.autocmd')
require('modules.keybinds')
require('modules.rust')

---Pretty print lua table
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
end

