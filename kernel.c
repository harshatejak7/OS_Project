void main() {
    char *video = (char*) 0xb8000;

    char *msg = "Ronaldo is the greatest football player of all time!!!";

    int i = 0;
    while (msg[i] != '\0') {
        video[i * 2] = msg[i];       // character
        video[i * 2 + 1] = 0x07;     // color
        i++;
    }

    while (1); // infinite loop
}