#include <stdio.h>
#include <unistd.h>

#include "migrate.h"

int main(int argc, char *argv[])
{
	printf("[test1] migrate to 1 & migrate back immediately\n");
	migrate(1, NULL, NULL);
	migrate(0, NULL, NULL);
	printf("[test1] Migrated back. Done sleep10\n");
	sleep(10);

	return 0;
}
