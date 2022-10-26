#include "gpio_ctrl.h"

int init_gpio(gpioCtrl* custom_gpio, u32 base_addr)
{
	custom_gpio->baseAddress = base_addr;
	return 0;
}

void write_gpio(gpioCtrl* custom_gpio, u32 write_data)
{
	Xil_Out32(custom_gpio->baseAddress, write_data);
}

u32 read_gpio(gpioCtrl* custom_gpio)
{
	return Xil_In32(custom_gpio->baseAddress + 4);
}
