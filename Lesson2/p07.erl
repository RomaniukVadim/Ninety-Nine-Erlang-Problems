-module(p07).

-export([flatten/1]).
-include_lib("eunit/include/eunit.hrl").

%%
%% (**) Flatten a nested list structure. %%
%% Transform a list, possibly holding    %%
%% lists as elements into a flat list by %%
%% replacing each list with its elements %%
%%                        (recursively). %%
%%
%% 1> p07:flatten([a,[],[b,[c,d],e]]).   %%
%% [a,b,c,d,e]                           %%
%%

flatten(List) ->
    flatten(List, []). %% Main interface. %%

flatten([[]|T],FlattenList) ->
    flatten(T,FlattenList);
%% When first element of list - emply list. %%

flatten([[_|_]=H|T],FlattenList) ->
    flatten(T,flatten(H,FlattenList));
%% When element is nested list. %%

flatten([H|T],FlattenList) ->
    flatten(T,FlattenList++[H]);
%% http://erlang.org/doc/efficiency_guide/listHandling.html %%

flatten([],FlattenList) ->
    FlattenList.
%% When no element in list. Return our FlattenList. %%


%%   Test for flatten() function     %%
flatten_test() ->
    ?assertEqual([a,b,c,d,e], flatten([a,[],[b,[c,d],e]])),
    ?assertEqual([a,b,c,d,e], flatten([a,[],[b,[c,[e,[[[b]]]],d],e]])),
    ?assertEqual([a,b,c,d,e], flatten([a,b,c,d,e])),
    ?assertEqual([], flatten([])),
    ok.
%%   Test for flatten() function     %%
