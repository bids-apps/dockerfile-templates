.PHONY: ants/Dockerfile freesurfer/Dockerfile afni/Dockerfile

freesurfer/Dockerfile:
	docker run --rm -it kaczmarj/neurodocker:0.9.1 \
		generate docker \
			--pkg-manager apt \
			--base-image bids/base_validator \
			--freesurfer method=binaries version=7.3.1 \
		> freesurfer/Dockerfile

afni/Dockerfile_tmp:
	docker run --rm -it kaczmarj/neurodocker:0.9.1 \
		generate docker \
			--base-image bids/base_validator \
			--pkg-manager apt \
			--afni method=binaries version=latest \
		> afni/Dockerfile_tmp

ants/Dockerfile:
	docker run --rm -it kaczmarj/neurodocker:0.9.1 \
		generate docker \
		--pkg-manager apt \
		--base-image bids/base_validator \
		--ants version=2.3.4 \
	> ants/Dockerfile
