-module(p23).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([rnd_select/2]).
-include_lib("eunit/include/eunit.hrl").


%% Test for rnd_select() function   %%
rnd_select_test() ->
    ?assertEqual([e,d,a], rnd_select([a,b,c,d,e,f,g,h], 3)),
    ok.
%% Test for rnd_select() function   %%
