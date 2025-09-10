local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Colorscheme
    "morhetz/gruvbox",

    -- Indent guide
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {}
    },

    -- Scrollbar (with preview)
    {
        "lewis6991/satellite.nvim",
        opts = {
            current_only = false,
            winblend = 30,
            zindex = 40,
            excluded_filetypes = {},
            width = 2,
            handlers = {
                cursor = {
                    enable = true,
                    symbols = { '⎺', '⎻', '⎼', '⎽' }
                },
                search = {
                    enable = true
                },
                diagnostic = {
                    enable = true,
                    signs = {'-', '=', '≡'},
                    min_severity = vim.diagnostic.severity.HINT
                },
                gitsigns = {
                    enable = true,
                    signs = {
                        add = "│",
                        change = "│",
                        delete = "-"
                    }
                },
                marks = {
                    enable = false
                },
                quickfix = {
                    signs = { '-', '=', '≡' }
                }
            }
        }
    },

    -- Unwanted whitespaces
    {
        "lukoshkin/highlight-whitespace",
        opts = {
            tws ="\\s\\+$",
            clear_on_buf_leave = false,
            palette = {
                markdown = {
                    tws = "#fb4934",
                    ['\\S\\@<=\\s\\(\\.\\|,\\)\\@='] = "#458588",
                    ['\\S\\@<= \\{2,\\}\\S\\@='] = "#83a598",
                    ['\\t\\+'] = "#d3869b",
                },
                other = {
                    tws = "#fb4934",
                    ['\\S\\@<=\\s,\\@='] = "#fabd2f",
                    ['\\(#\\|--\\)\\@<= \\{2,\\}\\S\\@='] = "#fabd2f",
                    ['\\S\\@<= \\{3,\\}\\(#\\|--\\)\\@='] = "#fabd2f",
                    ['\\t\\+'] = "#d3869b",
                }
            }
        }
    },

    -- Cursor
    "RRethy/vim-illuminate",

    -- Status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                icons_enabled = true,
                theme = "gruvbox",
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                always_divide_middle = true,
                always_show_tabline = true,
                globalstatus = true,
                disabled_filetypes = {
                    "neo-tree"
                },
                ignore_focus = {
                    "neo-tree"
                },
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                    refresh_time = 16, -- ~60fps
                    events = {
                        'WinEnter',
                        'BufEnter',
                        'BufWritePost',
                        'SessionLoadPost',
                        'FileChangedShellPost',
                        'VimResized',
                        'Filetype',
                        'CursorMoved',
                        'CursorMovedI',
                        'ModeChanged',
                    }
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff" },
                    lualine_c = { "filename" },
                    lualine_x = { "diagnostics", "lsp_status", "filetype" },
                    lualine_y = { "searchcount", "selectioncount" },
                    lualine_z = { "progress", "location" }
                    },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = {},
                    lualine_y = { "location" },
                    lualine_z = {}
                }
            }
        }
    },

    -- Tabline
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "lewis6991/gitsigns.nvim",
            "nvim-tree/nvim-web-devicons"
        },
        init = function()
            vim.g.barbar_auto_setup = false
        end,
        opts = {
            animation = true,
            auto_hide = false,
            tabpages = true,
            clickable = true,
            exclude_ft = {},
            exclude_name = {},
            focus_on_close = "left",
            hide = {
                extensions = true,
                inactive = true
            },
            highlight_alternate = false,
            highlight_inactive_file_icons = false,
            highlight_visible = true,
            icons = {
                buffer_index = false,
                buffer_number = false,
                button = "",
                diagnostics = {
                    symbols = {
                        hint = "󰌵",
                        info = "",
                        warn = "",
                        error = "",
                    },
                    highlights = {
                        hint = "DiagnosticSignHint",
                        info = "DiagnosticSignInfo",
                        warn = "DiagnosticSignWarn",
                        error = "DiagnosticSignError",
                    }
                },
                gitsigns = {
                    added = {
                        enabled = true,
                        icon = '+'
                    },
                    changed = {
                        enabled = true,
                        icon = '~'
                    },
                    deleted = {
                        enabled = true,
                        icon = '-'
                    }
                },
                filetype = {
                    custom_colors = false,
                    enabled = true
                },
                separator = {
                    left = '▎',
                    right = ''
                },
                separator_at_end = true,
                modified = {
                    button = "●"
                },
                pinned = {
                    button = "",
                    filename = true
                },
                preset = "default",
                alternate = {
                    filetype = {
                        enabled = false
                    }
                },
                current = {
                    buffer_index = true
                },
                inactive = {
                    button = '×'
                },
                visible = {
                    modified = {
                        buffer_number = false
                    }
                }
            },
            insert_at_end = false,
            insert_at_start = false,
            maximum_padding = 1,
            minimum_padding = 1,
            maximum_length = 30,
            minimum_length = 0,
            semantic_letters = true,
            sidebar_filetypes = {
                ['neo-tree'] = {
                    event = "BufWipeout"
                }
            }
        },
    },

    -- Git
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signs_staged = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signs_staged_enable = true,
            signcolumn = true,
            numhl      = false,
            linehl     = false,
            word_diff  = false,
            watch_gitdir = {
                follow_files = true
            },
            auto_attach = true,
            attach_to_untracked = false,
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol',
                delay = 1000,
                ignore_whitespace = false,
                virt_text_priority = 100,
                use_focus = true,
            },
            current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil,
            max_file_length = 40000,
            preview_config = {
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            }
        }
    },

    -- LazyGit
    {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile"
        },
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    },

    -- Terminal
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            hide_numbers = true,
            autochdir = false,
            start_in_insert = true,
            insert_mappings = true,
            terminal_mappings = true,
            persist_size = true,
            persist_mode = true,
            direction = "horizontal",
            close_on_exit = true,
            clear_env = false,
            shell = vim.o.shell,
            auto_scroll = true
        }
    },

    -- File tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        lazy = false,
        opts = {
            source_selector = {
                winbar = true,
                show_scrolled_off_parent_node = false,
                sources = {
                    {
                        source = "filesystem",
                        display_name = " 󰉓 Files "
                    },
                    {
                        source = "buffers",
                        display_name = " 󰈚 Buffers "
                    },
                    {
                        source = "git_status",
                        display_name = " 󰊢 Git "
                    },
                },
                content_layout = "start",
                tabs_layout = "equal",
                truncation_character = "…",
                tabs_min_width = nil,
                tabs_max_width = nil,
                padding = 0,
                separator = { left = "▏", right= "▕" },
                separator_active = nil,
                show_separator_on_edge = false,
                highlight_tab = "NeoTreeTabInactive",
                highlight_tab_active = "NeoTreeTabActive",
                highlight_background = "NeoTreeTabInactive",
                highlight_separator = "NeoTreeTabSeparatorInactive",
                highlight_separator_active = "NeoTreeTabSeparatorActive",
            },
            filesystem = {
                filtered_items = {
                    visible = false,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_hidden = true,
                    hide_by_name = {
                        ".DS_Store",
                        "thumbs.db",
                        ".git"
                    },
                    hide_by_pattern = {},
                    always_show = {},
                    always_show_by_pattern = {},
                },
            },
            default_component_configs = {
                git_status = {
                    symbols = {
                         -- Change type
                         added     = "✚",
                         deleted   = "✖",
                         modified  = "",
                         renamed   = "󰁕",
                         -- Status type
                         untracked = "",
                         ignored   = "",
                         unstaged  = "󰄱",
                         staged    = "",
                         conflict  = "",
                    }
                },
                diagnostics = {
                    symbols = {
                        hint = "󰌵",
                        info = "",
                        warn = "",
                        error = "",
                    },
                    highlights = {
                        hint = "DiagnosticSignHint",
                        info = "DiagnosticSignInfo",
                        warn = "DiagnosticSignWarn",
                        error = "DiagnosticSignError",
                    },
                },
                indent = {
                    with_markers = true,
                    indent_marker = "│",
                    last_indent_marker = "└",
                    indent_size = 2,
                    with_expanders = true,
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                }
            }
        }
    },
    {
        "antosha417/nvim-lsp-file-operations",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-neo-tree/neo-tree.nvim", -- makes sure that this loads after Neo-tree.
        },
        config = function()
            require("lsp-file-operations").setup()
        end,
    },

    -- Completion
    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "*",
        ---@module "blink.cmp"
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = "enter",
                ["<Up>"] = { "select_prev", "fallback" },
                ["<Down>"] = { "select_next", "fallback" },
                ["<Tab>"] = { "select_next", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },
                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },
                ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
            },
            appearance = {
                nerd_font_variant = "mono"
            },
            completion = {
                keyword = {
                    range = "prefix"
                },
                menu = {
                    draw = {
                        treesitter = { "lsp" }
                    }
                },
                trigger = {
                    show_on_trigger_character = true
                },
                documentation = {
                    auto_show = true
                }
            },
            signature = {
                enabled = true
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" }
            },
            fuzzy = {
                implementation = "prefer_rust_with_warning"
            }
        },
        opts_extend = { "sources.default" }
    }
})
