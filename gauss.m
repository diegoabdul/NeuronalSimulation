function gauss = gauss(tiempo,Imax)
%GAUSS   Simulaci�n del pulso de una neurona, como una funci�n de Gauss.
%
%Parametros de entrada:
%
%               gauss(tiempo,Imax)
%
%El valor de tiempo es el tiempo que se tarda en hacer la simulaci�n (arrayTiempo) 
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