PCB Group Order Repo
====================
**TLDR;**
Panelize small boards made by different people from your local hacker space,
order the panel to get a cheaper price,
wait,
break apart,
PROFIT !

Also this works on gerbers so there is no need to use the same CAD tool 
as everybody else !


How it works
------------
*Prerequisites:*
 * You run a proper Linux/Unix OS.
 * You have git, bash, curl, tar, gzip, freetype, gcc, make and lua installed.

*Step by step:*
 0. Run `lua/setup.sh` to get [Aperture Scripting](http://piratery.net/aperture-scripting/examples.html)
	and all its dependencies.
 1. For each new oder add a new branch to this repository. **master** is just an example.
 2. Put your gerbers for each single board into boards/*boardname*/
 3. Read [Aperture Scripting Examples](http://piratery.net/aperture-scripting/examples.html) to understand how stuff works.
 4. Modify panelize.lua to include your board
 5. `source lua/setupenv.sh`
 6. `lua panelize.lua`
 7. Review panelized gerbers in panel/...
 8. `git add board; git commit; git push`
