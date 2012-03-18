#!/bin/bash
curl -s http://www.espncricinfo.com/asia-cup-2012/engine/current/match/535798.html |  grep -e "<title>" | sed -n 1p | cut -d "|" -f1 | cut -d ">" -f2