UVER=2.1.3
WVER=213

WINKIT = /Users/will/tclkit/tclkit-win32.upx.exe
OSXKIT = /Users/will/tclkit/tclkit-darwin-ppc
WEBDIR = /Users/will/work/wjduquette/notebook

all:
	@echo "Use 'make build' to build the executable."

dist: build copydist

copydist:
	cp notebook.exe notebook notebook.kit $(WEBDIR)
	cp notebook.exe $(WEBDIR)/notebook$(WVER).exe
	cp notebook $(WEBDIR)/notebook$(UVER)
	cp notebook.kit $(WEBDIR)/notebook$(UVER).kit
	cp README.txt $(WEBDIR)

build: clean update savesrc buildvfs buildexe buildapp

savesrc:
	cd .. ; tar cvf notebook$(UVER).tar notebookkit/*.tcl notebookkit/lib notebookkit/*.txt notebookkit/Makefile ; gzip notebook$(UVER).tar
	cp ../notebook$(UVER).tar.gz /Users/will/work/wjduquette/notebook


update:
	update.tcl
	cp -f help.nbk lib/app-notebook

buildvfs:
	mkdir -p ./notebook.vfs
	cp main.tcl ./notebook.vfs
	cp -r lib ./notebook.vfs
	rm -rf ./notebook.vfs/lib/CVS
	rm -rf ./notebook.vfs/lib/*/CVS
	ln -s /Library/Tcl/bwidget1.7 ./notebook.vfs/lib/bwidget
	ln -s /Library/Tcl/tcllib1.7 ./notebook.vfs/lib/tcllib
	ln -s /Users/will/Library/Tcl/snit ./notebook.vfs/lib/snit
	ln -s /Users/will/Library/Tcl/trycatch ./notebook.vfs/lib/trycatch

buildexe:
	sdx.kit wrap notebook.exe -runtime $(WINKIT)
	sdx.kit wrap notebook -runtime $(OSXKIT)
	sdx.kit wrap notebook.kit

buildapp:
	cp -r notebook.vfs/lib Notebook.app/Contents/Resources/Scripts
	cp -r lib Notebook.app/Contents/Resources/Scripts


clean:
	-rm -rf notebook.vfs notebook.exe notebook.kit notebook.bat notebook
