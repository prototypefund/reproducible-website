OLD_LAYOUTS = $(notdir $(basename $(wildcard _layouts/*.html)))

all:
	jekyll build --verbose --trace

clean:
	rm -rf _site

lint:
	for X in $(OLD_LAYOUTS); do \
		grep -rl "layout: $$X" . | while read Y; do \
			echo "W: $$Y is using legacy layout '$$X'"; \
		done \
	done
