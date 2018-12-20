function VectorPicos = intFire(tiempoFinal,dt,Ie,UmbralMembrana,TopeDisparo,UmbralReset,PM)
%INTFIRE    Simulación del modelo de integracion
%
%Parametros de entrada:
%
%               intFire(TiempoFinal,dt,Ie)
%
%El valor de TiempoFinal es el tiempo que se tarda en hacer la simulación
%
%El valor de dt es el salto de tiempo
%
%El vlor de Ie es el vector del pulso de la corriente
%
%El valor de UmbralMembrana es el valor a partir de donde se dispara
%
%El valor de TopeDisparo es el valor maximo del disparo
%
%El valor del UmbralReset es el valor minimo que alcanza el potencial
%
%El valor del PM es el potencial de la membrana
%
%Representa la grafica de simulación del disparo
%
%
% autores: DIEGO ABDUL, BORJA DE PRADA, JORGE DUMONT.
%
arrayTiempo = 0:dt:tiempoFinal;

tau = 10; %tiempo de la membrana
RM = 10; %resistencia de la membrana

arrayVoltaje = zeros(1,length(arrayTiempo)); %inicializamos el vector voltaje

VectorPicos = zeros(1,length(arrayTiempo)); %nos muestra los spikes

i = 1; % index para ver cual numero esta siendo asignado a V

arrayVoltaje(i)= PM; %se asigna el primer numero a V

VectorPicos(i) = arrayVoltaje(i); %si no hay spike entonces dibujamos el voltaje normalmente

for t=dt:dt:tiempoFinal
    
    VectorMembrana = PM + Ie(i)*RM; %llenamos el vector mientras con los valores definidos
    
    arrayVoltaje(i+1) = VectorMembrana + (arrayVoltaje(i) - VectorMembrana)*exp(-dt/tau);
    %formula para activar el spike si pasamos el umbral definido
    
    if (arrayVoltaje(i+1) > UmbralMembrana) %formula para el spike
        
        arrayVoltaje(i+1) = UmbralReset; %volvemos a poner el voltaje en reset
        
        VectorPicos(i+1) = TopeDisparo; %dibujamos el spike
        
    else %si no ocurre lo anterior es porque no hubo un votaje para cruzar el umbral
        VectorPicos(i+1) = arrayVoltaje(i+1); %dibujamos el voltaje actual
    end
    i = i + 1; %nos movemos 1 en cuanto al index del tiempo
end

plot(arrayTiempo, VectorPicos);
xlabel('TIEMPO')
ylabel('VOLTAJE')
title('Simulacion de disparo','FontSize',12)
end

