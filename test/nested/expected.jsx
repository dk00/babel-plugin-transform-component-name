const UserAvatar = pure(Object.assign(({ url }) => <div class="avatar">
  <img src={url} />
</div>, {
  displayName: "user-avatar"
}));
