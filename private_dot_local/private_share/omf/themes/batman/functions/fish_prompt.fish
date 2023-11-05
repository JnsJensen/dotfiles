function fish_prompt
    test $status -ne 0
    and set -l colors d9b9af e3a0a2 ed8796
    or set -l colors afc2b7 9bcbc0 8bd5ca

    set -l pwd (prompt_pwd)
    set -l base (basename "$pwd")

    set -l expr "s|~|"(__batman_color_fst)"~"(__batman_color_off)"|g; \
               s|/|"(__batman_color_snd)"/"(__batman_color_off)"|g;  \
               s|"$base"|"(__batman_color_fst)$base(__batman_color_off)" |g"

    echo -n " ><> "

    echo -n (echo "$pwd" | sed -e $expr)(__batman_color_off)

    for color in $colors
        echo -n (set_color $color)">"
    end

    echo -n (__batman_color_off)" "
end
