for android not supported ntfs format sdcard or udisk, so we use fuse fs.
make sure your phone's kernel is enabled fuse :
# busybox zcat /proc/config.gz |busybox grep FUSE                     
CONFIG_MSM_FUSE_INFO_DEBUG=y
# CONFIG_QFP_FUSE is not set
CONFIG_FUSE_FS=y

Problem post:
1. statvfs.h  --- > vfs.h (modify related files)

2. mntent.c mntent.h (copy form uClinux)

3. lseek pread pwrite ---> lseek64 pread64 pwrite64 (cp pread64.S pwirte64.S from bionic)


NDK 添加汇编代码编译： 
Thanks for Sam's blog.
http://blog.sina.com.cn/s/blog_602f87700101khyh.html
#########################################################################################
0. 背景介绍：
NDK编译器支持C/C++ 嵌入汇编代码。但Sam感觉X86，ARM，MIPS等编译器对嵌入汇编代码的格式和具体
指令格式并不相同，所以理论上各种指令集应该都有一套专有代码。Sam只关心ARM指令集，所以以下所
有代码和方法均只对ARM平台有效。

1. 内嵌式ARM代码：
1.1：代码加入：
__asm__ __volatile__ ("MRC p15,0,%0,c0,c0,0" : "=r" (id) );
或者：
asm(
    "MRC p15, 0, R1, c0, c0 ,0 \n\t"   
    "STR R1,[R0],#0 \n\t"
     );

1.2：编译：
ndk-build -B V=1
正常编译。但运行时，指出 illegal instruction.


2. 单独添加.S 文件的方式：
2.1：文件生成:
生成ARMCPUID.s 和 ARMCPUID.h文件，内容分别为：

ARMCPUID.s
.text
.align 4
.arm

.globl ARMCPUID
ARMCPUID:
          MRC p15, 0, R1, c0, c0 ,0
          STR R1,[R0],#0
          MOV pc,lr 

ARMCPUID.h:
extern "C" void ARMCPUID(unsigned int *id);

2.2: 加其入C/C++代码：
unsigned int id;
ARMCPUID(&id);

2.3: 将.s文件加入编译编译列表：
Android.mk中，
LOCAL_SRC_FILES += ARMCPUID.s

2.4: 编译：
ndk-build -B V=1

