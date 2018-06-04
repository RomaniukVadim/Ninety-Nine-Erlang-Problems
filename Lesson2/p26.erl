-module(p26).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([combination/1]).
-include_lib("eunit/include/eunit.hrl").

combination([H|T]) ->
    combination(H,T,[]).
combination(_C,[],Acc)->
    Acc;
combination(C,L,Acc)->
    [H|T] = L,
    Acc1 = [[C,X] || X <- L],
    combination(H,T,Acc1 ++ Acc).

%% Test for combination() function   %%
combination_test() ->
    ?assertEqual([[e,f],[d,e],[d,f],[c,d],[c,e],[c,f],[b,c],[b,d],[b,e],[b,f],[a,b],[a,c],[a,d],[a,e],[a,f]], combination([a,b,c,d,e,f])),   ok.
%% Test for combination() function   %%
