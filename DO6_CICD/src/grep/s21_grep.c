#include "s21_grep.h"

int main(int argc, char *argv[]) {
  if (argc < 1) exit(0);
  props.ptr = argv;
  while (*props.ptr) {
    parseFlag(*props.ptr);
  }
  props.ptr = ++argv;
  while (*props.ptr) {
    parse(*props.ptr);
  }
  fileNames();

  clean();

  return 0;
}

void parseFlag(char *flags) {
  if (*flags == '-') {
    char *ptr = ++flags;
    int stop = 1;

    while (*ptr != '\0' && stop) {
      int resultSearchFlag = searchFlags(*ptr);
      switch (resultSearchFlag) {
        case 1:
          printf("grep: illegal option -- %c\n", *ptr);
          exit(0);
          break;
        case 2:
          ptr++;
          if (*ptr != 0) {
            stop = 0;
          } else {
            stop = 0;
            props.ptr++;
          }
          break;
      }
      ptr++;
    }
  }
  props.ptr++;
}

void parse(char *flags) {
  if (*flags == '-') {
    char *ptr = ++flags;
    int stop = 1;

    while (*ptr != '\0' && stop) {
      // printf("worked");
      int resultSearchFlag = searchFlags(*ptr);
      switch (resultSearchFlag) {
        case 2:
          ptr++;
          if (*ptr != '\0') {
            // printf("%s", ptr);
            recordPattern(ptr);
            stop = 0;
          } else {
            props.ptr++;
            recordPattern(*props.ptr);
          }
          props.onePattern = 1;
          break;
        case 3:
          ptr++;
          if (*ptr != '\0') {
            flagF(ptr);
            stop = 0;
          } else {
            props.ptr++;
            flagF(*props.ptr);
          }
          props.onePattern = 1;
          break;
        default:
          ptr++;
          break;
      }
    }
  } else if (!props.onePattern && !props.e) {
    recordPattern(flags);
    props.onePattern = 1;
  } else {
    recordFilename(flags);
  }

  props.ptr++;
}

int searchFlags(const char flag) {
  int notFound = 0;
  // printf("%c", flag);
  switch (flag) {
    case 'e':
      props.e = 1;
      notFound = 2;
      break;
    case 'i':
      props.i = 1;
      break;
    case 'v':
      props.v = 1;
      break;
    case 'c':
      props.c = 1;
      break;
    case 'l':
      props.l = 1;
      break;
    case 'n':
      props.n = 1;
      break;
    case 'h':
      props.h = 1;
      break;
    case 's':
      props.s = 1;
      break;
    case 'f':
      props.f = 1;
      notFound = 3;
      break;
    case 'o':
      props.o = 1;
      break;
    default:
      notFound = 1;
  }

  return notFound;
}

void recordFilename(const char *fileName) {
  if (!nameFiles.ptr1) {
    nameFiles.ptr = nameFiles.arr;
    nameFiles.ptr1 = 0;
  }

  if (*fileName != '-') {
    *nameFiles.ptr = (char *)fileName;
    nameFiles.ptr++;
    nameFiles.ptr1++;
    // printf("filename = %s ", fileName);
    *nameFiles.ptr = NULL;
  }
}

void recordPattern(const char *patterns) {
  if (!pattern.ptr1) {
    pattern.ptr = pattern.arr;
    pattern.ptr1 = 0;
  }
  *pattern.ptr = (char *)patterns;
  // printf("pattern = .%s.\n", patterns);
  pattern.ptr++;
  pattern.ptr1++;
}

void fileNames() {
  char **ptr = nameFiles.arr;
  while (*ptr != NULL) {
    openFile(*ptr);
    ptr++;
  }
}

void flagF(const char *filename) {
  char *line = NULL;
  FILE *fp;
  size_t length = 0;
  ssize_t read;
  char *pattern = NULL;

  if ((fp = fopen(filename, "r")) == NULL) {
    if (!props.s) printf("grep: %s: No such file or directory\n", filename);
  } else {
    while ((read = getline(&line, &length, fp)) != -1) {
      pattern = malloc((length) * sizeof(char));
      recordDynamicArray(pattern);
      char *ptrLine = line;
      char *ptrPattern = pattern;
      while (*ptrLine != '\0') {
        if (*ptrLine != 10) *ptrPattern = *ptrLine;
        ptrLine++;
        ptrPattern++;
      }
      recordPattern(pattern);
    }

    fclose(fp);
    free(line);
  }
}

void clean() {
  char **ptrPattern = dynamicMemory.arr;
  while (*ptrPattern != NULL) {
    free(*ptrPattern);
    ptrPattern++;
  }
}

void openFile(const char *filename) {
  char *line = NULL;
  FILE *fp;
  size_t len = 0;
  ssize_t read;

  if ((fp = fopen(filename, "r")) == NULL) {
    if (!props.s) printf("grep: %s: No such file or directory\n", filename);
  } else {
    find.coincidence = 0;
    find.countStr = 0;
    find.outStr = 0;
    while ((read = getline(&line, &len, fp)) != -1) {
      find.outStr = 0;
      find.lengthStr = len;
      find.oneLine = 0;
      char **ptrPattern = pattern.arr;
      while (*ptrPattern != NULL && !find.outStr) {
        search(line, ptrPattern, filename);
        ptrPattern++;
      }
    }
    fclose(fp);
  }

  if (find.outStr && !props.v && !(**pattern.arr == '\0' && pattern.ptr1 < 2))
    printf("\n");
  if (props.c && props.l) {
    printf("%d\n", 1);
  }
  if ((props.c && !props.l) || (props.c && find.coincidence == 0))
    print(filename, line);
  if (props.l && find.coincidence > 0) print(filename, line);
  if (line) free(line);
}

void search(char *cc, char **ptrPattern, const char *filename) {
  if (!find.oneLine) find.countStr++;

  regmatch_t pmatch[1];
  regex_t reg;
  int str;

  props.i ? regcomp(&reg, *ptrPattern, REG_ICASE)
          : regcomp(&reg, *ptrPattern, 0);
  str = props.v ? regexec(&reg, cc, 1, pmatch, 1)
                : !regexec(&reg, cc, 1, pmatch, 1);

  if (**ptrPattern == '\0' && pattern.ptr1 < 2) {
    str = props.v ? 0 : 1;
    pattern.empty = 1;
  }

  if (str) {
    find.coincidence++;
    if (!props.c && !props.l) print(filename, cc);

    if (props.o && !props.l && !props.v) {
      for (int i = pmatch[0].rm_so; i < pmatch[0].rm_eo; ++i) {
        putchar(cc[i]);
      }
      printf("\n");
      char *newPtr = cc + pmatch[0].rm_eo;

      find.oneLine = 1;
      if (pmatch[0].rm_eo) search(newPtr, ptrPattern, filename);
    }
  }

  regfree(&reg);
}

void print(const char *filename, const char *cc) {
  if ((nameFiles.ptr1 > 1 && !props.h && !props.l && !find.oneLine))
    printf("%s:", filename);
  if (props.n && !props.l && !props.c && !find.oneLine)
    printf("%d:", find.countStr);
  if ((!props.c && !props.l && !props.o) || (props.v && props.o)) {
    printf("%s", cc);
    find.outStr = 1;
  }
  if (((props.c && !props.l) || (props.c && !find.coincidence)))
    printf("%d\n", find.coincidence);
  if (props.l && find.coincidence > 0) printf("%s\n", filename);
}

void recordDynamicArray(const char *arr) {
  if (!dynamicMemory.ptr) dynamicMemory.ptr = dynamicMemory.arr;
  *dynamicMemory.ptr = (char *)arr;
  dynamicMemory.ptr++;
}
