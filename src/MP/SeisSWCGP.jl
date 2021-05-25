"""
    SeisSWCGP(in,operator,param,iter,lp,imax)

Robust Stagewise weak Orthognal Matching Pursuit algorithm with the coefficient updated by the conjugate gradient pursuit

# Arguments
- `dn`: Noisy data
- `operator`: Any operator passed the dot test
- `param`: parameters for the operator
- `iter`: Max iterations for the matching pursuit
- `a`: parameter alpha used to calcualte the threshold value
- `lp`: lp-norm space inner product
- `imax`: Max interation for the lp-norm inner product

"""
function SeisSWCGP(dn,operator,param,iter,a,lp,imax)
    m=operator(dn,param,-1,lp,imax);
    r=dn
    n=1
    ind_r=[];
    ind_c=[];
    v=[];
    d=[];
    dr=zeros(size(dn));
    for i=1:iter
        g=zeros(size(m))
        gn=operator(r,param,-1,lp,imax)
        thres=a*maximum(abs.(vec(gn)));
        ind=findall(abs.(gn).>= thres)
        ind_ri=getindex.(ind, 1)
        ind_ci=getindex.(ind, 2)
        push!(ind_r,ind_ri)
        push!(ind_c,ind_ci)
        for j=length(ind_r)
            g[ind_r[j],ind_c[j]]=gn[ind_r[j],ind_c[j]]
        end
        if n==1
            d=g;
            v=operator(d,param,1,lp,imax);
        else
            w=operator(g,param,1,lp,imax)
            u=-LP_norm(vec(v),vec(w),lp,imax,1)
            d=g+u*d
            v=w+u*v
        end
        beta=LP_norm(vec(v),vec(r),lp,imax,1)
        dr=dr+beta*v
        r=r-beta*v
        n=n+1
    end
    return dr
end
