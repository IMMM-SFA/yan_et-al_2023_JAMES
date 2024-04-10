_your zenodo badge here_

# yan-etal_2023_JAMES

**Large Ensemble Diagnostic Evaluation of Hydrologic Parameter Uncertainty in the Community Land Model Version 5 (CLM5)**

Hongxiang Yan<sup>1\*</sup>, Ning Sun<sup>1</sup>, Hisham Eldardiry<sup>1</sup>, Travis B. Thurber<sup>1</sup>, Patrick M. Reed<sup>2</sup>, Keyvan Malek<sup>2</sup>, Rohini Gupta<sup>2</sup>, Daniel Kennedy<sup>3</sup>, Sean C. Swenson<sup>3</sup>, Zhangshuan Hou<sup>1</sup>, Yanyan Cheng<sup>4</sup>, Jennie S. Rice<sup>1</sup>

<sup>1 </sup> Pacific Northwest National Laboratory, Richland, WA, USA

<sup>2 </sup> Department of Civil and Environmental Engineering, Cornell University, Ithaca, NY, USA

<sup>3 </sup> National Center for Atmospheric Research, Boulder, CO, USA

<sup>4 </sup> Department of Industrial Systems Engineering and Management, National University of Singapore, Singapore, Singapore


\* Correspondence: Hongxiang Yan, hongxiang.yan@pnnl.gov

## Abstract
Land surface models such as the Community Land Model version 5 (CLM5) seek to enhance understanding of terrestrial hydrology and aid in the evaluation of anthropogenic and climate change impacts. However, the effects of parametric uncertainty on CLM5 hydrologic predictions across regions, timescales, and flow regimes have yet to be explored in detail. The common use of the default hydrologic model parameters in CLM5 risks generating streamflow predictions that may lead to incorrect inferences for important dynamics and/or extremes. In this study, we benchmark CLM5 streamflow predictions relative to the commonly employed default hydrologic parameters for 464 headwater basins over the conterminous United States (CONUS). We evaluate baseline CLM5 default parameter performance relative to a large (1,307) Latin Hypercube Sampling-based diagnostic comparison of streamflow prediction skill using over 20 error measures. We provide a global sensitivity analysis that clarifies the significant spatial variations in parametric controls for CLM5 streamflow predictions across regions, temporal scales, and error metrics of interest. The baseline CLM5 shows relatively moderate to poor streamflow prediction skill in several CONUS regions, especially the arid Southwest and Central U.S. Hydrologic parameter uncertainty strongly affects CLM5 streamflow predictions, but its impacts vary in complex ways across U.S. regions, timescales, and flow regimes. Overall, CLM5's surface runoff and soil water parameters have the largest effects on simulated high flows, while canopy water and evaporation parameters have the most significant effects on the water balance.

## Journal reference
Yan, H., Sun, N., Eldardiry, H., Thurber, T. B., Reed, P. M., Malek, K., et al. (2023). Large ensemble diagnostic evaluation of hydrologic parameter uncertainty in the Community Land Model Version 5 (CLM5). Journal of Advances in Modeling Earth Systems, 15, e2022MS003312. https://doi.org/10.1029/2022MS003312

## Code Reference

CLM5:
Lawrence, D. M., Fisher, R. A., Koven, C. D., Oleson, K. W., Swenson, S. C., Bonan, G., et al. (2019). The Community Land Model version 5: Description of new features, benchmarking, and impact of forcing uncertainty. Journal of Advances in Modeling Earth Systems, 11, 4245– 4287. https://doi.org/10.1029/2018MS001583

IM3 CLM (CLM version 5.1 modified with parameter tuning support):
CLM & IM3 Development Teams. (2022). IMMM-SFA/im3-clm: v1.0.0 (v1.0.0). Zenodo. https://doi.org/10.5281/zenodo.6653705

## Data Reference

### Input Data

CAMELS dataset:
A. Newman; K. Sampson; M. P. Clark; A. Bock; R. J. Viger; D. Blodgett, 2014. A large-sample watershed-scale hydrometeorological dataset for the contiguous USA. Boulder, CO: UCAR/NCAR. https://dx.doi.org/10.5065/D6MW2F4D

NLDAS-2 dataset:
NLDAS project (2021), NLDAS Primary Forcing Data L4 Hourly 0.125 x 0.125 degree V2.0, Edited by David M. Mocko, NASA/GSFC/HSL, Greenbelt, Maryland, USA, Goddard Earth Sciences Data and Information Services Center (GES DISC), https://doi.org/10.5067/THUF4J1RLSYG

### Output Data

Yan, H., Sun, N., Eldardiry, H., Thurber, T., Reed, P. M., Malek, K., Gupta, R. S., Kennedy, D., Swenson, S., Vernon, C. R., Burleyson, C. D., & Rice, J. S. (2022). CLM5 CAMELS Basins Ensemble (v0.0.2) [Data set]. MSD-LIVE Data Repository. https://doi.org/10.57931/1884563

Yan, H. (2024). Behavioral Ensemble CLM5 Hydrological Parameter Sets (v1.0.0) [Data set]. MSD-LIVE Data Repository. https://doi.org/10.57931/2274938

## Contributing Modeling Software

| Model   | Version | Repository Link | DOI |
|---------|---------|-----------------|-----|
| im3-clm | v1.0.0  | https://github.com/immm-sfa/im3-clm | https://doi.org/10.5281/zenodo.6653705 |

## Reproduce my experiment

Clone the [IM3 CLM repository](https://github.com/IMMM-SFA/im3-clm) to set up the CLM5 model, you will need to download the NLDAS-2 forcing data and convert them into NetCDF format. You will also need to generate ensemble [hydrological parameter value files](https://doi.org/10.57931/2274938) following the workflow documented [here](https://github.com/IMMM-SFA/clm_hydroparameter_calibration). The [output data repository](https://doi.org/10.57931/1922953) already contains the ensemble output from the CLM5 model so you can skip rerunning the CLM5 model if you want to save time.

## Reproduce my figures

Use the scripts found in the `figures` directory to reproduce the figures used in this publication.

## Reproduce My Figures
| Figure Number | Script Name | Description | Figure |
|:-------------:|:-----------:|:-----------:|:------:|
| Figure 1      | Overlay the basin clusters on a shapefile of US States using software such as QGIS | Locations and clustering of the CAMELS basins | <a href="./figures/Figure 1.png"><img width="100" src="./figures/Figure 1.png"/></a> |
| Figure 2      | [Figure_2.m](./figures/Figure_2.m) | Describe the default parameter performance in KGE | <a href="./figures/Figure 2.png"><img width="100" src="./figures/Figure 2.png"/></a> |
| Figure 3      | [Figure_3.m](./figures/Figure_3.m) | Describe the default parameter performance in flow bias | <a href="./figures/Figure 3.png"><img width="100" src="./figures/Figure 3.png"/></a> |
| Figure 4      | [Figure_4.m](./figures/Figure_4.m) | Describe the coefficient of variation  | <a href="./figures/Figure 4.png"><img width="100" src="./figures/Figure 4.png"/></a> |
| Figure 5      | [Figure_5.m](./figures/Figure_5.m) | Describe the ensemble NSE values | <a href="./figures/Figure 5.png"><img width="100" src="./figures/Figure 5.png"/></a> |
| Figure 6      | [Figure_6.m](./figures/Figure_6.m) | Describe the regional FDC | <a href="./figures/Figure 6.png"><img width="100" src="./figures/Figure 6.png"/></a> |
| Figure 7      | [Figure_7.m](./figures/Figure_7.m) | Describe the sensitivity score to RMSE | <a href="./figures/Figure 7.png"><img width="100" src="./figures/Figure 7.png"/></a> |
| Figure 8      | [Figure_8.m](./figures/Figure_8.m) | Describe the regional sensitivity score to 23 metrics | <a href="./figures/Figure 8.png"><img width="100" src="./figures/Figure 8.png"/></a> |
| Figure 9      | [Figure_9.m](./figures/Figure_9.m) | Describe the selection of behavioral parameters to difference metrics | <a href="./figures/Figure 9.png"><img width="100" src="./figures/Figure 9.png"/></a> |
| Figure 10      | [Figure_10.m](./figures/Figure_10.m) | Describe the PDF of the behavioral parameters | <a href="./figures/Figure 10.png"><img width="100" src="./figures/Figure 10.png"/></a> |
