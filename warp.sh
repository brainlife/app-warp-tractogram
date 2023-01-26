#!/bin/bash

NCORE=8
inv_warp=`jq -r '.inv_warp' config.json`
track=`jq -r '.track' config.json`

[ ! -d track ] && mkdir track

[ ! -f x.nii.gz ] && mrconvert ${inv_warp} tmp-[].nii.gz -force -nthreads $NCORE && mv tmp-0.nii.gz x.nii.gz && mrcalc x.nii.gz -neg tmp-0.nii.gz -force -nthreads $NCORE

[ ! -f warp.nii.gz ] && warpconvert tmp-[].nii.gz displacement2deformation warp.nii.gz -force -nthreads $NCORE

[ ! -f ${outdir}/track.tck ] && tcktransform ${track} warp.nii.gz ${outdir}/track.tck -nthreads $NCORE -force

[ ! -f ${outdir}/track.tck ] && echo "something went wrong. check logs and derivatives" && exit 1 || echo "complete" && exit 0
