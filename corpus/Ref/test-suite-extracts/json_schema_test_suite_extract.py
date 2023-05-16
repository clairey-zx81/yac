#! /usr/bin/env python
#
# Extract schemas from JSON Schema Test Suite tests
#

import logging
import sys
import json
import re

logging.basicConfig(level=logging.INFO)
log = logging.getLogger("extract")

VERSIONS = {
    "draft3": "https://json-schema.org/draft-03/schema",
    "draft4": "https://json-schema.org/draft-04/schema",
    "draft6": "https://json-schema.org/draft-06/schema",
    "draft7": "https://json-schema.org/draft-07/schema",
    "draft2019-09": "https://json-schema.org/draft/2019-09/schema",
    "draft2020-12": "https://json-schema.org/draft/2020-12/schema",
    "draft-next": "https://json-schema.org/draft/next/schema",
}

for fn in sys.argv[1:]:
    prefix = fn.split("/tests/")[-1]
    prefix = re.sub("/.*/", "_", prefix)
    prefix = re.sub("/", "_", prefix)
    prefix = re.sub(r"\.json$", "", prefix)
    log.info(f"considering {fn}: {prefix}_*.json")
    schema_url = None
    for v, u in VERSIONS.items():
        if v in prefix:
            schema_url = u
            break
    assert schema_url is not None
    with open(fn) as f:
        jt = json.load(f)
    assert isinstance(jt, list)
    n = 0
    for t in jt:
        schema = t["schema"]
        if isinstance(schema, dict) and not "$schema" in schema:
            schema["$schema"] = schema_url
        out = f"{prefix}_{n:03}.json"
        with open(out, "w") as f:
            json.dump(schema, f, indent=2, sort_keys=True)
            f.write("\n")
        n += 1
