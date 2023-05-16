#! /usr/bin/env python
#
# Extract any self-advertised ($schema) JSON schema
# from inside an arbitrary JSON structure.
#

import logging
import sys
import json
import re

logging.basicConfig(level=logging.INFO)
log = logging.getLogger("extract")

count = 0

def lookForSchemas(jdata, prefix, extract: bool = False):
    """Recursively look for explicit JSON Schemas nested into a JSON value."""
    global count
    if jdata is None or isinstance(jdata, (bool, int, float, str)):
        return
    elif isinstance(jdata, (list, tuple)):
        # recurse into array items
        for j in jdata:
            lookForSchemas(j, prefix, True)
    elif isinstance(jdata, dict):
        # test whether the object is an explicit JSON Schema by trusting "$schema"
        if "$schema" in jdata and "json-schema.org" in jdata["$schema"]:
            if extract:
                out = f"{prefix}_{count:03}.json"
                with open(out, "w") as f:
                    json.dump(jdata, f, indent=2, sort_keys=True)
                    f.write("\n")
                count += 1
            else:
                # the root object is a JSON schema, bye bye!
                pass
        else:
            # recurse into property values
            for j in jdata.values():
                lookForSchemas(j, prefix, True)
    else:
        raise Exception(f"{prefix}: unexpected json type {type(jdata)}")

for fn in sys.argv[1:]:
    log.info(f"considering {fn}")
    count = 0
    prefix = fn.split("/")[-1]
    prefix = re.sub(r"\.json$", "", prefix)
    with open(fn) as f:
        jdata = json.load(f)
    lookForSchemas(jdata, prefix)
