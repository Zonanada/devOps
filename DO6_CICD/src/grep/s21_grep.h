#ifndef CAT_H
#define _GNU_SOURCE
#define CAT_H

#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct typeOpen {
  int e;
  int i;
  int v;
  int c;
  int l;
  int n;
  int h;
  int s;
  int f;
  int o;
  int countC;
  int outputC;
  char **ptr;
  char *advance;
  int onePattern;
} props;

struct nf {
  char **ptr;
  char *arr[9999];
  int ptr1;
} nameFiles;

struct pt {
  char **ptr;
  char *arr[9999];
  int ptr1;
  int empty;
} pattern;

struct dm {
  char **ptr;
  char *arr[9999];
} dynamicMemory;

struct serch {
  int coincidence;
  int countStr;
  int oneLine;
  unsigned long lengthStr;
  int outStr;
} find;

void parseGrep(const char *inputCat);
void parse(char *flags);
int searchFlags(const char flag);
void recordFilename(const char *fileName);
void recordPattern(const char *patterns);
void openFile(const char *filename);
void fileNames();
void flagE(char *cc, char **ptrPattern, const char *filename);
void flagI(char *cc, char **ptrPattern, const char *filename);
void flarV(char *cc, char **ptrPattern, const char *filename);
void flagC(char *cc, char **ptrPattern, const char *filename);
void printC(const char *filename);
void search(char *cc, char **ptrPattern, const char *filename);
void printStr(const char *filename, const char *cc);
void print(const char *filename, const char *cc);
void parseFlag(char *flags);
void flagF(const char *filename);
void recordDynamicArray(const char *arr);
void clean();

#endif