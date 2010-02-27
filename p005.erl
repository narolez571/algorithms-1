%% Problem
%% ---------------------
%% 2520 is the smallest number that can be divided by each of the numbers from 1 to 10
%% without any remainder.
%%
%% What is the smallest number that is evenly divisible by all of the numbers from 1 to 20?
%% ---------------------

-module(p005).
-include_lib("eunit/include/eunit.hrl").

%% Solution
%% ---------------------
%% Inspired by:
%% http://basildoncoder.com/blog/2008/06/10/project-euler-problem-5/
%% ---------------------

find(Max) -> lists:foldl(fun lcm/2, 1, lists:seq(1, Max)).

lcm(A, B) -> (A * B) div gcd(A, B).

gcd(A, B) when A < B -> gcd(B, A);
gcd(A, 0) -> A;
gcd(A, B) -> gcd(B, A rem B).


%% Tests

gcd_test() ->
    ?assertEqual(6, gcd(84, 18)).

lcm_test() ->
    ?assertEqual(12, lcm(4, 6)).

find_10_test() ->
    ?assertEqual(2520, find(10)).

find_20_test() ->
    ?assertEqual(232792560, find(20)).

%% Solution from bitRAKE
%% ---------------------
%% This does not require programming at all. Compute the prime factorization of each number from 1
%% to 20, and multiply the greatest power of each prime together: 
%%
%% 20 = 2^2 * 5 
%% 19 = 19 
%% 18 = 2 * 3^2 
%% 17 = 17 
%% 16 = 2^4 
%% 15 = 3 * 5 
%% 14 = 2 * 7 
%% 13 = 13 
%% 11 = 11 
%%
%% All others are included in the previous numbers. 
%%
%% ANSWER: 2^4 * 3^2 * 5 * 7 * 11 * 13 * 17 * 19 = 232,792,560
%% ---------------------