#include "fcgi_stdio.h"
#include <stdio.h>

int main() {

  // // int sockfd = FCGX_OpenSocket("127.0.0.1:9000", 100);

  // // ...or using Unix sockets:
  // int sockfd = FCGX_OpenSocket("/var/run/fcgi.sock", 100);


  // FCGX_Request req;
  // FCGX_InitRequest(&req, sockfd, 0);

  while (FCGI_Accept() >= 0) {
    printf("Content-Type: text/html\n\n");
    printf("Hello World!\n\n");
  }
  return 0;
}

// gcc server.c -lfcgi
