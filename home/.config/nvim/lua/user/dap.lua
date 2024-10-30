local status_ok, dap = pcall(require, "dap")
if not status_ok then
    return
end


local dapui = require "dapui"


-- {
--     enabled = true,                        -- enable this plugin (the default)
--     enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
--     highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
--     highlight_new_as_changed = true,       -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
--     show_stop_reason = true,               -- show stop reason when stopped for exceptions
--     commented = false,                     -- prefix virtual text with comment string
--     only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
--     all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
--     clear_on_continue = false,             -- clear virtual text on "continue" (might cause flickering when stepping)
--     --- A callback that determines how a variable is displayed or whether it should be omitted
--     --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
--     --- @param buf number
--     --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
--     --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
--     --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
--     --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
--     display_callback = function(variable, buf, stackframe, node, options)
--     -- by default, strip out new line characters
--       if options.virt_text_pos == 'inline' then
--         return ' = ' .. variable.value:gsub("%s+", " ")
--       else
--         return variable.name .. ' = ' .. variable.value:gsub("%s+", " ")
--       end
--     end,
--     -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
--     virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',
-- 
--     -- experimental features:
--     all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
--     virt_lines = true,                    -- show virtual lines instead of virtual text (will flicker!)
--     virt_text_win_col = 80                -- position the virtual text at a fixed window column (starting from the first text column) ,
--                                            -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
-- }


-- Handled by nvim-dap-go
dap.adapters.go = {
    type = "server",
    port = "${port}",
    executable = {
        command = "dlv",
        args = { "dap", "-l", "127.0.0.1:${port}" },
    },
}

-- https://code.visualstudio.com/docs/editor/debugging#_debug-actions
vim.keymap.set("n", "<Leader>dB", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end)
vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>dk', function() require('dapui').eval() end)
vim.keymap.set("n", "<Leader>df", function() require("dapui").float_element() end)

vim.keymap.set("n", "<f1>",       function() require('dap-go').debug_test() end)
vim.keymap.set('n', '<f5>',       function() require('dap').continue() end)
vim.keymap.set('n', '<f6>',       function() require('dap').step_over() end)
vim.keymap.set('n', '<f7>',       function() require('dap').step_into() end)
vim.keymap.set('n', '<f8>',       function() require('dap').step_out() end)
vim.keymap.set('n', '<f9>',       function() require('dap').up() end)
vim.keymap.set('n', '<s-f9>',     function() require('dap').down() end)
vim.keymap.set('n', '<s-f5>',     function() require('dap').terminate() end)
vim.keymap.set('n', '<cs-f5>',    function() require('dap').restart() end)
vim.keymap.set("n", "<f2>",       function() require('dapui').open() end)
vim.keymap.set("n", "<s-f2>",     function() require('dapui').close() end)


dap.listeners.before.attach.dapui_config = function()
    vim.opt.mouse = "a"
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    vim.opt.mouse = "a"
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    vim.opt.mouse = ""
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    vim.opt.mouse = ""
    dapui.close()
end
dap.defaults.fallback.terminal_win_cmd = '50vsplit new'


dapui.setup({
    layouts = {
        {
            elements = {
                { id = "scopes", size = 0.33 },
                { id = "breakpoints", size = 0.17 },
                { id = "stacks", size = 0.25 },
                { id = "watches", size = 0.25 },
            },
            position = "left",
            size = 40
        },
        {
            elements = {
                { id = "repl", size = 0.45 },
                { id = "console", size = 0.55 },
            },
            size = 20,
            position = "bottom",
        },
    },
    floating = {
        max_height = 0.9,
        max_width = 0.5, -- Floats will be treated as percentage of your screen.
        border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
})

require("dap.ext.vscode").load_launchjs()

require("dap-go").setup({
    dap_configurations = {
        {
            type = "go",
            name = "Attach remote",
            mode = "remote",
            request = "attach",
        },
    },
})

-- https://github.com/theHamsta/nvim-dap-virtual-text
require("nvim-dap-virtual-text").setup({
    enabled = true,                        -- enable this plugin (the default)
    enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = true,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,               -- show stop reason when stopped for exceptions
    commented = false,                     -- prefix virtual text with comment string
    only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
    all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
    clear_on_continue = false,             -- clear virtual text on "continue" (might cause flickering when stepping)
    --- A callback that determines how a variable is displayed or whether it should be omitted
    --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
    --- @param buf number
    --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
    --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
    --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
    --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
    display_callback = function(variable, buf, stackframe, node, options)
        -- by default, strip out new line characters
        if options.virt_text_pos == 'inline' then
            return ' = ' .. variable.value:gsub("%s+", " ")
        else
            return variable.name .. ' = ' .. variable.value:gsub("%s+", " ")
        end
    end,
    -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
    virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',

    -- experimental features:
    all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = 80                 -- position the virtual text at a fixed window column (starting from the first text column) ,
    -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
})


