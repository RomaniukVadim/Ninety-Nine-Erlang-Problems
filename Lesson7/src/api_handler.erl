-module(api_handler).

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).


init(_Transport, Req, []) ->
	{ok, Req, undefined}.

handle(Req, State) ->
	{Method, Req2} = cowboy_req:method(Req),
	HasBody = cowboy_req:has_body(Req2),
	{ok, Req3} = parce_date(Method, HasBody, Req2),
	{ok, Req3, State}.

terminate(_Reason, _Req, _State) ->
	ok.

parce_date(<<"POST">>, true, Req) ->
	{ok, PostVals, Req2} = cowboy_req:body_qs(Req),
	[{BinJson, true}] = PostVals,
	Json = jsx:decode(BinJson),
	Action = proplists:get_value(<<"action">>, Json),
	
	RB = case perform_action(Action, Json) of
		{ok, Ok} -> jsx:encode([<<"ok">>, Ok]);
		{error, Error} -> jsx:encode([<<"error">>, Error])
	end,
	cowboy_req:reply(200, [
		{<<"content-type">>, <<"text/plain; charset=utf-8">>}
	], RB, Req2);	
	

parce_date(<<"POST">>, false, Req) ->
	cowboy_req:reply(400, [], <<"Missing body.">>, Req);

parce_date(_, _, Req) ->
	cowboy_req:reply(405, Req).



perform_action(<<"insert">>, Json)->
	Key = proplists:get_value(<<"key">>, Json),
	Value = proplists:get_value(<<"value">>, Json),
	storage:insert(Key, Value);

perform_action(<<"lookup">>, Json) ->
	Key = proplists:get_value(<<"key">>, Json),
	storage:lookup(Key);

perform_action(<<"lookup_by_date">>, Json) ->
	DateFrom = proplists:get_value(<<"date_from">>, Json),
	DateTo = proplists:get_value(<<"date_to">>, Json),
	storage:lookup_by_date(DateFrom, DateTo);

perform_action(_, _)->{error, ["No Method"]}.


