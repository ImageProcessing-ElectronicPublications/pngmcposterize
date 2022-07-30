CC=gcc
CFLAGSOPT ?= -DNDEBUG -O3 -fstrict-aliasing -ffast-math -funroll-loops -fomit-frame-pointer -ffinite-math-only -fno-asynchronous-unwind-tables -flto
INCLUDE ?= -I. -I/usr/local/include/libpng16/ -I/usr/local/include/ -I/usr/include/ -I/usr/X11/include/ -I./include

CFLAGS ?= -Wall -Wno-unknown-pragmas $(INCLUDE) $(CFLAGSOPT)
CFLAGS += -std=c99 $(CFLAGSADD)

LDFLAGS ?= -L/usr/local/lib/ -L/usr/lib/ -L/usr/X11/lib/ -L./lib
LDFLAGS += -lpng -lz -lm $(LDFLAGSADD)
LDFLAGS += -static -s

OBJS = src/posterize.o \
       src/blurize.o \
       src/rwpng.o
COCOA_OBJS = src/rwpng_cocoa.o

ifdef USE_COCOA
CFLAGS += -DUSE_COCOA=1
OBJS += $(COCOA_OBJS)
FRAMEWORKS += -framework Cocoa
endif

TARGET = pngmcposterize

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $^ $(LDFLAGS) $(FRAMEWORKS) -o $@

rwpng_cocoa.o: rwpng_cocoa.m
	clang -c $(CFLAGS) $< -o $@

clean:
	-rm -f $(OBJS) $(TARGET)
