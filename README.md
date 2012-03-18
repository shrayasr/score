#Score

A small shell script to bring up scores from Cricinfo for all the cric fans out there :)

#####USEAGE

######add a match to track
	./score -a http://www.espncricinfo.com/asia-cup-2012/engine/current/match/535798.html pakVSind
	
######list currently tracked matches
	./score -l
	
	pakVSind : http://www.espncricinfo.com/asia-cup-2012/engine/current/match/535798.html
	
######stop tracking a match
	./score -r pakVSind
	

#####TODO

* ~~Allow for adding of URL to track~~
* ~~provision for multiple matches~~
* Make it faster (currently its curl-ing the entire page)
