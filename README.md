# UUtest

UU-test (Unimodal Uniform test) is a method for modeling one dimensional data generated by unimodal distributions. It works with the empirical cumulative density function (ecdf) of the data, assuming the data distribution is continuous. It attempts to build a piecewise linear approximation of the ecdf that is unimodal and models the data sufficiently in the sense that the data corresponding to each linear segment follows the uniform distribution. A unique feature of this approach is that in the case of unimodality, it also provides a statistical model of the data in the form of a Uniform Mixture Model (UMM). It is important to note that UU-test does not make use of any parameters. In addition, it relies on well-known uniformity tests (e.g. Kolmogorov- Smirnov), thus it does not require the computation of bootstrap samples, a fact that saves computational time. 

For the **Python version** of UU-test, check here: [https://github.com/pchasani/UDMM](https://github.com/pchasani/UDMM) 

> @article{chasani2022uu,<br>
   title={The UU-test for statistical modeling of unimodal data},    
  author={Chasani, Paraskevi and Likas, Aristidis},  
  journal={Pattern Recognition},    
  volume={122},  
  pages={108272},  
 year={2022},  
  publisher={Elsevier}  
}
