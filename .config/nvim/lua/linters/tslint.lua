return {
  sourceName = 'tslint',
  command = './node_modules/.bin/tslint',
  debounce = 100,
  args = {'--format', 'prose', '%filepath'},
  formatPattern = {
    [[^\s*(\w+):\s+([^:]+):(\d+):\s*(\d+)\s+-\s+(.*)]],
    {line = 3, column = 4, security = 1, message = {'[tslint] ', 5}},
  },
  securities = {ERROR = 'error', WARNING = 'warning'},
  rootPatterns = {
    'tslint.json',
  },
}

