-- >>> :section Visible type applications

-- >>> :type read
-- >>> :set -fprint-explicit-foralls
-- >>> :type read
-- >>> read "42" :: Int
-- >>> :set -XTypeApplications
-- >>> read @Int "42"
-- >>> :type it

main = undefined
