/****************************************************************
 *								*
 *	Copyright 2001, 2009 Fidelity Information Services, Inc	*
 *								*
 *	This source code contains the intellectual property	*
 *	of its copyright holder(s), and is made available	*
 *	under a license.  If you do not know the terms of	*
 *	the license, please stop and do not read further.	*
 *								*
 ****************************************************************/

/* for ctxt ?   #include "stack_frame.h" */

extern mumps_status;
extern dollar_truth;
extern mdb_condition_handler;
extern ctxt;

int dm_start(void)
{
  mumps_status = 1;
  dollar_truth = 1;
  gtm_asm_establish();
  /* from error.si   ctxt->ch = mdb_condition_handler; */
  /* from error.si   setjmp(ctxt->jmp); */
  restart();
  return 0;
}
