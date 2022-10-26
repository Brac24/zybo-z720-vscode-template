#ifndef _SRC_GPIOCTRL_H_
#define _SRC_GPIOCTRL_H_

#include <xil_types.h>
#include <xil_io.h>

typedef struct gpioCtrl {
	u32 baseAddress;
} gpioCtrl;

int init_gpio(gpioCtrl* custom_gpio, u32 base_addr);

void write_gpio(gpioCtrl* custom_gpio, u32 write_data);

u32 read_gpio(gpioCtrl* custom_gpio);

#endif /*_SCR_GPIOCTRL_H_*/
