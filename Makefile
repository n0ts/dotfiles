.PHONY: all setup clean

DESTDIR=${HOME}

DOTS=\
	.bin \
	.emacs \
	.emacs.d \
	.my.cnf \
	.screenrc \
	.zfunctions \
	.zlogin \
	.zshrc \
	.zshrc.linux \
	.zshrc.freebsd \
	.zshrc.darwin

DOTS_LOCAL=\
	dot.emacs.local \
	dot.zshrc.local
	
all: setup
setup: dots-setup
dots-setup: ${DOTS} ${DOTS_LOCAL}
clean: dots-clean

${DOTS}:
	rm -f ${DESTDIR}/${subst dot,,$@}
	ln -s ${PWD}/dot$@ ${DESTDIR}/${subst dot,,$@}

${DOTS_LOCAL}:
	touch ${DESTDIR}/${subst dot,,$@}

clean:
	${MAKE} dots-clean
	${MAKE} dots_local-clean

dots-clean:
	rm -f ${foreach p,${DOTS},${DESTDIR}/${p}}

dots_local-clean:
	rm -f ${foreach p,${DOTS_LOCAL},${DESTDIR}/${p}}
