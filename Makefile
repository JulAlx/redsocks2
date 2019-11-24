#
# Copyright (C) 2014 OpenWrt-dist
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=redsocks2-https
PKG_VERSION:=0.67
PKG_RELEASE:=1


#PKG_SOURCE:=release-$(PKG_VERSION).tar.gz
#PKG_SOURCE_URL:=https://github.com/JulAlx/redsocks2/archive
#PKG_SOURCE_VERSION:=72f1952d4f6c4d35a4d7b4063f444e92f3c7a925
#PKG_MAINTAINER:=JulAlx, hit me on Github!

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/JulAlx/redsocks2.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=72f1952d4f6c4d35a4d7b4063f444e92f3c7a925
PKG_SOURCE:=release-$(PKG_VERSION).tar.gz

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/$(BUILD_VARIANT)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/redsocks2-https
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Redirect any TCP connection to a HTTPS/HTTP proxy server.
	URL:=https://github.com/JulAlx/redsocks.git
	DEPENDS:=+libevent2 +libopenssl +zlib
endef

define Package/redsocks2-https/description
This is a modified version of the original redsocks2. \
It has been modified to enable 'HTTPS Proxy' feature by default \
and consequently 'Shadowsocks' disabled. Can't have both enabled at \
the same time. "Why?", don't ask me, speak to its developer!
endef

define Package/redsocks2-https/conffiles
/etc/config/redsocks2-https
endef

define Build/Compile
	$(call Build/Compile/Default, DISABLE_SHADOWSOCKS=true ENABLE_HTTPS_PROXY=true)
endef

define Package/redsocks2-https/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/redsocks2-https $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/etc/redsocks2-https
	$(INSTALL_DATA) ./files/redsocks2-https.template $(1)/etc/redsocks2-https/config.template
endef

$(eval $(call BuildPackage,redsocks2-https))
