export default (Image => Object.assign(({ url }) => <div class="avatar">
  <Image src={url} />
</div>, {
  displayName: "test"
}));
