p = 40; 
t=-4*p:1:4*p; %vector pentru axa timpului
d=6; 
duty = d/p;      
N = 50;       
w0 = 2*pi/p; 
x_tr= sawtooth(w0*t,0.3);  
f=@(t)sawtooth(w0*t,0.3);
cc=1/p*integral(f,0,p);
Ck=zeros(1,N);
Ak=zeros(1,N);
x_mod=0;
for k=1:1:N
   f=@(t)sawtooth(w0*t,0.3).*exp(-w0*t*1i*(k-25));
   Ck(k)=1/p*integral(f,0,p);          
   Ak(k+1)=2*abs(Ck(k));
   x_mod=x_mod+Ck(k)*exp(w0*t*1i*(k-25));
end
figure(1);
plot(t,x_mod,t,x_tr);
xlabel("Timp");
ylabel("Amplitudine");
title('x(t) și reconstrucția folosind 50 de coeficienți')
grid;
figure(2);
Ak(51)=abs(cc);
Ak(1)=Ak(51);%Amplitudinea Ak
stem([0:N],Ak);
hold on;
plot([0:N],Ak,"-o"); %folosit pentru a uni maximele coeficientilor cu o linie
title('spectru de amplitudini')
xlabel('Coeficient');
%se afiseaza spectrul de valori
grid;


%nr. de ordine= 6
%duty= factor de umplere
%w0=pulsatia
%N=nr de coeficienti
%D=pulsul semnalului
%P=perioada semnalului
%Ck(k)=coeficientii SFC
%x_tr=semnalul triunghiular
