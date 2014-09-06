LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	acls.c \
	attrib.c \
	attrlist.c \
	bitmap.c \
	bootsect.c \
	cache.c \
	collate.c \
	compat.c \
	compress.c \
	debug.c \
	device.c \
	dir.c \
	efs.c \
	index.c \
	inode.c \
	lcnalloc.c \
	logfile.c \
	logging.c \
	mft.c \
	misc.c \
	mst.c \
	object_id.c \
	realpath.c \
	reparse.c \
	runlist.c \
	security.c \
	unistr.c \
	unix_io.c \
	volume.c \
	xattrs.c \
	pread64.S \
	pwrite64.S \

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/.. \
	$(LOCAL_PATH)/../include/ntfs-3g/ \

LOCAL_CFLAGS += -DHAVE_ANDROID -DHAVE_CONFIG_H

LOCAL_SHARED_LIBRARIES := libfuse-lite

LOCAL_MODULE := ntfs_3g
#include $(BUILD_SHARED_LIBRARY)
include $(BUILD_STATIC_LIBRARY)
