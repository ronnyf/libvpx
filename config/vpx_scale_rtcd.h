/*
 *  Copyright (c) 2023 The WebM project authors. All Rights Reserved.
 *
 *  Use of this source code is governed by a BSD-style license
 *  that can be found in the LICENSE file in the root of the source
 *  tree. An additional intellectual property rights grant can be found
 *  in the file PATENTS.  All contributing project authors may
 *  be found in the AUTHORS file in the root of the source tree.
 */

#ifndef vpx_scale_rtcd_h
#define vpx_scale_rtcd_h

#include "libvpx_config/vpx_config.h"

#if defined(__APPLE__)
#include <TargetConditionals.h>
 
#if TARGET_OS_SIMULATOR

#if TARGET_CPU_X86_64
#error Not yet, got to figure out the asm part first, .S can be built with clang but .asm apparently not
//#include "libvpx_config/sim_x86_64/vpx_scale_rtcd.h"
#elif TARGET_CPU_ARM64
#include "libvpx_config/arm64/vpx_scale_rtcd.h"
#else
#error Unsupported
#endif // TARGET_CPU_X86_64

#else // TARGET_OS_SIMULATOR

#if TARGET_OS_IOS || TARGET_OS_MACCATALYST

#if TARGET_CPU_ARM64
#include "libvpx_config/arm64/vpx_scale_rtcd.h"
#elif TARGET_CPU_ARM
#if defined(__ARM_ARCH_7S__)
#include "libvpx_config/armv7s/vpx_scale_rtcd.h"
#elif defined(__ARM_ARCH_7A__)
#include "libvpx_config/armv7/vpx_scale_rtcd.h"
#else
#error Unsupported ARM_ARCH
#endif // defined(__ARM_ARCH_7S__)
#else
#error Unsupported
#endif // TARGET_CPU_ARM64

#elif TARGET_OS_OSX

#if TARGET_CPU_ARM64
#include "libvpx_config/arm64/vpx_scale_rtcd.h"
#elif TARGET_CPU_X86_64
#include "libvpx_config/mac_x86_64/vpx_scale_rtcd.h"
#else
#error Unsupported
#endif // TARGET_CPU_ARM64

#else
#error Unsupported
#endif // TARGET_OS_IOS || TARGET_OS_MACCATALYST

#endif // TARGET_OS_SIMULATOR
#endif // defined(__APPLE__)
#endif /* vpx_scale_rtcd */
