<h1 align="center">Warp tractogram to MNI space</h1>

<p align="center">
  A tractogram in MNI space, from a subject-space tractogram and a precomputed nonlinear transform.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.721"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.721-blue.svg" alt="Run on brainlife.io"></a>
  <a href="https://github.com/brainlife/app-warp-tractogram/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-MIT-lightgrey.svg" alt="MIT license"></a>
</p>

> 📍 **This branch, `mrtrix3-3.0.3-v1.0`, is the brainlife.io App Warp tractogram to MNI space using precomputed transformation** ([doi:10.25663/brainlife.app.721](https://doi.org/10.25663/brainlife.app.721)).

## 🧠 At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Warps a tractogram into MNI space with MRtrix3 tcktransform using a precomputed inverse nonlinear warp from a transform dataset.**

Converts the inverse displacement warp of the transform input into an MRtrix3 deformation field (warpconvert) and applies it to every streamline with tcktransform. Use it to bring subject tractograms into template space for group visualisation or atlas-based analysis; the transform must map between the tractogram's space and MNI.

| | |
|---|---|
| 📥 **Inputs** | `neuro/transform/nifti` · `neuro/track/tck` |
| 📤 **Outputs** | `neuro/track/tck` |
| 🐳 **Container** | `brainlife/mrtrix3:3.0.3` |
| ⚙️ **Resources** | 8 CPUs · 20 GB memory · 0.5 h walltime |
| 🔗 **Run it** | [doi.org/10.25663/brainlife.app.721](https://doi.org/10.25663/brainlife.app.721) |

#### 📥 Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `transform` | `neuro/transform/nifti` | yes | Nonlinear transform to MNI space; its inverse warp (inv_warp) is used to move streamlines. |
| `track` | `neuro/track/tck` | yes | Tractogram in subject space to be warped. |

#### 📤 Outputs

| Output | Datatype | Description |
|---|---|---|
| `track` | `neuro/track/tck` | Tractogram in MNI space. |

<!-- brainlife-app:end -->

## 🚀 Running the App

### ☁️ On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.721](https://doi.org/10.25663/brainlife.app.721), choose a `neuro/track/tck` tractogram in subject space and a `neuro/transform/nifti` dataset holding the nonlinear transform between that space and MNI, and press **Execute**. The App:

1. converts the transform's inverse displacement warp (`inv_warp`) into an MRtrix3 deformation field with `mrconvert`, `mrcalc` (negating the x component) and `warpconvert`;
2. applies it to every streamline with `tcktransform`.

The result is a `neuro/track/tck` dataset tagged `mni_space`. Use it to bring subject tractograms into template space for group visualisation or atlas-based analysis.

### 💻 Locally

You need [Singularity/Apptainer](https://apptainer.org/) and [`jq`](https://jqlang.github.io/jq/). MRtrix3 3.0.3 runs inside the container.

1. Clone this repository and check out the branch brainlife.io runs: `git checkout mrtrix3-3.0.3-v1.0`.
2. Create `config.json` with the paths to your inputs:

   ```json
   {
       "track": "/input/track/track.tck",
       "inv_warp": "/input/transform/inverse-warp.nii.gz"
   }
   ```

3. Run the App:

   ```bash
   ./main
   ```

## 📦 Outputs

```text
track/
└── track.tck   the tractogram in MNI space
```

## 🩺 Troubleshooting

- **`something went wrong. check logs and derivatives`**: `track/track.tck` was not produced. Check that the transform input contains an inverse warp matching the tractogram's space.

## 📚 Citing

> [!TIP]
> If you use this App in your work, please cite the App, the software it builds on and brainlife.io (below). GitHub's **Cite this repository** button gives the App citation in APA and BibTeX.

- Warp tractogram to MNI space using precomputed transformation. brainlife.io App. [doi:10.25663/brainlife.app.721](https://doi.org/10.25663/brainlife.app.721)
- Tournier et al. MRtrix3: A fast, flexible and open software framework for medical image processing and visualisation. *NeuroImage* 202:116137 (2019). [doi:10.1016/j.neuroimage.2019.116137](https://doi.org/10.1016/j.neuroimage.2019.116137)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## 👥 Authors

- Brad Caron

## 💰 Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io is publicly funded, and acknowledging that support helps keep it running. This App was developed with support from Wellcome, the U.S. National Institutes of Health (including the BRAIN Initiative BRAIN CONNECTS program: The Axonal Projectome EXchange, U24NS140384, and the Center for Mesoscale Connectomics, UM1NS132207) and the U.S. National Science Foundation.</sub>

## ⚖️ License

[MIT](https://github.com/brainlife/app-warp-tractogram/blob/main/LICENSE). MRtrix3 itself is distributed under its own [license](https://www.mrtrix.org/).
