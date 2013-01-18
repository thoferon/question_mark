module QuestionMark.MatchersTest () where

import QuestionMark.Core
import QuestionMark.Matchers

errors = filter (Success/=) . concat $ [eqTests, gtTests, ltTests]

eqTests = [
  (3 `should` eq 3) `should` Matcher (Success==) "eq should match equivalent values",
  (3 `should` eq 4) `should` Matcher ((==) (Error "failed to equal the value")) "eq should return an error for different values"
  ]

gtTests = [
  (3 `should` gt 2) `should` Matcher (Success==) "gt should match with a lower value",
  (3 `should` gt 3) `should` Matcher ((==) (Error "failed to be greater")) "gt should fail with the same value",
  (3 `should` gt 4) `should` Matcher ((==) (Error "failed to be greater")) "gt should fail with a greater value"
  ]

ltTests = [
  (2 `should` lt 3) `should` Matcher (Success==) "lt should match with a greater value",
  (2 `should` lt 2) `should` Matcher ((==) (Error "failed to be lower")) "lt should fail with the same value",
  (2 `should` lt 1) `should` Matcher ((==) (Error "failed to be lower")) "lt should fail with a lower value"
  ]

