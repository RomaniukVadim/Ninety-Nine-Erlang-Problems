-module(bs02).

-export([words/1]).
-include_lib("eunit/include/eunit.hrl").

%%
%% bs02: Split a string into words:                  %%
%%
%% 1> BinText = <<"Text with four words">>.          %%
%% <<"Text with four words">>                        %%
%% 2> bs02:words(BinText).                           %%
%% [<<"Text">>, <<"with">>, <<"four">>, <<"words">>] %%
%%

del_space(<<$\s, Rest/binary>>) ->
    del_space(Rest);
del_space(Rest) -> Rest.

%% Interface %%
words(Bin) ->
    words(del_space(Bin),<<>>,[]).
%%
%% When no more raw binary (<<>>), in Acc last word, %%
%% in List all other words.                          %%
%%
words(<<>>,Acc, List) ->
    List++[<<Acc/binary>>];
%%
%% When we meet space ($\s), send rest binary to     %%
%% function, nullify Accumulator, Append Acc         %%
%% (Word before space) to list.                      %%
%%
words(<<$\s, Rest/binary>>, Acc,List) ->
    words(Rest, <<>> ,List++[<<Acc/binary>>]);
%%
%% Grab words here, create word (<<Acc>>) from symbols %%
%% that precede before delimiter.                      %%
%%
words(<<X, Rest/binary>>,Acc,List) ->
    words(Rest, <<Acc/binary, X>>,List).
    
%%     Test for words() function    %%
words_test() ->
    ?assertEqual([<<"Text">>, <<"with">>, <<"four">>, <<"words">>], words(<<"Text with four words">>)),
    ?assertEqual([<<>>], words(<<>>)),
    ?assertEqual([<<"Text_with_four_words">>], words(<<"Text_with_four_words">>)),
    ok.
%%     Test for words() function    %%
