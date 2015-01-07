COMPILER = gcc
CCFLAGS = -ansi -pedantic -Wall -g -m32
TARGET = game

game: $(TARGET).c
	$(COMPILER) $(CCFLAGS) $(TARGET).c conway.s -o $(TARGET)

clean:
	rm -f *.o $(TARGET)
