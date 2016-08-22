## Collection of Dockerfiles with popular neuroimaging software
The Dockerfiles are designed in a way that makes them easy to combine. If you
for example want to use both FSL and AFNI you can copy and paste content of
one Dockerfile into another. You can also use the docker images directly

`FROM bids\base_fsl`
