if status is-interactive
    # Commands to run in interactive sessions can go here
    atuin init fish | source
end

abbr --set-cursor -a gc 'git commit -m "%"'
abbr -a ga 'git add .'
abbr --set-cursor -a gca 'git commit -am "%"'
abbr -a gs 'git status'
abbr -a gsw 'git switch'
abbr -a gswc 'git switch -c'
abbr -a gl 'git log'
abbr -a gpl 'git pull'
abbr -a gph 'git push'
abbr -a gsl 'git shortlog'

abbr -a rf 'exec fish'
abbr -a rfc 'clear && exec fish'

abbr -a cda 'conda activate'
abbr -a cdd 'conda deactivate'

abbr -a db 'distrobox'
abbr -a dbc 'distrobox create'
abbr -a dbl 'distrobox list'
abbr -a dbe 'distrobox enter'
abbr -a dbs 'distrobox stop'
abbr -a dbr 'distrobox rm'

abbr -a pm 'podman'

abbr -a cm 'chezmoi'

abbr -a ts 'tailscale'
abbr -a tss 'tailscale status'
abbr -a tsip 'tailscale ip'
abbr -a tsup 'tailscale up'
abbr -a tsdown 'tailscale down'
abbr -a tssh 'tailscale ssh'

alias ls 'exa --icons --group-directories-first --classify --grid'
alias ll 'exa --icons --group-directories-first --classify --long --header --git'
alias lle 'exa --icons --group-directories-first --classify --long --header --git --extended'
# alias ll 'exa --icons --group-directories-first --classify --long --header --accessed --modified --time-style=default'
alias lst 'exa --icons --group-directories-first --classify --tree --level=2'
alias llt 'exa --icons --group-directories-first --classify --tree --level=2 --long --header --git'
alias llet 'exa --icons --group-directories-first --classify --tree --level=2 --long --header --git --extended'

# alias contiker 'podman run --privileged --sysctl net.ipv6.conf.all.disable_ipv6=0 --mount type=bind,source=/home/jens/repos/contiki-ng,destination=/home/user/contiki-ng -e DISPLAY=:0 -v/tmp/.X11-unix:/tmp/.X11-unix -v /dev/bus/usb:/dev/bus/usb -v /dev/ttyUSB0:/dev/ttyUSB0:rw --user root:root --userns keep-id --user 1000  -ti contiker/contiki-ng'

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# if not test -f /run/.containerenv 
#     eval /home/jens/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# end
# # <<< conda initialize <<<

set -x EDITOR /usr/bin/micro


function list_dir --on-variable PWD
  ls -GF
end

sleep 0.1

# if set -q ZELLIJ
   # conda activate base
   # conda deactivate
# else
   # zellij -l orin
# end

alias vim 'nvim'
if test -z "$TMUX" 
  if tmux ls &> /dev/null
    # set SESSION_AMOUNT (tmux ls | wc -l)
    # if test (echo $SESSION_AMOUNT) -gt 1
      # tmux ls
      # read -P 'Choose session to attach to: ' CHOSEN_SESSION
      # tmux attach-session -t $CHOSEN_SESSION
    # end
    echo 'Attaching to last session'
    tmux a
  else
    echo 'No tmux sessions, creating a new one'
    tmux
  end
end
