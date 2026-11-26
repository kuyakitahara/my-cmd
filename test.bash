#!/bin/bash
# SPDX-FileCopyrightText: 2026 Kuya Kitahara
# SPDX-License-Identifier: BSD-3-Clause

ng () {
        echo "${1}行目のテスト失敗"
        res=1
}

res=0

### NORMAL INPUT (DOUBLE OUT) ###
out=$(echo 170 | ./darts-out)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "T20 T20 BULL" ] || ng "$LINENO"

out=$(echo 100 | ./darts-out -d)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "T20 D20" ] || ng "$LINENO"

out=$(echo 169 | ./darts-out)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "NO OUT" ] || ng "$LINENO"

### NORMAL INPUT (MASTER / STRAIGHT OUT) ###
out=$(echo 180 | ./darts-out -m)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "T20 T20 T20" ] || ng "$LINENO"

out=$(echo 20 | ./darts-out -s)
[ "$?" = 0 ] || ng "$LINENO"
[ "${out}" = "S20" ] || ng "$LINENO"

### MULTIPLE LINES INPUT ###
out=$(printf "40\n170\n" | ./darts-out)
[ "$?" = 0 ] || ng "$LINENO"
expected=$(printf "D20\nT20 T20 BULL")
[ "${out}" = "${expected}" ] || ng "$LINENO"

### STRANGE INPUT ###
out=$(echo あ | ./darts-out)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./darts-out)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo 0 | ./darts-out)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo -10 | ./darts-out)
[ "$?" = 1 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo 40 | ./darts-out -m -s)
[ "$?" = 2 ] || ng "$LINENO"
[ "${out}" = "" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
