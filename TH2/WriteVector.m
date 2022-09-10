function  WriteVector
        figure(1);
        N = 38; 
        K = 3;
        MFCCa = findMeanMFCCofNA(1,N+1,K);
        MFCCe = findMeanMFCCofNA(2,N+1,K);
        MFCCi = findMeanMFCCofNA(3,N+1,K);
        MFCCo = findMeanMFCCofNA(4,N+1,K);
        MFCCu = findMeanMFCCofNA(5,N+1,K);

        a1 = MFCCa(1,:) ; u1 = MFCCu(1,:) ; e1 = MFCCe(1,:) ; o1 = MFCCo(1,:) ; i1 = MFCCi(1,:) ;
        a2 = MFCCa(2,:) ; u2 = MFCCu(2,:) ; e2 = MFCCe(2,:) ; o2 = MFCCo(2,:) ; i2 = MFCCi(2,:) ;
        a3 = MFCCa(3,:) ; u3 = MFCCu(3,:) ; e3 = MFCCe(3,:) ; o3 = MFCCo(3,:) ; i3 = MFCCi(3,:) ;
        subplot (5,1,1);
        hold on;
        plot(u1,'-','LineWidth',1); plot(u2,'-','LineWidth',1);plot(u3,'-','LineWidth',1);
        title('Vector dac trung am u');
        subplot (5,1,2);
        hold on;
        plot(a1,'-','LineWidth',1); plot(a2,'-','LineWidth',1);plot(a3,'-','LineWidth',1);
        title('Vector dac trung am a');
        subplot (5,1,3);
        hold on;
        plot(i1,'-','LineWidth',1); plot(i2,'-','LineWidth',1);plot(i3,'-','LineWidth',1);
        title('Vector dac trung am i');
        subplot (5,1,4);
        hold on;
        plot(o1,'-','LineWidth',1); plot(o2,'-','LineWidth',1);plot(o3,'-','LineWidth',1);
        title('Vector dac trung am o');
        subplot (5,1,5);
        hold on;
        plot(e1,'-','LineWidth',1); plot(e2,'-','LineWidth',1);plot(e3,'-','LineWidth',1);
        title('Vector dac trung am e');
end
