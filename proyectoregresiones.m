%PROGRAMA DE LAS REGRESIONES%
%%Hecho por Kevin Brennan, Edwar Gonzalez, Guillermo Lezcano

function matriz = regresiones (x, y, c)
clc;
op=0;
n=c;   
   while op = 4;
   fprintf('\n--ELIJA LA OPCION QUE QUIERE REALIZAR--\n');
   fprintf('\n1. Regresion Lineal\n');
   fprintf('\n2. Regresion Polinomial de 2do Grado\n');
   fprintf('\n3. Regresion Exponencial\n');
   fprintf('\n4. Comparar la mejor regresion\n');
   op2=input('Inserte su eleccion');
      switch(op2)
            case 1
          %1RA PARTE - REGRESION LINEAL%
          xT= 0;
          yT= 0;
          xyT= 0;
          x2T= 0;
          Columna5T=0;
          Columna6T=0;
          for i = 1 : n
            xT= xT + x(i);
            yT= yT + y(i);
            xy(i)=x(i)*y(i);
            xyT= xyT + xy(i);
            x2(i)=(x(i))^2;
            x2T= x2T + x2(i);
          endfor
           %Valor Promedio
           xProm=xT/n;
           yProm=yT/n;
           %SISTEMAS DE ECUACIONES
           m1 = [n, xT; xT, x2T];
           m2 = [yT; xyT];
           %MATRIZ INVERSA
           m3=[inv(m1)*m2];
           a0=m3(1);
           a1=m3(2);
           %MATRIZ INVERSA
           for i = 1 : n
             Columna5(i)= (y(i)-a0-(a1*x(i)))^2;
             Columna5T=Columna5T + Columna5(i);
             Columna6(i) = (y(i)-yProm)^2;   
             Columna6T=Columna6T + Columna6(i); 
           endfor
           Sr=Columna5T;
           Syx=sqrt(Sr/(n-2));
           r2=(Columna6T-Sr)/Columna6T;
           r=sqrt(r2);
           %IMPRESION FINAL
           fprintf('\n                                                    ___________________________________');
              fprintf('\n                                                      REGRESION LINEAL');
              fprintf('\n                                                    ___________________________________\n');
              fprintf('\n              x     \t    y   \t    xy  \t    x^2\t  (y-a0-a1x)^2  \t (y-ym)^2\n');
              fprintf('         ______________________________________________________________________________________________________________________________\n'); 
           for i = 1 :n
           fprintf('\n\t%8.4f\t%8.4f\t%8.4f\t%8.4f\t%8.4f\t%8.4f\t%8.4f \t%8.4f  \n', x(i), y(i), xy(i), x2(i), Columna5(i), Columna6(i));   
         endfor
           fprintf('\n______________________________________________________________________________________________________________________________\n'); 
           fprintf('\nSUMA DE LAS COLUMNAS\n');
           fprintf('\n______________________________________________________________________________________________________________________________\n'); 
           fprintf('\nx=%8.4f \ny=%8.4f \nxy=%8.4f \nx^2=%8.4f \n(y-a0-a1x)^2=%8.4f \n(y-m)^2=%8.4f', xT, yT, xyT, x2T, Columna5T, Columna6T);
           fprintf('\n______________________________________________________________________________________________________________________________\n'); 
           fprintf('\nPROMEDIOS\n')
           fprintf('\nPromedio X=%8.4f, Promedio Y=%8.4f \n', xProm, yProm)
           fprintf('\n______________________________________________________________________________________________________________________________\n'); 
           fprintf('\nValores: a0=%8.4f , a1=%8.4f', a0, a1);
           if a1 < 0
             fprintf('\n______________________________________________________________________________________________________________________________\n'); 
             fprintf('\nECUACION: y=%8.4f %8.4f x', a0, a1);
             fprintf('\n______________________________________________________________________________________________________________________________\n');  
           else 
             fprintf('\n______________________________________________________________________________________________________________________________\n'); 
             fprintf('\nECUACION: y=%8.4f + %8.4f x', a0, a1);
             fprintf('\n______________________________________________________________________________________________________________________________\n');  
           endif   
           fprintf('\nSr: %8.4f', Sr);
           fprintf('\nSyx-Error Estandar: %8.4f', Syx);
           fprintf('\n______________________________________________________________________________________________________________________________\n'); 
           fprintf('\nr^2-Coeficiente de Determinacion: %8.4f', r2);
           fprintf('\nr-Coeficiente de Correlacion: %8.4f', r);
           fprintf('\n______________________________________________________________________________________________________________________________\n'); 
      case 2
       
      case 3
       
      case 4 
      
      endswitch
   endwhile  
endfunction