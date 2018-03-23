-module(bs03).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([split/2,split_erlrus/2]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.
%%
%% bs03:Divide the line into parts, with an explicit delimiter  %%
%%
%% 1> BinText = <<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>.         %%
%% <<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>                       %%
%% 2> bs03:split(BinText, "-:-").                               %%
%% [<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>] %%
%%

%% Delete spaces before first word.                  %%
%%
del_space(<<$\s, Rest/binary>>) ->
    del_space(Rest);
del_space(Rest) -> Rest.
%%
%% Interface %%
split(Bin,Delimiter) ->
    split(del_space(Bin),list_to_binary(Delimiter),<<>>,[]).
%%
%% When no more raw binary (<<>>), in Acc last word, %%
%% in List all other split.                          %%
%%
split(<<>>,_,Acc,List) ->
    List++[<<Acc/binary>>];

split(Bin,Delimiter,Acc,List) ->
    DelSize = (byte_size(Delimiter)),
    case Bin of
%%
%% When we meet delimiter, send rest binary to     %%
%% function, nullify Accumulator, Append Acc         %%
%% (Word before space) to list.                      %%
%%

	<<Delimiter:DelSize/binary, Rest/binary>> ->
	    split(Rest,Delimiter,<<>>,List++[<<Acc/binary>>]);
%%
%% Grab split here, create word (<<Acc>>) from symbols %%
%% that precede before delimiter.                      %%
%%

	<<X, Rest/binary>> ->
	    split(Rest,Delimiter,<<Acc/binary, X>>,List);	
%% Other
	_ ->
	    split(Bin,Delimiter,Acc,List)
	end.


split_erlrus(Bin, Delim) when Delim =/= <<>> ->
    split_erlrus(Bin, Delim, byte_size(Delim), [<<>>]).

split_erlrus(Bin, Delim, N, [AccCurrent | AccRest] = Acc) ->
    case Bin of
        <<Delim:N/binary, Rest/binary>> ->
	    split_erlrus(Rest, Delim, N, [<<>> | Acc]);
        <<C:1/binary, Rest/binary>> ->
	    split_erlrus(Rest, Delim, N, [<<AccCurrent/binary, C/binary>>| AccRest]);
        _ -> lists:reverse(Acc)
    end.



-ifdef(TEST).
%%     Test for split() function         %%
split_test() ->
    ?assertEqual([<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>] ,split(<<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>, "-:-")),
    ?assertEqual([<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>] ,split(<<"Col1-Col2-Col3-Col4-Col5">>, "-")),
    ?assertEqual([<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>] ,split(<<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>, "-:-")),
    ?assertEqual([<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>] ,split(<<"Col1Test TestCol2Test TestCol3Test TestCol4Test TestCol5">>, "Test Test")),
    ?assertEqual([<<>>] ,split(<<>>, "-:-")),
%%    Test for split() function           %%
%%
%%    Test for split_erlrus() function    %%
    ?assertEqual([<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>] ,split_erlrus(<<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>, <<"-:-">>)),
    ?assertEqual([<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>] ,split_erlrus(<<"Col1-Col2-Col3-Col4-Col5">>, <<"-">>)),
    ?assertEqual([<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>] ,split_erlrus(<<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>, <<"-:-">>)),
    ?assertEqual([<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>] ,split_erlrus(<<"Col1Test TestCol2Test TestCol3Test TestCol4Test TestCol5">>, <<"Test Test">>)),
    ok.
%%     Test for split_erlrus() function    %%
-endif.
