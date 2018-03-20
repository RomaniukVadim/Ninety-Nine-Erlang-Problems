-module(p08).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([compress/1,compress_erlrus/1]).
-include_lib("eunit/include/eunit.hrl").

%%
%% (**) Eliminate consecutive duplicates of list elements. %%
%% If a list contains repeated elements they should be     %%
%% replaced with a single copy of the element. The order   %%
%% of the elements should not be changed.                  %%
%%
%% 1> p08:compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e]). %%
%% [a,b,c,a,d,e]                                   %%
%%

%% Reverse func from task p05.erl                  %%
%% Without reverse output will be in reverse order %%
reverse(L) ->
    reverse(L,[]).
reverse([],Tail) ->
    Tail;
reverse([H|T], Tail) ->
    reverse(T,[H|Tail]).
%% Reverse func from task p05.erl %%


compress(List) ->
    compress(List,[]). %% Interface %%

compress([H|T],ListWithoutDub=[H|_]) ->
    compress(T,ListWithoutDub); %% If first raw list element like first element in ListWithoutdublicate %%

compress([H|T],ListWithoutDub) ->
    compress(T,[H|ListWithoutDub]); %% 

compress([],ListWithoutDub) ->
    reverse(ListWithoutDub). %% When list is empty. Return LastWithoutDublicate. %%

%% without tail recursion
compress_erlrus([]) -> [];
compress_erlrus([A| [A | _] = Rest]) -> compress_erlrus(Rest);
compress_erlrus([A | Rest]) ->[A | compress_erlrus(Rest)].


%%   Test for compress() function     %%
flatten_test() ->
    ?assertEqual([a,b,c,a,d,e], compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e])),
    ?assertEqual([a,b,c,a,d,e], compress_erlrus([a,a,a,a,b,c,c,a,a,d,e,e,e,e])),
    ?assertEqual([], compress([])),
    ?assertEqual([], compress_erlrus([])),
    ok.
%%   Test for compress() function     %%
