# Copyright 2011-2017 Mentor Graphics Corporation
# 			All Rights Reserved 
# 
# THIS WORK CONTAINS TRADE SECRET AND PROPRIETARY
# INFORMATION WHICH IS THE PROPERTY OF MENTOR
# GRAPHICS CORPORATION OR ITS LICENSORS AND IS
# SUBJECT TO LICENSE TERMS.

#
# call this script directly after calling any toolkit dialog or module
#
# ======================================================================
pushd `dirname $0` > /dev/null
set wd=`pwd -P`
popd > /dev/null
set TK_CMD_RESULT = `"$wd/msi_cmd" -tk_getCmdResult`
