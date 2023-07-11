/*
 *  Copyright (c) 2023 The WebM project authors. All Rights Reserved.
 *
 *  Use of this source code is governed by a BSD-style license
 *  that can be found in the LICENSE file in the root of the source
 *  tree. An additional intellectual property rights grant can be found
 *  in the file PATENTS.  All contributing project authors may
 *  be found in the AUTHORS file in the root of the source tree.
 */

#ifndef vp8_rtcd_h
#define vp8_rtcd_h

#include "config/vpx_config.h"

#if defined(__APPLE__)
#include <TargetConditionals.h>
 
#if TARGET_OS_SIMULATOR

#if TARGET_CPU_X86_64
#include "config/x86_64/vp8_rtcd.h"
#elif TARGET_CPU_ARM64
#include "config/arm64/vp8_rtcd.h"
#else
#error Unsupported
#endif // TARGET_CPU_X86_64

#else // TARGET_OS_SIMULATOR

#if TARGET_OS_IOS || TARGET_OS_MACCATALYST

#if TARGET_CPU_ARM64
#include "config/arm64/vp8_rtcd.h"
#elif TARGET_CPU_ARM
#if defined(__ARM_ARCH_7S__)
#include "config/armv7s/vp8_rtcd.h"
#elif defined(__ARM_ARCH_7A__)
#include "config/armv7/vp8_rtcd.h"
#else
#error Unsupported ARM_ARCH
#endif // defined(__ARM_ARCH_7S__)
#else
#error Unsupported
#endif // TARGET_CPU_ARM64

#elif TARGET_OS_OSX

#if TARGET_CPU_ARM64
#include "config/arm64/vp8_rtcd.h"
#elif TARGET_CPU_X86_64
#include "config/x86_64/vp8_rtcd.h"
#else
#error Unsupported
#endif // TARGET_CPU_ARM64

#else
#error Unsupported
#endif // TARGET_OS_IOS || TARGET_OS_MACCATALYST

#endif // TARGET_OS_SIMULATOR
#endif // defined(__APPLE__)
#endif /* vp8_rtcd */
