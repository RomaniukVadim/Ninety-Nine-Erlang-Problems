-module(p16).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([drop/2]).
-include_lib("eunit/include/eunit.hrl").


%% Test for drop() function   %%
drop_test() ->
    ?assertEqual([a,b,d,e,g,h,k], drop([a,b,c,d,e,f,g,h,i,k], 3)),
    ?assertEqual([a,b,c], drop([a,b,c], 0)),
    ok.
%% Test for drop() function   %%
