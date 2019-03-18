# Score.sh

A small shell script to bring up scores from Cricinfo for all the cric fans out there :)

## Usage

### Track a match

	$ ./score.sh -a http://www.espncricinfo.com/sri-lanka-v-england-2012/engine/current/match/536301.html someMatch
	
### Get score

	$ ./score.sh
	SLCD 44/1 (8.0 ov, EMGDY Munaweera 26*, MDKJ Perera 7*, SR Patel 0/7) - Stumps 
	
### List currently tracked matches

	$ ./score.sh -l
	
	someMatch : http://www.espncricinfo.com/sri-lanka-v-england-2012/engine/current/match/536301.html
	
### Stop tracking a match 

	$ ./score.sh -r someMatch
	

## TODO

* Make the commandline arguments **NOT** potitional based - [guide](http://www.shelldorado.com/goodcoding/cmdargs.html)
* ~~Allow for adding of URL to track~~
* ~~provision for multiple matches~~
* Make it faster (currently its curl-ing the entire page)
* ~~Add help~~
	* Individual switch help
* ~~check for uniqueness among keys~~
	* What i've written is **stupid** . make it more streamlined
* Proper error messages
