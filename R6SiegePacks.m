% Code by Gannon McCollum
%
% This is a brief script that will determine the expected number of games to be played
% per R6 Siege pack earned.

winChance = 0.6;
startingOdds = 0.02;
winBonus = 0.02;
lossBonus = 0.015;
gamesPlayed = 0; 


for i = 1:100000  % Earn 10,000 packs
    wonPack = 0;  % By default, we haven't won a pack yet (0).
    gamesPlayed
    while wonPack == 0  % Execute this as long as you haven't won a pack on the current attempt
        gamesPlayed = gamesPlayed + 1;
        winOrLoseGame = rand;  % Use this to determine if we won or lost the game
        if winOrLoseGame < winChance  % Here is a WIN
            winOrLoseRoll = rand;  % Now we get to roll
            if winOrLoseRoll < startingOdds % If we win, add a pack (and break the while loop)
                wonPack = 1;
                startingOdds = 0.02;  % Revert the starting odds to original value
            else  % If we lose, give the .02 win bonus and play again
                startingOdds = startingOdds + winBonus;
            end
        else % Here is a LOSS
            startingOdds = startingOdds + lossBonus;
        end
    end
end
