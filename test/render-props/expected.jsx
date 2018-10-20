import UserScreen from './user-screen';
import _profile from './profile';

const userScreen = Object.assign(({ userAvatar: _userAvatar }) =>
<UserScreen>
  <_userAvatar />
  <_profile />
  <_profile />
</UserScreen>,
{ displayName: "user-screen" });
