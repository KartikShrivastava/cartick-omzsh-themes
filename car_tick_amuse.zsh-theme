# vim:ft=zsh ts=2 sw=2 sts=2

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX=" b: %{$FG[177]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg_bold[red]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"

VIRTUAL_ENV_DISABLE_PROMPT=0

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  echo -n " venv: %{$fg_bold[blue]%}"
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

# Virtualenv: current working virtualenv
prompt_virtualenv() {
  if [[ -n "$VIRTUAL_ENV" && -n "$VIRTUAL_ENV_DISABLE_PROMPT" ]]; then
    prompt_segment black blue "(${VIRTUAL_ENV:t:gs/%/%%})%{$reset_color%}"
  fi
}

PROMPT='
%{$FG[029]%}%~%{$reset_color%}$(git_prompt_info)$(prompt_virtualenv) t: %{$FG[244]%}%*%{$reset_color%}
%{$FG[082]%}$%{$reset_color%} '

RPROMPT='$(ruby_prompt_info)'
