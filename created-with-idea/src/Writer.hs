module Writer where

import           Data.Aeson

import           Types

instance ToJSON Subject where
  toEncoding = genericToEncoding defaultOptions

instance FromJSON Subject

instance ToJSON Day where
  toEncoding = genericToEncoding defaultOptions

instance FromJSON Day

instance ToJSON TimeInterval where
  toEncoding = genericToEncoding defaultOptions

instance FromJSON TimeInterval

instance ToJSON Schedule where
  toEncoding = genericToEncoding defaultOptions

instance FromJSON Schedule

instance ToJSON Course where
  toEncoding = genericToEncoding defaultOptions

instance FromJSON Course
