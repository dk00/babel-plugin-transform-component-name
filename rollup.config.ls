import \rollup-plugin-babel : babel

config =
  input: \src/index.ls
  output: file: \lib/index.js format: \cjs sourcemap: true use-strict: false
  plugins: [babel require \./.babelrc]

export default: config
