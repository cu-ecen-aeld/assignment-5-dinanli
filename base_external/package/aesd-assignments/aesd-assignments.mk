
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = a67fc635bd77850988faee822f9829cf1b768270
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-dinanli.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) CROSS_COMPILE=aarch64-none-linux-gnu- -C $(@D)/server clean
	$(MAKE) $(TARGET_CONFIGURE_OPTS) CROSS_COMPILE=aarch64-none-linux-gnu- -C $(@D)/server all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/server/aesdsocket \
        $(TARGET_DIR)/usr/bin/aesdsocket
    $(INSTALL) -D -m 0755 $(@D)/server/aesdsocket-start-stop \
        $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

$(eval $(generic-package))
