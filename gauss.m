function gauss = gauss(tiempo,Imax)
%GAUSS   Simulación del pulso de una neurona, como una función de Gauss.
%
%Parametros de entrada:
%
%               gauss(tiempo,Imax)
%
%El valor de tiempo es el tiempo que se tarda en hacer la simulación (arrayTiempo) 
%
%El valor de Imax es el valor maximo de la corriente
%
% autores: DIEGO ABDUL, BORJA DE PRADA, JORGE DUMONT.
%

y=12.5*Imax;

norm = normpdf(tiempo,(length(tiempo)*0.1/2),5);
norm = y*norm;

gauss = norm;
plot(tiempo,gauss);
end