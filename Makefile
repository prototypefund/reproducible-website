all:
	jekyll build --verbose --trace

clean:
	rm -rf _site
