require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = { -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false,
  term_colors = true, --default: false
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
  -- styles = { --default
  --   comments = { "italic" },
  --   conditionals = { "italic" },
  --   loops = {},
  --   functions = {},
  --   keywords = {},
  --   strings = {},
  --   variables = {},
  --   numbers = {},
  --   booleans = {},
  --   properties = {},
  --   types = {},
  --   operators = {},
  -- },
  -- ayamir config
  styles = {
    comments = { "italic" },
    properties = { "italic" },
    functions = { "italic", "bold" },
    keywords = { "italic" },
    operators = { "bold" },
    conditionals = { "bold" },
    loops = { "bold" },
    booleans = { "bold", "italic" },
    numbers = {},
    types = {},
    strings = {},
    variables = {},
  },
  -- color_overrides = { --default
  -- },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    lsp_trouble = true,
    lsp_saga = true,
    gitgutter = false,
    gitsigns = true,
    telescope = true,
    nvimtree = true,
    -- which_key = true, --hard to see
    indent_blankline = { enabled = true, colored_indent_levels = false },
    dashboard = true,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = false,
    markdown = true,
    lightspeed = false,
    ts_rainbow = true,
    mason = true,
    neotest = false,
    noice = false,
    -- hop = true, --color: red -> orange | blue -> teal
    illuminate = true,
    cmp = true,
    dap = { enabled = true, enable_ui = true },
    notify = true,
    symbols_outline = false,
    coc_nvim = false,
    leap = false,
    neotree = { enabled = false, show_root = true, transparent_panel = false },
    telekasten = false,
    mini = false,
    aerial = false,
    vimwiki = true,
    beacon = false,
    navic = { enabled = false },
    overseer = false,
    fidget = true,
  },

  color_overrides = {
    mocha = {
      --comment = ayamir but i prefer default
      rosewater = "#F5E0DC", --default
      flamingo = "#F2CDCD", --default
      pink = "#F5C2E7", --default
      mauve = "#9D7DD8", --prev: #DDB6F2
      -- red = "#F28FAD",
      maroon = "#DA4B4A", --ayamir: #E8A2AF --now: nvchad baby-pink --prev: #ffa5c3
      peach = "#FF9D64", --prev: #F8BD96
      yellow = "#FAE3B0",
      green = "#ABE9B3",
      -- blue = "#96CDFB",
      sky = "#89DCEB",
      teal = "#B5E8E0",
      -- lavender = "#C9CBFF",

      -- text = "#D9E0EE",
      -- subtext1 = "#BAC2DE",
      -- subtext0 = "#A6ADC8",
      -- overlay2 = "#C3BAC6",
      -- overlay1 = "#988BA2",
      -- overlay0 = "#6E6C7E",
      -- surface2 = "#6E6C7E",
      -- surface1 = "#2f2e3e", --prev: #575268 --selection bg
      -- surface0 = "#302D41",

      -- base = "#1E1E2E",
      -- mantle = "#1A1826",
      -- crust = "#161320",
    },
  },
  -- custom_highlights = function (colors)
  --   return {
  --     -- Comment = { fg = colors.flamingo }, --example
  --   }
  -- end,
  -- integrations = { --default
  --   cmp = true,
  --   gitsigns = true,
  --   nvimtree = true,
  --   telescope = true,
  --   notify = false,
  --   mini = false,
  --   -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  -- },

  --ayamir
  highlight_overrides = {
    mocha = function(cp)
      return {
        -- For base configs.
        -- Function = { fg = cp.red }, --default: blue
        CursorLineNr = { fg = cp.green },
        Search = { bg = cp.surface1, fg = cp.pink, style = { "bold" } },
        IncSearch = { bg = cp.pink, fg = cp.surface1 },
        Keyword = { fg = cp.red }, --default: pink
        -- Type = { fg = cp.blue }, --default
        Type = { fg = cp.yellow }, --rust: u8, String, etc...
        Typedef = { fg = cp.yellow },

        -- For native lsp configs.
        DiagnosticVirtualTextError = { bg = cp.none },
        DiagnosticVirtualTextWarn = { bg = cp.none },
        DiagnosticVirtualTextInfo = { bg = cp.none },
        DiagnosticVirtualTextHint = { fg = cp.rosewater, bg = cp.none },

        DiagnosticHint = { fg = cp.rosewater },
        LspDiagnosticsDefaultHint = { fg = cp.rosewater },
        LspDiagnosticsHint = { fg = cp.rosewater },
        LspDiagnosticsVirtualTextHint = { fg = cp.rosewater },
        LspDiagnosticsUnderlineHint = { sp = cp.rosewater },

        -- For fidget.
        FidgetTask = { bg = cp.none, fg = cp.surface2 },
        FidgetTitle = { fg = cp.blue, style = { "bold" } },

        -- For treesitter.
        ["@field"] = { fg = cp.rosewater },
        ["@property"] = { fg = cp.yellow },

        ["@include"] = { fg = cp.teal },
        -- ["@operator"] = { fg = cp.sky },
        ["@keyword.operator"] = { fg = cp.sky },
        ["@punctuation.special"] = { fg = cp.maroon },

        -- ["@float"] = { fg = cp.peach },
        -- ["@number"] = { fg = cp.peach },
        -- ["@boolean"] = { fg = cp.peach },

        ["@constructor"] = { fg = cp.lavender },
        -- ["@constant"] = { fg = cp.peach },
        -- ["@conditional"] = { fg = cp.mauve },
        -- ["@repeat"] = { fg = cp.mauve },
        ["@exception"] = { fg = cp.peach },

        ["@constant.builtin"] = { fg = cp.lavender },
        -- ["@function.builtin"] = { fg = cp.peach, style = { "italic" } },
        -- ["@type.builtin"] = { fg = cp.yellow, style = { "italic" } },
        ["@variable.builtin"] = { fg = cp.red, style = { "italic" } },

        -- ["@function"] = { fg = cp.blue },
        ["@function.macro"] = { fg = cp.red, style = {} },
        ["@parameter"] = { fg = cp.rosewater },
        ["@keyword"] = { fg = cp.red, style = { "italic" } },
        ["@keyword.function"] = { fg = cp.maroon },
        ["@keyword.return"] = { fg = cp.red, style = {} }, --default: pink

        -- ["@text.note"] = { fg = cp.base, bg = cp.blue },
        -- ["@text.warning"] = { fg = cp.base, bg = cp.yellow },
        -- ["@text.danger"] = { fg = cp.base, bg = cp.red },
        -- ["@constant.macro"] = { fg = cp.mauve },

        -- ["@label"] = { fg = cp.blue },
        ["@method"] = { style = { "italic" } },
        ["@namespace"] = { fg = cp.rosewater, style = {} },

        ["@punctuation.delimiter"] = { fg = cp.teal },
        ["@punctuation.bracket"] = { fg = cp.overlay2 },
        -- ["@string"] = { fg = cp.green },
        -- ["@string.regex"] = { fg = cp.peach },
        ["@type"] = { fg = cp.yellow },
        ["@variable"] = { fg = cp.text },
        ["@tag.attribute"] = { fg = cp.mauve, style = { "italic" } },
        ["@tag"] = { fg = cp.peach },
        ["@tag.delimiter"] = { fg = cp.maroon },
        ["@text"] = { fg = cp.text },

        -- ["@text.uri"] = { fg = cp.rosewater, style = { "italic", "underline" } },
        -- ["@text.literal"] = { fg = cp.teal, style = { "italic" } },
        -- ["@text.reference"] = { fg = cp.lavender, style = { "bold" } },
        -- ["@text.title"] = { fg = cp.blue, style = { "bold" } },
        -- ["@text.emphasis"] = { fg = cp.maroon, style = { "italic" } },
        -- ["@text.strong"] = { fg = cp.maroon, style = { "bold" } },
        -- ["@string.escape"] = { fg = cp.pink },

        -- ["@property.toml"] = { fg = cp.blue },
        -- ["@field.yaml"] = { fg = cp.blue },

        -- ["@label.json"] = { fg = cp.blue },

        ["@function.builtin.bash"] = { fg = cp.red, style = { "italic" } },
        ["@parameter.bash"] = { fg = cp.yellow, style = { "italic" } },

        ["@field.lua"] = { fg = cp.blue }, --default: lavender
        ["@constructor.lua"] = { fg = cp.flamingo },

        ["@constant.java"] = { fg = cp.teal },

        ["@property.typescript"] = { fg = cp.lavender, style = { "italic" } },
        -- ["@constructor.typescript"] = { fg = cp.lavender },

        -- ["@constructor.tsx"] = { fg = cp.lavender },
        -- ["@tag.attribute.tsx"] = { fg = cp.mauve },

        ["@type.css"] = { fg = cp.lavender },
        ["@property.css"] = { fg = cp.yellow, style = { "italic" } },

        ["@property.cpp"] = { fg = cp.text },

        -- ["@symbol"] = { fg = cp.flamingo },
      }
    end
  },
})
-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
