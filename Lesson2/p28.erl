-module(p28).
-author('Romaniuk Vadim <romaniuk.cv@gmail.com>').
-export([lsort/1]).
-include_lib("eunit/include/eunit.hrl").


%% Test for lsort() function   %%
lsort_test() ->
    ?assertEqual([[o], [d,e], [d,e], [m,n], [a,b,c], [f,g,h], [i,j,k,l]], lsort([[a b c], [d ,e], [f,g,h], [d,e],[i,j,k,l], [m,n], [o]]).,
    ok.
%% Test for lsort() function   %%
