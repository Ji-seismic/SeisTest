function radon_linear_robust(In, Par, itype,lp,imax);
h = Par[1];
p = Par[2];
dt = Par[3];
np = length(p);
nh = length(h);

if itype==1;
    m=In;
    (nt,np)=size(m);
    d=zeros(nt,nh);
end;

if itype == -1;
    d = In;
    (nt, nh) = size(d);
    m = zeros(nt,np);
end;
aux=zeros(np*2,1);
for itau=1:nt;
    for ip=1:np;
        k=1;
        aux=0*aux;
        for ih=1:nh;
            t=(itau-1)*dt+p[ip]*h[ih];
            it=t/dt+1;
            it1=floor(Int,it);
            it2=it1+1;
            a=it-it1;
            if it2<nt && it1>1
                if itype==1;
                    d[it1,ih]=d[it1,ih]+(1-a)*m[itau,ip];
                    d[it2,ih]=d[it2,ih]+(a)*m[itau,ip];
                else
                    aux[k,1]=(1-a)*d[it1,ih]+(a)*d[it2,ih];
                    k=k+1;
                end
            end
        end
        m[itau,ip]=LP_norm(ones(k-1,1),aux[1:k-1,1],lp,imax,1);
    end
end

if itype==1;
    Out=d;
end;
if itype == -1;
    Out = m;
end;
return Out
end
