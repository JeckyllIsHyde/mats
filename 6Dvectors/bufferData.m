classdef bufferData < handle
   properties
       data = [];
   end
   properties (SetAccess = private)
       pointer = 0;
   end
   methods
       function BD = bufferData(nSize,dim)
           BD.data = zeros(nSize,dim);
       end
       function append(BD,d)
           BD.pointer = BD.pointer+1;
           BD.data(BD.pointer,:) = d;
       end
       function ptr = getPointer(BD)
           ptr = BD.pointer;
       end
   end
end