require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'php',
    'lua',
    'typescript',
    'go',
    'javascript',
    'json',
    'yaml',
    'c_sharp',
    'bash',
    'html',
    'css',
    'scss',
  },
  highlight = {
    enable = true,
  },
  indention = {
    enable = true,
  },
}
