INSTALL_PATH=~/.texlive/texmf-var/tex

default: install

clean:
	@[ -d $(INSTALL_PATH)/hed ] && rm -rf $(INSTALL_PATH)/hed &&\
		echo "Cleaning..." || echo "Already clean!"

install: clean
	@echo "Create directory..."
	@mkdir -p $(INSTALL_PATH)/hed
	@echo "Install files..."
	@cp *.{sty,cls} $(INSTALL_PATH)/hed

