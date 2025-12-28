vim.g.mapleader = " "

local map = vim.keymap.set

map("n", "<leader>pv", vim.cmd.Ex)

-- move lines up/down in visual mode
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv")

-- yank to system clipboard
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")

-- jump by screen but stay in the middle
map("v", "<C-d>", "<C-d>zz")
map("v", "<C-u>", "<C-u>zz")

-- paste/delete while preserving the buffer
map("x", "<leader>p", "\"_dP")
map("n", "<leader>d", "\"_d")
map("v", "<leader>d", "\"_d")

-- remove Ctrl-x and Ctrl-o
map("n", "<C-o>", "<nop>")
map("i", "<C-x>", "<nop>")
-- map("i", "<C-x><C-o>", "<nop>")
-- map("c", "<C-x><C-o>", "<nop>")

-- split vertically and switch to new window
map("n", "<C-n>", ":vs<CR><C-w>w")

map("n", "<leader>s", ":source<CR>")

-- NOTE: create doc comment for db queries in go
local create_sql_query_annotation = function()
    local line_number = vim.fn.line('.')
    local line = vim.fn.getline(line_number)

    local var_name, quote, single_line_query = line:match("const (%S+) string = (.)(.*)")

    if not var_name or not quote then
        vim.notify("invalid const declaration", vim.log.levels.WARN)
        return
    end

    local annotation = {
        "// " .. var_name,
        "//",
    }

    if quote == "\"" then
        if not single_line_query then
            vim.notify("invalid single line string", vim.log.levels.WARN)
            return
        end
        if #single_line_query < 2 then
            vim.notify("invalid query", vim.log.levels.WARN)
            return
        end

        local query = string.sub(single_line_query, 1, #single_line_query - 1)
        table.insert(annotation, "// \t" .. query)
    elseif quote == "`" then
        ---@param l string
        ---@return boolean
        local insert_line = function(l)
            local pos = string.find(l, "`")
            -- trim one tab
            l = string.sub(l, 2, #l)

            if not pos then
                table.insert(annotation, "// \t" .. l)
                return false
            else
                local query = string.sub(l, 1, pos - 1)
                table.insert(annotation, "// \t" .. query)
                return true
            end
        end

        local done = false

        if #single_line_query ~= 0 then
            done = insert_line(single_line_query)
        end

        if not done then
            local i = line_number + 1
            local line_count = vim.api.nvim_buf_line_count(0)

            while i < line_count and not done do
                line = vim.fn.getline(i)
                if line == "`" then
                    done = true
                    break
                end
                done = insert_line(line)
                i = i + 1
            end

            if not done then
                vim.notify("Reached EOF, string is not closed", vim.log.levels.WARN)
            end
        end
    else
        vim.notify("invalid string const decalaration", vim.log.level.WARN)
        return
    end

    vim.fn.append(line_number - 1, annotation)
end

map("n", "<leader>qa", create_sql_query_annotation)

map("n", "<leader>ln", function()
    vim.wo.wrap = not vim.wo.wrap
end)
