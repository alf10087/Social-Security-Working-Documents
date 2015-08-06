/////////////// SS 2004
/////////////// By: Alfonso Rojas-Alvarez 

///// Transformed the SAS files to DTA using Stat/Transfer
///// Merge both datasets

use "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/bene.dta", clear
merge 1:1 id using "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/earn.dta"

save "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/master_ss.dta", replace

