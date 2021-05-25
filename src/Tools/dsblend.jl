"""
    dsblend(din, PARAM, iflag)

forward and adjoint blend operator

# Arguments
- `din`: input data
- `PARAM`: parameters
- `iflag`: 1=forward operator
          -1=adjoint operator

"""
function dsblend(din,PARAM,iflag)
    tt=PARAM[1];
    Nt=PARAM[2];
    Ns=PARAM[3];
    dt=PARAM[4];
    (nt,ns)=size(din);
    tn=floor.(Int,tt/dt) .+1;
    mn=maximum(tn);
    if iflag==1
        out=zeros((nt+mn),1);
        for i=1:ns
            out[tn[i]:(tn[i]+nt-1)]=out[tn[i]:(tn[i]+nt-1)].+din[:,i];
        end
    end
    if iflag==-1
        out=zeros(Nt,Ns);
        for j=1:Ns
            out[1:Nt,j]=out[1:Nt,j]+din[tn[j]:(tn[j]+Nt-1)];
        end
    end
    return out

end
