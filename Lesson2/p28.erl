-module(p28).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([lsort/1]).
-include_lib("eunit/include/eunit.hrl").

lsort([])->
    [];
lsort([H|T]) ->
    lsort(H,T,[],[]).

lsort(P,[],Left,Right) ->
    lsort(Left) ++ [P] ++ lsort(Right);
lsort(P,[H|T],Left,Right) when length(H) >= length(P) ->
    lsort(P,T,Left,[H|Right]);
lsort(P,[H|T],Left,Right) ->
    lsort(P,T,[H|Left],Right).

%% Test for lsort() function   %%
lsort_test() ->
    ?assertEqual([[o],[d,e],[m,n],[d,e],[a,b,c],[f,g,h],[i,j,k,l]], lsort([[a,b,c],[d,e],[f,g,h],[d,e],[i,j,k,l],[m,n],[o]])),
    ok.
%% Test for lsort() function   %%
