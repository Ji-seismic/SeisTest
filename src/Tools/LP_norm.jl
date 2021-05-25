"""
    LP_norm(in1,in2,p,imax,type)

Calculate robust inner product in the Lp norm space: Find the parameter alpha which minimize this cost function ||in1-alpha*in2||_p

# Arguments
- `in1`: vector 1
- `in2`: vector 2
- `p`: Lp norm space
- `type`: 1 output=alpha, 2 output=inner product between in1 and in2 in lp norm space
"""
function LP_norm(in1,in2,p,imax,type)
    N=length(in1);
    if N==0
        alpha=0;
    else
        alpha=0;

        for i=1:imax
            w=1 ./((abs.(in2-alpha*in1)).^(2-p).+0.000000001);
            alpha=sum(in1.*w.*in2)/sum(in1.*w.*in1);
        end
    end
    if type==1
        out=alpha;
    end
    if type==2
        out=sum(alpha.*in1);
    end
    return out
end
