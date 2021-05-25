# Example

This example contains three steps

1. Generate synthetic seismic data with Radon operator
2. Blend and pseudo-deblending the seismic data manually
3. Remove the blending noise by the robust greedy pursuit methods with linear Radon operator

## Generate synthetic data

```@example example
using SeisProcessing, SeisTest, DSP, Plots
M=zeros(400,81);
M[100,50]=1;
M[200,30]=1;
M[300,50]=1;
M[370,35]=1;
wavelet=Ricker(dt=0.004,f0=25);
M=conv(M,wavelet);
operator=radon_linear_robust;
offset=collect(1:1:50);
p=collect(-0.04:0.001:0.04);
dt=0.004;
param=[offset,p,dt];
d=operator(M,param,1,2,20);
```
## Blending and pseudo-deblending the synthetic data manually
```@example example
fold=3;
(nt,ns)=size(d);
tt=tgenerator(dt,nt,ns,fold);
PARAM1=[tt,nt,ns,dt];
y = dsblend(d,PARAM1,1);
dn= dsblend(y,PARAM1,-1);
heatmap(dn)
```
