function [P,x_n,s_t]=agent_based_model_non_normal_network(el,T,kappa,ppm)
%
%Inputs: network: (edgelist: el); time steps: (T); social coupling: (kappa); 
%       controling the average holding time of each asset: (ppm)

% Outputs: price: (P); risky fraction of noise traders who hold the risky asset: (x_n); noise traders' state at time t: (s_t)


theta=0.95; 

E_Rt = 0.00016; 
r_d = 0.00016;   
R_f = 0.00004;

% fundamentalist
x_f = zeros(T+1,1); 
x_f(1,1) = 0.3;  
R=zeros(T,1); 
W_f = zeros(T+1,1); 
W_f(1,1) = 10^9; 
r = zeros(T,1);  
Sigma_d = 0.000016; 
P = zeros(T+1,1);  
P(1,1) = 1;
d = zeros(T+1,1);  
d(1,1) = 0.00016;
gamma_ss = (E_Rt + d(1,1)*(1+r_d)/P(1,1)-R_f)/x_f(1,1);

%Noiser trader 
W_n = zeros(T+1,1);  
W_n(1,1) = 10^9;
p_p= zeros (T,1); 
p_m= zeros (T,1);

%s = zeros (T+1,1);  
%s(1,1) = 2*x_n(1,1)-1;


H = zeros (T+1,1); H(1,1) = 0.00016; 
kappa=kappa*ppm;


%theta = 0.95;
Eta_Kappa = log(10)*(1-theta); 
%Sigma_Kappa = 0.1*ppm*(2*Eta_Kappa)^0.5;  
v = zeros(T+1,1);
v(1,1) = 1;

% Network

N=max(max(el));
s=rand(N,1)-0.5;
s=sign(s);
s_t(:,1)=s;
indeg = tabulate(el(:,2));
indeg(:,1)=[];
indeg(:,2)=[];
x_n=zeros(T+1,1);
x_n(1,1)=0.5;

for t = 1:T    
    
    NeiState=zeros(N,1);
    
    for i = 1:size(el,1)
                
        NeiState(el(i,2)) = NeiState(el(i,2))+s(el(i,1));
        
    end
    
    ppp=zeros(N,1);
    H(t)=0;
    ppp(indeg>0)=0.5*ppm*(-s(indeg>0).*kappa/ppm.*(NeiState(indeg>0)./indeg(indeg>0)+H(t)));
    ppp = ppp + 0.5*ppm;
    
    rp=rand(N,1);
    
    s(rp<ppp)=-s(rp<ppp);
    x_n(t+1)=sum(s==1)/N; 
    
    s_t(:,t+1) = s;
   
    %Kappa(t+1) = Kappa(t) + Eta_Kappa*(miu_Kappa - Kappa(t))+ Sigma_Kappa*normrnd(0,1);
    %Kappa(t+1)=Kappa*pp;
  
    r(t) = r_d + Sigma_d*normrnd(0,1);  d(t+1) = d(t)*(1+ r(t));
    
    v1 = (E_Rt-R_f)/gamma_ss;   v2 = d(t+1)/P(t)-R_f-1;    
    v3 = R_f+1;                 v4 = d(t+1)*(1+r_d)/gamma_ss;
    
     aa = (W_f(t)*x_f(t)*(v1-1)+W_n(t)*x_n(t)*(x_n(t+1)-1))/P(t);
     bb = W_f(t)*(x_f(t)*v4/P(t)+v1*(x_f(t)*v2+v3))+W_n(t)*x_n(t+1)*(x_n(t)*v2+v3);
     cc= W_f(t)*v4*(x_f(t)*v2+v3);
    
    P(t+1) = 0.5*(-bb - (bb^2-4*aa*cc)^0.5)/aa;
    R(t) = P(t+1)/P(t)-1;
    
    H(t+1) = H(t)*theta + (1 - theta) * (P(t+1)/P(t)-1); 
       
    W_f(t+1) = (P(t+1)/P(t)-1+d(t+1)/P(t)-R_f)*x_f(t)*W_f(t)+W_f(t)*(1+R_f);
    W_n(t+1) = (P(t+1)/P(t)-1+d(t+1)/P(t)-R_f)*x_n(t)*W_n(t)+W_n(t)*(1+R_f);
    
    v(t+1) = W_n(t+1)/W_f(t+1);
    x_f(t+1) = (E_Rt + d(t+1)*(1+r_d)/P(t+1)-R_f)/gamma_ss;    
end
       
W_f=W_f/10^9;
W_n=W_n/10^9;

%delete(hwait);

