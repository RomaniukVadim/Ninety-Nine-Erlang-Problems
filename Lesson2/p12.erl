-module(p12).

-export([decode_modified/1]).
-include_lib("eunit/include/eunit.hrl").

%%
%% (**) Decode a run-length encoded list.                 %%
%% Given a run-length code list generated as specified in %%
%% problem P11. Construct its uncompressed version.       %%
%%
%% 1> p12:decode_modified([{4,a},b,{2,c},{2,a},d,{4,e}]). %%
%% [a,a,a,a,b,c,c,a,a,d,e,e,e,e]                          %%
%%

decode_modified() ->
    ok.

%%   Test for decode_modified() function     %%
decode_modified_test() ->
    ?assertEqual([a,a,a,a,b,c,c,a,a,d,e,e,e,e], decode_modified([{4,a},b,{2,c},{2,a},d,{4,e}])),
    ?assertEqual([], decode_modified([{4,a},b,{2,c},{2,a},d,{4,e}])),
    ok.
%%   Test for decode_modified() function     %%

