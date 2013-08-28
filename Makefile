INSTALL_PATH=~/.texlive/texmf-var/tex/preambles

default: install

clean:
	@[ -d $(INSTALL_PATH) ] && rm -rf $(INSTALL_PATH) &&\
		echo "Cleaning..." || echo "Already clean!"

install: clean
	@echo "Create directory..."
	@mkdir -p $(INSTALL_PATH)
	@echo "Install files..."
	@cp *.{sty,cls} $(INSTALL_PATH)

