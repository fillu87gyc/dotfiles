-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
    nord0    = '#2e3440',
    nord1    = '#3b4252',
    nord2    = '#434c5e',
    nord3    = '#4c566a',
    nord4    = '#d8dee9',
    nord5    = '#e5e9f0',
    nord6    = '#eceff4',
    nord7    = '#8fbcbb',
    nord8    = '#88c0d0',
    nord9    = '#81a1c1',
    nord10   = '#5e81ac',
    nord11   = '#bf616a',
    nord12   = '#d08770',
    nord13   = '#ebcb8b',
    nord14   = '#a3be8c',
    nord15   = '#b48ead',
    bg       = '#202328',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
}
colors.bg = colors.nord1

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

-- Config
local config = {
    options = {
        -- Disable sections and component separators
        component_separators = '',
        section_separators = '',
        theme = {
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
    },
    sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

ins_left {
    -- mode component
    function()
        return ' [MODE]'
    end,
    color = function()
        -- auto change color according to neovims mode
        local mode_color = {
            n = colors.nord2,
            i = colors.nord7,
            v = colors.nord12,
            [''] = colors.nord13,
            V = colors.blue,
            c = colors.nord12,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [''] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.red,
            t = colors.red,
        }
        local fg_mode_color = {
            n = colors.nord8,
            i = colors.nord3,
            v = colors.nord1,
            [''] = colors.blue,
            V = colors.blue,
            c = colors.nord11,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [''] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.fg,
            ce = colors.fg,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.red,
            t = colors.red,
        }
        return { fg = fg_mode_color[vim.fn.mode()], bg = mode_color[vim.fn.mode()] }
    end,
    padding = { right = 1 },
}


ins_left {
    'filename',
    cond = conditions.buffer_not_empty,
    color = { fg = colors.magenta, gui = 'bold' },
}

ins_left {
    -- filesize component
    'filesize',
    cond = conditions.buffer_not_empty,
}


ins_left {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
    diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
    },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
    function()
        return '%='
    end,
}


ins_left {
    -- Lsp server name .
    function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = ' LSP:',
    color = { fg = colors.nord7, gui = 'bold' },
}

-- Add components to right sections
ins_right {
    'o:encoding', -- option component same as &encoding in viml
    fmt = string.upper, -- I'm not sure why it's upper case either ;)
    cond = conditions.hide_in_width,
    color = { fg = colors.green, gui = 'bold' },
}

ins_right {
    'fileformat',
    fmt = string.upper,
    icons_enabled = true,
    color = { fg = colors.green, gui = 'bold' },
}

ins_right {
    'filetype',
    colored = true, -- Displays filetype icon in color if set to true
    icon_only = false, -- Display only an icon for filetype
    icon = { 'X', align = 'right' },
    color = { fg = colors.magenta, gui = 'bold' },
}

ins_right {
    'branch',
    icon = '',
    color = { fg = colors.violet, gui = 'bold' },
}

ins_right {
    'diff',
    -- Is it me or the symbol for modified us really weird
    symbols = { added = ' ', modified = '柳 ', removed = ' ' },
    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
}

ins_right { 'progress', color = { fg = colors.fg, gui = 'bold' } }
-- Now don't forget to initialize lualine
lualine.setup(config)
