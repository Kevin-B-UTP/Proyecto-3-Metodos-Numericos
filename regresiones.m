%PROGRAMA DE LAS REGRESIONES%
%%Hecho por Kevin Brennan, Edwar Gonzalez, Guillermo Lezcano

## Guardar vectores en foma vertical EJEMPLO, antes de llamar la dunción : vector= [a; b; n];   n= número de elementos

## ejemplo de como usar la función

    ## >> regresión (matriz_x , matriz_y, #elementos ) matriz_x= valores de x, matriz_y = valores de y
    
function final= regresiones(x, y, n)
  clc;
  
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
              fprintf('\n                                              ___________________________________');
              fprintf('\n                                                      REGRESION LINEAL');
              fprintf('\n                                              ___________________________________\n');
              fprintf('\n              x     \t    y   \t    xy  \t    x^2\t  (y-a0-a1x)^2  \t (y-ym)^2\n');
              fprintf(' \n        _____________________________________________________________________________________________________\n'); 
           for i = 1 :n
           fprintf('\n\t%8.4f\t%8.4f\t%8.4f\t%8.4f\t%8.4f\t%8.4f\t%8.4f \t%8.4f  \n', x(i), y(i), xy(i), x2(i), Columna5(i), Columna6(i));   
         endfor
           ##fprintf('\n______________________________________________________________________________________________________________________________\n'); 
           ##fprintf('\nSUMA DE LAS COLUMNAS\n');
           ##fprintf('\n______________________________________________________________________________________________________________________________\n'); 
           ##fprintf('\nx=%8.4f \ny=%8.4f \nxy=%8.4f \nx^2=%8.4f \n(y-a0-a1x)^2=%8.4f \n(y-m)^2=%8.4f', xT, yT, xyT, x2T, Columna5T, Columna6T);
           ##fprintf('\n______________________________________________________________________________________________________________________________\n'); 
           ##fprintf('\nPROMEDIOS\n')
           ##fprintf('\nPromedio X=%8.4f, Promedio Y=%8.4f \n', xProm, yProm)
           ##fprintf('\n______________________________________________________________________________________________________________________________\n'); 
           ##fprintf('\nValores: a0=%8.4f , a1=%8.4f', a0, a1);
          
           ##fprintf('\nSr: %8.4f', Sr);
           ##fprintf('\nSyx-Error Estandar: %8.4f', Syx);
           
           fprintf(' \n        _____________________________________________________________________________________________________\n');  
           fprintf('\n\n                                           r^2-Coeficiente de Determinacion: %8.4f', r2);
           fprintf('\n                                              r-Coeficiente de Correlacion: %8.4f', r);
            if a1 < 0
             fprintf('\n                      ____________________________________________________________________________________\n'); 
             fprintf('\n                                               ECUACION: y=%8.4f %8.4f x', a0, a1);
             fprintf('\n______________________________________________________________________________________________________________________________\n');  
           else 
             fprintf('\n                      ____________________________________________________________________________________\n');
             fprintf('\n                                               ECUACION: y=%8.4f + %8.4f x', a0, a1);
             fprintf('\n                   -------------------------------------------------------------------------------------------\n');  
           endif   
          
          
           
  ## REGRESION POLINOMIAL DE SEGUNDO GRADO Y EXPONECIAL-----------------------------------------------------------------------------------         
           
  ## VARIABLES
  sumay = 0;
  sumax = 0;
  sumax_2 = 0;
  sumax_3 = 0;
  sumax_4 = 0;
  sumax_2_y = 0;
  sumax_y = 0;
  sumasUltimosValores=0;
  sumay_ym_2 = 0;
  sumalny=0;
  sumax_lny = 0;
  sumalny_p2 =0;
  final = "\tFIN";
  
  
  ## ENCABEZADO
      fprintf('\n\n\n\n                                                    !!==============================!!');
      fprintf('\n                                                      REGRESION POLINOMIAL 2DO GRADO');
      fprintf('\n                                                    !!==============================!!\n');
      fprintf('\n              x     \t    y   \t    x^2  \t    x^3\t           x^4  \t   x*y  \t  x^2*y  \t (y-ym)^2 \n');
      fprintf('         ______________________________________________________________________________________________________________________________\n'); 
   ## CALCULOS
   ## sumas
   for ciclo = 1 : n
       sumay   += y(ciclo) ;
       sumax   += x(ciclo) ;
   endfor
   ##ymedia
   ym = sumay / n ;
   
     ##for de 1 a n
    for ciclo = 1 : n
    ##Xs
      x_2 = x (ciclo) ^ 2;
      sumax_2 += x_2 ;
      x_3 = x (ciclo) ^ 3;
      sumax_3 += x_3 ;
      x_4 = x (ciclo) ^ 4;
      sumax_4 += x_4 ;
    ##x*y
     x_y   = x   (ciclo) * y (ciclo);
     sumax_y += x_y ;
     x_2_y = x_2         * y (ciclo);
     sumax_2_y += x_2_y  ;
    ##(y-ym)^2
     y_ym_2  = (y(ciclo)-ym)^2;
     sumay_ym_2 += y_ym_2;
 
     ##impresión
       
      fprintf('\n\t%8.4f\t%8.4f\t%8.4f\t%8.4f\t%8.4f\t%8.4f\t%8.4f \t%8.4f  \n', x(ciclo), y(ciclo), x_2, x_3, x_4,x_y,x_2_y, y_ym_2);
     
    endfor
    
    ## ESTA IMPRESIÓN ES PARA MOSTRAS LAS SUMAS DE LOS CALCULOS ( OPCIONAL )
    
        ##fprintf('         ______________________________________________________________________________________________________________________________\n'); 
        ##fprintf('\n                                                          SUMA DE LAS X:   %8.4f',sumax);
        ##fprintf('\n                                                          SUMA DE LAS Y:   %8.4f',sumay);
        ##fprintf('\n                                            _________________________________________________\n');
        ##fprintf('\n                                                        SUMA DE LAS X^2: %8.4f',sumax_2);
        ##fprintf('\n                                                        SUMA DE LAS X^3: %8.4f',sumax_3);
        ##fprintf('\n                                                        SUMA DE LAS X^4: %8.4f',sumax_4);
        ##fprintf('\n                                                        SUMA DE LAS X*Y: %8.4f',sumax_y);
        ##fprintf('\n                                                      SUMA DE LAS X^2*Y: %8.4f',sumax_2_y);
        ##fprintf('\n                                                   SUMA DE LAS (Y-YM)^2: %8.4f',sumay_ym_2);
        ##fprintf('\n                                                       _______________________________\n');
        ##fprintf('\n                                                             PROMEDIO Y: %8.4f',ym);
        ##fprintf('\n\n\n');
        ##fprintf('         ______________________________________________________________________________________________________________________________\n'); 
   
    ##MATRIZ
     
     matrizA         = [n , sumax, sumax_2 ; sumax, sumax_2, sumax_3 ;  sumax_2, sumax_3, sumax_4];
     matrizB         = [sumay; sumax_y; sumax_2_y];
     matrizRespuesta = [inv(matrizA)*matrizB];
     
     ##adquiriendo valores a0 a1 a2
     a0=matrizRespuesta(1);
     a1=matrizRespuesta(2);
     a2=matrizRespuesta(3);
     
     ## CALCULOS DE UTLIMO CUADRO
     fprintf('\n                                                           (y-a0-a1*x-a2*x^2)^2 ');
     fprintf('\n                                                    ___________________________________\n');
      
     for ciclo = 1 : n
        ultimoValor = (y(ciclo)-a0-a1*x(ciclo)-a2*x(ciclo)^2)^2;
       sumasUltimosValores += ultimoValor;
       
       ##coeficiente de determinación
       r2_p = (sumay_ym_2 - sumasUltimosValores)/ sumay_ym_2;
       
       fprintf('\n                                                                  %8.4f \n',ultimoValor);
     endfor
    ## (OPCIONAL)
    ##fprintf('\n                                                            ==================== \n');
    ##fprintf('\n                                                            Suma: %8.4f \n',sumasUltimosValores);
    fprintf('         ______________________________________________________________________________________________________________________________\n'); 
    fprintf('\n                                                               a0:   %8.4f',a0);
    fprintf('\n                                                               a1:   %8.4f',a1);
    fprintf('\n                                                               a2:   %8.4f\n',a2);
    fprintf('\n                                                              r^2:   %8.9f\n', r2_p);
    fprintf('\n                                                                r:   %8.9f\n\n',sqrt((sumay_ym_2 - sumasUltimosValores)/ sumay_ym_2));
    fprintf('\n                                         ecuación:   (%8.4f x^2) + (%8.4f x )+(%8.4f) \n',a2, a1, a0);
    fprintf('         ______________________________________________________________________________________________________________________________\n\n'); 
  
   
%% REGRESIÓN EXPONENCIAL ----------------
%%Variables
   lnyT=0;
   xLnyT=0;
   lnyp2T=0;
   ColumnaNo7Total=0;
%%Calculos para la 4ta y 5ta Columna
   for i = 1 : n
     %%
     lny(i) = log(y(i));
     xlny(i) = x(i)*log(y(i));
     lnyT += lny(i);
     xLnyT += xlny(i);     
   endfor 
   
%%Promedio de lny y sexta columna   
   lnyProm= lnyT/n;
   
for i = 1 : n
   lnyp2(i) = (lny(i)-lnyProm)^2;
   lnyp2T += lnyp2(i);
endfor 

%%Matrices
   mA         = [n , sumax; sumax, sumax_2];
   mB         = [lnyT; xLnyT];
   mT = [inv(mA)*mB];

LnA= mT(1);
b= mT(2);
eLnA= exp(LnA);

##Calculo para la 7ma Columna
for i = 1 : n
       ColumnaNo7(i) = (log(y(i)) - (LnA + b * x(i)))^2;
       ColumnaNo7Total += ColumnaNo7(i);
endfor
%%Calculo de los coeficientes
r2_e=  (lnyp2T - ColumnaNo7Total)/lnyp2T; 
r_e= sqrt(r2_e);

%%Impresion de la tabla y resultados
 fprintf('\n\n\n\n                                      =======================================');
      fprintf('\n                                               REGRESION EXPONENCIAL');
      fprintf('\n                                      =======================================\n');
      fprintf('\n             x     \t    y   \t    x^2  \t   lny \t          x * lny  \t(lny - p)^2 \t (ln y - (ln a+bx))^2');
      fprintf('\n     ________________________________________________________________________________________________________________________\n'); 
      for i= 1: n
      fprintf('\n\t%9.4f\t%9.4f\t%9.4f\t%9.4f\t%9.4f\t%9.4f\t%8.9f\n', x(i), y(i), x2(i), lny(i) , xlny(i) ,lnyp2(i), ColumnaNo7(i));
      endfor
 fprintf('         __________________________________________________________________________________________________________\n'); 
   fprintf('\n                                                ln(a):   %8.4f', LnA);
   fprintf('\n                                                   b :   %8.4f', b);
   fprintf('\n                                            e^(ln(a)):   %8.4f',eLnA);
   fprintf('\n                                                  r^2:   %8.9f',r2_e);
   fprintf('\n                                                    r:   %8.9f\n\n',r_e);
   fprintf('\n                                    ecuación:   %8.4f e^(%8.4f x) \n',eLnA, b);
   fprintf('         __________________________________________________________________________________________________________\n\n');   

  ##CONDICIONES PARA SABER CUAL ES EL MEJOR MÉTODO
  control = 0;
  if( r2 == r2_p)
    fprintf("\n\n ESTE PROBLEMA PUEDES RESOLVERLO POR POLINOMIAL Y LINEAL, (SE RECOMIENDA LINEAL, POR LA COMODIDAD)");
    control = 1;
  endif
  
  if(control != 1)
    if( r2 > r2_p && r2 > r2_e && r2 <= 1)
     fprintf("\n\n                SE RECOMIENDA UNA REGRESION LINEAL QUE CUENTA CON UN R^2 DE: %10.9f\n\n", r2);
     
    elseif( r2_p > r2 && r2_p > r2_e && r2 <= 1)
     fprintf("\n\n            SE RECOMIENDA UNA REGRESION POLINOMIAL DE 2DO GRADO QUE CUENTA CON UN R^2 DE: %10.9f \n\n", r2_p);
    else
     fprintf("\n\n               SE RECOMIENDA UNA REGRESION EXPONENCIAL QUE CUENTA CON UN R^2 DE: %10.9f \n\n", r2_e);
    endif
    endif     
endfunction
