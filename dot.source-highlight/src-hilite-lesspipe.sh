#! /bin/sh

STYLE_FILE=
if [ -d "$HOME/.source-highlight-solarized" ]; then
    STYLE_FILE="$HOME/.source-highlight-solarized/esc-solarized.style"
else
    STYLE_FILE="$HOME/source-highlight/wombat.style"
fi

if [ -z "$STYLE_FILE" ]; then
  exit
fi

for source in "$@"; do
    case $source in
    *ChangeLog|*changelog) 
        source-highlight --failsafe -f esc --lang-def=changelog.lang --style-file=$STYLE_FILE -i "$source" ;;
    *Makefile|*makefile) 
        source-highlight --failsafe -f esc --lang-def=makefile.lang --style-file=$STYLE_FILE -i "$source" ;;
    *)
        source-highlight --failsafe --infer-lang -f esc --style-file=$STYLE_FILE -i "$source" ;;
    esac
done
