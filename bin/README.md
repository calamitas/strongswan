# Setup

Edit the file `/etc/docker/daemon.json` and add this to enable ipv6 support:

```json
{
  "ipv6": true,
  "fixed-cidr-v6": "fc31:0:0:1::/64"
}
```

`sudo service docker restart`
