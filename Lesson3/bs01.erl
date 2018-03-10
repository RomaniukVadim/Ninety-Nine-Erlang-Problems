-module(bs01).

-export([first_word/1]).

%%
%% bs01: Extract first word from text %%
%%
%% 1> BinText = <<"Some text">>.      %%
%% <<"Some Text">>                    %%
%% 2> bs01:first_word(BinText).       %%
%% <<"Some">>                         %%
%%

first_word() ->
    ok.

%%     Test for first_word() function    %%
first_word_test() ->
    ?assertEqual(<<"Some">>, first_word(<<"Some text">>)),
    ?assertEqual(<<"Other_test_without_spaces">>, first_word(<<"Other_test_without_spaces">>)),
    ?assertEqual(<<>>, first_word(<<>>)),
    ok.
%%     Test for first_word() function    %%

