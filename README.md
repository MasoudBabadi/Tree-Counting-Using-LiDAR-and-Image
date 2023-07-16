# Tree-Counting-Using-LiDAR-and-Image
Tree counting using fusion of LiDAR point cloud/ waveforms and RGB image

This repository contains MATLAB codes and sample dataset for counting trees using fusion of aerial RGB image and point cloud/Waveform Lidar data. To this end, a binary vegetation map is produced using value and saturation components of the aerial color image. Then, in the case of the LiDAR point cloud, four conventional features and for LiDAR waveforms, 11 structural features are generated. Afterward, an object-based multistep procedure is applied on the extracted features, including local maximum filtering, supervised classification, and applying geometric conditions and extra points are removed, and the number of trees in each segment are identified. 
Four different cases are considered for counting trees including:
1) using first return points of LiDAR data and artificial neural network (ANN) as supervised classifier
2) using first return points of LiDAR data and support vector machine (SVM) as supervised classifier
3) using LiDAR waveforms and ANN as supervised classifier
4) using LiDAR waveforms and SVM as supervised classifier
All of the dataset and MATLAB codes for each case can be found in the respective folder.

For detailed descriptions, check the README file in each folder.
