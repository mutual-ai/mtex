function ebsd = horzcat(varargin)
% overloads [ebsd1,ebsd2,ebsd3..]

ebsd = varargin{1};

for i = 2:length(varargin)
  
  for fn = fieldnames(ebsd.options)'
    cfn = char(fn);
    ebsd.options.(cfn) = vertcat(ebsd.options.(cfn),varargin{i}.options.(cfn));
  end
  ebsd.rotations = vertcat(ebsd.rotations,varargin{i}.rotations);
  ebsd.phases =  vertcat(ebsd.phases,varargin{i}.phases);
  
end