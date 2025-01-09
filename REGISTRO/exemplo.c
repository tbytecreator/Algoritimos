#include <stdio.h>

typedef struct {
    char street[50];
    int number;
    char city[50];
    char state[3];
    char zip_code[10];
} Address;

int main() {

    Address address;

    strcpy(address.street, "123 Main St");
    address.number = 456;
    strcpy(address.city, "Anytown");
    strcpy(address.state, "CA");
    strcpy(address.zip_code, "12345");

    printf("Street: %s\n", address.street);
    printf("Number: %d\n", address.number);
    printf("City: %s\n", address.city);
    printf("State: %s\n", address.state);
    printf("Zip Code: %s\n", address.zip_code);

    return 0;
}