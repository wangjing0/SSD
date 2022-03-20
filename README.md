# Scaling Subspace Decomposition (SSD)
[**Try the tutorial here!**](https://github.com/wangjing0/SSD/blob/master/SSD_demo.ipynb)

**Just a reminder that data applied for validation should be different from those used in SSD. The metrics of validation depends on the specifical problem. Your general hypothesis will be whether the two become more similar after proper dimensional reduction with SSD.** 

SSD is a dimensionality reduction method, aiming to solve the optimization problem <img src="https://latex.codecogs.com/svg.image?v&space;={\operatorname{argmin}_{v}}&space;=&space;\frac{v^\top&space;{A}&space;v}{v^\top{B}&space;v}" title="https://latex.codecogs.com/svg.image?v ={\operatorname{argmin}_{v}} = \frac{v^\top {A} v}{v^\top{B} v}" /> , by sequentially searching for the projection along which the difference (A) between two data sets (X1, X2) is minimized. The denominator regularizates it by penalizing directions with diminishing covariance (B). The comparison and contrast to the Principal component analysis (PCA) is illustrated below.

<p align="center">
  <img src="ssd_pca.png" height="500" >
</p>

# Notes on the data:
Scaling analysis has two steps, 1) finding the scaling dimension on the training set and 2) validating with the test data. This function handles the first step using an optimization. Its input has the matrix A and B. Where A is the distance of the population activity A = (r1 - r2)' * ( r1 - r2) and a covariance B = cov([r1; r2]). 
 r1 and r2  has dimension of n x p. n is the number of observations (different time bins), and p is the number of neurons (or it is the relevent subspace after denoising). It outputs a set of eigen vectors X, which are the predicted scaling directions in descending/ascending order.

In the [Nature Neuro article (J. Wang et al 2018)](https://www.nature.com/articles/s41593-017-0028-6), training data r1 and r2 are the population spiking in two conditions: long and short production interval. Since the two need to be same duration(number of observations n1 = n2), spike counts were obtained by a time warping operation as described in the Methods section. For example, the short condition has interval of 640ms, and 20 bins. Accordingly, we sampled 20 time bins from _Set_ to _Go_  during the 1700ms interval, taking one trial of one neuron as an example below.

<p align="center">
  <img src="PastedGraphic-2.png" height="100" >
</p>

In the article, dimensionality was reduced to the scaling subspace as spanned by the first 3 eigen vectors. Then, it was verified with data from other intervals and conditions.
