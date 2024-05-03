# Crop Disease Detection Model using CNN

## Overview
This repository contains code for a Convolutional Neural Network (CNN) model trained to detect diseases in crops. The model is trained using TensorFlow and Keras and is designed to classify images of crops into various disease categories.

## Dataset
The model is trained on a dataset consisting of images of approximately 54,000 crops belonging to 38 classes. The dataset used for training and testing the model can be found at https://www.kaggle.com/datasets/abdallahalidev/plantvillage-dataset .  It could be accesed directly in the notebook using the Kaggle API

## Model Architecture
The CNN model architecture used for crop disease detection consists of several convolutional layers followed by max-pooling layers and dense layers. The final output layer uses softmax activation to predict the probability distribution over the different disease classes.

The architecture is as follows:
Model: "sequential"
_________________________________________________________________
 Layer (type)                Output Shape              Param #   
=================================================================
 conv2d (Conv2D)             (None, 222, 222, 32)      896       
                                                                 
 max_pooling2d (MaxPooling2  (None, 111, 111, 32)      0         
 D)                                                              
                                                                 
 conv2d_1 (Conv2D)           (None, 109, 109, 64)      18496     
                                                                 
 max_pooling2d_1 (MaxPoolin  (None, 54, 54, 64)        0         
 g2D)                                                            
                                                                 
 flatten (Flatten)           (None, 186624)            0         
                                                                 
 dense (Dense)               (None, 256)               47776000  
                                                                 
 dense_1 (Dense)             (None, 38)                9766      
                                                                 
=================================================================
Total params: 47805158 (182.36 MB)
Trainable params: 47805158 (182.36 MB)
Non-trainable params: 0 (0.00 Byte)


## Training
The model is trained using the provided dataset with a batch size of 32 and 5 epochs. During training, the model parameters are optimized using the Adam optimizer and categorical cross-entropy loss function.
To train the model, run the notebook: (notebook url)


## Requirements
- Kaggle Credentials
- Python == 3.12.0
- TensorFlow == 2.9.1
- Keras




#Trained model
Trained model (https://drive.google.com/file/d/1Fp_Yi7Qqp1mN_p1n4Fx6aqPjHJPRt3rs/view?usp=drive_link)
