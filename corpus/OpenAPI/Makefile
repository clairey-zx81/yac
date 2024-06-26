F.yaml  = $(wildcard *.yaml)
F.json  = $(filter-out %.stats.json, $(filter-out %.schema.json, $(filter-out %.model.json, $(wildcard *.json))))

# JSON derived from YAML
D.json  = $(F.yaml:%.yaml=%.json)

F.schema = $(F.json:%.json=%.schema.json) $(D.json:%.json=%.schema.json)
F.model = $(F.schema:%.schema.json=%.model.json)
F.stats = $(F.schema:%.schema.json=%.stats.json)

.PHONY: clean
clean:
	$(RM) $(D.json) *.schema.json *.model.json *.stats.json BROKEN/*.schema.json BROKEN/*.model.json BROKEN/*.stats.json

.PHONY: all
all: schema stats model

.PHONY: schema
schema: $(F.schema) BROKEN/ebay_api.schema.json BROKEN/walmart_api.schema.json

.PHONY: model
model: $(F.model)

.PHONY: stats
stats: $(F.stats) BROKEN/ebay_api.stats.json BROKEN/walmart_api.stats.json

%.json: %.yaml
	./yaml2json.py $< > $@

%.schema.json: %.json
	./extract.py $< > $@

%.model.json: %.schema.json
	jm-schema2model -e $< > $@

%.stats.json: %.schema.json
	../../../stats/json-schema-stats.py -d ../../../json-model/models -n $< > $@
