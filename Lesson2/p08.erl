-module(p08).

-export([compress/1]).

%% (**) Eliminate consecutive duplicates of list elements. %%
%% If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed. %%

%% 1> p08:compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e]). %%
%% [a,b,c,a,d,e]                                   %%

%%

but_last([_,_]=L) ->
    L;
but_last([_H|T]) ->
    but_last(T).

%%

compress(List) ->
    compress(List,[]). %% Interface %%

compress([H|_T]=[H,H|Rest],ListWithoutDub=[H|_]) ->
    compress(Rest,ListWithoutDub); %% If first element of ListWithoutDublicate equal first element from raw list, don't add this element %%

%%compress([H|_],but_last(ListWithoutDub)=[H,H|_]) ->
%%    ListWithoutDub; %%

compress([H|T],ListWithoutDub =[H|_]) ->
    compress(T,ListWithoutDub); %%

compress([H|_T]=[H,H|Rest],ListWithoutDub) ->
    compress(Rest,ListWithoutDub++[H]); %% If raw list have the same second element, send to function the rest after two elements %%

compress([H|T],ListWithoutDub) ->
    compress(T,ListWithoutDub++[H]); %%

compress([],ListWithoutDub) ->
    ListWithoutDub. %% When list is empty. Return LastWithoutDublicate. %%
