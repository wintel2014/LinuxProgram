/*
https://stackoverflow.com/questions/16552710/how-do-you-get-the-start-and-end-addresses-of-a-custom-elf-section
*/

#include <stdio.h>

struct thing {
    int val;
    const char* str;
    int another_val;
};
struct thing data1 = {1, "one"};
struct thing data2 = {2, "two"};

/* The following two pointers will be placed in "my_custom_section".
 * Store pointers (instead of structs) in "my_custom_section" to ensure
 * matching alignment when accessed using iterator in main(). */
struct thing *p_one __attribute__((section("my_custom_section"))) = &data1; 
struct thing *p_two __attribute__((section("my_custom_section"))) = &data2;

/* The linker automatically creates these symbols for "my_custom_section". */
extern struct thing *__start_my_custom_section;
extern struct thing *__stop_my_custom_section;

int main(void) {
    printf("section[my_custom_section]: [%p, %p)\n", &__start_my_custom_section, &__stop_my_custom_section);
    struct thing **iter = &__start_my_custom_section;
    for ( ; iter < &__stop_my_custom_section; ++iter) {
        printf("%p: %d; '%s'\n", *iter, (*iter)->val, (*iter)->str);
    }
    return 0;
}
