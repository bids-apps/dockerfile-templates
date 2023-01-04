## Collection of Dockerfiles with popular neuroimaging software

The neuroimaging software currently supported are:

- AFNI: https://afni.nimh.nih.gov/afni/
- ANTs: http://stnava.github.io/ANTs/
- FreeSurfer: http://freesurfer.net/
- FSL: http://fsl.fmrib.ox.ac.uk/
- SPM with matlab compiler runtime: http://www.fil.ion.ucl.ac.uk/spm/
- SPM with octave: http://www.fil.ion.ucl.ac.uk/spm/

You can also use the Docker images directly by base your docker recipe on one of
them. For example

```dockerfile
FROM bids/base_fsl
```

These Dockerfiles are designed in a way that also makes them easy to combine. If
you for example want to use both FSL and AFNI you can copy and paste content of
one Dockerfile into another.
