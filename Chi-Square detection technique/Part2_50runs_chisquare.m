%Calculation of 50 runs of simulation
n = 50;
count = 1;
falarm = 0;
drate = 0;
jd = 0;
i=0;j=0;k=0;l=0;
for loop = 1:n
    result = sim('project_model_part2_chisquare');
    attacks = attack.data;
    anomalies = anomaly.data;
    for m = 1:3501
        %calculation of falarm
        if (attacks(m)== 0 && anomalies(m) == 1)
            i = i + 1;
        end
        if attacks(m) == 0
            j = j + 1;
        end  
        %calculation of drate
        if attacks(m) == 1 && anomalies(m) == 1
            k = k + 1;
        end
        if attacks(m) == 1
            l = l + 1;
        end
    end
                falarm = falarm + ((i / j) * 100);
                drate = drate + ((k / l) * 100);
                %calculation of jd
                jd = jd + (drate / falarm);
                disp(loop);
                disp("**********************************");
                disp('Result of falarm----------------------------');
                disp(falarm);
                disp('Result of drate-----------------------------');
                disp(drate);
                disp('Result of jd--------------------------------');
                disp(jd);
end

disp("FINAL AVERAGES BELOW ***********************");
disp(falarm / 50);
disp(drate / 50);
disp(jd / 50);
