-module(bs02).

-export(words/1).
-include_lib("eunit/include/eunit.hrl").

%%
%% bs02: Split a string into words:                  %%
%%
%% 1> BinText = <<"Text with four words">>.          %%
%% <<"Text with four words">>                        %%
%% 2> bs02:words(BinText).                           %%
%% [<<"Text">>, <<"with">>, <<"four">>, <<"words">>] %%
%%


words() ->
    ok.

%%     Test for words() function    %%
words_test() ->
    ?assertEqual([<<"Text">>, <<"with">>, <<"four">>, <<"words">>], words(<<"Text with four words">>)),
    ?assertEqual([<<>>], words(<<>>)),
    ?assertEqual([<<"Text_with_four_words">>], words(<<"Text_with_four_words">>)),
    ok.
%%     Test for words() function    %%
