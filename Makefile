.PHONY: ants/Dockerfile freesurfer/Dockerfile afni/Dockerfile

freesurfer/Dockerfile:
	docker run --rm -it kaczmarj/neurodocker:0.9.1 \
		generate docker \
			--pkg-manager apt \
			--base-image bids/base_validator \
			--freesurfer method=binaries version=7.3.1 \
		> freesurfer/Dockerfile

afni/Dockerfile:
	docker run --rm -it kaczmarj/neurodocker:0.9.1 \
		generate docker \
			--base-image debian:buster-slim \
			--pkg-manager apt \
			--afni method=binaries version=latest \
			--run "curl -sL https://deb.nodesource.com/setup_18.x | bash -" \
			--install "nodejs" \
			--run "node --version && npm --version && npm install -g bids-validator@1.9.9" \
		> afni/Dockerfile

ants/Dockerfile:
	docker run --rm -it kaczmarj/neurodocker:0.9.1 \
		generate docker \
		--pkg-manager apt \
		--base-image bids/base_validator \
		--ants version=2.3.4 \
	> ants/Dockerfile
