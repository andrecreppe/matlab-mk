% main.mclear; clc; close all;global tglobal dataglobal sbdvglobal optiondata = [2 3 22 16 39 52 54 47 50 76 69 51 57 70 53 59 57];t = linspace(0,16,17);sbdv = 10;eps = 0.000001;disp('Escolha um modelo');disp('(1) exponencial // (2) logistico // (3) gompertz');option = input('Modelo: ');disp('')if option == 1 % Equacao Exponencial    p0Min = 25;    p0Max = 35;    kMin = -5;    kMax = 5;        while ((p0Max - p0Min)/2 > eps) || ((kMax-kMin)/2 > eps)        p0Val = linspace(p0Min, p0Max, sbdv);        kVal = linspace(kMin, kMax, sbdv);                for a = 1:sbdv            for b = 1:sbdv                Calc(a,b) = struct('p0',p0Val(a), 'k',kVal(b));            end        end                min = sort2D(Calc);        [p0Min, p0Max, kMin, kMax] = limits2D(min, Calc);    end        P0 = Calc(min).p0;    k = Calc(min).k    Res = modEXP(k);    Err = eqmp2D(Res)        plot(t, data, 'o');    hold on    plot(t, modEXP(k), '-r');    hold off    title('Equacao Exponencial')    xlabel('Dias')    ylabel('Populacao')elseif option == 2 % Equacao Logistica    p0Min = 0;    p0Max = 5;    kMin = 0;    kMax = 2;    Mmin = 50;    Mmax = 70;        while ((p0Max - p0Min)/2 > eps) || ((kMax - kMin)/2 > eps) || ((Mmax - Mmin)/2 > eps)        p0Val = linspace(p0Min, p0Max, sbdv);        kVal = linspace(kMin, kMax, sbdv);        Mval = linspace(Mmin, Mmax, sbdv);                for a = 1:sbdv            for b = 1:sbdv                for c = 1:sbdv                    Calc(a,b,c) = struct('p0',p0Val(a), 'k',kVal(b), 'M',Mval(c));                end            end        end                min = sort3D(Calc);        [p0Min, p0Max, kMin, kMax, Mmin, Mmax] = limits3D(min, Calc);    end        P0 = Calc(min).p0;    k = Calc(min).k    M = Calc(min).M    Res = modLOG(k, M);    Err = eqmp3D(Res)        plot(t, data, 'o');    hold on    plot(t, modLOG(k, M), '-m');    hold off    title('Equacao Logistica')    xlabel('Dias')    ylabel('Populacao')elseif option == 3 % Equacao de Gompertz    p0Min = 0;    p0Max = 5;    kMin = 0;    kMax = 1;    Mmin = 50;    Mmax = 70;        while ((p0Max - p0Min)/2 > eps) || ((kMax - kMin)/2 > eps) || ((Mmax - Mmin)/2 > eps)        p0Val = linspace(p0Min, p0Max, sbdv);        kVal = linspace(kMin, kMax, sbdv);        Mval = linspace(Mmin, Mmax, sbdv);                for a = 1:sbdv            for b = 1:sbdv                for c = 1:sbdv                    Calc(a,b,c) = struct('p0',p0Val(a), 'k',kVal(b), 'M',Mval(c));                end            end        end                min = sort3D(Calc);        [p0Min, p0Max, kMin, kMax, Mmin, Mmax] = limits3D(min, Calc);    end        P0 = Calc(min).p0;    k = Calc(min).k    M = Calc(min).M    Res = modGOMP(k, M);%     Err = sort3D(Res)    plot(t, data, 'o');    hold on    plot(t, modGOMP(k, M), '-g');    hold off    title('Equacao de Gompertz')    xlabel('Dias')    ylabel('Populacao')end