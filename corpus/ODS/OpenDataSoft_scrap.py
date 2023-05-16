#! /usr/bin/env python

import sys
import requests
import json

import logging
#logging.basicConfig(level=logging.INFO)
logging.basicConfig(level=logging.DEBUG)
log = logging.getLogger("scrap")

CATALOG = "/api/v2/catalog/datasets"

for url in sys.argv[1:]:
    log.debug(f"scrapping url = {url}")
    data = requests.get(url + CATALOG + "?limit=0").json()
    count = data["total_count"]
    datasets = []
    for batch in range(1 + count//100):
        data = requests.get(url + CATALOG + f"?limit=100&offset={batch*100}").json()
        datasets += [ d["dataset"]["dataset_id"] for d in data["datasets"]]
    assert count == len(datasets)

for dataset in datasets:
    print(dataset)
