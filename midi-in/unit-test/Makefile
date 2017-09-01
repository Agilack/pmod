
TARGET=ut_midi

CFLAGS = -Wall -pedantic -DDEBUG

all:
	cc $(CFLAGS) -o main.o -c main.c
	cc -o $(TARGET) main.o
clean:
	rm -f $(TARGET) *~ *.o
