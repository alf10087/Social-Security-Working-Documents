use "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/master_ss.dta", clear


/// Clean to just retired workers born between 1935-1939

keep if tob == "AXR"
keep if yob>1934
keep if yob<1940

/// Convert earnings to 2004 dollars

gen year = 1950 + _n
cpigen
local j = 1951
foreach var of varlist SSTE1951-SSTE2003 {
gen cpi_`var' = cpi if year == `j'
egen cpi`var' = mean(cpi_`var')
gen real_`j' = `var' / (cpi`var') * (1.096848)
local j = `j'+1
}
drop cpi* _merge year SSTE*


///// Get Age per Year and earnings per age

forvalues i = 1951/2003 { 
gen y`i' = `i' - yob
}

forvalue k = 20/64 {
	gen earn_`k' = .
	local i = 1951
		foreach var of varlist y1951-y2003 {
		replace earn_`k' = real_`i' if y`i' == `k'
		local i = `i' + 1
	}
}

save "/Users/Alfonso/Dropbox (Personal)/Alfonso and Jeff/Working Documents/pc_earnings_ss.dta", replace
