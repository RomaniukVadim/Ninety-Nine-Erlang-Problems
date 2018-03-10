-module(p14).

-export([duplicate/1]).
-include_lib("eunit/include/eunit.hrl").

%% (*) Duplicate the elements of a list. %%
%%
%% 1> p14:duplicate([a,b,c,c,d]). %%
%% [a,a,b,b,c,c,c,c,d,d]          %%
