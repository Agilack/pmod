#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/select.h>
#include <sys/time.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <termios.h>

static int open_port(const char *port);
void midi_rx(void);

int midi_fd;
unsigned char midi_msg[4];
int midi_step;

int main(void)
{
	fd_set rfds;
	struct timeval tv;
	int retval;

	printf("MIDI Input Unit-test\n");

	midi_fd = open_port("/dev/ttyUSB0");
	midi_step = 0;
	
	while(1)
	{
		FD_ZERO(&rfds);
		FD_SET(0, &rfds);
		FD_SET(midi_fd,  &rfds);
	
		tv.tv_sec  = 5;
		tv.tv_usec = 0;
	
		retval = select(16, &rfds, NULL, NULL, &tv);
		if (retval == 0)
			printf("NO EVENT\n");
		else if (retval > 0)
		{
			if (FD_ISSET(0, &rfds))
			{
				char b;
				read(0, &b, 1);
				printf("\n");
			}
			if (FD_ISSET(midi_fd,  &rfds))
				midi_rx();
		}
	}
	close(midi_fd);
	return(0);
}

/*
 * Open serial port connected to MIDI adapter
 *
 * @return File descriptor
 */
static int open_port(const char *port)
{
	struct termios options;
	int fd;

	fd = open(port, O_RDWR | O_NOCTTY | O_NDELAY);
	if (fd < 0)
	{
		fprintf(stderr, "open_port: Unable to open serial port (%d)\n", fd);
		exit(-1);
	}

	fcntl(fd, F_SETFL, 0);

	/* Get current port configuration */
	tcgetattr(fd, &options);
	/* Update port speed */
	cfsetospeed(&options, B115200);
	/* Set 8N1 */
	options.c_cflag &= ~PARENB;
	options.c_cflag &= ~CSTOPB;
	options.c_cflag &= ~CSIZE;
	options.c_cflag |= CS8;
	/* Raw datas */
	options.c_lflag &= ~(ICANON | ECHO | ECHOE | ISIG);
	options.c_oflag &= ~OPOST;
	/* No flow control */
	options.c_cflag &= ~CRTSCTS;
	/* Set the new port configuration */
	tcsetattr(fd, TCSANOW, &options);

	return (fd);
}

void midi_rx(void)
{
	unsigned char data;

	switch(midi_step)
	{
		/* Wait for Command/Status byte */
		case 0:
			read(midi_fd, &data, 1);
			if ((data & 0xF0) == 0xF0)
			{
				if (data == 0xF8)
				{
					/* Periodic Beat ... nothing to do */
				}
				else if (midi_msg[0] == 0xFE)
				{
					/* Active Sensing */
				}
				else if (midi_msg[0] == 0xF0)
				{  }
				else if (midi_msg[0] == 0xFC)
				{  }
			}
			else if (data == 0x90)
			{
				midi_msg[0] = 0x90;
				midi_step = 1;
			}
			else if ((data & 0x80) == 0)
			{
				midi_msg[1] = data;
				midi_step = 2;
			}
			break;
		/* Wait for the note */
		case 1:
			read(midi_fd, &midi_msg[1], 1);
			midi_step = 2;
			break;
		/* Wait for velocity */
		case 2:
			read(midi_fd, &midi_msg[2], 1);
			if (midi_msg[2] > 0)
			{
				printf("Note ON : %.2x\n", midi_msg[1]);
			}
			else
			{
				//printf("Note OFF: %.2x\n", midi_msg[1]);
			}
			fflush(stdout);
			midi_step = 0;
			break;
	}
}
