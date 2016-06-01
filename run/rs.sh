#! /bin/bash
rsync -vzh --update -e 'ssh -p 3222' patricio@200.5.224.86:lbp/lfa_apo_90000.nc ./
rsync -vzh --update -e 'ssh -p 3222' patricio@200.5.224.86:lbp/lfa_hol_90000.nc ./
rsync -vzh --update -e 'ssh -p 3222' patricio@200.5.224.86:lbp/naf_apo_90000.nc ./
rsync -vzh --update -e 'ssh -p 3222' patricio@200.5.224.86:lbp/naf_hol_90000.nc ./
echo 'lito'
exit 0
~      
