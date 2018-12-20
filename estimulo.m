function Ie = estimulo(inicioPulso,finPulso, tiempoFinal,Imax,Ruido,Gauss,Pulsos,numPulsos)
%ESTIMULO    Simulación del pulso de una neurona
%
%Parametros de entrada:
%
%               estimulo(inicioPulso,finPulso, tiempoFinal,Imax, Ruiso,Gauss,Pulsos,numPulsos)
%
%El valor de tiempoFinal es el tiempo que se tarda en hacer la simulación
%
%El valor de inicioPulso es el valor con respecto al tiempo en donde
%empieza el pulso
%
%El valor de finPulso es el valor con respecto al tiempo en donde termina
%el pulso
%
%El valor de Imax es el valor maximo de la corriente
%
%El valor de Ruido es un boolean que nos indica si el estímulo debe tener
%ruido.
%
%El valor de Gauss es un boolean que nos indica si el estímulo debe tener
%la forma de una función de Gauss.
%
%El valor de Pulsos es un boolean que nos indica si el estímulo debe tener
%varios pulsos.
%
%%El valor de numPulsos es el número de pulsos que queremos que tenga nuestro
%estímulo, en caso de que Pulsos==true.
%
% autores: DIEGO ABDUL, BORJA DE PRADA, JORGE DUMONT.
%

control = true;
dt=0.1; %valor fijo que representa los saltos de tiempo, no se coloco para
%fuera por consola porque da problemas con los vectores.
arrayTiempo = 0:dt:tiempoFinal;
if(Gauss==false && Pulsos==false)
    Ie = zeros(1,inicioPulso/dt);%vamos a llenar de 0 para el inicio del pulso
    Ie = [Ie Imax*ones(1,1+((finPulso-inicioPulso)/dt))];%luego se llena de el valor maximo para
    Ie = [Ie zeros(1, (tiempoFinal-finPulso)/dt)];%dibujar el estimulo.
else
    if(Gauss==true && Pulsos==false)
        Ie=gauss(arrayTiempo,Imax);
    else
        if(Gauss==false && Pulsos==true)
            Ie = estimulo2(numPulsos,Imax,tiempoFinal);
        else
            if(Gauss==true && Pulsos==true)
                msgbox('ERROR, el estímulo sólo puede ser Gaussiano o de Pulsos, no los dos a la vez', 'Error','error');
                control=false;
            end
        end
    end
end
noise = ruido(tiempoFinal);
if Ruido==true
    Ie = Ie+noise;
end
if (control)
    plot(arrayTiempo,Ie) %dibujamos con respecto al tiempo el pulso antes calculado
    xlabel('TIEMPO')
    ylabel('CORRIENTE')
    title('Simulacion pulso de corriente','FontSize',12)
end
end