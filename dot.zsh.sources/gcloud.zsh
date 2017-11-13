GCLOUD_DIR=/opt/google-cloud-sdk 
if [ -d "$GCLOUD_DIR" ]; then
  autoload -U compinit; compinit -u;

  source $GCLOUD_DIR/path.zsh.inc
  source $GCLOUD_DIR/completion.zsh.inc
fi

alias gcloud="pwd=`pwd`; cd $GCLOUD_DIR/bin; gcloud; cd $pwd"
