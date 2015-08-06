import excel "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/aliv_all.xlsx", firstrow clear
save "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/aliv_all.dta", replace

use "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/pc_earnings_ss.dta", clear

//// Generate Total Earnings

//// Present Value

forvalues i = 20/64 {
local j = `i'
gen pdv_`j' = earn_`j' / (1 + 0.02)^(`j' - 20)
}

egen tot_earn = rsum(pdv_20-pdv_64)

//// Probability of Alive by 64

xtile pc_at64 = tot_earn, nquantiles(100)

merge m:m pc_at64 sex using "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/aliv_all.dta"
drop _merge

//// Expected Taxes

forvalues i = 20/39 {
local j = `i'
gen exp_taxes_`j' = -0.124 * pdv_`j' * 1
	}

forvalues i = 40/64 {
local j = `i'
gen exp_taxes_`j' = -0.124 * pdv_`j' * Age_`j'
	}	
	
//// Expected PIA

gen yearly_pia = pia*12

//// Expected PIA per year

forvalues i = 64/100 {
	local j = `i'
	gen exp_pia_`j' = yearly_pia * Age_`j'
	}

save "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/pc_earnings_ss_final.dta", replace 


/// Only do this once, not necessary to generate the new file everytime
/// outsheet exp_taxes_20-exp_taxes_64 exp_pia_64-exp_pia_100 using "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/pc_earnings_ss_final.csv", comma nolabel replace
