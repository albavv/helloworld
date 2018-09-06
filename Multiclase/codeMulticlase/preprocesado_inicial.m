%% PREPROCESADO INICIAL
pacientes=dir('patient*');
for i=1:length(pacientes)
    load(pacientes(i).name);
    filtered_signal= denoise(patient.ecg(:,1),patient.fs);
    patient.filtered=filtered_signal;
%Deteccion de onda R
%    r=QRSsegment(filtered_signal,patient.fs);
%    patient.r=r
%     for k=1:length(r)
%         caracteristicas(k,:)=filtered_signal(r(k)-20:r(k)+20);
%     end
%    patient.caracteristicas=caracteristicas
   patient.filtered=filtered_signal;
   %save(['./patient' num2str(patient.name) '.mat'], 'patient');   
end
