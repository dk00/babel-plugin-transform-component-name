export default Object.assign(({ url }) => {
  return <div class="avatar">
    <img src={url} />
  </div>;
}, {
  displayName: "test"
});
