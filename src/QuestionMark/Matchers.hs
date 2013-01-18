module QuestionMark.Matchers (
  eq,
  gt,
  lt,
  (?=),
  (?<),
  (?>),
  ) where

import QuestionMark.Core

eq :: (Eq a) => a -> Matcher a
eq val = Matcher ((==) val) "failed to equal the value"

gt :: (Ord a) => a -> Matcher a
gt val = Matcher (\pred -> pred > val) "failed to be greater"

lt :: (Ord a) => a -> Matcher a
lt val = Matcher (\pred -> pred < val) "failed to be lower"

-- Helper for operators
matchWith :: (a -> Matcher a) -> a -> a -> TestResult
matchWith matcher pred arg = pred `should` matcher arg

-- Operators as aliases of eq, lt, gt, ...
(?=) :: (Eq a) => a -> a -> TestResult
(?=) = matchWith eq

(?>) :: (Ord a) => a -> a -> TestResult
(?>) = matchWith gt

(?<) :: (Ord a) => a -> a -> TestResult
(?<) = matchWith lt
