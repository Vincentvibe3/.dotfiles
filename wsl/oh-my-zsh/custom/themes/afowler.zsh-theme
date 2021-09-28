
# Color shortcuts
RED=$fg[red]
YELLOW=$fg[yellow]                                         
GREEN=$fg[green]
WHITE=$fg[white]
BLUE=$fg[blue]
RED_BOLD=$fg_bold[red]
YELLOW_BOLD=$fg_bold[yellow]
GREEN_BOLD=$fg_bold[green]
WHITE_BOLD=$fg_bold[white]
BLUE_BOLD=$fg_bold[blue]


if [ $UID -eq 0 ]; then CARETCOLOR="red"; else CARETCOLOR="blue"; fi

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{$BLUE_BOLD%}::: %{$GREEN%}%1~ $(git_prompt_info)%{$RESET_COLOR%} 
%{$BLUE%} » %{$reset_color%}'

RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}on \uE0A0 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"             
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}*"             
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"           
ZSH_THEME_GIT_PROMPT_CLEAN=""
