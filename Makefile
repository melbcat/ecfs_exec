all: ecfs_exec test
ecfs_exec: main.o ul_exec.o maps.o 
	gcc -g -shared main.o maps.o libecfsreader64.a -o libecfsexec.so 
main.o: main.c
	gcc -c -fPIC main.c
maps.o: maps.c
	gcc -c -fPIC maps.c
test:
	make -C example
clean:
	rm -f ecfs_exec *.o
