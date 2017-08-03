#include <fcntl.h>      /* open */ 
#include <stdio.h>
#include <stdlib.h>     /* exit */
#include <sys/ioctl.h>  /* ioctl */
#include <stdint.h>

#define WMT_IOC_MAGIC                                   'w'

#define COMBO_IOCTL_GET_CHIP_ID       _IOR(WMT_IOC_MAGIC, 0, int)
#define COMBO_IOCTL_SET_CHIP_ID       _IOW(WMT_IOC_MAGIC, 1, int)
#define COMBO_IOCTL_EXT_CHIP_DETECT   _IOR(WMT_IOC_MAGIC, 2, int)
#define COMBO_IOCTL_GET_SOC_CHIP_ID   _IOR(WMT_IOC_MAGIC, 3, int)
#define COMBO_IOCTL_DO_MODULE_INIT    _IOR(WMT_IOC_MAGIC, 4, int)
#define COMBO_IOCTL_MODULE_CLEANUP    _IOR(WMT_IOC_MAGIC, 5, int)
#define COMBO_IOCTL_EXT_CHIP_PWR_ON   _IOR(WMT_IOC_MAGIC, 6, int)
#define COMBO_IOCTL_EXT_CHIP_PWR_OFF  _IOR(WMT_IOC_MAGIC, 7, int)
#define COMBO_IOCTL_DO_SDIO_AUDOK     _IOR(WMT_IOC_MAGIC, 8, int)

int main()
{
  int file_desc = open("/dev/wmtdetect", 0);
  if (file_desc < 0) {
    exit(-1);
  }
  
  ioctl(file_desc, COMBO_IOCTL_EXT_CHIP_PWR_ON, NULL);
  sleep(1);

  ioctl(file_desc,COMBO_IOCTL_EXT_CHIP_DETECT,NULL); 
  uint32_t chipId = ioctl(file_desc, COMBO_IOCTL_GET_CHIP_ID, NULL);
  
  ioctl(file_desc, COMBO_IOCTL_DO_SDIO_AUDOK,  chipId);

  ioctl(file_desc, COMBO_IOCTL_SET_CHIP_ID,chipId);

  ioctl(file_desc, COMBO_IOCTL_MODULE_CLEANUP,  chipId);
  ioctl(file_desc, COMBO_IOCTL_DO_MODULE_INIT, chipId);
}

