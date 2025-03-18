// https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/Proxy_servers_and_tunneling/Proxy_Auto-Configuration_PAC_file#isinnet
// https://en.wikipedia.org/wiki/Proxy_auto-config
function FindProxyForURL(url, host) {
  if (
      isPlainHostName(host) ||
      dnsDomainIs(host, ".xiaojukeji.com") ||
      shExpMatch(host, "*didichuxing.com") ||
      isInNet(host, "10.0.0.0", "255.0.0.0") ||
      isInNet(host, "172.16.0.0", "255.240.0.0") ||
      isInNet(host, "192.168.0.0", "255.255.0.0")
     ) {
    return "DIRECT";
  }

  if (
      shExpMatch(host, "*youtube.com") ||
      shExpMatch(host, "*github.com") ||
      shExpMatch(host, "*googlevideo.com") ||
      shExpMatch(host, "*google.com*")
     ) {
    return "PROXY 127.0.0.1:3128";
  }


  return "PROXY 127.0.0.1:3128; DIRECT";
}
