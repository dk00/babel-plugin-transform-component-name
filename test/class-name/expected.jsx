export default (Image => Object.assign(({ url }) => <div className="avatar">
  <Image src={url} />
</div>, {
  displayName: "test"
}));
