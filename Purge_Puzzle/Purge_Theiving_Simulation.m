clear;
clc;

n_households = 1000;
n_trials = 1000;

total_winnings = 0 * diag(ones(n_households));
winnings = diag(ones(n_households));
for i = 1:n_trials
    winnings(:) = 100;
    for j = 1:n_households
        choice = random('unid',n_households - 1);
        if choice >= j
            choice = choice + 1;
        end
        winnings(j) = winnings(j) + winnings(choice);
        winnings(choice) = 0;
    end
    total_winnings = total_winnings + winnings;
end

average_winnings = total_winnings / n_trials;
plot(average_winnings)
