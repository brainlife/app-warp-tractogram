<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

**Warps a tractogram into MNI space with MRtrix3 tcktransform using a precomputed inverse nonlinear warp from a transform dataset.**

Converts the inverse displacement warp of the transform input into an MRtrix3 deformation field (warpconvert) and applies it to every streamline with tcktransform. Use it to bring subject tractograms into template space for group visualisation or atlas-based analysis; the transform must map between the tractogram's space and MNI.

Run it on brainlife.io: [https://doi.org/10.25663/brainlife.app.721](https://doi.org/10.25663/brainlife.app.721)

| Input | Datatype | Required | Description |
|---|---|---|---|
| `transform` | `neuro/transform/nifti` | yes | Nonlinear transform to MNI space; its inverse warp (inv_warp) is used to move streamlines. |
| `track` | `neuro/track/tck` | yes | Tractogram in subject space to be warped. |

| Output | Datatype | Description |
|---|---|---|
| `track` | `neuro/track/tck` | Tractogram in MNI space. |

Runtime: container `brainlife/mrtrix3:3.0.3`; 8 CPUs; 20 GB memory; 0.5 h walltime.

<!-- brainlife-app:end -->

# app-warp-tractogram