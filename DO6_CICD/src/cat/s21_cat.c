#include "s21_cat.h"

int main(int argc, char *argv[]) {
  if (argc < 1) exit(0);
  for (int i = 1; i < argc; i++) {
    parseFlag(argv[i]);
  }

  var.countStr = 1;

  for (int i = 1; i < argc; i++) {
    props.filename = argv[i];
    openFile();
  }

  // printf("\n-b = %d, -e = %d, -n = %d, -s = %d, -t = %d, filename = %s\n",
  //        props.b, props.e, props.n, props.s, props.t, props.filename);

  return 0;
}

void parseFlag(const char *flags) {
  char *ptr = (char *)flags;
  if (*ptr == '-') {
    ptr++;
    if (*ptr == '-') {
      searchFlagsGnu(flags);
    } else {
      while (*ptr != '\0') {
        if (searchFlags(*ptr)) {
          printf("cat: illegal option -- %c\nusage: cat [-benstuv] [file ...]",
                 *ptr);
          exit(0);
        }
        ptr++;
      }
    }
  }
}

int searchFlags(const char flag) {
  int notFound = 0;
  // printf("%c", flag);
  switch (flag) {
    case 'b':
      props.b = 1;
      break;
    case 'e':
      props.e = 1;
      props.v = 1;
      break;
    case 'E':
      props.e = 1;
      break;
    case 'n':
      props.n = 1;
      break;
    case 's':
      props.s = 1;
      break;
    case 't':
      props.t = 1;
      props.v = 1;
      break;
    case 'T':
      props.t = 1;
      break;
    default:
      notFound = 1;
  }
  return notFound;
}

void searchFlagsGnu(const char *flag) {
  if (strcmp(flag, "--number-nonblank") == 0) {
    props.b = 1;
  } else if (strcmp(flag, "--number") == 0) {
    props.n = 1;
  } else if (strcmp(flag, "--squeeze-blank") == 0) {
    props.s = 1;
  }
}

void openFile() {
  if (*props.filename != '-') {
    FILE *fp;
    char c;
    if ((fp = fopen(props.filename, "r")) == NULL) {
      printf("cat: %s: No such file or directory", props.filename);
    } else {
      var.count = 1;
      var.countStr = 1;

      while ((c = getc(fp)) != EOF) {
        if (props.s) flagS(c);
        if (props.b) flagB(c);
        if (props.n && !props.b && !var.ignoreSymbol) flagN(c);
        if (props.e && !var.ignoreSymbol) flagE(c);
        if (props.t) flagT(c);
        if (props.v) flagV(c);

        if (var.ignoreSymbol) {
          var.ignoreSymbol = 0;
        } else {
          printf("%c", c);
        }
      }

      fclose(fp);
    }
  }
}

void flagS(const char c) {
  if (c == 10) {
    var.count++;
  } else {
    var.count = 0;
  }

  if (var.count > 2) {
    var.ignoreSymbol = 1;
  }
}

void flagE(const char c) {
  if ((c == 10) && props.e) printf("$");
}

void flagB(const char c) {
  if (var.countStr == 1 &&
      c != 10) {  // пришет номер первой строки при флагах -b
    var.trPL = 0;
    printNumberStr(var.countStr);
    var.countStr++;
  }
  if (c == 10)
    var.trPL = 1;  // отмечает что текущий символ перевод строки, -b -n

  if (var.trPL &&
      c != 10) {  // нумерует слудующую строку если она не пустая, -b
    printNumberStr(var.countStr);
    var.trPL = 0;
    var.countStr++;
  }
}

void flagN(const char c) {
  if (var.trPL == 1) {  // нумерует каждую строку, флаг -n
    printNumberStr(var.countStr);
    var.trPL = 0;
    var.countStr++;
  }

  if (var.countStr == 1) {  // пришет номер первой строки при флагах -b, -n
    printNumberStr(var.countStr);
    var.countStr++;
  }

  if (c == 10)
    var.trPL = 1;  // отмечает что текущий символ перевод строки, -b -n
}

void flagT(const char c) {
  if (c == 9) {
    printf("^I");
    var.ignoreSymbol = 1;
  }
}

void flagV(const char c) {
  if (c < 32 && c > -1 && c != 9 && c != 10) {
    printf("^%c", c + 64);
    var.ignoreSymbol = 1;
  } else if (c == 127) {
    printf("^?");
    var.ignoreSymbol = 1;
  }
}

void printNumberStr(const int countStr) {
  if (countStr < 10) {
    printf("     %d\t", countStr);
  } else if (countStr < 100) {
    printf("    %d\t", countStr);
  } else if (countStr < 1000) {
    printf("   %d\t", countStr);
  } else if (countStr < 10000) {
    printf("  %d\t", countStr);
  } else if (countStr < 100000) {
    printf(" %d\t", countStr);
  } else if (countStr < 1000000) {
    printf("%d\t", countStr);
  }
}
