#!/bin/bash

current=$(ibus engine)

if [ "$current" = "xkb:us::eng" ]; then
    ibus engine xkb:ir::fas
else
    ibus engine xkb:us::eng
fi
