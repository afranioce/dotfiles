return {
  command = './vendor/bin/phpstan',
  debounce = 100,
  rootPatterns = {'composer.json', 'composer.lock', 'vendor'},
  args = {'analyze', '--error-format', 'raw', '--no-progress', '%file'},
  offsetLine = 0,
  offsetColumn = 0,
  sourceName = 'phpstan',
  formatLines = 1,
  formatPattern = {
    [[^[^:]+:(\d+):(.*)(\r|\n)*$]],
    {line = 1, message = {'[phpstan] ', 2}},
  }
}
