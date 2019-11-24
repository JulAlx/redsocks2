<b>redsocks2-https for OpenWRT</b>

This is a modified version of the original redsocks2. It has been modified to enable the 'HTTPS Proxy' feature by default and consequently 'Shadowsocks' disabled. Can't have both enabled at the same time. "<i>Why?</i>"; don't ask me, speak to its developer!

Must be compiled against 'openssl' and 'libevent2.1+'. The existing 'libevent2.0' in OpenWRT 18 branch, does not have OpenSSL enabled and as such, 'redsocks2-https' will fail to compile.

https://github.com/openwrt/openwrt/tree/master/package/libs/libevent2

Just clone 'libevent2.1+' from OpenWRT master into the 'package' directory and issue the following the command:

<code>make package/libevent2/compile -j1 V=s</code>

Once compiled and installed, clone this repository into the 'package' directory and compile the application:

<code>git clone https://github.com/JulAlx/redsocks2-https.git ./package</code>
<code>make package/redsocks2-https/compile -j1 V=s</code>
