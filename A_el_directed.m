function A=A_el_directed(el)
% Convert edge list (el) to adjacency matrix (A)
%
% INPUTs: edge list (el)
% OUTPUTs: adjacency matrix (A)



N=max(max(el));

A=zeros(N);

for i = 1:size(el,1)
    A(el(i,1),el(i,2))=1;
end