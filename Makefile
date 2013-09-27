INSTALL_PATH=~/.texlive/texmf-var/tex

default: install

uninstall:
	@[ -d $(INSTALL_PATH)/hed ] && rm -rf $(INSTALL_PATH)/hed &&\
		echo "Uninstalling..." || echo "hed is not installed"

install: uninstall
	@echo "Create directory..."
	install -dm 755 $(INSTALL_PATH)/hed
	@echo "Install files..."
	install -m 644 source/* $(INSTALL_PATH)/hed/

tests: clean
	cd utils && bash tester.sh

update_info:
	cd utils && bash updater.sh

clean:
	rm -rf tmp build
