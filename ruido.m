function noise = ruido(tiempoFinal)
dt = 0.1;
arrayTiempo = 0:dt:tiempoFinal;
ruido = rand(1,length(arrayTiempo))*0.1;

x=1;


incremento = x/length(arrayTiempo);
vector = zeros(1,length(arrayTiempo));

vector(1) = x;
i=2;


for t=1:dt:tiempoFinal
    
    vector(i)=vector(i-1)-incremento;
    
    i=i+1;
end

noise = vector+ruido;
plot(arrayTiempo,noise);
end