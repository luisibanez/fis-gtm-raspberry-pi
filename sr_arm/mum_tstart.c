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

GBLREF unsigned short proc_act_type;

void mum_tstart(void)
{
  if(proc_act_type!=0)
  {
    trans_code();
  }
  /*
     The assembly version here calls:

                   getframe

     which is a macro defined in sr_i386/g_msf.si

     Must figure out the equivalent...

  */
  inst_flush();
}
