# Earthquake_prediction_using_ML
The codes showcase an application of hybrid neural networks, support vector machine, and particle swarm optimization for creating an earthquake prediction model. The model uses mathematically computed seismic features based on past earthquakes. The work has been mainly done from 2016 to 2019, leading to the publication of several research articles. The codes have been written in MATLAB. A detailed explanation of the whole concept, seismic parameters computation and the applied machine learning technique is provided here: https://doi.org/10.1371/journal.pone.0199004.


## Modules
The repository contains two main modules:

* <u>Mathematically computed seismic parameters</u>
* <u>Machine learning for earthquake forecasting</u>

## 1 - Mathematically computed seismic parameters
Seismic parameters are computed from raw seismicity using mathematical concepts discussed in the literature. To compute the parameters, run the file `Calculate_Parameters.m` in the module "seismic_parameters". 
### Inputs
The code file `Calculate_Parameters.m` requires 3 inputs:
 
 1 - An earthquake catalog in the form of Excel sheet, see example catalogs available in the module.
 
 2 - Number of earthquakes to compute parameters e.g. 50, 100, etc.
 
 3 - The horizon period (or prediction period) to compute the actual earthquake target magnitudes, e.g. 15 days, 30 days, etc.

## 2 - Machine learning for earthquake forecasting
The module 'SVR_HNN' takes in the seismic parameters computed in the previous step. To run the module use the code file `HNN.m`. It loads the seismic parameters and separates train and test datasets. Feature selection is carried out based on maximum relevance and minimum redundancy (mRMR) techniques. Afterward, support regression is carried out for the initial estimation of magnitudes, followed by an ensemble of 3 neural networks (referred to as hybrid neural networks). The optimization of neural networks is carried out using an evolutionary technique referred to as particle swarm optimization. 

Please follow the paper https://doi.org/10.1371/journal.pone.0199004 for details and other relevant literature in the context of this work.
