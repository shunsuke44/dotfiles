#!/bin/bash
origext='.orig'

set -eu -o pipefail

machine=''
case "$(uname -s)" in
    Linux*) machine='linux';;
    Darwin*) machine='mac';;
    *) machine='unknown'
       echo 'not supported'
       exit 1
esac

files=('.bash_profile' '.bashrc' '.git-prompt.sh' '.tmux.conf' '.vimrc')

# install global dotfiles
echo 'installing global dotfiles...'
for fname in ${files[@]}; do
    absname="$(readlink -f $fname)"
    if [[ -f "$HOME/$fname" ]]; then
        mv "$HOME/$fname" "$HOME/${fname}${origext}"
    fi
    ln -s "$absname" "$HOME/$fname"
    echo "installed $fname"
done

exit 0

# # install local dotfiles
# echo 'installing local dotfiles...'
# localfiles=('.tmux.conf')
# localdir='local'
# case "$machine" in
#     'linux') localdir="$localdir/linux";;
#     'mac') localdir="$localdir/mac";;
#     'unknown') localdir=''
# esac
#
# if [[ "$localdir" ]]; then
#     echo "installing local dotfiles in $localdir ..."
#     for fname in ${localfiles[@]}; do
#         absname="$(readlink -f "$localdir/$fname")"
#         if [[ -f "$HOME/$fname" ]]; then
#             mv "$HOME/$fname" "$HOME/${fname}${origext}"
#         fi
#         ln "$absname" "$HOME/$fname"
#     done
# fi
#
# exit 0
