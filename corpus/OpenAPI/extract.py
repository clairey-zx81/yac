#! /usr/bin/env python
#
# Extraction of schemas from an OpenAPI spec
#
# TODO complete

import sys
import json
import logging
logging.basicConfig(level=logging.DEBUG)
log = logging.getLogger("oa2js")

def replaceRefs(data):
    if isinstance(data, dict):
        # rewrite references
        if "$ref" in data:
            val = data["$ref"]
            if isinstance(val, str):
                if val.startswith("#/components/schemas/"):
                    data["$ref"] = "#/$defs/" + val[21:]
                elif val.startswith("#/components/responses/"):
                    data["$ref"] = "#/$defs/responses:" + val[23:]
                elif val.startswith("#/components/parameters/"):
                    data["$ref"] = "#/$defs/parameters:" + val[24:]
                elif val.startswith("#/definitions/"):  # swagger 2.0
                    data["$ref"] = "#/$defs/" + val[14:]
                # else?
        # deprecated OpenAPI extension to JSON Schema: "example"
        if "example" in data:
            if "examples" not in data:
                data["examples"] = []
            data["examples"].append(data["example"])
            del data["example"]
        # TODO discriminator? xml? externalDocs?
        for key, val in data.items():
            replaceRefs(val)
    elif isinstance(data, list):
        for item in data:
            replaceRefs(item)

# .content."application/json".schema
# .schema
def extractContentAppJson(data):
    if "content" in data:
        content = data["content"]
        if isinstance(content, dict) and len(content) == 1:
            mime = list(content.keys())[0]
            appres = content[mime]
        else:
            log.warning(f"content with multiple mime-types?")
            appres = None
        if appres and "schema" in appres:
            schema = appres["schema"]
        else:
            schema = None
        return schema
    elif "schema" in data:  # swagger 2.0
        return data["schema"]
    else:
        return None

def convert(data):
    out = {"$defs": {}}

    # .components.schemas
    # .components.reponses.XXX.content.<type-mime>.schema
    if "components" in data:  # openapi 3.
        components = data["components"]
        if "schemas" in components:
            out["$defs"].update(components["schemas"])
        if "responses" in components:
            responses = components["responses"]
            for name, rval in responses.items():
                schema = extractContentAppJson(rval)
                if schema is not None:
                    out["$defs"][f"responses:{name}"] = schema
        if "parameters" in components:
            parameters = components["parameters"]
            for name, pval in parameters.items():
                if "schema" in pval:
                    out["$defs"][f"parameters:{name}"] = pval["schema"]
        # TODO headers? pathItems? requestBodies?

    # .definitions (swagger 2.0)
    if "definitions" in data:  # swagger 2.0
        out["$defs"].update(data["definitions"])

    # .paths.XXX.<method>.parameters[*].schema
    # .paths.XXX.<method>.requestBody.content."application/json".schema
    # .paths.XXX.<method>.reponses.<status>.content."application/json".schema
    if "paths" in data:
        for path, pval in data["paths"].items():
            for method, mval in pval.items():
                if "parameters" in mval:
                    params = mval["parameters"]
                    assert isinstance(params, list)
                    for param in params:
                        if "schema" in param:
                            schema = param["schema"]
                        elif "type" in param:  # swagger 2.0
                            schema = {"type": param["type"]}
                        else:
                            schema = None
                        if schema is not None:
                            name = param.get("name", "?")
                            pin = param.get("in", "?")
                            out["$defs"][f"{path}:{method}:param:{name}/{pin}"] = schema

                if "responses" in mval:
                    responses = mval["responses"]
                    for status, rval in responses.items():
                        if "$ref" in rval:
                           out["$defs"][f"{path}:{method}:resp:{status}"] = rval
                        else:
                            schema = extractContentAppJson(rval)
                            if schema is not None:
                                out["$defs"][f"{path}:{method}:resp:{status}"] = schema
                            if "headers" in rval:
                                headers = rval["headers"]
                                for head, hval in headers.items():
                                    if "$ref" in hval:
                                        out["$defs"][f"{path}:{method}:resp:{status}:head:{head}"] = hval
                                    elif "schema" in hval:
                                        out["$defs"][f"{path}:{method}:resp:{status}:head:{head}"] = hval["schema"]
                if "requestBody" in mval:
                    schema = extractContentAppJson(mval["requestBody"])
                    if schema is not None:
                        out["$defs"][f"{path}:{method}:reqbod"] = schema

    replaceRefs(out)

    out["anyOf"] = [name for name in out["$defs"] if name.startswith("/")]

    return out

for fn in sys.argv[1:]:
    with open(fn) as f:
        try:
            data = json.load(f)
            if not isinstance(data, dict):
                raise Exception("expecting a dict")
            out = convert(data)
            print(json.dumps(out, indent=2, sort_keys=False))
        except Exception as e:
            log.error(e)
