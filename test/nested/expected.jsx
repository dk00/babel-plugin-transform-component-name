const UserAvatar = pure(Object.assign(({ url }) => <div>
  <img src={url} />
</div>, {
  displayName: "user-avatar"
}));
