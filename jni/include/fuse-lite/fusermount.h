#ifndef __FUSERMOUNT_H__
#define __FUSERMOUNT_H__

struct mntent *getmntent_r (FILE *filep,struct mntent *mnt, char *buff, int bufsize);
struct mntent *getmntent(FILE * filep);
int addmntent(FILE * filep, const struct mntent *mnt);
char *hasmntopt(const struct mntent *mnt, const char *opt);
FILE *setmntent(const char *name, const char *mode);
int endmntent(FILE * filep);

#endif
