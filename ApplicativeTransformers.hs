{-# OPTIONS_GHC -Wall #-}
{-# LANGUAGE KindSignatures #-}

module ApplicativeTransformers
    ( IdentityT(..)
    ) where

import Control.Applicative


newtype IdentityT (f :: * -> *) a = IdentityT { runIdentityT :: f a } deriving (Show)

instance Functor f => Functor (IdentityT f) where
    fmap h (IdentityT f) = IdentityT $ fmap h f

instance Applicative f => Applicative (IdentityT f) where
    pure = IdentityT . pure
    (IdentityT h) <*> (IdentityT f) = IdentityT $ h <*> f
