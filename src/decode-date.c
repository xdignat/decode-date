#define WASM_EXPORT __attribute__((visibility("default")))

typedef int i32;
typedef unsigned u32;
typedef short i16;
typedef long long i64;
typedef i64 * p64;
typedef double f64;
typedef void * pointer;
typedef char bool;

typedef struct {
  f64 week;
  f64 year;
  f64 month;
  f64 day;
  f64 hour;
  f64 minute;
  f64 second;
  f64 msec;
} TDecodeDateA, TDecodeDateB;

typedef struct {
  u32 week;
  u32 year;
  u32 month;
  u32 day;
  u32 hour;
  u32 minute;
  u32 second;
  u32 msec;
} TDecodeDateC;

typedef struct {
  TDecodeDateA a;
  TDecodeDateB b;
  TDecodeDateC c;
} TDecodeDate;

f64 fdiv(f64 a, f64 b) {
  return trunc(a / b);
}

f64 fmod(f64 a, f64 b) {
  return a - (trunc(a / b) * b);
}

f64 fshl2(f64 a) {
  return a * 4;
}

f64 fshr2(f64 a) {
  return trunc(a / 4);
}

TDecodeDate ddMem;

WASM_EXPORT
pointer decodeDate_A_Offset() {
  return &ddMem.a;
}

WASM_EXPORT
pointer decodeDate_B_Offset() {
  return &ddMem.a;
}

WASM_EXPORT
pointer decodeDate_C_Offset() {
  return &ddMem.c;
}

WASM_EXPORT
bool decodeDate_A_Proc(f64 value) {
  i32 j, time, week, year, month, day, hour, minute, second, msec;
  
  if (value < -62162035200000 || value > 92556518400000)
    return 0;
  
  value += 62162121600000;
  day = value / 86400000;
  time = fmod(value, 86400000);
  
  msec = time % 1000;
  second = (time / 1000 % 60);
  minute = (time / 60000 % 60);
  hour = (time / 3600000);

  j = (day << 2) - 1;
  week = (day + 2) % 7;
  year = (j / 146097);

  day = (j - (146097 * year)) & -4;
  j = ((day + 3) / 1461);
  day = (day + 7 - (1461 * j)) >> 2;
  month = ((5 * day - 3) / 153);
  day = ((5 * day + 2 - (153 * month)) / 5);
  year = 100 * year + j;
  if (month < 10)
    month += 2;
  else {
    month -= 10;
    year++;
  }  

  ddMem.a.week = week;
  ddMem.a.year = year;
  ddMem.a.month = month;
  ddMem.a.day = day;
  ddMem.a.hour = hour;
  ddMem.a.minute = minute;
  ddMem.a.second = second;
  ddMem.a.msec = msec;
  
  return 1;
}

WASM_EXPORT
bool decodeDate_B_Proc(f64 value) {
  f64 j, time, week, year, month, day, hour, minute, second, msec;
  if (value < -62162035200000 || value > 92556518400000)
    return 0;

  value = 62162121600000 + value;
  
  day = fdiv(value, 86400000);
  time = fmod(value, 86400000);
  
  msec = fmod(time, 1000);
  second = fmod(fdiv(time, 1000), 60);
  minute = fmod(fdiv(time, 60000), 60);
  hour = fdiv(time, 3600000);

  j = fshl2(day) - 1;
  week = fmod(day + 2, 7);
  year = fdiv(j, 146097);

  day = fshl2(fshr2(j - (146097 * year)));
  j = fdiv((day + 3), 1461);
  day = fshr2(day + 7 - (1461 * j));
  month = fdiv((5 * day - 3), 153);
  day = fdiv((5 * day + 2 - (153 * month)), 5);
  year = 100 * year + j;
  if (month < 10)
    month += 2;
  else {
    month -= 10;
    year++;
  }  

  ddMem.b.week = week;
  ddMem.b.year = year;
  ddMem.b.month = month;
  ddMem.b.day = day;
  ddMem.b.hour = hour;
  ddMem.b.minute = minute;
  ddMem.b.second = second;
  ddMem.b.msec = msec;
  
  return 1;
}

WASM_EXPORT
bool decodeDate_C_Proc(f64 value) {
  i32 j, time, week, year, month, day, hour, minute, second, msec;
  
  if (value < -62162035200000 || value > 92556518400000)
    return 0;
    
  value += 62162121600000;
  day = value / 86400000;
  time = fmod(value, 86400000);
  
  msec = time % 1000;
  second = (time / 1000 % 60);
  minute = (time / 60000 % 60);
  hour = (time / 3600000);

  j = (day << 2) - 1;
  week = (day + 2) % 7;
  year = (j / 146097);

  day = (j - (146097 * year)) & -4;
  j = ((day + 3) / 1461);
  day = (day + 7 - (1461 * j)) >> 2;
  month = ((5 * day - 3) / 153);
  day = ((5 * day + 2 - (153 * month)) / 5);
  year = 100 * year + j;
  if (month < 10)
    month += 2;
  else {
    month -= 10;
    year++;
  }  

  ddMem.c.week = week;
  ddMem.c.year = year;
  ddMem.c.month = month;
  ddMem.c.day = day;
  ddMem.c.hour = hour;
  ddMem.c.minute = minute;
  ddMem.c.second = second;
  ddMem.c.msec = msec;
  
  return 1;
}
