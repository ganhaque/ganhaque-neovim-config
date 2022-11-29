local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end
--------------------------------------------------------------------------
local colors = {
  red = '#f38ba8',
  grey = '#313244', --note: changed #a0a1a7 -> #313244 (surface0)
  black = '#383a42',
  white = '#f3f3f3',
  light_green = '#83a598',
  orange = '#fe8019',
  green = '#8ec07c',
}

-- local theme = {
--   normal = {
--     a = { fg = colors.white, bg = colors.black },
--     b = { fg = colors.white, bg = colors.grey },
--     c = { fg = colors.black, bg = colors.white },
--     z = { fg = colors.white, bg = colors.black },
--   },
--   insert = { a = { fg = colors.black, bg = colors.light_green } },
--   visual = { a = { fg = colors.black, bg = colors.orange } },
--   replace = { a = { fg = colors.black, bg = colors.green } },
-- }

-- Put proper separators and gaps between components in sections

local empty = require('lualine.component'):extend()

-- white slash separator between modules
-- function empty:draw(default_highlight)
--   self.status = ''
--   self.applied_separator = ''
--   self:apply_highlights(default_highlight)
--   self:apply_section_separators()
--   return self.status
-- end

local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      -- comp.separator = left and { right = '' } or { left = '' }
      comp.separator = left and { right = '' } or { left = '' }
    end
  end
  return sections
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  colored = false,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = false,
  symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}

-- local mode = {
-- 	"mode",
-- 	fmt = function(str)
-- 		return "-- " .. str .. " --"
-- 	end,
-- }

local filetype = {
  "filetype",
  icons_enabled = true,
  icon = nil,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local location = {
  "location",
  padding = 0,
}

-- cool function for progress
local progress = function()
  local current_line = vim.fn.line(".")
  local total_lines = vim.fn.line("$")
  local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
  },
  sections = process_sections {
    -- lualine_a = { branch, diagnostics },
    lualine_a = { 'mode'},
    lualine_b = { branch, diagnostics },
    lualine_c = {{'filename', file_status = false, path = 1}},
    -- lualine_x = { "encoding", "fileformat", "filetype" },
    -- lualine_x = { diff, spaces, "encoding", filetype, {
    lualine_x = { diff, filetype, {
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
      color = { fg = '#ffffff', gui = 'bold' },
      }
    },
    lualine_y = { location },
    lualine_z = { 'progress', progress },
    --some more valid options
    --'filesize'
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    -- lualine_c = { "filename" },
    lualine_c = {{'filename', file_status = true, path = 2}}, --what does file_status do?
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})

