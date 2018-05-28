-module(p27).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([group3/1]).
-include_lib("eunit/include/eunit.hrl").


%% Test for group3() function   %%
group3_test() ->
    ?assertEqual([ [ [aldo,beat] [carla,david,evi] [flip,gary,hugo,ida] ] ... ], group3([aldo,beat,carla,david,evi,flip,gary,hugo,ida])),
    ok.
%% Test for group3() function   %%
