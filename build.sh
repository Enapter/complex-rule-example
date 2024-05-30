#!/usr/bin/env bash

cd "$(dirname "$0")" || exit 1

# if luarocks avaialbe
if ! command -v luarocks &> /dev/null; then
    echo "luarocks is not installed, install it first"
    exit 1
fi

if [ ! -d "lua_modules" ]; then
  # Init luarocks inside the rule directory, it will put ./luarocks and ./lua wrappers into it
  luarocks --lua-version 5.3 init
fi

# Call a wrapper to run tests, it will install missing dependencies automatically
if ./luarocks test; then
  echo "Tests OK"
else
  echo "Some tests failed"
  exit 1
fi

mkdir -p build

# Compile all files into one
./lua_modules/bin/amalg.lua \
    -o build/main.lua \
    -p .amalg-header \
    -s enapter/main.lua \
    -- \
    $(find enapter -type f -name '*.lua' | sed 's/\.lua$//; s/\//./g')

# Test it
echo
echo "Amalg done, checking..."
./lua build/main.lua
