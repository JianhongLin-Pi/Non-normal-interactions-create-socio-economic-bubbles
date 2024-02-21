function node_level = node_level_el(el)
% Calculating the level of nodes
%
% INPUT: edgelist: (el)
% OUTPUT: level of nodes: (node_level)

A = A_el_directed(el);
Indegree = sum(A);
v = Indegree;
v(v==0)=1;
A=A';
B = diag(v) - A;
node_level = B^(-1)*v';