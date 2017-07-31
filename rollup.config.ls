import \rollup-plugin-babel : babel

config =
  entry: "src/index.ls" dest: "lib/index.js" format: \cjs
  plugins: [babel require \./.babelrc]
  source-map: true use-strict: false

export default: config
