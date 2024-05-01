CC = gcc
CFLAGS = -Wall -g

# Target executable name
TARGET = maze_game

all: $(TARGET)

$(TARGET): main.o maze.o
	$(CC) $(CFLAGS) -o $(TARGET) main.o maze.o

main.o: main.c maze.h
	$(CC) $(CFLAGS) -c main.c

maze.o: maze.c maze.h
	$(CC) $(CFLAGS) -c maze.c

clean:
	rm -f *.o $(TARGET)

.PHONY: all clean
