LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	fuse.c \
	fuse_kern_chan.c \
	fuse_loop.c \
	fuse_lowlevel.c \
	fuse_opt.c \
	fusermount.c \
	fuse_session.c \
	fuse_signals.c \
	helper.c \
	mount.c \
	mount_util.c \
	mntent.c \


LOCAL_C_INCLUDES := \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/.. \
	$(LOCAL_PATH)/../include/fuse-lite/ \


LOCAL_CFLAGS += -g -O2 -DHAVE_CONFIG_H -DHAVE_ANDROID

LOCAL_MODULE := fuse-lite
#include $(BUILD_SHARED_LIBRARY)
include $(BUILD_STATIC_LIBRARY)
