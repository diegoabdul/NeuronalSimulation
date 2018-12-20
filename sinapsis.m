function Ie2 =  sinapsis( tiempoFinal,inicioPulso,finPulso,Imax,UmbralMembrana,TopeDisparo,UmbralReset,Peso,Ruido,Gauss,Pulsos,numPulsos)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

noise = ruido(tiempoFinal);
dt=0.1; %definimos el valor de dt para que sea fijo durante todo el tiempo

PM = -70; %potencial de la membrana

arrayTiempo = 0:dt:tiempoFinal;

Ie = estimulo(inicioPulso,finPulso, tiempoFinal,Imax,Ruido,Gauss,Pulsos,numPulsos);

potencial = intFire(tiempoFinal,dt,Ie,UmbralMembrana,TopeDisparo,UmbralReset,PM);

sinapsis = zeros(1,length(arrayTiempo));

i=1;

for t=dt:dt:tiempoFinal
    
    if(potencial(i)>UmbralMembrana)
        sinapsis(i-3) = Peso;
        sinapsis(i-2) = Peso;
        sinapsis(i-1) = Peso;
        sinapsis(i) = Peso;
        sinapsis(i+1) = Peso;
        sinapsis(i+2) = Peso;
        sinapsis(i+3) = Peso;
        
    else
        sinapsis(i) = 0;
    end
    i=i+1;
end
Ie2=sinapsis+noise;
%%subplot(2,1,1);
%plot(arrayTiempo, sinapsis);
end

