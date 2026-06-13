# NOTE: https://just.systems

# just global settings
set quiet

# Systems information
FLAKE_HOST := "laptop"

# ANSI color codes
C_RED := "\\033[1;31m"
C_GREEN := "\\033[1;32m"
C_BLUE := "\\033[1;34m"
C_NONE := "\\033[0m"

default:
    just --list

safety app_name="zen-beta":
    #!/usr/bin/env bash
    if pgrep "{{ app_name }}" >/dev/null 2>&1; then
      printf "{{ C_RED }}   PKILL?  {{ C_NONE }} {{ app_name }} [y/N]: "
      read -r answer

      if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
        pkill {{ app_name }}
        printf "{{ C_RED }}  󱒼 KILLED  {{ C_NONE }} {{ app_name }}\n"
      else
        printf "{{ C_BLUE }}  󰜺 SKIPPED {{ C_NONE }} {{ app_name }}\n"
      fi
    fi

git:
    printf "{{ C_GREEN }}   GIT     {{ C_NONE }} *\n"
    git add -A

notify exit_code="0":
    #!/usr/bin/env bash
    ICON_PATH="{{ justfile_directory() }}/images/logos/nixos-colorful.png"

    IS_GUI_RUNNING() {
      pgrep "noctalia" &>/dev/null
    }

    # Warning notification
    if [[ "{{ exit_code }}" -ne 0 ]]; then
      printf "{{ C_RED }}   FAILED  {{ C_NONE }} Task\n" 
      if IS_GUI_RUNNING; then
        nix run nixpkgs#libnotify -- \
          --transient \
          -u critical \
          -a "System Task" \
          -i "$ICON_PATH" \
          "Task Failed (Code: {{ exit_code }})" \
          "The operation was aborted. Check your terminal for the error."
      fi
      exit {{ exit_code }}
    fi

    # Success notification
    printf "{{ C_GREEN }}   SUCCESS {{ C_NONE }} Task\n"
    if IS_GUI_RUNNING; then
      nix run nixpkgs#libnotify -- \
        --transient \
        -a "System Task" \
        -i "$ICON_PATH" \
        "Task Completed" \
        "The operation finished successfully without errors."
    fi
    exit 0

commit: git
    #!/usr/bin/env bash
    GEN=$(readlink /nix/var/nix/profiles/system | cut -d "-" -f 2)
    MESS="[ AUTO ] NixOS Generation $GEN"
    DESC="Saved latest generation $GEN at $(date -u +%Y-%m-%d\ %H:%M:%S)."

    if git diff --quiet --cached; then
      printf "{{ C_BLUE }}   SKIPPED  {{ C_NONE }} Auto-commit\n"
      exit 0
    fi

    git commit -m "$MESS" -m "$DESC" &>/dev/null
    printf "{{ C_GREEN }}   COMMIT  {{ C_NONE }} Latest Generation\n"

push:
    printf "{{ C_BLUE }}   PUSH    {{ C_NONE }} *\n"
    git push -v

specialisation spec_name="Virtualisation" host=FLAKE_HOST: safety git
    printf "{{ C_BLUE }}   SPECIAL {{ C_NONE }} NixOS#{{ host }}\n"
    nh os test {{ justfile_directory() }}/hosts/{{ host }} --specialisation {{ spec_name }} -H {{ host }} && just notify 0 || just notify $?

switch host=FLAKE_HOST: safety git
    printf "{{ C_BLUE }}  󰟁 SWITCH  {{ C_NONE }} NixOS#{{ host }}\n"
    nh os switch {{ justfile_directory() }}/hosts/{{ host }} -H {{ host }} && just notify 0 && just commit || just notify $?

boot host=FLAKE_HOST: safety git
    printf "{{ C_BLUE }}  󰜉 BOOT    {{ C_NONE }} NixOS#{{ host }}\n"
    nh os boot {{ justfile_directory() }}/hosts/{{ host }} -H {{ host }} && just notify 0 && just commit || just notify $?

test host=FLAKE_HOST: safety git
    printf "{{ C_BLUE }}  󰙨 TEST    {{ C_NONE }} NixOS#{{ host }}\n"
    nh os test {{ justfile_directory() }}/hosts/{{ host }} -H {{ host }} && just notify 0 || just notify $?

dry host=FLAKE_HOST: safety git
    printf "{{ C_BLUE }}   DRY     {{ C_NONE }} NixOS#{{ host }}\n"
    nh os build {{ justfile_directory() }}/hosts/{{ host }} -H {{ host }} --dry && just notify 0 || just notify $?

update host=FLAKE_HOST: safety git
    #!/usr/bin/env bash
    printf "{{ C_BLUE }}   UPDATE  {{ C_NONE }} lazy.nvim\n"
    NVIM_APPNAME=lvim nvim --headless "+Lazy! sync" +qa &>/dev/null

    printf "{{ C_BLUE }}   UPDATE  {{ C_NONE }} vim.pack\n"
    nvim --headless +"lua vim.pack.update()" +w +qa &>/dev/null

    printf "{{ C_BLUE }}  󰟁 UPDATE  {{ C_NONE }} NixOS#{{ host }}\n"
    if nh os switch {{ justfile_directory() }}/hosts/{{ host }} -H {{ host }} --update; then
      just notify 0
    else
      just notify $?
      exit 1
    fi

    if pgrep "noctalia" >/dev/null 2>&1; then
      printf "{{ C_RED }}   RESTART? {{ C_NONE }} noctalia [Y/n]: "
      read -r answer
      if [[ "$answer" != "y" && "$answer" != "Y" ]]; then
        printf "{{ C_BLUE }}  󰜺 SKIPPED {{ C_NONE }} noctalia\n"
      else
        pkill "noctalia"
        nohup noctalia >/dev/null 2>&1 &
        printf "{{ C_BLUE }}   RESTART {{ C_NONE }} noctalia\n"
        sleep 3
      fi
    fi

    just commit
