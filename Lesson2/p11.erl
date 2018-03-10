-module(p11).

-export(encode_modified/1).
-include_lib("eunit/include/eunit.hrl").

%%
%% (*) Modified run-length encoding.                      %%
%% Modify the result of problem P10 in such a way that if %%
%% an element has no duplicates it is simply copied into  %%
%% the result list. Only elements with duplicates are     %%
%% transferred as (N E) lists.                            %%
%%
%% 1> p11:encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e]). %%
%% [{4,a},b,{2,c},{2,a},d,{4,e}]                          %%
%%

encode_modified() ->
    ok.


%%   Test for encode_modified() function     %%
encode_modified_test() ->
    ?assertEqual([{4,a},b,{2,c},{2,a},d,{4,e}], encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e])),
    ?assertEqual([], encode_modifies([])),
    ok.
%%   Test for encode_modified() function     %%
