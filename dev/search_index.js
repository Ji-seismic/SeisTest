var documenterSearchIndex = {"docs":
[{"location":"publication/#Publications","page":"Publication","title":"Publications","text":"","category":"section"},{"location":"publication/","page":"Publication","title":"Publication","text":"Below is a list of publications made with this project:","category":"page"},{"location":"publication/","page":"Publication","title":"Publication","text":"Ji et al. 2020. Lp-space Robust Matching Pursuit algorithm for time-domain Radon-based deblending\nJi et al. 2021. A lp-space Matching Pursuit algorithm and its application to robust seismic data denoising via time-domain Radon","category":"page"},{"location":"public/#Public-documentation","page":"Public","title":"Public documentation","text":"","category":"section"},{"location":"public/","page":"Public","title":"Public","text":"Documentation for public SeisTest.jl public interface","category":"page"},{"location":"public/#Public-interface","page":"Public","title":"Public interface","text":"","category":"section"},{"location":"public/","page":"Public","title":"Public","text":"SeisMP\nSeisOMP\nSeisSWCGP\ndsblend\nLP_norm","category":"page"},{"location":"public/#SeisTest.SeisMP","page":"Public","title":"SeisTest.SeisMP","text":"SeisMP(in,operator,param,iter,lp,imax)\n\nRobust Matching Pursuit algorithm via lp-norm inner product\n\nArguments\n\nin: Noisy data\noperator: Any operator passed the dot test\nparam: parameters for the operator\niter: Max iterations for the matching pursuit\nlp: lp-norm space inner product\nimax: Max interation for the lp-norm inner product\n\n\n\n\n\n","category":"function"},{"location":"public/#SeisTest.SeisOMP","page":"Public","title":"SeisTest.SeisOMP","text":"SeisOMP(in,operator,param,iter,lp,imax)\n\nRobust Orthognal Matching Pursuit algorithm with the coefficient updated by the conjugate gradient pursuit\n\nArguments\n\ndn: Noisy data\noperator: Any operator passed the dot test\nparam: parameters for the operator\niter: Max iterations for the matching pursuit\nlp: lp-norm space inner product\nimax: Max interation for the lp-norm inner product\n\n\n\n\n\n","category":"function"},{"location":"public/#SeisTest.SeisSWCGP","page":"Public","title":"SeisTest.SeisSWCGP","text":"SeisSWCGP(in,operator,param,iter,lp,imax)\n\nRobust Stagewise weak Orthognal Matching Pursuit algorithm with the coefficient updated by the conjugate gradient pursuit\n\nArguments\n\ndn: Noisy data\noperator: Any operator passed the dot test\nparam: parameters for the operator\niter: Max iterations for the matching pursuit\na: parameter alpha used to calcualte the threshold value\nlp: lp-norm space inner product\nimax: Max interation for the lp-norm inner product\n\n\n\n\n\n","category":"function"},{"location":"public/#SeisTest.dsblend","page":"Public","title":"SeisTest.dsblend","text":"dsblend(din, PARAM, iflag)\n\nforward and adjoint blend operator\n\nArguments\n\ndin: input data\nPARAM: parameters\niflag: 1=forward operator         -1=adjoint operator\n\n\n\n\n\n","category":"function"},{"location":"public/#SeisTest.LP_norm","page":"Public","title":"SeisTest.LP_norm","text":"LP_norm(in1,in2,p,imax,type)\n\nCalculate robust inner product in the Lp norm space: Find the parameter alpha which minimize this cost function ||in1-alpha*in2||_p\n\nArguments\n\nin1: vector 1\nin2: vector 2\np: Lp norm space\ntype: 1 output=alpha, 2 output=inner product between in1 and in2 in lp norm space\n\n\n\n\n\n","category":"function"},{"location":"#SeisTest.jl","page":"Home","title":"SeisTest.jl","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for SeisTest.jl, used to show how to generate Julia Packages and hosting it on the GitHub Pages","category":"page"},{"location":"example/#Example","page":"Example","title":"Example","text":"","category":"section"},{"location":"example/","page":"Example","title":"Example","text":"This example contains three steps","category":"page"},{"location":"example/","page":"Example","title":"Example","text":"Generate synthetic seismic data with Radon operator\nBlend and pseudo-deblending the seismic data manually\nRemove the blending noise by the robust greedy pursuit methods with linear Radon operator","category":"page"},{"location":"example/#Generate-synthetic-data","page":"Example","title":"Generate synthetic data","text":"","category":"section"},{"location":"example/","page":"Example","title":"Example","text":"using SeisProcessing, SeisTest, DSP\nM=zeros(400,81);\nM[100,50]=1;\nM[200,30]=1;\nM[300,50]=1;\nM[370,35]=1;\nwavelet=Ricker(dt=0.004,f0=25);\nM=conv(M,wavelet);\noperator=radon_linear_robust;\noffset=collect(1:1:50);\np=collect(-0.04:0.001:0.04);\ndt=0.004;\nparam=[offset,p,dt];\nd=operator(M,param,1,2,20);","category":"page"},{"location":"example/#Blending-and-pseudo-deblending-the-synthetic-data-manually","page":"Example","title":"Blending and pseudo-deblending the synthetic data manually","text":"","category":"section"},{"location":"example/","page":"Example","title":"Example","text":"fold=3;\n(nt,ns)=size(d);\ntt=tgenerator(dt,nt,ns,fold);\nPARAM1=[tt,nt,ns,dt];\ny = dsblend(d,PARAM1,1);\ndn= dsblend(y,PARAM1,-1);\n","category":"page"},{"location":"example/#Remove-the-blending-noise-by-three-different-Greedy-Pursuit-methods","page":"Example","title":"Remove the blending noise by three different Greedy Pursuit methods","text":"","category":"section"},{"location":"example/","page":"Example","title":"Example","text":"lp=1;imax=20;\ndr_mp=SeisMP(dn,operator,param,1,lp,imax)\nsnr_mp=MeasureSNR(d, dr_mp; db=false)\ndr_swcgp=SeisSWCGP(dn,operator,param,1,0.7,lp,imax)\nsnr_swcgp=MeasureSNR(d, dr_swcgp; db=false)\nprintln(\"SNR of MP after 1 iteration: \", snr_mp)\nprintln(\"SNR of SWCGP after 1 iteration: \", snr_swcgp)\n","category":"page"}]
}
