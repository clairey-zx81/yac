#! /usr/bin/env python
#
# convert YAML to JSON
#

import sys
import yaml
import json

# WTF? Yuk…
try:
    from yaml import CLoader as Loader, CDumper as Dumper
except ImportError:
    from yaml import Loader, Dumper

# force str on foreign data types, eg "date"
def jsonify(data):
    if isinstance(data, list):
        for item in data: 
            jsonify(item)
    elif isinstance(data, dict):
        for key in list(data.keys()):
            val = data[key]
            if val is not None and not isinstance(val, (str, float, int, bool, list, dict)):
                data[key] = str(val)
            jsonify(val)
    return data

# process file arguments to stdout
for fn in sys.argv[1:]:
    with open(fn) as f:
        loaded = yaml.load(f.read(), Loader=Loader)
        jsoned = jsonify(loaded)
        print(json.dumps(jsoned, indent=2, sort_keys=False))
