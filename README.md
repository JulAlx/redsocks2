<b>redsocks2 for OpenWRT</b>

This is a modified version of the original redsocks2. It has been modified to enable the 'HTTPS Proxy' feature by default and consequently 'Shadowsocks' disabled. Can't have both enabled at the same time. "<i>Why?</i>"; don't ask me, speak to its developer!

Must be compiled against 'openssl' and 'libevent2.1+'. The existing 'libevent2.0' in OpenWRT 18 branch, does not have OpenSSL enabled and as such, 'redsocks2' will fail to compile.

https://github.com/openwrt/openwrt/tree/master/package/libs/libevent2

