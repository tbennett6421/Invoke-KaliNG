## Default loading point

## Load other files
if [ -f /root/.my_zsh_custom/.proxy ]; then
    source /root/.my_zsh_custom/.proxy
fi
if [ -f /root/.my_zsh_custom/.my_sh_vars ]; then
    source /root/.my_zsh_custom/.my_sh_vars
fi
if [ -f /root/.my_zsh_custom/.my_sh_aliases ]; then
    source /root/.my_zsh_custom/.my_sh_aliases
fi
if [ -f /root/.my_zsh_custom/.my_sh_functions ]; then
    source /root/.my_zsh_custom/.my_sh_functions
fi
if [ -f /root/.my_zsh_custom/.my_sh_env ]; then
    source /root/.my_zsh_custom/.my_sh_env
fi
if [ -f /root/.my_zsh_custom/.my_sh_prompt ]; then
    source /root/.my_zsh_custom/.my_sh_prompt
fi
