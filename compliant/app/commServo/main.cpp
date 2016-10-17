#include <iostream>

#include <string.h>

using namespace std;

struct Angulos {
    int a1;
    int a2;
};

unsigned char buffer[] = {0xff,0xff,0xff,0xff,0x00,0x02,0x00,0x00};

Angulos angles = {104,0};

int main()
{

    cout << "Hello World!" << endl;
    cout << (int)buffer[0] << ' ' << angles.a2 << ' '
         << (int)buffer[1] << ' ' << sizeof(buffer)/sizeof(char)   << ' '
         << (char)angles.a1 << ' ' << sizeof(angles) << ' ' << sizeof(int) << ' ' << sizeof(angles)/sizeof(int)   << ' '
         << (int)*buffer << endl;

    memcpy(&angles,buffer,sizeof(buffer));

    cout << angles.a1 << ' ' << angles.a2 << ' ' << endl;

    return 0;
}

