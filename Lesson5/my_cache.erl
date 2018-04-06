-module(my_cache).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([create/0,insert/3,lookup/1,delete_obsolete/0]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

create() ->
    try ets:new(?MODULE,[named_table]) of
	?MODULE -> ok
    catch
	error:badarg ->
	    {error, already_created}
    end.

insert(Key,Value,TimeToLive) ->
    ExpTime = TimeToLive + current_time(),
    try ets:insert(?MODULE,{Key,Value,ExpTime}) of
	true -> ok
    catch
	error:badarg ->
	    {error,no_exist}
    end.

lookup(Key) ->
    Now = current_time(),
    try ets:select(?MODULE, [{{'$1','$2','$3'},[{'>','$3',Now},{'=:=','$1',Key}],['$$']}])
    of
	[Value] -> {ok, Value};
	[] -> {error, undefined}
    catch
	error:badarg ->
	    {error,not_exist}
    end.
	     
delete_obsolete() ->
    Now = current_time(),
    try
	ets:select_delete(?MODULE,[{{'$_','$_','$3'},[{'=<','$3',Now}],['$$']}])
    of
	_ -> ok
    catch
		error:badarg -> {error, not_exists}
    end.

current_time() ->
	calendar:datetime_to_gregorian_seconds(calendar:local_time()).

-ifdef(TEST).
my_cache_test() ->
    ok.
-endif.

%% 1. Написать библиотеку для кеширования:
%% ok = my_cache:create().
%%
%% Создание кеш-таблицы
%% ok = my_cache:insert(Key, Value, 600). %% Ключ, Значение, Время жизни записи
%%
%% {ok, Value} = my_cache:lookup(Key).
%% Получить значение по ключу, функция
%% должна доставать только НЕ устаревшие данные
%%
%% ok = my_cache:delete_obsolete().
%% Очистка утстаревших данных


% EtsId = ets:new(TableName, Opts).
% true = ets:insert(EtsId, ObjectOrObjects).
% [Object] = ets:lookup(EtsId, Key).
% true = ets:delete(EtsId).
% persons = ets:new(persons, [public, named_table]).
% true = ets:insert(persons, {key1, value1}).
% [{key1, value1}] = ets:lookup(persons, key1).
% true = ets:delete(persons).
