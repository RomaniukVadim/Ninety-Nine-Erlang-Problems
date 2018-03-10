-module(bs03).

-export([split/2]).
-include_lib("eunit/include/eunit.hrl").

%%
%% bs03:Divide the line into parts, with an explicit delimiter  %%
%%
%% 1> BinText = <<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>.         %%
%% <<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>                       %%
%% 2> bs03:split(BinText, "-:-").                               %%
%% [<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>] %%
%%

del_space(<<$\s, Rest/binary>>) ->
    del_space(Rest);
del_space(Rest) -> Rest.

%% Interface %%
split(Bin,Delimiter) ->
    split(del_space(Bin),list_to_binary(Delimiter),<<>>,[]).
%%
%% When no more raw binary (<<>>), in Acc last word, %%
%% in List all other split.                          %%
%%
split(<<>>,_,Acc,List) ->
    List++[<<Acc/binary>>];
%%
%% When we meet space ($\s), send rest binary to     %%
%% function, nullify Accumulator, Append Acc         %%
%% (Word before space) to list.                      %%
%%

split(Bin,Delimiter,Acc,List) ->
    DelSize = (byte_size(Delimiter)),
    case Bin of
	<<Delimiter:DelSize/binary, Rest/binary>> ->
	    split(Rest,Delimiter,<<>>,List++[<<Acc/binary>>]);
	<<X, Rest/binary>> ->
	    split(Rest,Delimiter,<<Acc/binary, X>>,List);	
	_ ->
	    split(Bin,Delimiter,Acc,List)
	end.
%%
%% Grab split here, create word (<<Acc>>) from symbols %%
%% that precede before delimiter.                      %%
%%


%%     Test for split() function    %%
split_test() ->
    ?assertEqual([<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>] ,split(<<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>, "-:-")),
    ok.
%%     Test for split() function    %%
