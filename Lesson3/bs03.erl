-module(bs03).

-export(split/2).
-include_lib("eunit/include/eunit.hrl").

%%
%% bs03:Divide the line into parts, with an explicit delimiter  %%
%%
%% 1> BinText = <<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>.         %%
%% <<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>                       %%
%% 2> bs03:split(BinText, "-:-").                               %%
%% [<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>] %%
%%


%%     Test for split() function    %%
split_test() ->
    ?assertEqual([<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>] ,split(BinText, "-:-")),
    ok.
%%     Test for split() function    %%
