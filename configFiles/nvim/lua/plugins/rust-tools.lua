return {
  'simrat39/rust-tools.nvim',
   'mfussenegger/nvim-dap',
    config = function ()
        local rt = require("rust-tools")

        rt.setup({
            server = {
                on_attach = function(_, bufnr)
                    -- Hover actions
                    --vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                    -- Code action groups
                    --vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                end,
            },
        })

        --->Rust enable inlay hints
        -- Commands:
        -- RustEnableInlayHints
        -- RustDisableInlayHints
        -- RustSetInlayHints
        -- RustUnsetInlayHints

        -- Set inlay hints for the current buffer
        --require('rust-tools').inlay_hints.set()
        -- Unset inlay hints for the current buffer
        --require('rust-tools').inlay_hints.unset()

        -- Enable inlay hints auto update and set them for all the buffers
        require('rust-tools').inlay_hints.enable()
        -- Disable inlay hints auto update and unset them for all buffers
        --require('rust-tools').inlay_hints.disable()
    end
}
