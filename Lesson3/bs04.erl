-module(bs04).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([decode_xml/1]).
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
decode_xml(Xml) ->
	decode_xml(Xml, []). % переходим к двум аргум

decode_xml(Xml, Word) ->
	case Xml of
		<<"</", Rest/binary>> ->
			bracket_close( Rest, <<>>, Word);
		<<"<",Rest/binary>> ->
			bracket_open( Rest, <<>>, Word);
		<<>> -> []
	end.

bracket_close(<<">",Rest/binary>>, Acc, [Acc|Word]) ->
	decode_xml(Rest, Word);

bracket_close(<<X,Rest/binary>>, Acc, Word) ->
	bracket_close(Rest, <<Acc/binary,X>>, Word).


bracket_open(<<"</", Rest/binary>>, Acc, [Bracket|Word]) ->
	[{Bracket, [], [Acc]} | bracket_close(Rest, <<>>, [Bracket|Word]) ];
%%
%%         if "<" write to tuple                                                                        %%
%%
bracket_open(<<"<", Rest/binary>>, <<>>, [Bracket|Word]) ->
	{Bracket, [], decode_xml(<<"<",Rest/binary>>, [Bracket|Word]) }; 

bracket_open(<<">",Rest/binary>>, Acc, Word) ->
	bracket_open(Rest, <<>>, [Acc|Word]);
 
bracket_open(<<X, Rest/binary>>, Acc, Word) ->
    bracket_open(Rest, <<Acc/binary,X>>, Word).

