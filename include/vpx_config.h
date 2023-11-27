//
//  vpx_config.h
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

#ifndef ANY_VPX_CONFIG_H
#define ANY_VPX_CONFIG_H

#ifdef __APPLE__
#include <TargetConditionals.h>
#else
#error The purpose of this is to build libvpx with Xcode
#endif // __APPLE__

#if TARGET_OS_SIMULATOR
#include "sim-x86-64/vpx_config.h"
#else
#if TARGET_CPU_ARM64
#include "arm64/vpx_config.h"
#elif TARGET_CPU_ARM

#if __ARM_ARCH == 7
#include "armv7/vpx_config"
#elif __ARM_ARCH_7S__
#include "armv7s/vpx_config"
#endif // __ARM_ARCH

#elif TARGET_CPU_X86_64
#include "x86_64/vpx_config"
#endif // TARGET_CPU_X86_64

#endif // TARGET_OS_SIMULATOR

#endif /* ANY_VPX_CONFIG_H */
