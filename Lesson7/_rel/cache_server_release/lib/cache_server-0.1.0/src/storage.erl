-module(storage).

-include_lib("stdlib/include/ms_transform.hrl").

-record(mycache,{key, value, dt=calendar:local_time()}).

-export([insert/2, lookup/1, lookup_by_date/2]).


insert(Key, Value)->
	State = ets:new(mycache, [public, named_table, {keypos, #mycache.key}]),
	
	Data = #mycache{key=Key, value=Value},
	case ets:info(mycache) of
		undefined -> {error, State};
		_else ->
			NewState = ets:insert(mycache, Data),		
			{ok, NewState}
	end.

lookup(Key)->
	case ets:lookup(mycache, Key) of
		[]->{error, Key};
		[{_, _, R, {{_, _, _},{_, _, _}}}] -> R,
		{ok, R}
		

end.	


lookup_by_date(DateFrom, DateTo)->
	case ets:select(mycache, ets:fun2ms(fun(N=#mycache{dt=C})
		       when C >= DateFrom, C =< DateTo->
		                N
		   end))of
	[]->{error, "No Data"};
	[{_, _, Value, {{_, _, _},{_, _, _}}}] ->Value,
	{ok, Value}
end.
	
