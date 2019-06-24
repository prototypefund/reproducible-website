OLD_LAYOUTS = $(notdir $(basename $(wildcard _layouts/*.html)))

all:
	jekyll build --verbose --trace

clean:
	rm -rf _site

lint:
	@for X in $(OLD_LAYOUTS); do \
		grep -rl "layout: $$X" . | while read Y; do \
			echo "W: $$Y is using legacy layout '$$X'"; \
		done \
	done
	@grep -rl "href=[\"']/" . | while read X; do \
		echo "W: $$X is using URIs that are not using '{{ \"/foo\" | prepend: site.baseurl }}'"; \
	done
