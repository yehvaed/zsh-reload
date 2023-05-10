# https://wiki.zshell.dev/community/zsh_plugin_standard#zero-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# https://z.digitalclouds.dev/community/zsh_plugin_standard#funtions-directory
if [[ $PMSPEC != *f* ]] {
  fpath+=( "${0:h}/functions" )
}

reload () {
  export ZSH_RELOADED=true
  echo "🚀 reloading zshrc..." 
  exec zsh
}

[[ -n "${ZSH_RELOADED}" ]] && unset ZSH_RELOADED