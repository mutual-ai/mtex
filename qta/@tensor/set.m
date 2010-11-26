function T = set(T,pName,pValue)
% set properties of a tensor variable
%
%% Syntax
%  T = set(T,'mineral','mineral name')  
% 
%% Input
%  T      - @tensor
%  pName  - property name
%  pValue - property value
%
%% Output
%
%% See also
% tensor/get


switch pName

  case 'CS'
    
    M = transformationMatrix(T.CS,pValue);
    T = rotate(T,M);
    T.CS = pValue;
  
  case fields(T)
    
    T.(pName) = pValue;
    
  case fields(T.properties)
  
    T.properties.(pName) = pValue;
    
end