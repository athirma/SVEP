# SVEP

This is the implementation of SVEP in the paper: [A Predictive Language Model for SARS-CoV-2 Evolution]. Semantic model for variants evolution prediction (SVEP) is a sequence prediction tool specializing in forecasting SARS-CoV-2 variants and essential amino acid substitutions within virus evolution. Its framework can be adapted for predicting mutations in other virus sequences given sufficient sequence data. The most commendabel feature of SVEP is its prediction could be purely based on sequence information and only requires minimial computational power (eg. personal desktop). 

## Requirements
- Python (3.7)
- MATLAB R2020b


The tool comprises three primary sections:
1. bil code developed in Python (3.7) for training Bi-LSTM language models.
modelTrain.py
bioModel.py

Package           Version       
-ip	          22.3	
jieba	          0.42.1	
numpy	          1.21.6	
torch	          1.12.1	
typing-extensions 4.4.0  	


2. Sequence generation code in MATLAB R2020b for generating SARS-CoV-2 variants.
Restorethedataset1.m is the code to simulate and restore the SARS-CoV-2 variants in dataset1.
Restorethedataset2.m is the code to simulate and restore the SARS-CoV-2 variants in dataset2.
Restorethedataset3.m is the code to simulate and restore the SARS-CoV-2 variants in dataset3.
Predictionofthesequencesbyusingdataset1.m is the code to predict the SARS-CoV-2 variants based on dataset1.
Predictionofthesequencesbyusingdataset2.m is the code to predict the SARS-CoV-2 variants based on dataset2.
Predictionofthesequencesbyusingdataset3.m is the code to predict the SARS-CoV-2 variants based on dataset3.


3. Figure drawing code in MATLAB R2020b.
Draw circles.m


The tool comprises several MaATLAB mats:
1. dataset1.mat
2. dataset2.mat
3. dataset3.mat
4. pn1.mat is the occurance frequency of the dominant amino acid at each hotspot in dataset-1.
5. pn2.mat is the occurance frequency of the dominant amino acid at each hotspot in dataset-2.
6. pn3.mat is the occurance frequency of the dominant amino acid at each hotspot in dataset-3.


The tool comprises the code for the comparison of models (Bi-LSTM model, Logistic model, KNN model, Decision Tree, SVEP...) :
modelTrain_1.py
compare.py


Usage of bil
1. Download and save all the files (including the well trained Bi-LSTM model), and set files to MATLAB path
2. Open the MATLAB file (e.g., "Restorethedataset1"), and define model parameters: sequence generation number (num), mutation frequency of  hotspots (1-alpha), and more mutable hotspot mutation frequency (1-h).
3. Click "Run"; results will be displayed in the command window and workspace.

