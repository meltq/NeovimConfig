local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>Db"] = { "<cmd> DapToggleBreakpoint <CR>" },
    ["<leader>Dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

return M
