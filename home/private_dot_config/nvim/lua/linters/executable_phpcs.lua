return {
  command = './vendor/bin/phpcs',
  debounce = 100,
  rootPatterns = {'composer.json', 'composer.lock', 'vendor'},
  args = {'--standard=PSR2', '--report=emacs', '-s', '-'},
  offsetLine = 0,
  offsetColumn = 0,
  sourceName = 'phpcs',
  formatLines = 1,
  formatPattern = {
    [[^.*:(\d+):(\d+):\s+(.*)\s+-\s+(.*)(\r|\n)*$]],
    {line = 1, column = 2, security = 3, message = {'[phpcs] ', 4}},
  },
  securities = {
    E = 'error',
    W = 'warning',
  }
}
