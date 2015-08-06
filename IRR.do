import excel "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/IRR2.xlsx", firstrow clear
save "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/IRR.dta", replace

use "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/pc_earnings_ss_final.dta", clear

gen ident = _n

merge 1:1 ident using "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/IRR.dta"

egen median_IRR = median(IRR)

save "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/pc_earnings_ss_final.dta", replace 
