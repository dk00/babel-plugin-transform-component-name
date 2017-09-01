# babel-plugin-transform-component-name

Add display name to react components.

[![build status](https://travis-ci.org/dk00/babel-plugin-transform-component-name.svg)](https://travis-ci.org/dk00/babel-plugin-transform-component-name)
[![coverage](https://codecov.io/gh/dk00/babel-plugin-transform-component-name/branch/master/graph/badge.svg)](https://codecov.io/gh/dk00/babel-plugin-transform-component-name)
[![npm](https://img.shields.io/npm/v/babel-plugin-transform-component-name.svg)](https://npm.im/babel-plugin-transform-component-name)
[![dependencies](https://david-dm.org/dk00/babel-plugin-transform-component-name/status.svg)](https://david-dm.org/dk00/babel-plugin-transform-component-name)

Let react dev tools show component names instead of unknown.

If lower case started JSX element type names are available in the scope, they are treated as custom components.

## Examples

**avatar.jsx**

```jsx
export default ({url}) =>
<div class="avatar">
  <img src={url} />
</div>
```

**Out**

```jsx
export default Object.assign(({url}) =>
<div class="avatar">
  <img src={url} />
</div>, {displayName: 'avatar'})
```

**In**

```jsx
import UserScreen from './user-screen'
import userAvatar from './user-avatar'

<UserScreen>
  <user-avatar />
</UserScreen>
```

**Out**

```jsx
import UserScreen from './user-screen';
import userAvatar from './user-avatar';

const _userAvatar = userAvatar;
<UserScreen>
  <_userAvatar />
</UserScreen>;
```

## Installation

```
npm i --save-dev babel-plugin-transform-component-name
```

## Usage

*.babelrc.js*

```js
module.exports = {
  plugins: ['transform-component-name']
}
```

### Via CLI

```
babel --plugins transform-component-name script.js
```

### Via Node API

```js
require('babel-core').transform('code', {
  plugins: ['transform-component-name']
});
```
