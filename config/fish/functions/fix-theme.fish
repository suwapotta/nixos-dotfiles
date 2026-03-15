function fix-theme
    set -l FIX_PATH "$HOME/nixos-dotfiles/config/zen/themingFix.css"
    set -l FIX_IMPORT "@import \"$FIX_PATH\";"

    for PROFILE in ~/.config/zen/*/chrome/userChrome.css
        if test -f "$PROFILE"
            sed -i "\|$FIX_IMPORT|d" "$PROFILE"
            echo $FIX_IMPORT >>"$PROFILE"
        end
    end

    echo "Success!"
end
