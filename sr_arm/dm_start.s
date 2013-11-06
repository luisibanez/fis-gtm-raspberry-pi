#################################################################
#								#
#	Copyright 2001 Sanchez Computer Associates, Inc.	#
#								#
#	This source code contains the intellectual property	#
#	of its copyright holder(s), and is made available	#
#	under a license.  If you do not know the terms of	#
#	the license, please stop and do not read further.	#
#								#
#################################################################

	.title	dm_start.s

.include	"g_msf.si"

	.arch armv6
	.fpu vfp
	.text

	.align	2
	.global	dm_start
	.type	dm_start, %function

	.sbttl	mum_tstart

	.data
.extern	dollar_truth
.extern	xfer_table
.extern	frame_pointer
.extern	msp
.extern	mumps_status
.extern	restart

	.text
.extern	mdb_condition_handler
.extern	op_unwind

dm_start:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {REG_FRAME_POINTER, lr}
	add	REG_FRAME_POINTER, sp, #4
	ldr	r3, .L2  @ get address of mumps_status
	mov	r2, #1
	str	r2, [r3, #0]  @ set mumps_status to 1
	ldr	r3, .L2+4     @ get address of dollar_truth
	mov	r2, #1
	str	r2, [r3, #0]  @ set dollar_truth to 1
  ldr REG_XFER_TABLE, .L2+8
	ldrh	REG_XFER_TABLE, [REG_XFER_TABLE, #0]
  bl	gtm_asm_establish
  bl	restart
	mov	r3, #0
	mov	r0, r3
	ldmfd	sp!, {REG_FRAME_POINTER, pc}
.L3:
	.align 2
.L2:
	.word mumps_status
	.word dollar_truth
	.word	xfer_table
	.size	dm_start, .-dm_start

	.align	2
	.global	gtm_levl_ret_code
	.type	gtm_levl_ret_code, %function
gtm_levl_ret_code:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	gtm_levl_ret_code, .-gtm_levl_ret_code

	.align	2
	.global	gtm_ret_code
	.type	gtm_ret_code, %function
gtm_ret_code:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	gtm_ret_code, .-gtm_ret_code
