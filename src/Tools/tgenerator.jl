function tgenerator(dt,nt,ns,fold)
j=1;
J=zeros(ns);
for k=1:ns
    J[k]=j;
    j=j+floor(nt/fold+((rand(1)[1])*(nt/fold)));
end
tt=dt.*J';
end
