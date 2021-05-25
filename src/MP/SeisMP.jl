"""
    SeisMP(in,operator,param,iter,lp,imax)

Robust Matching Pursuit algorithm via lp-norm inner product

# Arguments
- `in`: Noisy data
- `operator`: Any operator passed the dot test
- `param`: parameters for the operator
- `iter`: Max iterations for the matching pursuit
- `lp`: lp-norm space inner product
- `imax`: Max interation for the lp-norm inner product

"""
function SeisMP(in,operator,param,iter,lp,imax)
    Madj=operator(in,param,-1,lp,imax);
    x=zeros(size(Madj));
    dr=zeros(size(in));
    r=in
    for i=1:iter
        Madj=operator(r,param,-1,lp,imax);
        ind=findmax(abs.(Madj))[2];
        M=zeros(size(Madj));
        M[ind[1],ind[2]]=Madj[ind[1],ind[2]];
        g=operator(M,param,1,lp,imax);
        alpha=LP_norm(vec(g),vec(r),lp,imax,1);
        dr=dr+alpha*g
        x=x+alpha*M;
        r=r-alpha*g;
    end
    return dr
end
