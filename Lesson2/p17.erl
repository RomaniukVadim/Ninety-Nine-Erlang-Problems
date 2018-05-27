-module(p17).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([split/2]).
-include_lib("eunit/include/eunit.hrl").


%% Test for split() function   %%
split_test() ->
    ?assertEqual([[a,b,c], [d,e,f,g,h,i]], split([a,b,c,d,e,f,g,h,i], 3)),
    ?assertEqual([], split([], 3)),
    ?assertEqual([], split([a,b,c], 0)),
    ok.
%% Test for split() function   %%
