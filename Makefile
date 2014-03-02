OBO = http://purl.obolibrary.org/obo

ONTIDS = obi pato go chebi
ONTIRIS = $(patsubst %,%.owl,$(ONTIDS))
ALL = $(ONTIDS) $(ONTIRIS)

all: test-redirects

test-redirects: $(patsubst %,test-redirect-%,$(ALL))

test-top-redirects: $(patsubst %,test-redirect-%,$(ONTIDS))
test-owl-redirects: $(patsubst %,test-redirect-%,$(ONTIRIS))


test-redirect-%:
	curl $(OBO)/$* -o out-$@ && grep "302 Found" out-$@ && mv out-$@ success-$@
