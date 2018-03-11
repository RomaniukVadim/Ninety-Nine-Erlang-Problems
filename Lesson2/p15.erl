-module(p15).

-export([replicate/2]).
-include_lib("eunit/include/eunit.hrl").

%% (**) Replicate the elements of a list a given number of times. %%
%% 
%% 1> p15:replicate([a,b,c], 3). %%
%% [a,a,a,b,b,b,c,c,c]           %%
%%
%% Reverse func from task p05.erl %%
reverse(L) ->
    reverse(L,[]).
reverse([],Tail) ->
    Tail;
reverse([H|T], Tail) ->
    reverse(T,[H|Tail]).
%% Reverse func from task p05.erl %%
%%
%% Interface                      %%
replicate(L,Num) ->
    replicate(L,Num,Num,[]).
%% When we count to zero, set increment to Num %%
replicate([_H|T],Num,0,DupList) ->
    replicate(T,Num,Num,DupList);
%% Some kind of Dark Magick, append first Head elements %%
%% until increment is zero.                             %%
replicate([H|T],Num,Inc,DupList) ->
   [H|replicate([H|T],Num,Inc-1,DupList)];
%% When raw list is empty, send replicate List          %%
replicate([],_,_,L) ->
    reverse(L).


%% Test for replicate() function   %%
replicate_test() ->
    ?assertEqual([a,a,a,b,b,b,c,c,c], replicate([a,b,c], 3)),
    ?assertEqual([a,a,a,a,a,b,b,b,b,b,c,c,c,c,c], p15:replicate([a,b,c], 5)),
    ?assertEqual([], replicate([], 3)),
    ?assertEqual([], replicate([a,b,c], 0)),
    ok.
%% Test for replicate() function   %%

