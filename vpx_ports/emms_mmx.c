/*
 *  Copyright (c) 2018 The WebM project authors. All Rights Reserved.
 *
 *  Use of this source code is governed by a BSD-style license
 *  that can be found in the LICENSE file in the root of the source
 *  tree. An additional intellectual property rights grant can be found
 *  in the file PATENTS.  All contributing project authors may
 *  be found in the AUTHORS file in the root of the source tree.
 */

#include "./vpx_config.h"
#if (VPX_ARCH_X86 || VPX_ARCH_X86_64) && HAVE_MMX

#include <mmintrin.h>

#include "vpx_ports/system_state.h"

//#if !VPX_X86_NO_ASM

void vpx_clear_system_state() { _mm_empty(); }

//#endif // !VPX_X86_NO_ASM

#endif
