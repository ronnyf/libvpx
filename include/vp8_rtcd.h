//
//  vp8_rtcd.h
//  libvpx
//
//  Created by Falk, Ronny on 7/8/23.
//
//  Copyright (c) 2014 The WebM project authors. All Rights Reserved.
//
//  Use of this source code is governed by a BSD-style license
//  that can be found in the LICENSE file in the root of the source
//  tree. An additional intellectual property rights grant can be found
//  in the file PATENTS.  All contributing project authors may
//  be found in the AUTHORS file in the root of the source tree.
//

#ifndef vp8_rtcd_h
#define vp8_rtcd_h

#ifdef __APPLE__
#include <TargetConditionals.h>
#else
#error The purpose of this is to build libvpx with Xcode
#endif // __APPLE__

#if TARGET_OS_SIMULATOR
#include "sim-x86-64/vp8_rtcd.h"
#else
#if TARGET_CPU_ARM64
#include "arm64/vp8_rtcd.h"
#elif TARGET_CPU_ARM

#if __ARM_ARCH == 7
#include "armv7/vp8_rtcd"
#elif __ARM_ARCH_7S__
#include "armv7s/vp8_rtcd"
#endif // __ARM_ARCH

#elif TARGET_CPU_X86_64
#include "x86_64/vp8_rtcd"
#endif // TARGET_CPU_X86_64

#endif // TARGET_OS_SIMULATOR

#endif // vp8_rtcd_h
