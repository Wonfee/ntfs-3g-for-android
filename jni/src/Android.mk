LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := ntfs-3g.c ntfs-3g_common.c

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/.. \
	$(LOCAL_PATH)/../include/fuse-lite/ \
	$(LOCAL_PATH)/../include/ntfs-3g/ \

LOCAL_CFLAGS += -DHAVE_CONFIG_H -DHAVE_ANDROID


#LOCAL_SHARED_LIBRARIES += libfuse-lite libntfs_3g
LOCAL_STATIC_LIBRARIES += libfuse-lite libntfs_3g

LOCAL_MODULE := ntfs-3g
include $(BUILD_EXECUTABLE)

