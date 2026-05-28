#include "int_qsort.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static void test_001(void)
{
	int arr_to_sort[] = { 12, 69, 9,  46, 49, 45, 33, 41,
			      97, 88, 26, 61, 53, 27, 68 };
	size_t size_arr = sizeof(arr_to_sort) / sizeof(arr_to_sort[0]);

	qsort(arr_to_sort, size_arr, sizeof(int), compar_ascending);
	print_array(arr_to_sort, size_arr);
}

static void test_002(void)
{
	int arr_to_sort[] = { 12, 69, 9,  46, 49, 45, 33, 41,
			      97, 88, 26, 61, 53, 27, 68 };
	size_t size_arr = sizeof(arr_to_sort) / sizeof(arr_to_sort[0]);

	qsort(arr_to_sort, size_arr, sizeof(int), compar_descending);
	print_array(arr_to_sort, size_arr);
}

int main(int argc, char *argv[])
{
	if (argc < 2) {
		return EXIT_SUCCESS;
	}

	char *test_name = argv[1];
	if (strcmp(test_name, "test_000") == 0) {
		test_001();
		return EXIT_SUCCESS;
	}

	if (strcmp(test_name, "test_001") == 0) {
		test_001();
		return EXIT_SUCCESS;
	}

	if (strcmp(test_name, "test_002") == 0) {
		test_002();
		return EXIT_SUCCESS;
	}

	fprintf(stderr, "Unknown test case (%s).\n", test_name);
	return EXIT_FAILURE;
}
