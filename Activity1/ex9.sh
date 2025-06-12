#!/bin/bash

CRACK="ivanivanivanivananananaaaaaa"

echo "The result of ##*iva is" ${CRACK##*iva}
echo "The result of #*iva is" ${CRACK#*iva}
echo "The result of %%an* is" ${CRACK%%an*}
echo "The result of %iva* is" ${CRACK%iva*}
