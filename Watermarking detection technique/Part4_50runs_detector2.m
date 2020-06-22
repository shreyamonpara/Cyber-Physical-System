%Calculation of 50 runs simulation
n= 50;
count = 1;
drate = 0;
je = 0;
jw = 0;
i=0;j=0;k=0;l=0;xeq=0;
for loop = 1:n
    result = sim('project_model_part4_watermarking_detector2');
    attacks = attack.data;
    anomalies = anomaly.data;
    x_data = x.data;
    for m = 1:1301
        %calculation of drate
        if attacks(m) == 1 && anomalies(m) == 1
            k = k + 1;
        end
        if attacks(m) == 1
            l = l + 1;
        end
        %calculation of je
        if (attacks(m)== 0 && anomalies(m) == 1)
            normlize = norm(x_data(m) - xeq);
            i = i + (normlize);
        end
        if attacks(m) == 0
            j = j + 1;
        end  
    end
     drate = drate + ((k / l) * 100);
     je = je + (i / j);
     jw = jw + (drate / je);
     disp(loop);
     disp('Result of drate-----------------------------');
     disp(drate);
     disp('Result of je--------------------------------');
     disp(je);
     disp('Result of jw--------------------------------');
     disp(jw);
end   
disp("FINAL AVERAGES BELOW ***********************");
disp(drate / 50);
disp(je / 50);
disp(jw / 50);
    