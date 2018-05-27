-module(p18).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([slice/2]).
-include_lib("eunit/include/eunit.hrl").


%% Test for replicate() function   %%
replicate_test() ->
    ?assertEqual([c,d,e,f,g], slice([a,b,c,d,e,f,g,h,i,k],3,7)),
    ?assertEqual([a,b,c,d,e,f,g,h,i,k], replicate(slice([a,b,c,d,e,f,g,h,i,k],1,10)),
    ?assertEqual([], replicate([], 2,4)),
    ok.
%% Test for replicate() function   %%
