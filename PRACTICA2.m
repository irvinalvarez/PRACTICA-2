close all 
prompt= 'Introduzca el valor (grados) de la Rotación en el Eje  X (phi):';
phiDeg = input(prompt);

prompt= 'Introduzca el valor (grados) de la Rotación en el Eje Y(theta):';
thetaDeg = input(prompt);

prompt= 'Introduzca el valor(grados) de la Rotación en el Eje Z (psi):';
psiDeg = input(prompt);
%------conversiones en radianes-------------------------------------------

phiRad= deg2rad(phiDeg);
thetaRad= deg2rad(thetaDeg);
psiRad= deg2rad(psiDeg);

for t=0:0.01:phiRad
    clf 
    for t1=0:0.01:thetaRad
        clf
        for t2=0:0.01:psiRad
            clf
line([-9 9],[0 0],[0 0],'color',[1 0 0],'linewidth',2.5);   %establece el Eje x rojo
line([0 0],[-9 9],[0 0],'color',[0 1 0],'linewidth',2.5);   %establece el Eje y verde
line([0 0],[0 0],[-9 9],'color',[0 0 1],'linewidth',2.5);   %establece el Eje z azul

p1=[0 0 0]; % punto de referencia
p2=[7 0 0]; % punto de referencia
p3=[7 3 0]; % punto de referencia
p4=[0 3 0]; % punto de referencia
p5=[0 0 2]; % punto de referencia
p6=[0 3 2]; % punto de referencia
p7=[7 0 2]; % punto de referencia
p8=[7 3 2]; % punto de referencia

grid on 

imprimir(p1,p2,p3,p4,p5,p6,p7,p8)

view(120,30)
%-------------Matrices de rotacion--------------- 

Rx= [1 0 0;0 cos(t) -sin(t); 0 sin(t) cos(t)];
Ry= [cos(t1) 0 sin(t1) ;0 1 0; -sin(t1) 0 cos(t1) ];
Rz= [cos(t2) -sin(t2) 0;sin(t2) cos(t2) 0; 0 0 1];

Rt = Rz*Ry*Rx;

p1 = Rx*p1'; % transponerlo es con ' 
p2 = Rx*p2';
p3 = Rx*p3';
p4 = Rx*p4';
p5 = Rx*p5';
p6 = Rx*p6';
p7 = Rx*p7';
p8 = Rx*p8';

imprimir(p1,p2,p3,p4,p5,p6,p7,p8)

p1 = Ry*p1; 
p2 = Ry*p2;
p3 = Ry*p3;
p4 = Ry*p4;
p5 = Ry*p5;
p6 = Ry*p6;
p7 = Ry*p7;
p8 = Ry*p8;

imprimir(p1,p2,p3,p4,p5,p6,p7,p8)

p1 = Rz*p1; 
p2 = Rz*p2;
p3 = Rz*p3;
p4 = Rz*p4;
p5 = Rz*p5;
p6 = Rz*p6;
p7 = Rz*p7;
p8 = Rz*p8;

imprimir(p1,p2,p3,p4,p5,p6,p7,p8)

pause (0.01)
        end
    end
end