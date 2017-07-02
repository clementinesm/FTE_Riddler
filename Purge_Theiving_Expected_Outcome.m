clear;
clc;

n_households = 1000;
init = 100 * diag(ones(n_households));

for i = 1:n_households
    for j = 1:n_households - 1
        if j >= i
            j = j + 1;
        end
        init(i) = init(i) + init(j)/(n_households - 1);
        init(j) = init(j)*(n_households - 2)/(n_households - 1);
    end
end

plot(init)