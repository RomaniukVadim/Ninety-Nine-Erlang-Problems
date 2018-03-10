-module(p15).

-export([replicate/2]).
-include_lib("eunit/include/eunit.hrl").

%% (**) Replicate the elements of a list a given number of times. %%
%% 
%% 1> p15:replicate([a,b,c], 3). %%
%% [a,a,a,b,b,b,c,c,c]           %%


replicate() ->
    ok.

%% Test for replicate() function   %%
replicate_test() ->
    ?assertEqual([a,a,a,b,b,b,c,c,c], replicate([a,b,c], 3)),
    ?assertEqual([], replicate([], 3)),
    ok.
%% Test for replicate() function   %%

