export PHPVM_DIR="/home/gary/.phpvm"
export PATH="$PHPVM_DIR/bin:$PATH"
if [[ -s "$PHPVM_DIR/phpvm.sh" ]]; then
  source "$PHPVM_DIR/phpvm.sh"
fi