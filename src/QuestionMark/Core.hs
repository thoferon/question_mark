module QuestionMark.Core (
  Matcher(..),
  TestResult(..),
  should,
  (?)
  ) where

data Matcher a = Matcher (a -> Bool) String

data TestResult = Success | Error String
                  deriving(Show, Eq)

should :: a -> (Matcher a) -> TestResult

should pred (Matcher f msg)
            | f pred    = Success
            | otherwise = Error msg

(?) = should
