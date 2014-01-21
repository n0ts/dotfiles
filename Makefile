.PHONY: all setup clean

DESTDIR=${HOME}

DOTS=\
	.bin \
	.ackrc \
	.editrc \
	.emacs \
	.emacs.d \
	.my.cnf \
	.gitconfig.local \
	.gitignore.local \
	.inputrc \
	.screenrc \
	.zaw.sources \
	.zfunctions \
	.zlogin \
	.zshrc \
	.zshrc.linux \
	.zshrc.freebsd \
	.zshrc.darwin

DOTS_LOCAL=\
	dot.emacs.local \
	dot.zshrc.local

DOTS_ZSH=\
	.zshrc.test


all: setup
setup: dots-setup
dots-setup: ${DOTS} ${DOTS_LOCAL}
clean: dots-clean

${DOTS}:
	rm -f ${DESTDIR}/${subst dot,,$@}
	ln -s `pwd`/dot$@ ${DESTDIR}/${subst dot,,$@}

${DOTS_LOCAL}:
	touch ${DESTDIR}/${subst dot,,$@}

clean:
	${MAKE} dots-clean
	${MAKE} dots_local-clean

dots-clean:
	rm -f ${foreach p,${DOTS},${DESTDIR}/${p}}

dots-local-clean:
	rm -f ${foreach p,${DOTS_LOCAL},${DESTDIR}/${p}}


dots-zwc:
	zsh -c "zcompile ${DESTDIR}/.zshrc"
	zsh -c "zcompile ${DESTDIR}/.zshrc.linux"
	zsh -c "zcompile ${DESTDIR}/.zshrc.freebsd"
	zsh -c "zcompile ${DESTDIR}/.zshrc.darwin"
	zsh -c "zcompile ${DESTDIR}/.zshrc.local"

dots-zwc-clean:
	rm -f ${DESTDIR}/.*.zwc
