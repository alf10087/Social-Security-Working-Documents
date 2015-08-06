import excel "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/aliv_64F2.xlsx", firstrow clear
save "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/aliv_64F2.dta", replace

import excel "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/aliv_64M2.xlsx", firstrow clear
save "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/aliv_64M2.dta", replace

use "/Users/Alfonso/Dropbox (Personal)/SS/pc_earnings_ss.dta", clear

//// Generate Total Earnings

egen tot_earn = rsum(earn_20-earn_64)

//// Probability of Alive by 64

xtile pc_at64 = tot_earn, nquantiles(100)

merge m:m pc_at64 sex using "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/aliv_64M2.dta"
drop _merge

merge m:m pc_at64 sex using "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/aliv_64F2.dta"
drop _merge

//// Expected Taxes

gen exp_taxes = 0.124 * prob_alive*tot_earn

//// Expected PIA

gen yearly_pia = pia*12

//// Expected PIA per year

forvalues i = 
