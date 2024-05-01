CC=gcc
CFLAGS=-Wall -g

all: maze

maze: main.o maze.o
	$(CC) $(CFLAGS) -o maze main.o maze.o

main.o: main.c sample.h
	$(CC) $(CFLAGS) -c main.c

maze.o: mazegame.c sample.h
	$(CC) $(CFLAGS) -c mazegame.c

clean:
	rm -f *.o maze
