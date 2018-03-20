-module(bs01).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([first_word/1]).
-include_lib("eunit/include/eunit.hrl").

%%
%% bs01: Extract first word from text           %%
%%
%% 1> BinText = <<"Some text">>.                %%
%% <<"Some Text">>                              %%
%% 2> bs01:first_word(BinText).                 %%
%% <<"Some">>                                   %%
%%
%% \s - space                                   %%
%%
%% if first symbol in binary is space,          %%
%% function delete him.                         %%
%% Example: <<" Some text">> to <<"Some text">> %%
%%

del_space(<<$\s, Rest/binary>>) ->
    del_space(Rest);
del_space(Rest) -> Rest.

%% 

%% Interface %%
first_word(Bin) ->
    first_word(del_space(Bin), <<>>).

first_word(<<>>, Acc) ->
    Acc;
%% return Accumulator if binary is empty.
first_word(<<$\s, _/binary>>, Acc) ->
    Acc;
%% return Accumulator if binary is space.
first_word(<<X, Bin/binary>>, Acc) ->
    first_word(Bin, <<Acc/binary, X>>).
%% Add byte to Acc until X is space.


%%     Test for first_word() function    %%
first_word_test() ->
    ?assertEqual(<<"Some">>, first_word(<<"Some text">>)),
    ?assertEqual(<<"Some">>, first_word(<<"  Some text">>)),
    ?assertEqual(<<"Some_text">>, first_word(<<" Some_text">>)),
    ?assertEqual(<<"Other_test_without_spaces">>, first_word(<<"Other_test_without_spaces">>)),
    ?assertEqual(<<>>, first_word(<<>>)),
    ok.
%%     Test for first_word() function    %%

