#
# Copyright (C) 2014 OpenWrt-dist
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=redsocks2
PKG_VERSION:=0.66
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/semigodking/redsocks.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=3052eeab75ff1ebd20c22334fbbecd808525bca7
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MAINTAINER:=semigodking  <semigodking@gmail.com>
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/$(BUILD_VARIANT)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/redsocks2
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Redirect any TCP connection to a HTTPS/HTTP proxy server.
	URL:=https://github.com/semigodking/redsocks.git
	DEPENDS:=+libopenssl +libevent2 +libevent2-openssl
endef

define Package/redsocks2/description
This is a modified version of the original redsocks2. \
It has been modified to enable 'HTTPS Proxy' feature by default \
and consequently 'Shadowsocks' disabled. Can't have both enabled at \
the same time. "Why?", don't ask me, speak to its developer!
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
