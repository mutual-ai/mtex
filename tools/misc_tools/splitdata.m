function ind = splitdata(pl,n)
% make n - partitions of a sorted list by its mean, returns its indices

if issorted(pl)
  r = 0;
elseif issorted(flipud(pl(:)));
  r = 1;
else
  error('requires sorted input')
end

n = 1:n;
n = sum(2.^n)+1;

pk{1} = pl;
ind{1} = 1:length(pl);
ps{1} = 0;
for k=1:n %pseudo recursion
  [pk{end+1} pk{end+2} ind{end+1} ind{end+2} ps{end+1} ps{end+2}] = split(pk{k},ps{k},r);
end
ind = ind(end-n:end);
ind(cellfun('isempty',ind)) = [];

function [s1 s2 ind1 ind2 low up] = split(s,ps,r)

m = mean(s);

if r
  ind1 = s >  m;
  ind2 = s <= m;
else
  ind1 = s <  m;
  ind2 = s >= m;
end
s1 = s( ind1 );
s2 = s( ind2 );

ind1 = find(ind1)+ps;
ind2 = find(ind2)+ps;

if ~isempty(ind1)
  low = ind1(1)-1;
  up = ind1(end);
else
  low = ps;
  up = ps;
end
