module Main where

import qualified Data.List          as List
import           Data.Map           (Map)
import qualified Data.Map           as Map
import           Data.Maybe
import           Data.Set           (Set, fromList, union)
import qualified Data.Set           as Set

import           Text.Pretty.Simple

import           Builder
import           Types

import Control.Arrow

main :: IO ()
main = pPrint courses





justNatural :: Integer -> Maybe Integer
justNatural x
  | x > 0 = Just x
  | otherwise = Nothing

justEven :: Integer -> Maybe Integer
justEven x
  | x `mod` 2 == 0 = Just x
  | otherwise = Nothing





morning = TimeInterval 10 12

noon = TimeInterval 11 13

afternoon = TimeInterval 12 14

mondayMorning = Schedule Monday morning

mondayNoon = Schedule Monday noon

mondayAfternoon = Schedule Monday afternoon

thursdayMorning = Schedule Thursday morning

thursdayNoon = Schedule Thursday noon

thursdayAfternoon = Schedule Thursday afternoon

filoMorning = Course Filo $ fromList [mondayMorning, thursdayMorning]

filoNoon = Course Filo $ fromList [mondayNoon, thursdayNoon]

polNoon = Course CsPoliticas $ fromList [mondayNoon, thursdayNoon]

polAfternoon = Course CsPoliticas $ fromList [mondayAfternoon, thursdayAfternoon]

courses = [filoMorning, filoNoon, polNoon, polAfternoon]

offer = courseOffersOf courses

validPossibilities = [[filoMorning, polAfternoon]]
