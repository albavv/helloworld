function [ECGdenoised] = denoise(ECG,fs)
%Funcion que realiza el preprocesado para limpiar de la señal de ECG.
%Comprende eliminacion de linea de base y eliminacion de ruido HF.
%Parametros de entrada:
%               -ecg_signal: se�al de ECG
%               -fs: frecuencia de muestreo de la señal de ECG               
%Parametros de salida:
%               -ECGdenoised: se�al después de eliminar parte de ruido
%Date:03_04_18
%Author: Rebeca Goya
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
%tama�o de la ventana del filtro de mediana de la BWcancell (sg)
TBWcancell = 0.8;
%Orden del filtro paso bajo
OLPF = 32;
%Frecuencia de corte del filtro paso bajo Hz
FCLPF = 50;

ECGdenoised = zeros(size(ECG));
aux = ECG;
% Eliminamos la linea de base
aux = detrendSpline(aux,fs,TBWcancell);

%FPB orden 32 y fc = 50 Hz para eliminar el ruido de alta frec.
%La frecuencia de corte del filtro hay que pasarsela normalizada.
%Toma valores entre 0 y 1 donde 1 corresponde a Fnyquist = fs/2.
B = fir1(OLPF,FCLPF/(fs/2));
aux = filtfilt(B,1,aux);
    
ECGdenoised = aux;
end