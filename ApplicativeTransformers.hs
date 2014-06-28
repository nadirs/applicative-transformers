{-# OPTIONS_GHC -Wall #-}
{-# LANGUAGE KindSignatures, GeneralizedNewtypeDeriving #-}

module ApplicativeTransformers
    ( IdentityT(..)
    , mapIdentityT
    ) where

import Control.Applicative


newtype IdentityT (f :: * -> *) a = IdentityT { runIdentityT :: f a }
                                    deriving (Show, Functor, Applicative)

mapIdentityT :: (f a -> g b) -> IdentityT f a -> IdentityT g b
mapIdentityT h = IdentityT . h . runIdentityT
