function array = find_edge22(input)
[~,c] = size(input);
temp = input(1);
array = zeros(1,50);
n = 1;
for i = 1:c
    if ((temp~=input(i))&&((temp==0)||(input(i)==0)))
        array(n) = i;
        n = n + 1;
    end
    temp = input(i);
end
end