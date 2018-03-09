-module(p08).

-export([compress/1]).

%% (**) Eliminate consecutive duplicates of list elements. %%
%% If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed. %%

%% 1> p08:compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e]). %%
%% [a,b,c,a,d,e]                                   %%

reverse(L) ->
    reverse(L,[]).
reverse([],Tail) ->
    Tail;
reverse([H|T], Tail) ->
    reverse(T,[H|Tail]).



compress(List) ->
    compress(List,[]). %% Interface %%

compress([H|T],ListWithoutDub=[H|_]) ->
    compress(T,ListWithoutDub); %% If first raw list element like first element in ListWithoutdublicate %%

compress([H|T],ListWithoutDub) ->
    compress(T,[H|ListWithoutDub]); %% 

compress([],ListWithoutDub) ->
    reverse(ListWithoutDub). %% When list is empty. Return LastWithoutDublicate. %%
