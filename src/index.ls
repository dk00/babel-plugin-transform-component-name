import
  path: {basename, extname}

t = object-assign = void

function dash-split ([a, b]) => "#a-#b"
function kebab-case => it.replace /[a-z][A-Z]/g dash-split .to-lower-case!
function camelCase => it.replace /-([A-z])/g (, head) -> head.to-upper-case!
function merge items => t.call-expression object-assign, items

function extract-name
  it.id?name

function find-name path, file: opts: {filename}
  {node: source} = path.find -> it.node.id || it.is-statement!
  name = extract-name source or basename filename, extname filename
  t.value-to-node {display-name: kebab-case name}

function returns-JSX {body}
  result = body.body?slice? -1 .0?argument || body
  t.is-JSX-element result

function should-add-name {node}
  !node._has-name && returns-JSX node

!function add-name {node}: path, state
  if should-add-name path and find-name path, state
    node._has-name = true
    path.replace-with merge [node, that]

function add-alias path, alias, id
  binding = t.variable-declarator id, t.identifier alias
  path.find (.is-statement!)
  .insert-after t.variable-declaration \const [binding]

!function rewrite-type {scope, node}
  {name} = node.name
  alias = camelCase name
  if /^[a-z]/test name and scope.get-binding alias
    id = scope.generate-uid-identifier alias
    scope.rename alias, id.name
    add-alias that.path, alias, id
    that.identifier.name = alias
    node.name.name = id.name

function plugin
  t := it.types
  object-assign := t.member-expression (t.identifier \Object),
    t.identifier \assign
  visitor:
    ArrowFunctionExpression: add-name
    JSXOpeningElement: rewrite-type

export default: plugin
