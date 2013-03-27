Adquisició d'audio (format .wav):
http://www.faq-mac.com/tutoriales/grabar-cualquier-audio-reproducido-mac/32819

Útils per l'adquisició: 
Soundflower (només per Mac: http://code.google.com/p/soundflower/)
Audiacity (http://audacity.sourceforge.net)

Processament: 
Matlab (http://www.mathworks.es/products/matlab/) 
Scilab (http://www.scilab.org/)


Fitxers:
- bugs.wav ("¿qué hay de nuevo viejo?") 1.1262 segons (2 x 49664 mostres a 44100 Hz)
- countdown.wav ("The final countdown", Europe) 3.1695 segons (2 x 139776 mostres a 44100 Hz)


Codi matlab/scilab:

//llegir fitxer
[A, Fs]=wavread('bugs.wav');
//reproducció:
playsnd(A, Fs) //scilab
sound(A, Fs) //matlab OSX
wavplay(A, Fs) //matlab Windows
//variant volum de reproducció
playsnd(A, Fs)
playsnd(5*A, Fs)
playsnd(2*A, Fs)
//Freqüència de mostreig
Fs
//durada (segons)
size(A, 2)/Fs //scilab
length(A)/Fs //matlab
//llegir fitxer
[B, Fs2]=wavread('countdown.wav');
//reproducció variant volum de reproducció
playsnd(B, Fs)
playsnd(2*B, Fs)
playsnd(3*B, Fs)
//durada
length(B)/Fs
//mono:
AA=A(1, :); //scilab
AA=A(:, 1); //matlab
playsnd(AA, Fs);

//representar el senyal
scf(0), plot2d3(AA)
//reproduir i representar un bocí del senyal
// "Que"
playsnd(AA(1:10000), Fs) 
scf(1), plot2d3(AA(1:10000))
//"Q"
playsnd(5*AA(5500:6000), Fs)
scf(2), plot2d3(AA(5500:6000))
//detalls de la representació
scf(3), plot2d3(AA(5900:6000))
scf(4), plot2d3(AA(5900:5930))

//Operacions amb senyals
//reflexió del senyal
N=length(AA);
I=zeros(1:N);
for k=1:N
  I(k)=AA(N+1-k);
end
playsnd(I, Fs);
scf(5), plot2d3(I)

//bocí de senyal B amb la durada de A, mono:
D=B(1, 1:size(A, 2)); //scilab
D=B(1:length(A), 1); //matlab
D=B(1:length(AA), 1); //scilab i matlab

//reproducció de combinacions lineal dels senyals
playsnd(AA+D, Fs)
playsnd(AA+2*D, Fs)
playsnd(AA+5*D, Fs)
playsnd(AA-D, Fs)
playsnd(2*AA-3*D, Fs)
//canvi de la freqüencia de mostreig en reproducció
playsnd(AA, 2*Fs)
//Nota: en matlab 'sound(AA, 2*Fs)' dóna error
playsnd(AA, Fs/2)
//retard d'un senyal respecte de l'altre:
//bocí més llarg de música de fons (durada doble que D)
DD=B(1, 1:2*length(AA)); //scilab
DD=B(1:2*length(AA), 1); //matlab
E=DD;
//retard d'1/2 segon == Fs mostres
E(Fs/2:Fs/2+length(AA)-1)=E(Fs/2:Fs/2+length(AA)-1)+AA;
playsnd(E, Fs);

//Altres exemples de processament del senyal (Wikipedia: Audio signal processing)
//eco: canal 1 original, canal 2 retardat > 35ms
ret_eco_min=int(0.035*Fs)
//ret_eco_min=1543
retard=3000/Fs
Aecho=zeros(2, length(AA)+3000);
Aecho(1, 1:length(AA))=AA;
Aecho(2, 3000:3000+length(AA)-1)=AA;
playsnd(Aecho, Fs)
//chorus: canal 1 original, canal 2 retardat (5ms-35ms)
ret_chorus_min=int(0.05*Fs)
//ret_chorus_min=220
retard=1500/Fs
Achorus=zeros(2, length(AA)+1500);
Achorus(1, 1:length(AA))=AA;
Achorus(2, 1500:1500+length(AA)-1)=AA;
playsnd(Achorus, Fs)
//pitch shift (fer més agut o greu el senyal)
//shift=300
AA_f=fft(AA);
scf(0), plot2d3(abs(AA_f));
N=length(AA);
Aup_f=zeros(1, N);
Aup_f(1)=AA_f(1);
shift=300
for k=2+shift:N/2
  Aup_f(k)=AA_f(k-shift);
end
//per propietats de simetria de l'espectre dels senyals reals
for k=N/2:N-1
  Aup_f(k)=conj(Aup_f(N-k));
end
Aup=real(ifft(Aup_f));
scf(1), plot2d3(abs(Aup_f));
playsnd(Aup, Fs)
//chorus amb AA i Aup
retard=1500/Fs
Achorus2=zeros(2, length(AA)+1500);
Achorus2(1, 1:length(AA))=AA;
Achorus2(2, 1500:1500+length(AA)-1)=Aup;
playsnd(Achorus2, Fs)
//pitch shift amb desplaçament major -> veu metàlica
AA_f=fft(AA);
scf(0), plot2d3(abs(AA_f));
N=length(AA);
Aup2_f=zeros(1, N);
Aup2_f(1)=AA_f(1);
shift2=1500
for k=2+shift2:N/2
  Aup2_f(k)=AA_f(k-shift2);
end
//per propietats de simetria de l'espectre dels senyals reals
for k=N/2:N-1
  Aup2_f(k)=conj(Aup2_f(N-k));
end
Aup2=real(ifft(Aup2_f));
scf(2), plot2d3(abs(Aup2_f));
playsnd(Aup2, Fs)

//exemple de sistema recursiu:
//sintetitzador de sons (Karplus-Strong algorithm)
x=rand(100, 1, "normal");
scf(0), plot2d3(x)
M=size(x)
M=length(x)
N=10*M;
y=zeros(N, 1);
y(1:M)=x;
for k=M+1:N
  y(k)=0.9*y(k-M);
end
playsnd(x)
playsnd(y)
playsnd(y, 44100)
playsnd(y, 11000)
//un altre exemple
[A, Fs]=wavread('bugs.wav');
x=A(1, 1:10000)';
M=length(x);
N=10*M;
D=100;
y=zeros(N, 1);
y(1:M)=x;
for k=D+1:N
    y(k)=y(k)+0.9*y(k-D);
end
playsnd(x, Fs)
playsnd(y, Fs)
 
   
end

