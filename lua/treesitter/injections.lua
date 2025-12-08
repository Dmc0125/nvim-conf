vim.treesitter.query.set("go", "injections", [[
(
    (raw_string_literal_content) @injection.content
    (#match? @injection.content "^\\<!-- html --\\>")
    (#set! injection.language "html")
)
]])
