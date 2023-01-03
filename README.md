## Collection of Dockerfiles with popular neuroimaging software

The neuroimaging software currently supported are:

* AFNI: https://afni.nimh.nih.gov/afni/
* ANTs: http://stnava.github.io/ANTs/
* FSL: http://fsl.fmrib.ox.ac.uk/
* FreeSurfer: http://freesurfer.net/
* SPM: http://www.fil.ion.ucl.ac.uk/spm/

The Dockerfiles are designed in a way that makes them easy to combine. If you
for example want to use both FSL and AFNI you can copy and paste content of
one Dockerfile into another. You can also use the Docker images directly:

`FROM bids/base_fsl`
