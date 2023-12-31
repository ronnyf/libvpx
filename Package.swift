// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "libvpx",
	platforms: [
		.iOS(.v12),
		.macOS(.v10_13),
		.macCatalyst(.v13),
		.watchOS(.v5),
		.tvOS(.v11)
	],
    products: [
		.library(
			name: "libvpx",
			type: .static,
			targets: ["libvpx"]
		),
		.library(
			name: "dylibvpx",
			type: .dynamic,
			targets: ["libvpx"]
		),
    ],
    targets: [
		.target(
			name: "libvpx",
			path: "./",
			sources: [
				// vp8
				"vp8/common/alloccommon.c",
				"vp8/common/arm/loopfilter_arm.c",
				"vp8/common/arm/neon/bilinearpredict_neon.c",
				"vp8/common/arm/neon/copymem_neon.c",
				"vp8/common/arm/neon/dc_only_idct_add_neon.c",
				"vp8/common/arm/neon/dequant_idct_neon.c",
				"vp8/common/arm/neon/dequantizeb_neon.c",
				"vp8/common/arm/neon/idct_blk_neon.c",
				"vp8/common/arm/neon/iwalsh_neon.c",
				"vp8/common/arm/neon/loopfiltersimplehorizontaledge_neon.c",
				"vp8/common/arm/neon/loopfiltersimpleverticaledge_neon.c",
				"vp8/common/arm/neon/mbloopfilter_neon.c",
				"vp8/common/arm/neon/shortidct4x4llm_neon.c",
				"vp8/common/arm/neon/sixtappredict_neon.c",
				"vp8/common/arm/neon/vp8_loopfilter_neon.c",
				"vp8/common/blockd.c",
				"vp8/common/context.c",
				"vp8/common/debugmodes.c",
				"vp8/common/dequantize.c",
				"vp8/common/entropy.c",
				"vp8/common/entropymode.c",
				"vp8/common/entropymv.c",
				"vp8/common/extend.c",
				"vp8/common/filter.c",
				"vp8/common/findnearmv.c",
				"vp8/common/generic/systemdependent.c",
				"vp8/common/idct_blk.c",
				"vp8/common/idctllm.c",
//				"vp8/common/loongarch/idct_lsx.c",
//				"vp8/common/loongarch/loopfilter_filters_lsx.c",
//				"vp8/common/loongarch/sixtap_filter_lsx.c",
				"vp8/common/loopfilter_filters.c",
				"vp8/common/mbpitch.c",
				"vp8/common/mfqe.c",
//				"vp8/common/mips/dspr2/dequantize_dspr2.c",
//				"vp8/common/mips/dspr2/filter_dspr2.c",
//				"vp8/common/mips/dspr2/idct_blk_dspr2.c",
//				"vp8/common/mips/dspr2/idctllm_dspr2.c",
//				"vp8/common/mips/dspr2/reconinter_dspr2.c",
//				"vp8/common/mips/dspr2/vp8_loopfilter_filters_dspr2.c",
//				"vp8/common/mips/mmi/copymem_mmi.c",
//				"vp8/common/mips/mmi/dequantize_mmi.c",
//				"vp8/common/mips/mmi/idct_blk_mmi.c",
//				"vp8/common/mips/mmi/idctllm_mmi.c",
//				"vp8/common/mips/mmi/loopfilter_filters_mmi.c",
//				"vp8/common/mips/mmi/sixtap_filter_mmi.c",
//				"vp8/common/mips/msa/bilinear_filter_msa.c",
//				"vp8/common/mips/msa/copymem_msa.c",
//				"vp8/common/mips/msa/idct_msa.c",
//				"vp8/common/mips/msa/loopfilter_filters_msa.c",
//				"vp8/common/mips/msa/mfqe_msa.c",
//				"vp8/common/mips/msa/sixtap_filter_msa.c",
				"vp8/common/modecont.c",
				"vp8/common/postproc.c",
				"vp8/common/quant_common.c",
				"vp8/common/reconinter.c",
				"vp8/common/reconintra.c",
				"vp8/common/reconintra4x4.c",
				"vp8/common/rtcd.c",
				"vp8/common/setupintrarecon.c",
				"vp8/common/swapyv12buffer.c",
				"vp8/common/treecoder.c",
				"vp8/common/vp8_loopfilter.c",
				"vp8/common/vp8_skin_detection.c",
				"vp8/common/x86/bilinear_filter_sse2.c",
				"vp8/common/x86/idct_blk_mmx.c",
				"vp8/common/x86/idct_blk_sse2.c",
				"vp8/common/x86/loopfilter_x86.c",
				"vp8/common/x86/vp8_asm_stubs.c",
				"vp8/decoder/dboolhuff.c",
				"vp8/decoder/decodeframe.c",
				"vp8/decoder/decodemv.c",
				"vp8/decoder/detokenize.c",
				"vp8/decoder/error_concealment.c",
				"vp8/decoder/onyxd_if.c",
				"vp8/decoder/threading.c",
				"vp8/encoder/arm/neon/denoising_neon.c",
				"vp8/encoder/arm/neon/fastquantizeb_neon.c",
				"vp8/encoder/arm/neon/shortfdct_neon.c",
				"vp8/encoder/arm/neon/vp8_shortwalsh4x4_neon.c",
				"vp8/encoder/bitstream.c",
				"vp8/encoder/boolhuff.c",
				"vp8/encoder/copy_c.c",
				"vp8/encoder/dct.c",
				"vp8/encoder/denoising.c",
				"vp8/encoder/encodeframe.c",
				"vp8/encoder/encodeintra.c",
				"vp8/encoder/encodemb.c",
				"vp8/encoder/encodemv.c",
				"vp8/encoder/ethreading.c",
				"vp8/encoder/firstpass.c",
				"vp8/encoder/lookahead.c",
//				"vp8/encoder/loongarch/dct_lsx.c",
//				"vp8/encoder/loongarch/encodeopt_lsx.c",
//				"vp8/encoder/loongarch/vp8_quantize_lsx.c",
				"vp8/encoder/mcomp.c",
//				"vp8/encoder/mips/mmi/dct_mmi.c",
//				"vp8/encoder/mips/mmi/vp8_quantize_mmi.c",
//				"vp8/encoder/mips/msa/dct_msa.c",
//				"vp8/encoder/mips/msa/denoising_msa.c",
//				"vp8/encoder/mips/msa/encodeopt_msa.c",
//				"vp8/encoder/mips/msa/quantize_msa.c",
//				"vp8/encoder/mips/msa/temporal_filter_msa.c",
				"vp8/encoder/modecosts.c",
				"vp8/encoder/mr_dissim.c",
				"vp8/encoder/onyx_if.c",
				"vp8/encoder/pickinter.c",
				"vp8/encoder/picklpf.c",
				"vp8/encoder/ratectrl.c",
				"vp8/encoder/rdopt.c",
				"vp8/encoder/segmentation.c",
				"vp8/encoder/temporal_filter.c",
				"vp8/encoder/tokenize.c",
				"vp8/encoder/treewriter.c",
				"vp8/encoder/vp8_quantize.c",
				"vp8/encoder/x86/denoising_sse2.c",
				"vp8/encoder/x86/quantize_sse4.c",
				"vp8/encoder/x86/vp8_enc_stubs_sse2.c",
				"vp8/encoder/x86/vp8_quantize_sse2.c",
				"vp8/encoder/x86/vp8_quantize_ssse3.c",
				"vp8/vp8_cx_iface.c",
				"vp8/vp8_dx_iface.c",
				// vp9:
				"vp9/common/arm/neon/vp9_highbd_iht16x16_add_neon.c",
				"vp9/common/arm/neon/vp9_highbd_iht4x4_add_neon.c",
				"vp9/common/arm/neon/vp9_highbd_iht8x8_add_neon.c",
				"vp9/common/arm/neon/vp9_iht16x16_add_neon.c",
				"vp9/common/arm/neon/vp9_iht4x4_add_neon.c",
				"vp9/common/arm/neon/vp9_iht8x8_add_neon.c",
//				"vp9/common/mips/dspr2/vp9_itrans16_dspr2.c",
//				"vp9/common/mips/dspr2/vp9_itrans4_dspr2.c",
//				"vp9/common/mips/dspr2/vp9_itrans8_dspr2.c",
//				"vp9/common/mips/msa/vp9_idct16x16_msa.c",
//				"vp9/common/mips/msa/vp9_idct4x4_msa.c",
//				"vp9/common/mips/msa/vp9_idct8x8_msa.c",
//				"vp9/common/mips/msa/vp9_mfqe_msa.c",
//				"vp9/common/ppc/vp9_idct_vsx.c",
				"vp9/common/vp9_alloccommon.c",
				"vp9/common/vp9_blockd.c",
				"vp9/common/vp9_common_data.c",
				"vp9/common/vp9_debugmodes.c",
				"vp9/common/vp9_entropy.c",
				"vp9/common/vp9_entropymode.c",
				"vp9/common/vp9_entropymv.c",
				"vp9/common/vp9_filter.c",
				"vp9/common/vp9_frame_buffers.c",
				"vp9/common/vp9_idct.c",
				"vp9/common/vp9_loopfilter.c",
				"vp9/common/vp9_mfqe.c",
				"vp9/common/vp9_mvref_common.c",
				"vp9/common/vp9_postproc.c",
				"vp9/common/vp9_pred_common.c",
				"vp9/common/vp9_quant_common.c",
				"vp9/common/vp9_reconinter.c",
				"vp9/common/vp9_reconintra.c",
				"vp9/common/vp9_rtcd.c",
				"vp9/common/vp9_scale.c",
				"vp9/common/vp9_scan.c",
				"vp9/common/vp9_seg_common.c",
				"vp9/common/vp9_thread_common.c",
				"vp9/common/vp9_tile_common.c",
				"vp9/common/x86/vp9_highbd_iht16x16_add_sse4.c",
				"vp9/common/x86/vp9_highbd_iht4x4_add_sse4.c",
				"vp9/common/x86/vp9_highbd_iht8x8_add_sse4.c",
				"vp9/common/x86/vp9_idct_intrin_sse2.c",
				"vp9/decoder/vp9_decodeframe.c",
				"vp9/decoder/vp9_decodemv.c",
				"vp9/decoder/vp9_decoder.c",
				"vp9/decoder/vp9_detokenize.c",
				"vp9/decoder/vp9_dsubexp.c",
				"vp9/decoder/vp9_job_queue.c",
				"vp9/encoder/arm/neon/vp9_dct_neon.c",
				"vp9/encoder/arm/neon/vp9_denoiser_neon.c",
				"vp9/encoder/arm/neon/vp9_diamond_search_sad_neon.c",
				"vp9/encoder/arm/neon/vp9_error_neon.c",
				"vp9/encoder/arm/neon/vp9_frame_scale_neon.c",
				"vp9/encoder/arm/neon/vp9_highbd_error_neon.c",
				"vp9/encoder/arm/neon/vp9_highbd_temporal_filter_neon.c",
				"vp9/encoder/arm/neon/vp9_quantize_neon.c",
				"vp9/encoder/arm/neon/vp9_temporal_filter_neon.c",
//				"vp9/encoder/mips/msa/vp9_error_msa.c",
//				"vp9/encoder/mips/msa/vp9_fdct16x16_msa.c",
//				"vp9/encoder/mips/msa/vp9_fdct4x4_msa.c",
//				"vp9/encoder/mips/msa/vp9_fdct8x8_msa.c",
//				"vp9/encoder/ppc/vp9_quantize_vsx.c",
				"vp9/encoder/vp9_alt_ref_aq.c",
				"vp9/encoder/vp9_aq_360.c",
				"vp9/encoder/vp9_aq_complexity.c",
				"vp9/encoder/vp9_aq_cyclicrefresh.c",
				"vp9/encoder/vp9_aq_variance.c",
				"vp9/encoder/vp9_bitstream.c",
				"vp9/encoder/vp9_blockiness.c",
				"vp9/encoder/vp9_context_tree.c",
				"vp9/encoder/vp9_cost.c",
				"vp9/encoder/vp9_dct.c",
				"vp9/encoder/vp9_denoiser.c",
				"vp9/encoder/vp9_encodeframe.c",
				"vp9/encoder/vp9_encodemb.c",
				"vp9/encoder/vp9_encodemv.c",
				"vp9/encoder/vp9_encoder.c",
				"vp9/encoder/vp9_ethread.c",
				"vp9/encoder/vp9_ext_ratectrl.c",
				"vp9/encoder/vp9_extend.c",
				"vp9/encoder/vp9_firstpass.c",
				"vp9/encoder/vp9_frame_scale.c",
				"vp9/encoder/vp9_lookahead.c",
				"vp9/encoder/vp9_mbgraph.c",
				"vp9/encoder/vp9_mcomp.c",
				"vp9/encoder/vp9_multi_thread.c",
				"vp9/encoder/vp9_noise_estimate.c",
				"vp9/encoder/vp9_non_greedy_mv.c",
				"vp9/encoder/vp9_picklpf.c",
				"vp9/encoder/vp9_pickmode.c",
				"vp9/encoder/vp9_quantize.c",
				"vp9/encoder/vp9_ratectrl.c",
				"vp9/encoder/vp9_rd.c",
				"vp9/encoder/vp9_rdopt.c",
				"vp9/encoder/vp9_resize.c",
				"vp9/encoder/vp9_segmentation.c",
				"vp9/encoder/vp9_skin_detection.c",
				"vp9/encoder/vp9_speed_features.c",
				"vp9/encoder/vp9_subexp.c",
				"vp9/encoder/vp9_svc_layercontext.c",
				"vp9/encoder/vp9_temporal_filter.c",
				"vp9/encoder/vp9_tokenize.c",
				"vp9/encoder/vp9_tpl_model.c",
				"vp9/encoder/vp9_treewriter.c",
				"vp9/encoder/x86/highbd_temporal_filter_sse4.c",
				"vp9/encoder/x86/temporal_filter_sse4.c",
				"vp9/encoder/x86/vp9_dct_intrin_sse2.c",
				"vp9/encoder/x86/vp9_denoiser_sse2.c",
				"vp9/encoder/x86/vp9_error_avx2.c",
				"vp9/encoder/x86/vp9_frame_scale_ssse3.c",
				"vp9/encoder/x86/vp9_highbd_block_error_intrin_sse2.c",
				"vp9/encoder/x86/vp9_quantize_avx2.c",
				"vp9/encoder/x86/vp9_quantize_sse2.c",
				"vp9/encoder/x86/vp9_quantize_ssse3.c",
				"vp9/vp9_cx_iface.c",
				"vp9/vp9_dx_iface.c",
				"vp9/vp9_iface_common.c",
				// vpx:
				"vpx/src/vpx_codec.c",
				"vpx/src/vpx_decoder.c",
				"vpx/src/vpx_encoder.c",
				"vpx/src/vpx_image.c",
				"vpx/src/vpx_tpl.c",
				// vpx_dsp:
				"vpx_dsp/add_noise.c",
				"vpx_dsp/arm/avg_neon.c",
				"vpx_dsp/arm/avg_pred_neon.c",
				"vpx_dsp/arm/deblock_neon.c",
				"vpx_dsp/arm/fdct16x16_neon.c",
				"vpx_dsp/arm/fdct32x32_neon.c",
				"vpx_dsp/arm/fdct4x4_neon.c",
				"vpx_dsp/arm/fdct8x8_neon.c",
				"vpx_dsp/arm/fdct_partial_neon.c",
				"vpx_dsp/arm/hadamard_neon.c",
				"vpx_dsp/arm/highbd_avg_neon.c",
				"vpx_dsp/arm/highbd_avg_pred_neon.c",
				"vpx_dsp/arm/highbd_hadamard_neon.c",
				"vpx_dsp/arm/highbd_idct16x16_add_neon.c",
				"vpx_dsp/arm/highbd_idct32x32_1024_add_neon.c",
				"vpx_dsp/arm/highbd_idct32x32_135_add_neon.c",
				"vpx_dsp/arm/highbd_idct32x32_34_add_neon.c",
				"vpx_dsp/arm/highbd_idct32x32_add_neon.c",
				"vpx_dsp/arm/highbd_idct4x4_add_neon.c",
				"vpx_dsp/arm/highbd_idct8x8_add_neon.c",
				"vpx_dsp/arm/highbd_intrapred_neon.c",
				"vpx_dsp/arm/highbd_loopfilter_neon.c",
				"vpx_dsp/arm/highbd_quantize_neon.c",
				"vpx_dsp/arm/highbd_sad4d_neon.c",
				"vpx_dsp/arm/highbd_sad_neon.c",
				"vpx_dsp/arm/highbd_subpel_variance_neon.c",
				"vpx_dsp/arm/highbd_variance_neon.c",
				"vpx_dsp/arm/highbd_vpx_convolve8_neon.c",
				"vpx_dsp/arm/highbd_vpx_convolve_avg_neon.c",
				"vpx_dsp/arm/highbd_vpx_convolve_copy_neon.c",
				"vpx_dsp/arm/highbd_vpx_convolve_neon.c",
				"vpx_dsp/arm/idct16x16_1_add_neon.c",
				"vpx_dsp/arm/idct16x16_add_neon.c",
				"vpx_dsp/arm/idct32x32_135_add_neon.c",
				"vpx_dsp/arm/idct32x32_1_add_neon.c",
				"vpx_dsp/arm/idct32x32_34_add_neon.c",
				"vpx_dsp/arm/idct32x32_add_neon.c",
				"vpx_dsp/arm/idct4x4_1_add_neon.c",
				"vpx_dsp/arm/idct4x4_add_neon.c",
				"vpx_dsp/arm/idct8x8_1_add_neon.c",
				"vpx_dsp/arm/idct8x8_add_neon.c",
				"vpx_dsp/arm/intrapred_neon.c",
				"vpx_dsp/arm/loopfilter_neon.c",
				"vpx_dsp/arm/quantize_neon.c",
				"vpx_dsp/arm/sad4d_neon.c",
				"vpx_dsp/arm/sad_neon.c",
				"vpx_dsp/arm/subpel_variance_neon.c",
				"vpx_dsp/arm/subtract_neon.c",
				"vpx_dsp/arm/sum_squares_neon.c",
				"vpx_dsp/arm/variance_neon.c",
				"vpx_dsp/arm/vpx_convolve8_neon.c",
				"vpx_dsp/arm/vpx_convolve8_neon_asm.c",
				"vpx_dsp/arm/vpx_convolve_avg_neon.c",
				"vpx_dsp/arm/vpx_convolve_copy_neon.c",
				"vpx_dsp/arm/vpx_convolve_neon.c",
				"vpx_dsp/arm/vpx_scaled_convolve8_neon.c",
				"vpx_dsp/avg.c",
				"vpx_dsp/bitreader.c",
				"vpx_dsp/bitreader_buffer.c",
				"vpx_dsp/bitwriter.c",
				"vpx_dsp/bitwriter_buffer.c",
				"vpx_dsp/deblock.c",
				"vpx_dsp/fastssim.c",
				"vpx_dsp/fwd_txfm.c",
				"vpx_dsp/intrapred.c",
				"vpx_dsp/inv_txfm.c",
//				"vpx_dsp/loongarch/avg_lsx.c",
//				"vpx_dsp/loongarch/avg_pred_lsx.c",
//				"vpx_dsp/loongarch/fwd_dct32x32_lsx.c",
//				"vpx_dsp/loongarch/fwd_txfm_lsx.c",
//				"vpx_dsp/loongarch/idct32x32_lsx.c",
//				"vpx_dsp/loongarch/intrapred_lsx.c",
//				"vpx_dsp/loongarch/loopfilter_16_lsx.c",
//				"vpx_dsp/loongarch/loopfilter_4_lsx.c",
//				"vpx_dsp/loongarch/loopfilter_8_lsx.c",
//				"vpx_dsp/loongarch/quantize_lsx.c",
//				"vpx_dsp/loongarch/sad_lsx.c",
//				"vpx_dsp/loongarch/sub_pixel_variance_lsx.c",
//				"vpx_dsp/loongarch/subtract_lsx.c",
//				"vpx_dsp/loongarch/variance_lsx.c",
//				"vpx_dsp/loongarch/vpx_convolve8_avg_horiz_lsx.c",
//				"vpx_dsp/loongarch/vpx_convolve8_avg_lsx.c",
//				"vpx_dsp/loongarch/vpx_convolve8_avg_vert_lsx.c",
//				"vpx_dsp/loongarch/vpx_convolve8_horiz_lsx.c",
//				"vpx_dsp/loongarch/vpx_convolve8_lsx.c",
//				"vpx_dsp/loongarch/vpx_convolve8_vert_lsx.c",
//				"vpx_dsp/loongarch/vpx_convolve_avg_lsx.c",
//				"vpx_dsp/loongarch/vpx_convolve_copy_lsx.c",
				"vpx_dsp/loopfilter.c",
//				"vpx_dsp/mips/add_noise_msa.c",
//				"vpx_dsp/mips/avg_msa.c",
//				"vpx_dsp/mips/common_dspr2.c",
//				"vpx_dsp/mips/convolve2_avg_dspr2.c",
//				"vpx_dsp/mips/convolve2_avg_horiz_dspr2.c",
//				"vpx_dsp/mips/convolve2_dspr2.c",
//				"vpx_dsp/mips/convolve2_horiz_dspr2.c",
//				"vpx_dsp/mips/convolve2_vert_dspr2.c",
//				"vpx_dsp/mips/convolve8_avg_dspr2.c",
//				"vpx_dsp/mips/convolve8_avg_horiz_dspr2.c",
//				"vpx_dsp/mips/convolve8_dspr2.c",
//				"vpx_dsp/mips/convolve8_horiz_dspr2.c",
//				"vpx_dsp/mips/convolve8_vert_dspr2.c",
//				"vpx_dsp/mips/deblock_msa.c",
//				"vpx_dsp/mips/fwd_dct32x32_msa.c",
//				"vpx_dsp/mips/fwd_txfm_msa.c",
//				"vpx_dsp/mips/idct16x16_msa.c",
//				"vpx_dsp/mips/idct32x32_msa.c",
//				"vpx_dsp/mips/idct4x4_msa.c",
//				"vpx_dsp/mips/idct8x8_msa.c",
//				"vpx_dsp/mips/intrapred16_dspr2.c",
//				"vpx_dsp/mips/intrapred4_dspr2.c",
//				"vpx_dsp/mips/intrapred8_dspr2.c",
//				"vpx_dsp/mips/intrapred_msa.c",
//				"vpx_dsp/mips/itrans16_dspr2.c",
//				"vpx_dsp/mips/itrans32_cols_dspr2.c",
//				"vpx_dsp/mips/itrans32_dspr2.c",
//				"vpx_dsp/mips/itrans4_dspr2.c",
//				"vpx_dsp/mips/itrans8_dspr2.c",
//				"vpx_dsp/mips/loopfilter_16_msa.c",
//				"vpx_dsp/mips/loopfilter_4_msa.c",
//				"vpx_dsp/mips/loopfilter_8_msa.c",
//				"vpx_dsp/mips/loopfilter_filters_dspr2.c",
//				"vpx_dsp/mips/loopfilter_mb_dspr2.c",
//				"vpx_dsp/mips/loopfilter_mb_horiz_dspr2.c",
//				"vpx_dsp/mips/loopfilter_mb_vert_dspr2.c",
//				"vpx_dsp/mips/sad_mmi.c",
//				"vpx_dsp/mips/sad_msa.c",
//				"vpx_dsp/mips/sub_pixel_variance_msa.c",
//				"vpx_dsp/mips/subtract_mmi.c",
//				"vpx_dsp/mips/subtract_msa.c",
//				"vpx_dsp/mips/sum_squares_msa.c",
//				"vpx_dsp/mips/variance_mmi.c",
//				"vpx_dsp/mips/variance_msa.c",
//				"vpx_dsp/mips/vpx_convolve8_avg_horiz_msa.c",
//				"vpx_dsp/mips/vpx_convolve8_avg_msa.c",
//				"vpx_dsp/mips/vpx_convolve8_avg_vert_msa.c",
//				"vpx_dsp/mips/vpx_convolve8_horiz_msa.c",
//				"vpx_dsp/mips/vpx_convolve8_mmi.c",
//				"vpx_dsp/mips/vpx_convolve8_msa.c",
//				"vpx_dsp/mips/vpx_convolve8_vert_msa.c",
//				"vpx_dsp/mips/vpx_convolve_avg_msa.c",
//				"vpx_dsp/mips/vpx_convolve_copy_msa.c",
//				"vpx_dsp/ppc/deblock_vsx.c",
//				"vpx_dsp/ppc/fdct32x32_vsx.c",
//				"vpx_dsp/ppc/hadamard_vsx.c",
//				"vpx_dsp/ppc/intrapred_vsx.c",
//				"vpx_dsp/ppc/inv_txfm_vsx.c",
//				"vpx_dsp/ppc/quantize_vsx.c",
//				"vpx_dsp/ppc/sad_vsx.c",
//				"vpx_dsp/ppc/subtract_vsx.c",
//				"vpx_dsp/ppc/variance_vsx.c",
//				"vpx_dsp/ppc/vpx_convolve_vsx.c",
				"vpx_dsp/prob.c",
				"vpx_dsp/psnr.c",
				"vpx_dsp/psnrhvs.c",
				"vpx_dsp/quantize.c",
				"vpx_dsp/sad.c",
				"vpx_dsp/skin_detection.c",
				"vpx_dsp/ssim.c",
				"vpx_dsp/subtract.c",
				"vpx_dsp/sum_squares.c",
				"vpx_dsp/variance.c",
				"vpx_dsp/vpx_convolve.c",
				"vpx_dsp/vpx_dsp_rtcd.c",
				"vpx_dsp/x86/avg_intrin_avx2.c",
				"vpx_dsp/x86/avg_intrin_sse2.c",
				"vpx_dsp/x86/avg_pred_avx2.c",
				"vpx_dsp/x86/avg_pred_sse2.c",
				"vpx_dsp/x86/fwd_txfm_avx2.c",
				"vpx_dsp/x86/fwd_txfm_sse2.c",
				"vpx_dsp/x86/highbd_convolve_avx2.c",
				"vpx_dsp/x86/highbd_idct16x16_add_sse2.c",
				"vpx_dsp/x86/highbd_idct16x16_add_sse4.c",
				"vpx_dsp/x86/highbd_idct32x32_add_sse2.c",
				"vpx_dsp/x86/highbd_idct32x32_add_sse4.c",
				"vpx_dsp/x86/highbd_idct4x4_add_sse2.c",
				"vpx_dsp/x86/highbd_idct4x4_add_sse4.c",
				"vpx_dsp/x86/highbd_idct8x8_add_sse2.c",
				"vpx_dsp/x86/highbd_idct8x8_add_sse4.c",
				"vpx_dsp/x86/highbd_intrapred_intrin_sse2.c",
				"vpx_dsp/x86/highbd_intrapred_intrin_ssse3.c",
				"vpx_dsp/x86/highbd_loopfilter_sse2.c",
				"vpx_dsp/x86/highbd_quantize_intrin_avx2.c",
				"vpx_dsp/x86/highbd_quantize_intrin_sse2.c",
				"vpx_dsp/x86/highbd_sad4d_avx2.c",
				"vpx_dsp/x86/highbd_sad_avx2.c",
				"vpx_dsp/x86/highbd_variance_sse2.c",
				"vpx_dsp/x86/inv_txfm_avx2.c",
				"vpx_dsp/x86/inv_txfm_sse2.c",
				"vpx_dsp/x86/inv_txfm_ssse3.c",
				"vpx_dsp/x86/loopfilter_avx2.c",
				"vpx_dsp/x86/loopfilter_sse2.c",
				"vpx_dsp/x86/post_proc_sse2.c",
				"vpx_dsp/x86/quantize_avx.c",
				"vpx_dsp/x86/quantize_avx2.c",
				"vpx_dsp/x86/quantize_sse2.c",
				"vpx_dsp/x86/quantize_ssse3.c",
				"vpx_dsp/x86/sad4d_avx2.c",
				"vpx_dsp/x86/sad4d_avx512.c",
				"vpx_dsp/x86/sad_avx2.c",
				"vpx_dsp/x86/subtract_avx2.c",
				"vpx_dsp/x86/sum_squares_sse2.c",
				"vpx_dsp/x86/variance_avx2.c",
				"vpx_dsp/x86/variance_sse2.c",
				"vpx_dsp/x86/vpx_subpixel_4t_intrin_sse2.c",
				"vpx_dsp/x86/vpx_subpixel_8t_intrin_avx2.c",
				"vpx_dsp/x86/vpx_subpixel_8t_intrin_ssse3.c",
				// vpx_scale:
				"vpx_scale/generic/gen_scalers.c",
				"vpx_scale/generic/vpx_scale.c",
				"vpx_scale/generic/yv12config.c",
				"vpx_scale/generic/yv12extend.c",
//				"vpx_scale/mips/dspr2/yv12extend_dspr2.c",
				"vpx_scale/vpx_scale_rtcd.c",
				// vpx_mem:
				"vpx_mem/vpx_mem.c",
				// vpx_ports:
				"vpx_ports/arm_cpudetect.c",
				"vpx_ports/emms_mmx.c",
//				"vpx_ports/loongarch_cpudetect.c",
//				"vpx_ports/mips_cpudetect.c",
//				"vpx_ports/ppc_cpudetect.c",
				// vpx_util:
				"vpx_util/vpx_debug_util.c",
				"vpx_util/vpx_thread.c",
				"vpx_util/vpx_write_yuv_frame.c",
			],
			publicHeadersPath: "include/",
			cSettings: [
				.headerSearchPath("./"),
				.headerSearchPath("include/config"),
			]
		)
    ],
	cLanguageStandard: .gnu11,
	cxxLanguageStandard: .gnucxx20
)
