# Hiredis Makefile
# Copyright (C) 2010-2011 Salvatore Sanfilippo <antirez at gmail dot com>
# Copyright (C) 2010-2011 Pieter Noordhuis <pcnoordhuis at gmail dot com>
# This file is released under the BSD license, see the COPYING file

CC=gcc
CFLAGS=-g -Wall -I. -lm -shared  -lmingw32 -lws2_32 -lmsvcrt -m32
#CFLAGS=-lws2_32 -I. -shared 

#OBJ = net.o 
#DEPS = fmacros.h net.h hiredis.h config.h
#%.o: %.c $(DEPS)
#	$(CC) -c -o $@ $< $(CFLAGS)
	
	
all: hiredislib
	
hiredislib: net.o async.o hiredis.o sds.o
	$(CC) -o hiredislib.dll net.o async.o hiredis.o sds.o $(CFLAGS)
	
net.o: net.c fmacros.h net.h hiredis.h
	$(CC) -c net.c $(CFLAGS)

async.o: async.c async.h hiredis.h sds.h dict.c dict.h
	$(CC) -c async.c $(CFLAGS)

example.o: example.c hiredis.h $(CFLAGS)
	$(CC) -c example.c $(CFLAGS)

hiredis.o: hiredis.c fmacros.h hiredis.h net.h sds.h
	$(CC) -c hiredis.c $(CFLAGS)

sds.o: sds.c sds.h
	$(CC) -c sds.c $(CFLAGS)

test.o: test.c hiredis.h
	$(CC) -c test.c $(CFLAGS)

	

#hellomake: $(OBJ)
#	gcc -o $@ $^ $(CFLAGS)


#clean:
#	rm *.o
	
