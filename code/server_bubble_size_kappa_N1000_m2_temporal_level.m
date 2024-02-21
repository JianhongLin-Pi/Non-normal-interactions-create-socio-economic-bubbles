ppm=0.05;
kappaall=[0.6 0.7 0.8 0.9 0.98];
T=25000;
N0thetaall=[1,0;5,0;1,0.5;5,0.5;1,1;5,1];

N=1000;
m=2;



t0=251;
deltaT=250;
ST=30;


CoreNum =3;
parpool('local', CoreNum);


for ii = 1:length(N0thetaall)
    N0=N0thetaall(ii,1);
    theta=N0thetaall(ii,2);
    
    parfor jj=1:length(kappaall)
       
        kappa=kappaall(jj);
        for kk=1:ST
            tic;
            disp(ii*1000000+jj*10000+kk);

            [el]=non_normal_network_sigmoid_temporal_level(N,N0,m,theta);
            [P,x,~,~,~,~]=Noise_Trader_directed_network_varyKappa_pp(el,T,kappa,ppm);
            deltaT=250; 
            [peak]=detect_peak_t0_deltaT(P,T,t0,deltaT);
            NumPeak0_T25000deltaT250kappa{ii,jj}(kk) = size(peak,1);
            SizePeak0_T25000deltaT250kappa{ii,jj}(kk) = mean(peak(:,5));
            bubble_steepness_kappa0_T25000{ii,jj}(kk) = 250*mean(peak(:,5)./(peak(:,2)-peak(:,4)));

            [peak]=detect_peak_t0_deltaT(P,10000,t0,deltaT);
            NumPeak0_T10000deltaT250kappa{ii,jj}(kk) = size(peak,1);
            SizePeak0_T10000deltaT250kappa{ii,jj}(kk) = mean(peak(:,5));
            bubble_steepness_kappa0_T10000{ii,jj}(kk) = 250*mean(peak(:,5)./(peak(:,2)-peak(:,4)));
        end
    end
end
delete(gcp('nocreate'));
save 'bubble_size_kappa_N1000_m2_temporal_level.mat'

for i1=1:length(N0thetaall)
    for ii = 1:length(kappaall)
        SizeBubble_kappa_T25000{i1}(ii)=mean(SizePeak0_T25000deltaT250kappa{i1,ii});
        std_SizeBubble_kappa_T25000{i1}(ii)=std(SizePeak0_T25000deltaT250kappa{i1,ii});
        SizeBubble_kappa_T10000{i1}(ii)=mean(SizePeak0_T10000deltaT250kappa{i1,ii});
        std_SizeBubble_kappa_T10000{i1}(ii)=std(SizePeak0_T10000deltaT250kappa{i1,ii});
        bubble_steepness_kappa_T25000{i1}(ii) = mean(bubble_steepness_kappa0_T25000{i1,ii});
        std_bubble_steepness_kappa_T25000{i1}(ii) = std(bubble_steepness_kappa0_T25000{i1,ii});
        bubble_steepness_kappa_T10000{i1}(ii) = mean(bubble_steepness_kappa0_T10000{i1,ii});
        std_bubble_steepness_kappa_T10000{i1}(ii) = std(bubble_steepness_kappa0_T10000{i1,ii});
    end
end

save 'bubble_size_kappa_N1000_m2_temporal_level.mat'