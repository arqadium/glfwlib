##############################################################################
##                            Good Luck Fav Wun™                            ##
##                                                                          ##
##                      Copyright © 2020 ARQADIUM LLC.                      ##
##                       Released under BSD-2-Clause.                       ##
##############################################################################

include base.mk

PROJECT := glfw
EXEFILE :=
SOFILE  :=
AFILE   := 1

# <system> includes
INCLUDES := include
# "local" includes
INCLUDEL := src

# libraries
LIBS    :=
LIBDIRS :=

# frameworks (macOS only)
FWORKS :=

# in-tree 3rd-party libraries
3PLIBDIR := 3rdparty
3PLIBS :=

DEFINES += _GLFW_VULKAN_STATIC

# sources
CFILES   := \
	src/context.c \
	src/init.c \
	src/input.c \
	src/monitor.c \
	src/vulkan.c \
	src/window.c
MFILES   :=
HFILES   := \
	src/internal.h \
	src/mappings.h
CPPFILES :=
HPPFILES :=

ifeq ($(TP),Darwin)
CFILES += \
	src/cocoa_time.c \
	src/posix_thread.c \
	src/egl_context.c \
	src/osmesa_context.c
MFILES += \
	src/cocoa_init.m \
	src/cocoa_joystick.m \
	src/cocoa_monitor.m \
	src/cocoa_window.m \
	src/nsgl_context.m
HFILES += \
	src/cocoa_platform.h \
	src/cocoa_joystick.h \
	src/posix_thread.h \
	src/nsgl_context.h \
	src/egl_context.h \
	src/osmesa_context.h
DEFINES += _GLFW_COCOA
else ifeq ($(TP),Win32)
CFILES += \
	src/win32_init.c \
	src/win32_joystick.c \
	src/win32_monitor.c \
	src/win32_time.c \
	src/win32_thread.c \
	src/win32_window.c \
	src/wgl_context.c \
	src/egl_context.c \
	src/osmesa_context.c
HFILES += \
	src/win32_platform.h \
	src/win32_joystick.h \
	src/wgl_context.h \
	src/egl_context.h \
	src/osmesa_context.h
DEFINES += _GLFW_WIN32
else ifeq ($(TP),Linux)
CFILES += \
	src/x11_init.c \
	src/x11_monitor.c \
	src/x11_window.c \
	src/xkb_unicode.c \
	src/posix_time.c \
	src/posix_thread.c \
	src/glx_context.c \
	src/egl_context.c \
	src/osmesa_context.c \
	src/linux_joystick.c
HFILES += \
	src/x11_platform.h \
	src/xkb_unicode.h \
	src/posix_time.h \
	src/posix_thread.h \
	src/glx_context.h \
	src/egl_context.h \
	src/osmesa_context.h \
	src/linux_joystick.h
DEFINES += _GLFW_X11
endif # $(TP)

# test suite sources
TES_CFILES   :=
TES_HFILES   :=
TES_MFILES   :=
TES_CPPFILES :=
TES_HPPFILES :=

OVR_CFLAGS := -std=c99 -Wno-c11-extensions -Wno-pedantic
OVR_MFLAGS := -Wno-c11-extensions -Wno-pedantic

# this defines all our usual targets
include targets.mk
