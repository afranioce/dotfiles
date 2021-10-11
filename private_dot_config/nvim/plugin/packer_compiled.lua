-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/afranio/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/afranio/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/afranio/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/afranio/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/afranio/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["FixCursorHold.nvim"] = {
    config = { "vim.g.cursorhold_updatetime = 700" },
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim"
  },
  LuaSnip = {
    config = { "require'luasnip/loaders/from_vscode'.load()" },
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  ["dashboard-nvim"] = {
    config = { "require('p-dashboard-nvim')" },
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "require('p-gitsigns')" },
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "require('p-nvim-indent-blankline')" },
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  kommentary = {
    config = { "require('p-kommentary')" },
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "require('p-nvim-lspkind')" },
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lualine-lsp-progress"] = {
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/lualine-lsp-progress"
  },
  ["lualine.nvim"] = {
    config = { "require('p-lualine')" },
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "require('p-nvim-autopairs')" },
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bufferline.lua"] = {
    config = { "require('p-nvim-bufferline')" },
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-cmp"] = {
    config = { "require('p-nvim-cmp')" },
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-dap"] = {
    config = { "require('p-nvim-dap')" },
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "require('p-nvim-dap-ui')" },
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    config = { "require('p-nvim-dap-virtual-text')" },
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text"
  },
  ["nvim-lspconfig"] = {
    config = { "require('p-nvim-lspconfig')" },
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "require('p-nvim-tree')" },
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "require('p-nvim-treesitter')" },
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope.nvim"] = {
    config = { "require('p-telescope')" },
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "require('p-nvim-toggleterm')" },
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/toggleterm.nvim"
  },
  vim = {
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/vim"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/vim-dadbod"
  },
  ["vim-dadbod-completion"] = {
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/vim-dadbod-completion"
  },
  ["vim-dadbod-ui"] = {
    config = { "require('p-vim-dadbod-ui')" },
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/vim-dadbod-ui"
  },
  ["vim-sneak"] = {
    loaded = true,
    path = "/home/afranio/.local/share/nvim/site/pack/packer/start/vim-sneak"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: FixCursorHold.nvim
time([[Config for FixCursorHold.nvim]], true)
vim.g.cursorhold_updatetime = 700
time([[Config for FixCursorHold.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require('p-nvim-cmp')
time([[Config for nvim-cmp]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require('p-nvim-indent-blankline')
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
require('p-nvim-dap')
time([[Config for nvim-dap]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
require('p-kommentary')
time([[Config for kommentary]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require('p-nvim-autopairs')
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
require('p-nvim-bufferline')
time([[Config for nvim-bufferline.lua]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
require('p-nvim-dap-ui')
time([[Config for nvim-dap-ui]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require('p-nvim-tree')
time([[Config for nvim-tree.lua]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require('p-telescope')
time([[Config for telescope.nvim]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
require('p-dashboard-nvim')
time([[Config for dashboard-nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
require('p-nvim-toggleterm')
time([[Config for toggleterm.nvim]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
require('p-nvim-lspkind')
time([[Config for lspkind-nvim]], false)
-- Config for: vim-dadbod-ui
time([[Config for vim-dadbod-ui]], true)
require('p-vim-dadbod-ui')
time([[Config for vim-dadbod-ui]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require('p-gitsigns')
time([[Config for gitsigns.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
require'luasnip/loaders/from_vscode'.load()
time([[Config for LuaSnip]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require('p-lualine')
time([[Config for lualine.nvim]], false)
-- Config for: nvim-dap-virtual-text
time([[Config for nvim-dap-virtual-text]], true)
require('p-nvim-dap-virtual-text')
time([[Config for nvim-dap-virtual-text]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require('p-nvim-lspconfig')
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require('p-nvim-treesitter')
time([[Config for nvim-treesitter]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
