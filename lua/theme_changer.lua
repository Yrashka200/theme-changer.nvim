local M = {}

M.themes = {
  { name = "Tokyo Night", colorscheme = "tokyonight-night" },
  { name = "Catppuccin Mocha", colorscheme = "catppuccin-mocha" },
  { name = "GitHub Dark", colorscheme = "github_dark" },
  { name = "VS Code", colorscheme = "vscode" },
  { name = "One Dark", colorscheme = "onedark" },
  { name = "Kanagawa Wave", colorscheme = "kanagawa-wave" },
  { name = "Gruvbox", colorscheme = "gruvbox" },
  { name = "Nord", colorscheme = "nord" },
  { name = "Everforest", colorscheme = "everforest" },
  { name = "Rose Pine", colorscheme = "rose-pine" },
  { name = "Dracula", colorscheme = "dracula" },
  { name = "Nightfox", colorscheme = "nightfox" },
}

local function is_available(colorscheme)
  for _, extension in ipairs({ "lua", "vim" }) do
    local path = "colors/" .. colorscheme .. "." .. extension
    if #vim.api.nvim_get_runtime_file(path, true) > 0 then
      return true
    end
  end
  return false
end

local function open_picker()
  vim.ui.select(M.themes, {
    prompt = "Choose a colorscheme",
    format_item = function(theme)
      local status = is_available(theme.colorscheme) and "" or " [not installed]"
      return theme.name .. status
    end,
  }, function(theme)
    if not theme then
      return
    end

    if not is_available(theme.colorscheme) then
      vim.notify(
        theme.name .. " is not installed. Run :PluginManager sync and restart Neovim.",
        vim.log.levels.WARN,
        { title = "Theme Changer" }
      )
      return
    end

    local ok, err = pcall(vim.cmd.colorscheme, theme.colorscheme)
    if not ok then
      vim.notify(
        "Could not load " .. theme.name .. ": " .. tostring(err),
        vim.log.levels.ERROR,
        { title = "Theme Changer" }
      )
      return
    end

    vim.notify("Colorscheme changed to " .. theme.name, vim.log.levels.INFO, {
      title = "Theme Changer",
    })
  end)
end

function M.setup()
  vim.api.nvim_create_user_command("Theme", open_picker, {
    desc = "Choose a Neovim colorscheme",
  })
  vim.cmd([[
    cnoreabbrev <expr> theme (getcmdtype() == ':' && getcmdline() ==# 'theme') ? 'Theme' : 'theme'
  ]])
end

return M
