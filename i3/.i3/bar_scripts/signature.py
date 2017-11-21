#!/usr/bin/env python3
import xkcd

random = xkcd.getRandomComic()

print("~ fntlnz >")
print("https://fntlnz.wtf")
print("If you're tired, here's a comic for ya!")
print(" | " + random.getTitle())
print(" | " + random.getImageLink())
