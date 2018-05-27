-module(p21).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([insert_at/2]).
-include_lib("eunit/include/eunit.hrl").


%% Test for insert_at() function   %%
insert_at_test() ->
    ?assertEqual([d,e,f,g,h,a,b,c], insert_at([a,b,c,d], alfa, 2)),
    ?assertEqual([g,h,a,b,c,d,e,f], insert_at([a,b,c,d,e,f,g,h], -2)),
    ?assertEqual([], insert_at([], 2)),
    ok.
%% Test for insert_at() function   %%
