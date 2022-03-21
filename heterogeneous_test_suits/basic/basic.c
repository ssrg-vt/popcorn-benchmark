#include <stdio.h>
#include <unistd.h>

#include "migrate.h"

int tid_main;

volatile unsigned long ret = 0;
void func2(int i)
{
	int j;
	printf("\t\titer %d: Executing %s, on %s node.\n",
			i, __func__, gettid() == tid_main ? "local" : "remote");
	for (j = 0; j < 1000000; j++) {
		ret++;
	}
}

void func1(int i)
{
	int j;
	printf("\titer %d: Executing %s, on %s node. sleep 3mins\n",
			i, __func__, gettid() == tid_main ? "local" : "remote");
	for (j = 0; j < 1000000; j++) {
		ret++;
	}
	sleep(3);
	func2(i);
}

int main(int argc, char *argv[])
{
	int i;

	tid_main = gettid();
	printf("Thread id %d on x86 node. Going to migrate to node 1 and call the func 10 times ret %lu[Start]\n", tid_main, ret);

	migrate(1, 0, 0);
	for (i = 0; i < 10; i++) {
		func1(i);
	}
	migrate(0, 0, 0);
	printf("Migrated back from node 1 [Done] ret = %lu expected %lu\n",
			ret, 1000000UL * 2 * 10);
	return 0;
}
