#include <iostream>
#include <string>
#include <fstream> 
#include <string.h>

using namespace std;
     
int main(int argc, char **argv)
{
  cout << "Hello world " << endl;
  const char *message = "Hello";
  char password[32];
  char buffer[256];

  memcpy(buffer, message, 256);
 
  return 0;
}
