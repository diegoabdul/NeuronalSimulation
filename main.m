function main(tiempoFinal,inicioPulso,finPulso,Imax,UmbralMembrana,TopeDisparo,UmbralReset,Ruido,Gauss,Pulsos,numPulsos)
%MAIN    Simulación del modelo de integracion y pulso
%                       de una neurona.
%
%Parametros de entrada:
%           VALORES RECOMENDANDOS: main(50,20,45,5,-55,10,-70)
%               main(TiempoFinal,InicioPulso,finPulso,IMax)
%
%El valor de TiempoFinal es el tiempo que se tarda en hacer la simulación
%
%El valor de inicioPulso es el valor con respecto al tiempo en donde
%empieza el pulso
%
%El valor de finPulso es el valor con respecto al tiempo en donde termina
%el pulso
%
%El valor de Imax es el valor maximo de la corriente

%
%El valor de UmbralMembrana es el valor a partir de donde se dispara
%
%El valor de TopeDisparo es el valor maximo del disparo
%
%El valor del UmbralReset es el valor minimo que alcanza el potencial
%
%Representa 2 graficas la primera es la de simulación del disparo y
%la segunda la simulacion de pulso de CORRIENTE.
%
%
% autores: DIEGO ABDUL, BORJA DE PRADA, JORGE DUMONT.
%


dt=0.1; %definimos el valor de dt para que sea fijo durante todo el tiempo
control=true;
PM = -70; %potencial de la membrana
if(inicioPulso>finPulso)
    msgbox('ERROR, el inicio del pulso debe ser menor que el fin del pulso', 'Error','error');
end
if(tiempoFinal<finPulso)
    msgbox('ERROR, el tiempo final debe ser mayor que el fin del pulso', 'Error','error');
end

if(tiempoFinal>=finPulso)
    
    if((UmbralMembrana>-40)||(UmbralMembrana<-70))
        msgbox('ERROR, el Umbral debe estar entre [-40,-70]', 'Error','error');
        control=false;
    end
    if(TopeDisparo<UmbralMembrana)
        msgbox('ERROR, el Disparo debe ser mayor que el umbral de la membrana', 'Error','error');
        control=false;
    end
    if(UmbralReset>PM)
        msgbox('ERROR, el Disparo debe ser mayor que el umbral de la membrana', 'Error','error');
        control=false;
    end
    if(control)
        
      
        %llamamos al estimulo para calcularlo
        
        subplot(2,1,1);
       Ie=estimulo(inicioPulso,finPulso, tiempoFinal,Imax,Ruido,Gauss,Pulsos,numPulsos);
        %dibujamos el estimulo ya calculado.
        
        
        subplot(2,1,2);
        intFire(tiempoFinal,dt,Ie,UmbralMembrana,TopeDisparo,UmbralReset,PM);
        %llamamos a intFire con el valor calculado del estimulo y lo dibujamos
        
    end
end
end

