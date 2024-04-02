F.yaml  = $(wildcard *.yaml)
F.json  = $(filter-out %.schema.json, $(filter-out %.model.json, $(wildcard *.json)))

# JSON derived from YAML
D.json  = $(F.yaml:%.yaml=%.json)

F.model = $(F.json:%.json=%.model.json) $(D.json:%.json=%.model.json)
F.schema = $(F.json:%.json=%.schema.json) $(D.json:%.json=%.schema.json)

.PHONY: clean
clean:
	$(RM) $(D.json) *.schema.json *.model.json

.PHONY: schema
schema: $(F.schema)

.PHONY: model
model: $(F.model)

%.json: %.yaml
	./yaml2json.py $< | jq > $@

%.schema.json: %.json
	./extract.py $< | jq > $@

%.model.json: %.schema.json
	schema2model -e $< > $@
