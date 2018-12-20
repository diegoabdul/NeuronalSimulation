function Ie = estimulo2(Pulsos,Imax,tiempoFinal)
 %ESTIMULO2    Simulación de la corriente con varios pulsos de una neurona
%
%Parametros de entrada:
%
%               estimulo2(Pulsos,Imax,tiempoFinal)
%
%El valor de tiempoFinal es el tiempo que se tarda en hacer la simulación
%
%El valor de Pulsos es el número de pulsos que queremos que tenga nuestro
%estímulo.
%
%El valor de Imax es el valor maximo de la corriente
%
% autores: DIEGO ABDUL, BORJA DE PRADA, JORGE DUMONT.
%

dt=0.1;

arrayTiempo = 0:dt:tiempoFinal;

Ie = zeros(1,length(arrayTiempo));

x=Pulsos+1;

distancia = round(length(arrayTiempo)/x);

i=distancia;

for t1=1:1:Pulsos
    Ie(i)=Imax;
    i=i+distancia;
end

j=1;

for t2=arrayTiempo
    
    if Ie(j)>0
        Ie(j-1)=Imax;
        Ie(j-2)=Imax;
        Ie(j-3)=Imax;
        Ie(j-4)=Imax;
        Ie(j-5)=Imax;
        Ie(j-6)=Imax;
        Ie(j-7)=Imax;
    end
    j=j+1;
end

%plot(arrayTiempo,Ie);

end