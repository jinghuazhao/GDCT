/*31-10-2009 MRC-Epid JHZ*/

input all_aa all_ab all_bb
1 2 3
10 20 30
100 200 300
end
qui gen p=.
forval i=1/`=_N' {
   local aa=all_aa[`i']
   local ab=all_ab[`i']
   local bb=all_bb[`i']
   qui genhwi `aa' `ab' `bb'
   qui replace p=r(p_exact) in `i'
}
list
program stata_snphwe, plugin using ("/genetics/data/software/bin/stata_snphwe.plugin")
qui gen p_exact=.
plugin call stata_snphwe all_aa all_ab all_bb p_exact
list
