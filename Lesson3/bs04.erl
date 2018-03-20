-module(bs04).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export(decode_xml/1).
-include_lib("eunit/include/eunit.hrl").

%%
%% bs04:Disassemble an XML document without attributes
%%
%% 1> BinXML = <<"<start><item>Text1</item><item>Text2</item></start>">>.
%% <<”<start><item>Text1</item><item>Text2</item></start>”>>
%% 2> bs04:decode_xml(BinXML).
%% {<<"start">>, [], [
%% {<<"item">>, [], [<<"Text1">>]},
%% {<<"item">>, [], [<<"Text2">>]}
%% ]}
%%

decode_xml() ->
    ok.

%%     Test for decode_xml() function    %%
decode_xml_test() ->
    ?assertEqual({<<"start">>, [], [{<<"item">>, [], [<<"Text1">>]},{<<"item">>, [], [<<"Text2">>]}]} ,decode_xml(<<"<start><item>Text1</item><item>Text2</item></start>">>)),
    ?assertEqual(<<>>, decode_xml(<<>>)),
    ok.
%%     Test for decode_xml() function    %%
