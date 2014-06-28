{-# OPTIONS_GHC -Wall #-}
{-# LANGUAGE KindSignatures, GeneralizedNewtypeDeriving #-}

module ApplicativeTransformers
    ( IdentityT(..)
    ) where

import Control.Applicative


newtype IdentityT (f :: * -> *) a = IdentityT { runIdentityT :: f a }
                                    deriving (Show, Functor, Applicative)
