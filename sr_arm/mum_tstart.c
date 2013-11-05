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
#include "xfer_enum.h"

GBLREF unsigned short proc_act_type;
GBLREF xfer_entry_t   xfer_table[];

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

  /* Load transfer table

         xfer_table

     this global array variable is defined in

        sr_port/xfer.h

     and the entries are loaded in

        sr_port/xfer_table.c

   */

}
