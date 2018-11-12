export default Object.assign(({ url }) => {
  return <div>
    <img src={url} />
  </div>;
}, {
  displayName: "test"
});
