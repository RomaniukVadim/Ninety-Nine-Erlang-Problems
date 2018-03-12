-module(p13).

-export([decode/1]).
-include_lib("eunit/include/eunit.hrl").

%%
%% (**) Run-length encoding of a list (direct solution). %%
%%
%% Implement the so-called run-length encoding data      %%
%% compression method directly. I.e. don't explicitly    %%
%% create the sublists containing the duplicates, as in  %%
%% problem P09, but only count them. As in problem P11,  %%
%% simplify the result list by replacing the singleton   %%
%% lists (1 X) by X.                                     %%
%%
%% 1> p13:decode([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]). %%
%% [a,a,a,a,b,c,c,a,a,d,e,e,e,e]                         %%
%%
%% When list is empty, return empty list.                %%
decode([])->
    [];
%% When first element is tuple of two element and count  %%
%% equal two. Return list of two elements.               %%
decode([{2,X}|[]])->
    [X,X];
%% When first element is tuple of two element and count  %%
%% unknown.                                              %%
decode([{Count,X}|[]])->
    [X|decode([{Count-1,X}])];
%% When first element is tuple of two element, count     %%
%% equal two,but with tail. Return list, where head is   %%
%% our element and Tail is list of element and recurse.  %%
decode([{2,X}|T])->
    [X|[X|decode(T)]];
%%
decode([{Count,X}|T])->
    [X|decode([{Count-1,X}|T])];
%%
decode([H|[{Count,X}|T]])->
    [H|decode([{Count,X}|T])];
%% When we have only one element in head, and tail is
%% empty list.
decode([H|[]])->
    [H].



%%   Test for decode() function     %%
decode_test() ->
    ?assertEqual([{4,a},b,{2,c},{2,a},d,{4,e}], decode([a,a,a,a,b,c,c,a,a,d,e,e,e,e])),
    ?assertEqual([], decode([])),
    ok.
%%   Test for decode() function     %%
