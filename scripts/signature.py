#!/usr/bin/env python
import xkcd

random = xkcd.getRandomComic()

print "~ fntlnz >"
print " | " + random.getTitle()
print " | " + random.getImageLink()
