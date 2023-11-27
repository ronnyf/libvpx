// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "libvpx",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
		.library(name: "vpx", targets: ["vpx"]),
		.library(name: "vpx_util", targets: ["vpx_util"]),
		.library(name: "vp8_common", targets: ["vp8_common"]),
		.library(name: "vp8_decoder", targets: ["vp8_decoder"]),
    ],
	targets: [
		.target(
			name: "vp8_common",
			path: "Sources/vp8",
			sources: Package.common_vp8(),
			publicHeadersPath: "include",
			cSettings: [
				.headerSearchPath("../vpx/include"),
				.headerSearchPath("../vpx_dsp/include"),
				.headerSearchPath("../vpx_mem/include"),
				.headerSearchPath("../vpx_ports/include"),
				.headerSearchPath("../vpx_scale/include"),
			]
		),
		.target(
			name: "vpx",
			dependencies: [
				"vp8_common"
			],
			path: "Sources/vpx",
			sources: [
				"src/vpx_codec.c",
				"src/vpx_decoder.c",
				"src/vpx_encoder.c",
				"src/vpx_image.c",
				"src/vpx_tpl.c",
			],
			publicHeadersPath: "include",
			cSettings: [
				.headerSearchPath("../vpx_dsp/include"),
				.headerSearchPath("../vpx_mem/include"),
				.headerSearchPath("../vpx_ports/include"),
				.headerSearchPath("../vpx_scale/include"),
			]
		),
		.target(
			name: "vpx_util",
			dependencies: [
				"vpx"
			],
			path: "Sources/vpx_util",
			sources: [
				"vpx_debug_util.c",
				"vpx_thread.c",
//				"vpx_write_yuv_frame.c",
			],
			publicHeadersPath: "include"
		),
		.target(
			name: "vpx_dsp",
			dependencies: [
			],
			path: "Sources/vpx_dsp",
			sources: [
				
			],
			publicHeadersPath: "include"
		),
		.target(
			name: "vp8_decoder",
			path: "Sources/vp8",
			sources: [
				"vp8_dx_iface.c"
			],
			publicHeadersPath: "include",
			cSettings: [
				.headerSearchPath("../vpx/include"),
				.headerSearchPath("../vpx_dsp/include"),
				.headerSearchPath("../vpx_mem/include"),
				.headerSearchPath("../vpx_ports/include"),
				.headerSearchPath("../vpx_scale/include"),
				.define("", to: "", .when(platforms: [.iOS]))
			]
		),
	]
)

extension Package {
	static func common_vp8() -> [String] {
		var result: [String] = [
			"common/alloccommon.c",
			"common/blockd.c",
			"common/debugmodes.c",
			"common/dequantize.c",
			"common/entropy.c",
			"common/entropymode.c",
			"common/entropymv.c",
			"common/extend.c",
			"common/filter.c",
			"common/findnearmv.c",
			"common/generic/systemdependent.c",
			"common/idct_blk.c",
			"common/idctllm.c",
			"common/rtcd.c",
			"common/vp8_loopfilter.c",
			"common/loopfilter_filters.c",
			"common/mbpitch.c",
			"common/modecont.c",
			"common/quant_common.c",
			"common/reconinter.c",
			"common/reconintra.c",
			"common/reconintra4x4.c",
			"common/setupintrarecon.c",
			"common/swapyv12buffer.c",
			"common/treecoder.c"
		]
		
#if HAVE_X86
		result += ["common/x86/idct_blk_mmx.c"]
#endif
		
#if CONFIG_POSTPROC
		result += ["common/x86/vp8_asm_stubs.c", "common/x86/loopfilter_x86.c"]
#endif
		
#if HAVE_MMX
		result += ["common/x86/idct_blk_mmx.c"]
#endif
		
#if HAVE_SSE2
		result += ["common/x86/idct_blk_sse2.c", "common/x86/bilinear_filter_sse2.c"]
#endif
		
#if HAVE_NEON
		result += [
			"common/arm/loopfilter_arm.c",
			"common/arm/loopfilter_arm.h",
			"common/arm/neon/bilinearpredict_neon.c",
			"common/arm/neon/copymem_neon.c",
			"common/arm/neon/dc_only_idct_add_neon.c",
			"common/arm/neon/dequant_idct_neon.c",
			"common/arm/neon/dequantizeb_neon.c",
			"common/arm/neon/idct_blk_neon.c",
			"common/arm/neon/iwalsh_neon.c",
			"common/arm/neon/vp8_loopfilter_neon.c",
			"common/arm/neon/loopfiltersimplehorizontaledge_neon.c",
			"common/arm/neon/loopfiltersimpleverticaledge_neon.c",
			"common/arm/neon/mbloopfilter_neon.c",
			"common/arm/neon/shortidct4x4llm_neon.c",
			"common/arm/neon/sixtappredict_neon.c"
		]
#endif
		
#if VPX_ARCH_ARM
		//		result += [...]
#endif
		return result
	}
	
	static func vpx_dsp() -> [String] {
		var result: [String] = [
			"prob.c",
			"intrapred.c",
			"skin_detection.c",
			"vpx_dsp_rtcd.c",
		]
		
		#if CONFIG_ENCODERS
		result += [
			"bitwriter.c",
			"bitwriter_buffer.c",
			"psnr.c",
			"sad.c",
			"subtract.c",
			"sum_squares.c",
		]
		
		#if CONFIG_VP9_HIGHBITDEPTH
		#if HAVE_SSE2
		result += [
			"x86/highbd_sad4d_sse2.asm.S",
			"x86/highbd_sad_sse2.asm.S",
		]
		#endif
		
		#if HAVE_AVX2
		result += [
			"x86/highbd_sad4d_avx2.c",
			"x86/highbd_sad_avx2.c",
		]
		#endif
		
		#if HAVE_NEON
		result += [
			"arm/highbd_sad4d_neon.c",
			"arm/highbd_sad_neon.c",
		]
		#endif
		
		#endif // CONFIG_VP9_HIGHBITDEPTH
		
		#if CONFIG_INTERNAL_STATS
		result += [
			"ssim.c",
			"psnrhvs.c",
			"fastssim.c",
		]
		#endif // CONFIG_INTERNAL_STATS
		
		#if HAVE_NEON
		result += [
			"arm/sum_squares_neon.c",
			"arm/sad4d_neon.c",
			"arm/sad_neon.c",
			"arm/subtract_neon.c",
		]
		#endif

		#if HAVE_NEON_HAVE_NEON_DOTPROD
		result += [
			"arm/sad4d_neon_dotprod.c",
			"arm/sad_neon_dotprod.c",
		]
		#endif
		
		#if HAVE_SSE2
		result += [
			"x86/sum_squares_sse2.c",
			"x86/sad4d_sse2.asm",
			"x86/sad_sse2.asm",
			"x86/subtract_sse2.asm",
		]
		#endif

		#if HAVE_AVX2
		result += [
			"x86/sad4d_avx2.c",
			"x86/sad_avx2.c",
			"x86/subtract_avx2.c",
		]
		#endif

		#if HAVE_AVX512
		result += [
			"x86/sad4d_avx512.c",
		]
		#endif
		
		#if CONFIG_POSTPROC || CONFIG_VP9_POSTPROC
		result += [
			"variance.c",
		]
		
		#if HAVE_NEON
		result += [
			"arm/avg_pred_neon.c",
			"arm/subpel_variance_neon.c",
			"arm/variance_neon.c",
		]
		#endif
		
		#if HAVE_NEON_DOTPROD
		result += [
			"arm/variance_neon_dotprod.c",
		]
		#endif
		
		#if HAVE_SSE2
		result += [
			"x86/avg_pred_sse2.c",
			"x86/variance_sse2.c", // Contains SSE2 and SSSE3
		]
		#endif
		
		#if HAVE_AVX2
		result += [
			"x86/avg_pred_avx2.c",
			"x86/variance_avx2.c",
		]
		#endif
		
		#if HAVE_SSE2
		result += [
			"x86/subpel_variance_sse2.asm.S", // Contains SSE2 and SSSE3
		]
		
		#if HAVE_VPX_ARCH_X86_64
		result += [
			"x86/ssim_opt_x86_64.asm.S",
		]
		#endif
		
		#endif // HAVE_SSE2
		
		#if CONFIG_VP9_HIGHBITDEPTH
		
		#if HAVE_SSE2
		result += [
			"x86/highbd_variance_sse2.c",
			"x86/highbd_variance_impl_sse2.asm.S",
			"x86/highbd_subpel_variance_impl_sse2.asm.S",
		]
		#endif
		
		#if HAVE_NEON
		result += [
			"arm/highbd_avg_pred_neon.c",
			"arm/highbd_variance_neon.c",
			"arm/highbd_subpel_variance_neon.c",
		]
		#endif
		
		#endif // CONFIG_VP9_HIGHBITDEPTH
		
		#endif // CONFIG_POSTPROC || CONFIG_VP9_POSTPROC
		
		#endif // CONFIG_ENCODERS
		
		#if CONFIG_DECODERS
		result += [
			"bitreader.c",
			"bitreader_buffer.c",
		]
		#endif
		
		#if CONFIG_POSTPROC || CONFIG_VP9_POSTPROC
		result += [
			"add_noise.c",
			"deblock.c",
		]
		
		#if HAVE_NEON
		result.append("arm/deblock_neon.c")
		#endif
				
		#if HAVE_SSE2
		result += [
			"x86/add_noise_sse2.asm.S",
			"x86/deblock_sse2.asm.S",
			"x86/post_proc_sse2.c",
		]
		#endif // HAVE_SSE2
		#endif // CONFIG_POSTPROC || CONFIG_VP9_POSTPROC
		
		#if HAVE_SSE2
		result.append("x86/intrapred_sse2.asm.S")
		#endif
		
		#if HAVE_SSSE3
		result.append("x86/intrapred_ssse3.asm.S")
		#endif
		
		#if CONFIG_VP9_HIGHBITDEPTH
		#if HAVE_SSE2
		result.append("x86/highbd_intrapred_sse2.asm.S")
		#endif
		
		#if HAVE_SSE2
		result.append("x86/highbd_intrapred_intrin_sse2.c")
		#endif
		
		#if HAVE_SSSE3
		result.append("x86/highbd_intrapred_intrin_ssse3.c")
		#endif
		
		#if HAVE_NEON
		result.append("arm/highbd_intrapred_neon.c")
		#endif
		#endif // CONFIG_VP9_HIGHBITDEPTH
		
		#if HAVE_NEON_ASM
		result.append("arm/intrapred_neon_asm.S")
		#endif
		
		#if HAVE_NEON
		result.append("arm/intrapred_neon.c")
		#endif
		
		#if CONFIG_VP9
		result += [
			"vpx_convolve.c",
			"loopfilter.c",
			"inv_txfm.c",
		]
		
		#if HAVE_NEON
		result += [
			"arm/vpx_scaled_convolve8_neon.c",
		]
		#endif
		
		#if HAVE_NEON_ASM
		result += [
			"arm/vpx_convolve_copy_neon_asm.S",
			"arm/vpx_convolve8_horiz_filter_type2_neon.S",
			"arm/vpx_convolve8_vert_filter_type2_neon.S",
			"arm/vpx_convolve8_horiz_filter_type1_neon.S",
			"arm/vpx_convolve8_vert_filter_type1_neon.S",
			"arm/vpx_convolve8_avg_horiz_filter_type2_neon.S",
			"arm/vpx_convolve8_avg_vert_filter_type2_neon.S",
			"arm/vpx_convolve8_avg_horiz_filter_type1_neon.S",
			"arm/vpx_convolve8_avg_vert_filter_type1_neon.S",
			"arm/vpx_convolve_avg_neon_asm.S",
			"arm/vpx_convolve8_neon_asm.c",
			"arm/vpx_convolve_neon.c",

			"arm/loopfilter_16_neon.S",
			"arm/loopfilter_8_neon.S",
			"arm/loopfilter_4_neon.S",
			
			"arm/save_reg_neon.S",
			
			"arm/idct_neon.S",
			"arm/idct4x4_1_add_neon.S",
			"arm/idct4x4_add_neon.S",
		]
		#elseif HAVE_NEON
		result += [
			"arm/vpx_convolve_copy_neon.c",
			"arm/vpx_convolve8_neon.c",
			"arm/vpx_convolve_avg_neon.c",
			"arm/vpx_convolve_neon.c",
			"arm/loopfilter_neon.c",
			"arm/idct4x4_1_add_neon.c",
			"arm/idct4x4_add_neon.c",
			"arm/idct8x8_1_add_neon.c",
			"arm/idct8x8_add_neon.c",
			"arm/idct16x16_1_add_neon.c",
			"arm/idct16x16_add_neon.c",
			"arm/idct32x32_1_add_neon.c",
			"arm/idct32x32_34_add_neon.c",
			"arm/idct32x32_135_add_neon.c",
			"arm/idct32x32_add_neon.c",
		]
		#endif
		
		#if HAVE_NEON_DOTPROD
		result += [
			"arm/vpx_convolve8_neon_dotprod.c",
			"arm/vpx_convolve_neon_dotprod.c",
		]
		#endif
		
		#if HAVE_NEON_I8MM
		result += [
			"arm/vpx_convolve8_neon_i8mm.c",
			"arm/vpx_convolve_neon_i8mm.c",
		]
		#endif
		
		
		#if HAVE_SSE2
		result += [
			"x86/vpx_subpixel_8t_sse2.asm.S",
			"x86/vpx_subpixel_4t_intrin_sse2.c",
			"x86/vpx_subpixel_bilinear_sse2.asm.S",
			"x86/vpx_convolve_copy_sse2.asm.S",
			"x86/loopfilter_sse2.c",
			"x86/inv_txfm_sse2.c",
			"x86/inv_wht_sse2.asm.S",
		]
		#endif
		
		#if HAVE_SSSE3
		result += [
			"x86/vpx_subpixel_8t_ssse3.asm.S",
			"x86/vpx_subpixel_bilinear_ssse3.asm.S",
			"x86/vpx_subpixel_8t_intrin_ssse3.c",
			"x86/inv_txfm_ssse3.c",
		]
		#endif
		
		#if HAVE_AVX2
		result += [
			"x86/vpx_subpixel_8t_intrin_avx2.c",
			"x86/loopfilter_avx2.c",
			"x86/inv_txfm_avx2.c",
		]
		#endif
		
		#if CONFIG_VP9_HIGHBITDEPTH
		#if HAVE_SSE2
		result += [
			"x86/vpx_high_subpixel_8t_sse2.asm.S",
			"x86/vpx_high_subpixel_bilinear_sse2.asm.S",
			"x86/highbd_loopfilter_sse2.c",
			"x86/highbd_idct4x4_add_sse2.c",
			"x86/highbd_idct8x8_add_sse2.c",
			"x86/highbd_idct16x16_add_sse2.c",
			"x86/highbd_idct32x32_add_sse2.c",
		]
		#endif
		
		#if HAVE_SSE4_1
		result += [
			"x86/highbd_idct4x4_add_sse4.c",
			"x86/highbd_idct8x8_add_sse4.c",
			"x86/highbd_idct16x16_add_sse4.c",
			"x86/highbd_idct32x32_add_sse4.c",
		]
		#endif
		
		#if HAVE_AVX2
		result.append("x86/highbd_convolve_avx2.c")
		#endif
		
		#if HAVE_NEON
		result += [
			"arm/highbd_vpx_convolve_copy_neon.c",
			"arm/highbd_vpx_convolve_avg_neon.c",
			"arm/highbd_vpx_convolve8_neon.c",
			"arm/highbd_vpx_convolve_neon.c",
			"arm/highbd_loopfilter_neon.c",
			"arm/highbd_idct4x4_add_neon.c",
			"arm/highbd_idct8x8_add_neon.c",
			"arm/highbd_idct16x16_add_neon.c",
			"arm/highbd_idct32x32_add_neon.c",
			"arm/highbd_idct32x32_34_add_neon.c",
			"arm/highbd_idct32x32_135_add_neon.c",
			"arm/highbd_idct32x32_1024_add_neon.c",
		]
		#endif
		#endif // CONFIG_VP9_HIGHBITDEPTH
		
		#endif // CONFIG_VP9
		
		#if CONFIG_VP9_ENCODER
		result += [
			"fwd_txfm.c",
			"quantize.c",
			"avg.c",
		]
		
		#if HAVE_NEON
		result += [
			"arm/fdct4x4_neon.c",
			"arm/fdct8x8_neon.c",
			"arm/fdct16x16_neon.c",
			"arm/fdct32x32_neon.c",
			"arm/fdct_partial_neon.c",
			"arm/quantize_neon.c",
			"arm/avg_neon.c",
			"arm/hadamard_neon.c",
		]
		#endif
		
		#if HAVE_SSE2
		result += [
			"x86/avg_intrin_sse2.c",
		]
		#endif
		
		#if HAVE_AVX
		result += [
			"x86/quantize_avx.c",
		]
		#endif
		
		#if HAVE_AVX2
		result += [
			"x86/quantize_avx2.c",
			"x86/fwd_txfm_avx2.c",
			"x86/avg_intrin_avx2.c",
		]
		#endif
		
		#if CONFIG_VP9_HIGHBITDEPTH
		#if HAVE_NEON
		result += [
			"arm/highbd_quantize_neon.c",
			"arm/highbd_hadamard_neon.c",
			"arm/highbd_avg_neon.c",
		]
		#endif
		
		#if HAVE_SSE2
		result += [
			"x86/highbd_quantize_intrin_sse2.c",
		]
		#endif
		
		#if HAVE_AVX2
		result += [
			"x86/highbd_quantize_intrin_avx2.c",
		]
		#endif // HAVE_AVX2
		#endif // CONFIG_VP9_HIGHBITDEPTH
		
		#if VPX_ARCH_X86_64 && HAVE_SSSE3
		result += [
			"x86/fwd_txfm_ssse3_x86_64.asm.S",
			"x86/quantize_ssse3.c",
			"x86/avg_ssse3_x86_64.asm.S",
		]
		#endif
		
		#if HAVE_SSE2
		result += [
			"x86/fwd_txfm_sse2.c",
			"x86/quantize_sse2.c",
		]
		#endif
		
		#endif // CONFIG_VP9_ENCODER
		
		return result
	}
}
