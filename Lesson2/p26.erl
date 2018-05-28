-module(p26).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([combination/2]).
-include_lib("eunit/include/eunit.hrl").


%% Test for combination() function   %%
combination_test() ->
    ?assertEqual([[a,b,c], [a,b,d], [a,b,e] ... ], combination([a,b,c,d,e,f],3)),
    ok.
%% Test for combination() function   %%
