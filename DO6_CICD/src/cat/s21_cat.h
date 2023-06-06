#ifndef CAT_H

#define CAT_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void parseCat(const char *inputCat);
void parseFilename(const char *ptr);
void parseFlag(const char *flags);
void openFile();
int searchFlags(const char flag);
void searchFlagsGnu(const char *flag);
void printNumberStr(const int countStr);
void flagS(const char c);
void flagE(const char c);
void flagN(const char c);
void flagB(const char c);
void flagT(const char c);
void flagV(const char c);

struct typeOpen {
  int b;
  int e;
  int n;
  int s;
  int t;
  int v;
  char *filename;
} props;

struct loopVariables {
  int trPL;
  int countStr;
  int ignoreSymbol;
  int trSymbols;
  int count;
} var;

#endif  // S21_STRING_H