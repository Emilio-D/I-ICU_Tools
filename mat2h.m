%************************************************************************
%*  function mat2c(fich, var1, [var2, ..., varn])                       *
%************************************************************************
% Parametros de entrada:                                                *
%   * fich -> nombre del fichero que se desea convertir (incluyendo la  *
%             extension .mat).                                          *
%   * var1, [var2, ... varn] -> nombre de las variables a incluir en    *
%                               referencia.c. Si no se indica nada, se  *
%                               incluye la variable 'referencia'.       *
% Parametros de salida: ninguno.                                        *   
%************************************************************************
%  * Guarda las variables incluidas en el .mat "fich" como valores      *
%    separados por comas en un fichero .c llamdo referencia.c           *
%************************************************************************
%* Ejemplos de utilización:                                             *
%       mat2c('referencia.mat', 'referencia');                          *
%       mat2c('datos.mat', 'referencia', 'perturbacion');               *
%************************************************************************
%*   Creado: 19/12/2015    *    Ultima modificacion: 02/03/2016 (CLG)   *
%************************************************************************
function mat2c(fich, varargin )

if nargin < 1; 
    fich = './referencia.mat'; 
    if nargin < 2; 
        varargin{1} = 'referencia'; 
    end
end
S = load(fich);
aux_fn = './auxiliar.txt'; % fichero auxiliar con csv
file_name = 'E:\Senales_TFM\ADS5294_samples.h'; % nombre del fichero en que se guardará

% escribir el fichero referencia.c con el formato adecuado
fid = fopen(file_name,'w'); 
fprintf(fid, '#include <stdint.h>\n'); 

field_name = fieldnames(S);
for i = 1:length(field_name)
    aux = getfield(S, field_name{i});
    if size(aux,1) == 1 % Timeseries
        aux2 = [aux.Time'; aux.Data']; 
        aux = aux2;   
    end
      
    for j = 2:size(aux, 1)
        dato = aux(j,:); 
        % es necesario escribir los datos en un fichero csv intermedio
        csvwrite(aux_fn, dato);
        % leer valores separados por comas
        fid_aux = fopen(aux_fn, 'r');
        texto = fgets(fid_aux);
        fclose(fid_aux);
        if length(varargin) >= j-1
            if strcmp(varargin{j-1},'referencia')
                fprintf(fid, 'static const int16_t %s[] = { %s }; \n', varargin{j-1}, texto(1:end-1));
            else
                fprintf(fid, 'static const uint16_t %s[] = { %s }; \n', varargin{j-1}, texto(1:end-1));
            end
        else
            error('No se ha especificado el nombre de la variable');
        end
    end
end

fclose(fid);

% eliminar el fichero auxiliar
delete(aux_fn); 

