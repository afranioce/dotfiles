return {
  sourceName = 'eslint_fmt',
  command = './node_modules/.bin/eslint',
  args = {'--fix', '--fix-to-stdout', '--stdin', '--stdin-filename', '%filepath'},
  rootPatterns = {
    '.eslintrc',
    '.eslintrc.cjs',
    '.eslintrc.js',
    '.eslintrc.json',
    '.eslintrc.yaml',
    '.eslintrc.yml',
  },
}
