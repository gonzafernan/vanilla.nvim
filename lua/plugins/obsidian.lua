return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    -- ft = "markdown",
    event = {
        -- load obsidian.nvim for markdown files in vault
        "BufReadPre "
        .. vim.fn.expand("~")
        .. "/vaults/personal/**.md",
        "BufNewFile " .. vim.fn.expand("~") .. "/vaults/personal/**.md",
    },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",
    },
    opts = {
        -- vaults
        workspaces = {
            {
                name = "personal",
                path = "~/vaults/personal",
            },
        },
        -- daily notes
        daily_notes = {
            folder = "dailies",
            -- date_format = "%Y-%m-%d",
            -- alias_format = "%B %-d, %Y",
            -- template = nil
        },
        -- templates
        templates = {
            subdir = "templates",
            -- date_format = "%Y-%m-%d",
            -- time_format = "%H:%M",
            -- substitutions = {},
        },
        -- notes id
        note_id_func = function(title)
            -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
            -- In this case a note with the title 'My new note' will be given an ID that looks
            -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
            local suffix = ""
            if title ~= nil then
                -- If title is given, transform it into valid file name.
                suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
                -- If title is nil, just add 4 random uppercase letters to the suffix.
                for _ = 1, 4 do
                    suffix = suffix .. string.char(math.random(65, 90))
                end
            end
            return tostring(os.time()) .. "-" .. suffix
        end,
    },
}
