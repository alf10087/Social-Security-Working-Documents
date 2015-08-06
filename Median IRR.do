import excel "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/aliv_all_median.xlsx", firstrow clear
save "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/aliv_all_median.dta", replace

//// IRR if everyone lived the same

use "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/pc_earnings_ss_final.dta", clear

//// Probability of Alive by 64

drop _merge
merge m:m pc_at64 sex using "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/aliv_all_median.dta"
drop _merge

//// Expected Median Taxes

forvalues i = 20/39 {
local j = `i'
gen exp_taxes_`j'm = -0.124 * pdv_`j' * 1
	}

forvalues i = 40/64 {
local j = `i'
gen exp_taxes_`j'm = -0.124 * pdv_`j' * Age_`j'm
	}	

//// Expected Median PIA per year

forvalues i = 64/100 {
	local j = `i'
	gen exp_pia_`j'm = yearly_pia * Age_`j'm
	}

save "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/pc_earnings_ss_final_median.dta", replace 

/// outsheet exp_taxes_20m-exp_taxes_64m exp_pia_64m-exp_pia_100m using "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/pc_earnings_ss_final_median.csv", comma nolabel replace

import excel "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/IRR_median.xlsx", firstrow clear
save "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/IRR_median.dta", replace

use "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/pc_earnings_ss_final_median.dta", clear

merge 1:1 ident using "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/IRR_median.dta"
drop _merge

egen IRR_median_median = median(IRR_median)

save "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/pc_earnings_ss_final_final.dta", replace 
