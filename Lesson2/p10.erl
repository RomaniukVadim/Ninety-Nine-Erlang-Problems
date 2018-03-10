-module(p10).

-export([encode/1]).
-include_lib("eunit/include/eunit.hrl").

%%
%%  (*) Run-length encoding of a list.           %%
%%
%% Use the result of problem P09 to implement    %%
%% the so-called run-length encoding data        %%
%% compression method. Consecutive duplicates of %%
%% elements are encoded as lists (N E) where N   %%
%% is the number of duplicates of the element E. %%
%%
%% 1> p10:encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e]). %%
%% [{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]         %%
%%

encode() ->
    ok.


%%   Test for encode() function     %%
encode_test() ->
    ?assertEqual([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}], encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e])),
    ?assertEqual([], encode([])),
    ok.
%%   Test for encode() function     %%
