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

#include "mdef.h"
#include "error.h"
#include "gtm_common_defs.h"
#include "rtnhdr.h"
#include "stack_frame.h"

GBLREF int mumps_status;
GBLREF int dollar_truth;
GBLREF condition_handler *ctxt;

int dm_start(void)
{
  mumps_status = 1;
  dollar_truth = 1;

  gtm_asm_establish();

  /* from error.si   ctxt->ch = mdb_condition_handler; */
  /* from error.si   setjmp(ctxt->jmp); */

  restart(); /* it should point to mum_tstart(); see assignment in sr_unix/errorsp.h */

  return 0;
}
