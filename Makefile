OBO = http://purl.obolibrary.org/obo

ONTIDS = obi pato go chebi
ONTIRIS = $(patsubst %,%.owl,$(ONTIDS))
CLASSES = OBI_0000697 PATO_0000047 GO_0000047 CHEBI_23367
ALL = $(ONTIDS) $(ONTIRIS) ($CLASSES)

all: test-redirects

test-redirects: $(patsubst %,test-redirect-%,$(ALL))

test-top-redirects: $(patsubst %,test-redirect-%,$(ONTIDS))
test-owl-redirects: $(patsubst %,test-redirect-%,$(ONTIRIS))
test-cls-redirects: $(patsubst %,test-redirect-%,$(CLASSES))


test-redirect-%:
	curl $(OBO)/$* -o out-$@ && grep "302 Found" out-$@ && mv out-$@ success-$@
