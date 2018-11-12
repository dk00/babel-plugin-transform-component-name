export default (Image => Object.assign(({ url }) => <div>
  <Image src={url} />
</div>, {
  displayName: "test"
}));
