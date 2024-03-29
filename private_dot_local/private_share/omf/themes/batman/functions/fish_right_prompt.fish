function git::is_stashed
  command git rev-parse --verify --quiet refs/stash >/dev/null
end

function git::get_ahead_count
  echo (command git log 2> /dev/null | grep '^commit' | wc -l | tr -d " ")
end

function git::branch_name
  command git symbolic-ref --short HEAD
end

function git::is_touched
  test -n (echo (command git status --porcelain))
end

function fish_right_prompt
  set -l code $status
  test $code -ne 0; and echo (__batman_color_dim)"("(__batman_color_trd)"$code"(__batman_color_dim)") "(__batman_color_off)

  if test -n "$SSH_CONNECTION"
     printf (__batman_color_trd)":"(__batman_color_dim)"$HOSTNAME "(__batman_color_off)
   end

  if git rev-parse 2> /dev/null
    git::is_stashed; and echo (__batman_color_trd)"^"(__batman_color_off)
    printf (__batman_color_snd)"("(begin
      if git::is_touched
        echo (__batman_color_trd)"*"(__batman_color_off)
      else
        echo ""
      end
    end)(__batman_color_fst)(git::branch_name)(__batman_color_snd)(begin
      set -l count (git::get_ahead_count)
        if test $count -eq 0
          echo ""
        else
          echo (__batman_color_trd)"+"(__batman_color_fst)$count
        end
    end)(__batman_color_snd)") "(__batman_color_off)
  end

  set -l expr "s|\.|"(__batman_color_trd)"."(__batman_color_fst)"|g"
  set -l pmexpr "s|podman|pm|g"
  set -l dexpr "s|docker|dk|g"

  set -l system "cont"
  if test -f /run/.containerenv
    if test -n "$DISTROBOX_ENTER_PATH"
      set system "db"
    end
    if test -n "$container"
      set system "$system."(echo "$container" | sed -e $pmexpr | sed -e $dexpr)
    end
    if test -n "$CONTAINER_ID"
      set system "$system.$CONTAINER_ID"
    end
    printf (__batman_color_snd)"("(__batman_color_fst)(echo "$system" | sed -e $expr)(__batman_color_snd)")"(__batman_color_off)" "
  end
    #  else
    #    set system "host"
    #  end


  # printf (__batman_color_dim)(date +%H(__batman_color_fst):(__batman_color_dim)%M(__batman_color_fst):(__batman_color_dim)%S)(__batman_color_off)" "
  printf (__batman_color_dim)(date +%H(__batman_color_fst):(__batman_color_dim)%M)(__batman_color_off)" "
end
