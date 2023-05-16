

// json_schema = {}

// en dir geoJSON
var geojson_definitions = {
    "geoJSON": {
        "title": "Geo JSON object",
        "description": "Schema for a Geo JSON object",
        "type": "object",
        "required": ["type"],
        "properties": {
            "crs": { "$ref": "#/definitions/crs" },
            "bbox": { "$ref": "#/definitions/bbox" }
        },
        "oneOf": [
            { "$ref": "#/definitions/geometry" },
            { "$ref": "#/definitions/geometryCollection" },
            { "$ref": "#/definitions/feature" },
            { "$ref": "#/definitions/featureCollection" }
        ]
    },
    "bbox": {
        "description": "A bounding box as defined by GeoJSON",
        "type": "array",
        "items": { "type": "number" }
    },
    "crs": {
        "title": "crs",
        "description": "a Coordinate Reference System object",
        "type": ["object", "null"],
        "required": ["type", "properties"],
        "properties": {
            "type": { "type": "string" },
            "properties": { "type": "object" }
        },
        "additionalProperties": false,
        "oneOf": [
            { "$ref": "#/definitions/namedCrs" },
            { "$ref": "#/definitions/linkedCrs" }
        ]
    },
    "namedCrs": {
        "properties": {
            "type": { "enum": ["name"] },
            "properties": {
                "required": ["name"],
                "additionalProperties": false,
                "properties": {
                    "name": { "type": "string" }
                }
            }
        }
    },
    "linkedObject": {
        "type": "object",
        "required": ["href"],
        "properties": {
            "href": { "type": "string", "format": "uri" },
            "type": { "type": "string", "description": "Suggested values: proj4, ogjwkt, esriwkt" }
        }
    },
    "linkedCrs": {
        "properties": {
            "type": {
                "enum": ["link"]
            },
            "properties": { "$ref": "#/definitions/linkedObject" }
        }
    },
    "geometryCollection": {
        "title": "GeometryCollection",
        "description": "A collection of geometry objects",
        "required": ["geometries"],
        "properties": {
            "type": { "enum": ["GeometryCollection"] },
            "geometries": {
                "type": "array",
                "items": { "$ref": "http://json-schema.org/geojson/geometry.json#" }
            }
        }
    },
    "feature": {
        "title": "Feature",
        "description": "A Geo JSON feature object",
        "required": ["geometry", "properties"],
        "properties": {
            "type": { "enum": ["Feature"] },
            "geometry": {
                "oneOf": [
                    { "type": "null" },
                    { "$ref": "#/definitions/geometry" }
                ]
            },
            "properties": {
                "type": ["object", "null"]
            },
            "id": {}
        }
    },
    "featureCollection": {
        "title": "FeatureCollection",
        "description": "A Geo JSON feature collection",
        "required": ["features"],
        "properties": {
            "type": { "enum": ["FeatureCollection"] },
            "features": {
                "type": "array",
                "items": { "$ref": "#/definitions/feature" }
            }
        }
    },
    "geometry": {
        "title": "geometry",
        "description": "One geometry as defined by GeoJSON",
        "type": "object",
        "required": ["type", "coordinates"],
        "oneOf": [
            {
                "title": "Point",
                "properties": {
                    "type": { "enum": ["Point"] },
                    "coordinates": { "$ref": "#/definitions/position" }
                }
            },
            {
                "title": "MultiPoint",
                "properties": {
                    "type": { "enum": ["MultiPoint"] },
                    "coordinates": { "$ref": "#/definitions/positionArray" }
                }
            },
            {
                "title": "LineString",
                "properties": {
                    "type": { "enum": ["LineString"] },
                    "coordinates": { "$ref": "#/definitions/lineString" }
                }
            },
            {
                "title": "MultiLineString",
                "properties": {
                    "type": { "enum": ["MultiLineString"] },
                    "coordinates": {
                        "type": "array",
                        "items": { "$ref": "#/definitions/lineString" }
                    }
                }
            },
            {
                "title": "Polygon",
                "properties": {
                    "type": { "enum": ["Polygon"] },
                    "coordinates": { "$ref": "#/definitions/polygon" }
                }
            },
            {
                "title": "MultiPolygon",
                "properties": {
                    "type": { "enum": ["MultiPolygon"] },
                    "coordinates": {
                        "type": "array",
                        "items": { "$ref": "#/definitions/polygon" }
                    }
                }
            }
        ],
        "position": {
            "description": "A single position",
            "type": "array",
            "minItems": 2,
            "items": [{ "type": "number" }, { "type": "number" }],
            "additionalItems": false
        },
        "positionArray": {
            "description": "An array of positions",
            "type": "array",
            "items": { "$ref": "#/definitions/position" }
        },
        "lineString": {
            "description": "An array of two or more positions",
            "allOf": [
                { "$ref": "#/definitions/positionArray" },
                { "minItems": 2 }
            ]
        },
        "linearRing": {
            "description": "An array of four positions where the first equals the last",
            "allOf": [{ "$ref": "#/definitions/positionArray" }, { "minItems": 4 }]
        },
        "polygon": {
            "description": "An array of linear rings",
            "type": "array",
            "items": { "$ref": "#/definitions/linearRing" }
        }
    }
};

function include_geojson_definitions(json_schema) {
    for (var def in geojson_definitions) {
        if (geojson_definitions.hasOwnProperty(def)) {
            json_schema.definitions[def] = geojson_definitions[def];
        }
    }
}

function build_json_schema(dataset) {
    // console.log(JSON.stringify(dataset, null, 4))

    var json_schema = {
        title: dataset.dataset_id,
        type: "object",
        oneOf: [{ $ref: '#/definitions/' + dataset.dataset_id }],
        definitions: {}
    };

    json_schema.definitions[dataset.dataset_id] = {
        properties: {
            records: {
                type: "array",
                items: { $ref: '#/definitions/' + dataset.dataset_id + '_records' }
            }
        }
    };

    var fields = {};

    var type_templates = {
        text: { type: 'string' },
        date: { type: 'string', format: 'date' },
        datetime: { type: 'string', format: 'date-time' },
        int: { type: 'integer' },
        double: { type: 'number' },
        geo_point_2d: { type: 'array', minItems: 2, maxItems: 2, items: { type: 'number' } },
        geo_shape: { type: 'object', "oneOf": [{ "$ref": "#/definitions/geometry" }] }, ip_address: { type: 'string' }
    };

    for (var i in dataset.fields) {
        var field = dataset.fields[i];
        if (field.type in type_templates) {
            fields[field.name] = Object.assign({}, type_templates[field.type]);
        } else {
            fields[field.name] = { type: 'string' };
        }
        if (field.type === 'geo_point_2d' || field.type === 'geo_shape') {
            include_geojson_definitions(json_schema);
        }
        fields[field.name].title = field.label;
        fields[field.name].description = field.description ? field.description : '';

        for (var annotation in field.annotations) {
          if (annotation.name === 'unit' && annotation.args && annotation.args.length > 0) {
              fields[field.name].unit = annotation.args[0];
          }
        }
    }

    json_schema.definitions[dataset.dataset_id + '_records'] = {
        properties: { fields: { type: 'object', properties: fields } }
    }

	return json_schema;
}

process.argv.forEach(function (val, idx, array) {
  if (idx < 2) {
    return;
  }
  // console.log(`val = ${val}`)
  fetch(val)
    .then( (res) => res.json())
    .then( (j) => build_json_schema(j.dataset))
    .then( (js) => console.log(JSON.stringify(js, null, 4)))
});
