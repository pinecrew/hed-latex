INSTALL_PATH=~/.texlive/texmf-var/tex

default: install

clean:
	@[ -d $(INSTALL_PATH)/hed ] && rm -rf $(INSTALL_PATH)/hed &&\
		echo "Cleaning..." || echo "Already clean!"

install: clean
	@echo "Create directory..."
	install -dm 755 $(INSTALL_PATH)/hed
	@echo "Install files..."
	install -m 644 source/* $(INSTALL_PATH)/hed/

