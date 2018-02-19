%% Compare Shock Simulations in Stationarized and Unit-Root Models
%
% In this m-file, we show that the three model versions (stationarized and
% unit-root) have identical shock responses.
%


%% Clear the Workspace
%
% Clear all variables, close all figure windows, clear command window, and
% check the IRIS version.
%

clear
close all
clc
irisrequired 20180209


%% Load the Three Model Objects
%
% Load all three versions of the model created in |read_model|:
%
% * |m1| is the stationarized version, 
% * |m2| is the unit-root version solved around a point on the
% balanced-growth path where productivity |A=1|, 
% * |m3| is the unit-root version solved around a point on the
% balanced-growth path where productivity |A=2|.

load MAT/read_model.mat m1 m2 m3


%% Simulate a Productivity Shock
%
% Simulate the same shock, |u|,  in the three versions of the model.
%

d1 = sstatedb(m1, 1:40);
d1.u(1) = 0.10;
s1 = simulate(m1, d1, 1:40);
s1 = dbextend(d1, s1);

d2 = sstatedb(m2, 1:40);
d2.u(1) = 0.10;
s2 = simulate(m2, d2, 1:40);
s2 = dbextend(d2, s2);

d3 = sstatedb(m3, 1:40);
d3.u(1) = 0.10;
s3 = simulate(m3, d3, 1:40);
s3 = dbextend(d3, s3);

%% Plot the Productivity Shock Responses
%
% Plot the responses in the same variables (or their transformations) for
% all three model versions.
%

dbplot(s1, 0:40, {'y', 'c', 'i', 'r', 'k', 'dA'}, 'Tight=', true);
le = visual.hlegend('Top', 'Productivity Shock Simulation');
title(le, ['Model m1 ', comment(m1)]);

dbplot(s2, 0:40, {'Y/A', 'C/A', 'I/A', 'r', 'K/A', 'dA'}, 'Tight=', true);
le = visual.hlegend('Top', 'Productivity Shock Simulation');
title(le, ['Model m2 ', comment(m2)]);

dbplot(s3, 0:40, {'Y/A', 'C/A', 'I/A', 'r', 'K/A', 'dA'}, 'Tight=', true);
le = visual.hlegend('Top', 'Productivity Shock Simulation');
title(le, ['Model m3 ', comment(m3)]);


%% Compare Numerically the Shock Responses
% 
% Display the numerical values and their differences for stationarized
% output |y| from the three simulated models.
%

disp([ s1.y, s2.Y/s2.A, s2.y, s3.Y/s3.A, s3.y ])
disp([ s2.Y/s2.A-s1.y, s2.y-s1.y, s3.Y/s3.A-s1.y, s3.y-s1.y])
maxabs([ s2.Y/s2.A-s1.y, s2.y-s1.y, s3.Y/s3.A-s1.y, s3.y-s1.y])


%% Unit-Root Responses
%
% In models |m2| and |m3|, the responses inthe unit-root variables (note
% that the shock has permanent effect on all of them) can be obtained
% directly.
%

dbplot(d2 & s2, 0:40, {'Y', 'C', 'I', 'r', 'K', 'dA'}, 'Tight=', true);
le = visual.hlegend('Top', 'No Shock', 'Shock Simulation');
title(le, ['Model m2 ', comment(m2)]);

dbplot(d3 & s3, 0:40, {'Y', 'C', 'I', 'r', 'K', 'dA'}, 'Tight=', true);
le = visual.hlegend('Top', 'No Shock', 'Shock Simulation');
title(le, ['Model m2 ', comment(m2)]);


%% Show Variables and Objects Created in This File

whos


%% Get Help on IRIS Functions Used in This File
%
%    help model/sstatedb
%    help model/simulate
%    help data/dbextend
%    help data/dbplot
%    help visual/hlegend
%
