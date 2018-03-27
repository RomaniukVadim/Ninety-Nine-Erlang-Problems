-module(my_cache).
-export([create/0,insert/3,lookup/1,delete_obsolete/0]).

create() ->
    try ets:new(cache,[named_table]) of
	cache -> ok
    catch
	error:badarg ->
	    {error, already_created}
    end.

insert(Key,Value,TimeToLive) ->
    ExpTime = TimeToLive + current_time(),
    try ets:insert(cache,{Key,Value,ExpTime}) of
	true -> ok
    catch
	error:badarg ->
	    {error,no_exist}
    end.

lookup(Key) ->
    Now = current_time(),
    try ets:select(cache, [{{'$1','$2','$3'},[{'>','$3',Now},{'=:=','$1',Key}],['$$']}])
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
	ets:select_delete(cache,[{{'$_','$_','$3'},[{'=<','$3',Now}],['$$']}])
    of
	_ -> ok
    catch
		error:badarg -> {error, not_exists}
    end.

current_time() ->
	calendar:datetime_to_gregorian_seconds(calendar:local_time()).

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
