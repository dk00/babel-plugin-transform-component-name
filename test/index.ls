import
  fs: {read-file-sync}
  tape: test
  \babel-core : {transform}
  \../src/index : component-name

function test-transform t, name, description, options
  [code, expected] = <[actual expected]>map (which) ->
    read-file-sync "test/#name/#which.jsx" .to-string!trim!
  actual = transform code, options .code
  t.equal actual, expected, description

cases =
  \default-export : 'add display name to default export components'
  \return-jsx-element : 'add display name to functions return JSX'
  \normal-functions : 'only add names to functions return JSX'
  \component-factory : 'add display name to product of component factory'
  nested: 'add display name to component in nested expressions'
  \component-type-name :
    'treat type name as custom if it can be found in the scope'

options =
  filename: \/path/to/test.jsx
  parser-opts: plugins: [\jsx]
  plugins: [component-name]

test 'Component name' (t) ->
  Object.keys cases .for-each ->
    test-transform t, it, cases[it], options
  t.end!
