#! /usr/bin/env python

import sys
import requests
import json
import time

import logging
logging.basicConfig(level=logging.INFO)
# logging.basicConfig(level=logging.DEBUG)
log = logging.getLogger("scrap")

CATALOG = "/api/v2/catalog/datasets"

url = sys.argv[1]
start = int(sys.argv[2]) if len(sys.argv) > 2 else 0

log.info(f"scrapping url {url} from {start}")
data = requests.get(url + CATALOG + "?limit=0").json()
count = data["total_count"]

for batch in range(1 + count//100):
    if batch*100 < start:
        continue
    log.info(f"batch: {batch}")
    data = requests.get(url + CATALOG + f"?limit=100&offset={batch*100}").json()
    if "datasets" in data:
        for d in data["datasets"]:
            print(d["dataset"]["dataset_id"])
    else:
        log.warning("no datasets!")
    time.sleep(0.5)
