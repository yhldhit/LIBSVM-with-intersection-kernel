we make changes so that LIBSVM can support the HI kernel SVM.Actually, there are mainly two ways to trian intersection kernel SVM. First, you can precomputed the Gram matrix of this kernel. Second, you can change the source code and then add a type for the new kernel, as we did in this work.
Note that:
1)we only debug on the Matlab interface, other languages are not tested;
2)we define the intersection kernel as '5'
2)the interface is not changed at all, except for that when you want to trian intersection kernel SVM, you need set the argument '-t' to '5',just like this:
 svmmodel = svmtrain(l,x,sprintf('-t %i -b 1',5));

One more important thing is that before this, a earlier edition libsvm , in support of HI kernel has been  released by Prof.S maji. And you can access it via the link:
And this is also the main reference for me. Experimental results also show that there are no praticle differences between models trained on this two edition.

If you want to know the detailed steps to add a new kernel in LIBSVM, it will help for you to refer to file 'notes.doc' in the filter.

Reference:
[1] Classification using Intersection Kernel SVMs is efficient, 
Subhransu Maji, Alexander C. Berg, Jitendra Malik, CVPR 2008 
[2] Efficient classification for Additive Kernel SVMs, 
Subhransu Maji, Alexander C. Berg, Jitendra Malik, IEEE PAMI, 2012
[3] Chang, Chih-Chung and Chih-Jen Lin. ¡°LIBSVM: A library for support vector machines.¡± ACM TIST 2 (2011): 27.
