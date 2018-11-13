export default (Image => Object.assign(({ url }) => <div className="avatar">
  <Image {...{ url }} />
</div>, {
  displayName: "test"
}));
