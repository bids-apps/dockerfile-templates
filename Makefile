.PHONY: ants/Dockerfile

afni/Dockerfile:
	docker run --rm -it kaczmarj/neurodocker:0.9.1 \
		generate docker \
			--pkg-manager apt \
			--base-image bids/base_validator \
			--afni method=binaries version=latest \
		> afni/Dockerfile

ants/Dockerfile:
	docker run --rm -it kaczmarj/neurodocker:0.9.1 \
		generate docker \
		--pkg-manager apt \
		--base-image bids/base_validator \
		--ants version=2.3.4 \
	> ants/Dockerfile
