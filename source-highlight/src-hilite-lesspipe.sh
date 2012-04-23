#! /bin/sh

for source in "$@"; do
    case $source in
    *ChangeLog|*changelog) 
        source-highlight --failsafe -f esc --lang-def=changelog.lang --style-file=$HOME/.env/source-highlight/wombat.style -i "$source" ;;
    *Makefile|*makefile) 
        source-highlight --failsafe -f esc --lang-def=makefile.lang --style-file=$HOME/.env/source-highlight/wombat.style -i "$source" ;;
    *)
        source-highlight --failsafe --infer-lang -f esc --style-file=$HOME/.env/source-highlight/wombat.style -i "$source" ;;
    esac
done
