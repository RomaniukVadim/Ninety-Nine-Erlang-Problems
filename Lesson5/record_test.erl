-module(record_test).

-export([new/0,new/3]).
-export([get_field/2,set_field/3, get_index/1]).


-record(person, {name="Joe", gender, age=56}).

new() ->
    #person{}.

new(Name,Gender, Age) ->
    #person{name=Name, gender=Gender, age=Age}.

get_index(name) ->
    #person.name;
get_index(gender) ->
    #person.gender;
get_index(age) ->
    #person.age.


get_field(name,Record) ->
    Record#person.name;
get_field(gender, Record) ->
    Record#person.gender;
get_field(age, Record) ->
    Record#person.age.

set_field(name,Name,Record) ->
    Record#person{name=Name};
set_field(age,Age,Record) ->
    Record#person{age=Age};
set_field(gender,Gender,Record) ->
    Record#person{gender=Gender}.

