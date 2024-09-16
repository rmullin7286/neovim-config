return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    lazy = true,
    config = function()
        local pairs = require('nvim-autopairs')
        local Rule = require('nvim-autopairs.rule')

        pairs.setup({})

        pairs.add_rules {
            -- Rule for raw string literals in Rust
            Rule('r#"', '"#', 'rust')
        }
    end
}
