-module(test).

-export([run/0, run/1]).

run() ->
    Modules = [p01, p02, p03, p04, p05, p06, p06, p07, p08, p09, p10, p11, p12, p13, p14, p15],
    Res = lists:map(fun(M) -> eunit:test(M) end, Modules),
    case Res of
        [ok,ok,ok,ok,ok,ok,ok,ok,ok,ok,ok,ok,ok,ok,ok] -> init:stop(0);
        _ -> init:stop(1)
    end.


run([M, F]) ->
    io:format("run test ~p:~p~n", [M, F]),
    Res = erlang:apply(M, F, []),
    io:format("result: ~p~n~n", [Res]),
    case Res of
        ok -> init:stop(0);
        error -> init:stop(1)
    end.
