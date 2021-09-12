return {
  sourceName = 'eslint',
  command = './node_modules/.bin/eslint',
  debounce = 100,
  args = {'--stdin', '--stdin-filename', '%filepath', '--format', 'json'},
  parseJson = {
    errorsRoot = '[0].messages',
    line = 'line',
    column = 'column',
    endLine = 'endLine',
    endColumn = 'endColumn',
    message = '[eslint] ${message} [${ruleId}]',
    security = 'severity',
  },
  securities = {[2] = 'error', [1] = 'warning'},
  rootPatterns = {
    '.eslintrc',
    '.eslintrc.cjs',
    '.eslintrc.js',
    '.eslintrc.json',
    '.eslintrc.yaml',
    '.eslintrc.yml',
    'package.json'
  },
}
