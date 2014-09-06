#ifndef _UNISTD_H_
#define _UNISTD_H_

#include <stddef.h>
#include <sys/cdefs.h>
#include <sys/types.h>
#include <sys/select.h>
#include <sys/sysconf.h>
#include <pathconf.h>

extern ssize_t pread64(int, void *, size_t, off64_t);
extern ssize_t pwrite64(int, const void *, size_t, off64_t);

#endif
