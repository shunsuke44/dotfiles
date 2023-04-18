#!/bin/bash
origext='.orig'

set -eu -o pipefail

# except this script
for fname in $(git ls-files | grep -v install.sh); do
    absname="$(readlink -f $fname)"
    echo $absname
    if [[ -f "$HOME/$fname" ]]; then
        mv "$HOME/$fname" "$HOME/${fname}${origext}"
    fi
    ln "$absname" "$HOME/$fname"
done
