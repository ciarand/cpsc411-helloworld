compile: clean
	xctool archive -archivePath output

run: compile
	output.xcarchive/Products/usr/local/bin/cpsc411-assignment-a

clean:
	rm -rf ./output.xcarchive

.PHONY: compile run clean
