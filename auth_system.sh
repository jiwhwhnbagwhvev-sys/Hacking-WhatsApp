#!/bin/bash

DATA="auth_data.tmp"

PASSWORDS=(
"NeonBlade99"
"RootMaster77"
"GalaxyKey88"
"Phantom404"
"SilentRoot66"
"Quantum55"
"CloudKey22"
"Matrix99"
"FutureRoot11"
"CyberKing77"
)

touch $DATA

NOW=$(date +%s)

if [ ! -s "$DATA" ]; then
  INDEX=$((RANDOM % 10))
  echo "$NOW:$INDEX" > $DATA
fi

LAST=$(cut -d: -f1 $DATA)
INDEX=$(cut -d: -f2 $DATA)

DIFF=$(( (NOW - LAST) / 86400 ))

if [ $DIFF -ge 21 ]; then
  INDEX=$((RANDOM % 10))
  echo "$NOW:$INDEX" > $DATA
fi

echo "${PASSWORDS[$INDEX]}"
