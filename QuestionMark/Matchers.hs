module QuestionMark.Matchers (
  eq,
  (?=)
  ) where

import QuestionMark.Core

eq :: (Eq a) => a -> Matcher a
eq val = Matcher ((==) val) "failed to equal the value"

(?=) :: (Eq a) => a -> a -> TestResult
(?=) pred val = pred `should` eq val
