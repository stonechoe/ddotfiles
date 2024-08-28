# For Linux

# git config
echo "[user]
	email = choems@outlook.com
	name = Minseok Choe
[push]
	autoSetupRemote = true
[url \"ssh://git@github.com/\"]
	insteadOf = https://github.com/" > ~/.gitconfig
	

echo '🍺  Installing Homebrew'
git clone https://github.com/Homebrew/brew homebrew
eval "$(homebrew/bin/brew shellenv)"
brew update --force --quiet
chmod -R go-w "$(brew --prefix)/share/zsh"

echo '💰  Installing oh-my-zsh'
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo 'eval "$($HOME/homebrew/bin/brew shellenv)"' >> ".profile"
echo 'eval "$($HOME/homebrew/bin/brew shellenv)"' >> ".zprofile"

echo '👊  Installing chezmoi'
brew install chezmoi
chezmoi init https://github.com/stonechoe/ddotfiles.git

echo '👊  Installing asdf'
brew install asdf
. $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh
echo '. $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh' >> ".zshrc"
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf plugin-add deno https://github.com/asdf-community/asdf-deno.git

echo '👊  Installing coursier' && brew install coursier && cs setup
echo "Done."


# install zsh(omz) plugins
zsh <<< '
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting

omz plugin enable zsh-autosuggestions
omz plugin enable zsh-syntax-highlighting
omz plugin enable fast-syntax-highlighting
omz plugin enable asdf
'
