import \rollup-plugin-babel : babel

config =
  input: \src/index.ls
  output: file: \lib/index.js format: \cjs
  plugins: [babel require \./.babelrc]
  sourcemap: true use-strict: false

export default: config
