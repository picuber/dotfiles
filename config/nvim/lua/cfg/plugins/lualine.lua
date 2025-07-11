local nomod = {
    function()
        return "NOM"
    end,
    cond = function()
        return vim.bo.modifiable == false
    end,
}

local readonly = {
    "%R",
    cond = function()
        return vim.bo.readonly
    end,
}

local noeol = {
    function()
        return "noEOL"
    end,
    cond = function()
        return vim.bo.endofline == false
    end,

}

local preview = {
    "%W",
    cond = function()
        return vim.wo.previewwindow
    end,
}

local modified = {
    function()
        return "+"
    end,
    cond = function()
        return vim.bo.modified
    end,
}

local function charVal()
    return "0x%B"
end

require("lualine").setup({
    options = {
        theme = "nord",
        always_divide_middle = true,
        disabled_filetypes = {},
        section_separators = { left = "", right = "" },
        component_separators = { left = "|", right = "|" },
    },

    sections = {
        lualine_a = { "mode" },
        lualine_b = { nomod, readonly, preview, "diff", "diagnostics" },
        lualine_c = { { "filename", file_status = false, path = 1 }, modified, noeol },
        lualine_x = { charVal, "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },

    inactive_sections = {
        lualine_a = {},
        lualine_b = { nomod, readonly, preview },
        lualine_c = { { "filename", file_status = false, path = 1 }, modified, noeol },
        lualine_x = {},
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },

    tabline = {
        lualine_a = { { "tabs", mode = 0, tabs_color = { inactive = "lualine_b_normal" } } },
        lualine_x = { "branch" },
        lualine_y = { "ObsessionStatus" },
        lualine_z = { "hostname" },
    },

    extensions = {
        "fzf",
        "nvim-tree",
        "quickfix",
        "toggleterm",
    },
})
