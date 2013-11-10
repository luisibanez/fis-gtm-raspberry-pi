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

	.TITLE	mum_tstart.s

.include	"g_msf.si"

	.arch armv6
	.fpu vfp
	.text

	.align	2
	.global	mum_tstart
	.type	mum_tstart, %function

	.sbttl	mum_tstart
	.data
.extern frame_pointer
.extern xfer_table
.extern proc_act_type
 
	.text
.extern	trans_code

mum_tstart:
	add	REG_FRAME_POINTER, sp, #4
	ldr	r3, .L3
	ldrh	r3, [r3, #0]
	cmp	r3, #0
	beq	.L1
	blx	trans_code
.L1: getframe     @defined in g_msf.si
  ldr REG_FRAME_POINTER, .L5
	ldrh	REG_XFER_TABLE, [REG_XFER_TABLE, #0]
  bx lr
.L4:
	.align	2
.L3:
	.word	proc_act_type
.L5:
	.word	xfer_table
	.size	mum_tstart, .-mum_tstart
