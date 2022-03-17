#
# Makefile for NBODY6++ June 2003 R.Sp., Changed by Long Wang on Aug 20, 2014
#
# Please use:
#    make
#    make install
#

RESULT = nbody6++.sse
INSTALLDIR = /usr/local
EXTRATOOLS = nb6++dumpb2a libinitial.so libnb6out3.so nb6++snapshot
ifeq ("x", "x $(EXTRATOOLS)")
EXTRAOBJS = installtools
endif

VPATH=./build

$(RESULT) : 
	$(MAKE) -C ./build

clean: 
	rm -f ./build/*.o ./build/*.so ./build/$(RESULT) $(EXTRATARGET)

install: $(RESULT) $(EXTRAOBJS)
	@[ -d $(INSTALLDIR)/bin ] || mkdir $(INSTALLDIR)/bin
	@[ -d $(INSTALLDIR)/share ] || mkdir $(INSTALLDIR)/share
	@[ -d $(INSTALLDIR)/share/doc ] || mkdir $(INSTALLDIR)/share/doc
	cp ./build/$(RESULT)  $(INSTALLDIR)/bin
	cp ./doc/nbody6++_manual.pdf $(INSTALLDIR)/share/doc/


installtools: 
	@[ -d $(INSTALLDIR)/bin ] || mkdir $(INSTALLDIR)/bin
	@[ -d $(INSTALLDIR)/include ] || mkdir $(INSTALLDIR)/include
	@[ -d $(INSTALLDIR)/lib ] || mkdir $(INSTALLDIR)/lib
	cp ./build/nb6++dumpb2a $(INSTALLDIR)/bin
	cp ./build/nb6++snapshot $(INSTALLDIR)/bin
	cp ./include/initial.h $(INSTALLDIR)/include 
	cp ./build/libinitial.so $(INSTALLDIR)/lib
	cp ./include/nb6out3.h $(INSTALLDIR)/include
	cp ./build/libnb6out3.so $(INSTALLDIR)/lib

uninstall:
	rm -f $(INSTALLDIR)/bin/$(RESULT)
	rm -f $(INSTALLDIR)/lib/libinitial.so $(INSTALLDIR)/lib/libnb6out3.so
	rm -f $(INSTALLDIR)/share/doc/nbody6++_manual.pdf
	rm -f $(INSTALLDIR)/bin/nb6++dumpb2a $(INSTALLDIR)/bin/nb6++snapshot
