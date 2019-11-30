#
# Copyright (C) 2014 OpenWrt-dist
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=redsocks2
PKG_VERSION:=0.67
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/semigodking/redsocks.git
#PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=ebbd1d0c04e47bc52706aeac3febcab0b6b35424
#PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MAINTAINER:=semigodking  <semigodking@gmail.com>
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/$(BUILD_VARIANT)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/redsocks2
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Redirect any TCP connection to a HTTP/HTTPS proxy server
	URL:=https://github.com/semigodking/redsocks
	DEPENDS:=+libopenssl +libevent2 +libevent2-core +libevent2-openssl
endef

define Package/redsocks2/description
This iteration of redsocks2 enables 'HTTPS Proxy' feature \
by default and consequently,'Shadowsocks' is disabled.
endef

define Package/redsocks2/conffiles
/etc/config/redsocks2
endef

define Build/Compile
	$(call Build/Compile/Default,DISABLE_SHADOWSOCKS=true ENABLE_HTTPS_PROXY=true)
endef

define Package/redsocks2/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/redsocks2 $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/etc/redsocks2
	$(INSTALL_DATA) ./files/redsocks2.template $(1)/etc/redsocks2/config.template
endef

$(eval $(call BuildPackage,redsocks2))
