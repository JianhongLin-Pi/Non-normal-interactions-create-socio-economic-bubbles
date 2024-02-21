function [el]=growing_non_normal_network(N,N0,m,theta)
% Generating non-normal networks
%
% INPUTs: number of nodes (N)
%        number of top nodes (N0)
%        in-ward directed links (m)
%
% OUTPUTs: edge list (el)

el = zeros(N*m*2,2);



if N0<m+1
    k=0;
    for i=N0+1:m+1
        for j = 1:i-1
            k=k+1;
            el(k,1)=j;
            el(k,2)=i;
            if theta>0&&j>N0
               node_level = node_level_el(el(1:k,:));
               rate_reciprocated = theta/(1+exp(-2.552*(node_level(j)-3.668)))-theta/(1+exp(-2.552*(1-3.668)));
               p=rand(1,1);
               if p<rate_reciprocated
                  k=k+1;
                  el(k,1)=i;
                  el(k,2)=j;
               end
            end
        end
    end
    
    for i=m+2:N
        deg=zeros(i-1,1);
        deg(unique(el(1:k,1))) = hist(el(1:k,1), unique(el(1:k,1)));
        deg=deg+1;
        nei = weightedRandomSample(m,1:1:i-1,deg/sum(deg));
        while not(length(unique(nei))==length(nei))
            nei = weightedRandomSample(m,1:1:i-1,deg/sum(deg));
        end
        for j = 1:m
            k=k+1;
            el(k,1)=nei(j);
            el(k,2)=i;
            if theta>0&&nei(j)>N0
               node_level = node_level_el(el(1:k,:));
               rate_reciprocated = theta/(1+exp(-2.552*(node_level(nei(j))-3.668)))-theta/(1+exp(-2.552*(1-3.668)));
               p=rand(1,1);
               if p<rate_reciprocated
                  k=k+1;
                  el(k,1)=i;
                  el(k,2)=nei(j);
               end
            end
        end
    end
else
    k=0;
    for i = N0+1:N
        deg=zeros(i-1,1);
        deg(unique(el(1:k,1))) = hist(el(1:k,1), unique(el(1:k,1)));
        deg=deg+1;
        nei = weightedRandomSample(m,1:1:i-1,deg/sum(deg));
        while not(length(unique(nei))==length(nei))
           nei = weightedRandomSample(m,1:1:i-1,deg/sum(deg));
        end
        
        for j = 1:m
            k=k+1;
            el(k,1)=nei(j);
            el(k,2)=i;
            if theta>0&&nei(j)>N0
               node_level = node_level_el(el(1:k,:));
               rate_reciprocated = theta/(1+exp(-2.552*(node_level(nei(j))-3.668)))-theta/(1+exp(-2.552*(1-3.668)));
               p=rand(1,1);
               if p<rate_reciprocated
                  k=k+1;
                  el(k,1)=i;
                  el(k,2)=nei(j);
               end
            end
        end
    end
end
el(k+1:end,:) = [];