#!/bin/zsh

PS3=""
select name in a b c;

do
    echo "\t" You selected $name.
    break
done
