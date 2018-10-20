import
  fs: {read-file-sync}
  tape: test
  \./transform : transform

function compress-spaces
  it.replace /\s+/g ' '

function test-transform t, name, description
  [code, snap] = <[actual expected]>map (which) ->
    read-file-sync "test/#name/#which.jsx" .to-string!trim!
  actual = compress-spaces transform code
  expected = compress-spaces snap
  t.equal actual, expected, description

cases =
  \default-export : 'add display name to default export components'
  \return-jsx-element : 'add display name to functions return JSX'
  \normal-functions : 'only add names to functions return JSX'
  \component-factory : 'add display name to product of component factory'
  nested: 'add display name to component in nested expressions'
  \component-type-name :
    'treat type name as custom if it can be found in the scope'
  \render-props :
    'treat type name as custom if it can be found in parameters'

test 'Component name' (t) ->
  Object.keys cases .for-each ->
    test-transform t, it, cases[it]
  t.end!
