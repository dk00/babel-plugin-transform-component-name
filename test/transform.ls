import
  fs: {read-file-sync}
  \babel-core : {transform}
  \../src/index : component-name

options =
  filename: \/path/to/test.jsx
  parser-opts: plugins: [\jsx]
  plugins: [component-name]

function transform-name code
  transform code, options .code

function transform-file path
  transform-name read-file-sync path

export {default: transform-name, transform-file}
