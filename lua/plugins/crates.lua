return {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml", "BufNewFile Cargo.toml" },
    opts = {
        completion = {
            -- cmp = { enabled = true },
        },
    },
}
