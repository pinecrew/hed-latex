DEST=~/.texlive/texmf-var/tex

default: install

uninstall:
	@[ -d $(DEST)/hed ] && rm -rf $(DEST)/hed &&\
		echo "Uninstalling..." || echo "hed is not installed"

install: uninstall
	@echo "Create directory..."
	install -dm 755 $(DEST)/hed
	@echo "Install files..."
	install -m 644 source/* $(DEST)/hed/

tests: clean
	cd utils && bash tester.sh

update_info:
	cd utils && bash updater.sh

clean:
	rm -rf tmp build
