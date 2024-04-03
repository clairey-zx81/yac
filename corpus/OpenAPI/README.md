# OpenAPI examples

Sources:

- 6 OpenAPI documentation;
- 4 postman, dont 2 BROKEN, type API
- 10 api.gouv.fr

API Type:

- OAS Doc 6
- Open Data 5
- Data Consultation 4
- Service 5

Extensions:

- `x-` extensions in 5 specs
- `discriminator` in 1
- `xml` and `externalDocs` in 0

## From OpenAPI

[OpenAPI Initiative](https://www.openapis.org/).

- [Callback](https://github.com/OAI/OpenAPI-Specification/blob/main/examples/v3.0/callback-example.json)
  Bug: 1 missing object
- [Link](https://github.com/OAI/OpenAPI-Specification/blob/main/examples/v3.0/link-example.json)
  Bug: _0_
- [Petstore](https://github.com/OAI/OpenAPI-Specification/blob/main/examples/v3.0/petstore.json)
  Bug: _0_
- [Petstore expanded](https://github.com/OAI/OpenAPI-Specification/blob/main/examples/v3.0/petstore-expanded.json)
  Bug: _0_
- [Uspto](https://github.com/OAI/OpenAPI-Specification/blob/main/examples/v3.0/uspto.json)
  Bug: 2 `uriref` format typo instead of `uri-ref`.
- [Webhook](https://github.com/OAI/OpenAPI-Specification/blob/main/examples/v3.1/webhook-example.json)
  Bug: missing object

## From postman.com

- [EBay API](https://www.postman.com/api-evangelist/workspace/ebay/api/ab1d1245-9134-4ba7-8caf-20abeb24de16/version/16d6fc2b-f41e-499c-a16a-ba3c81f175bb/definition/efcb4720-a513-46fc-81c9-ec5bd371111b/file/efcb4720-a513-46fc-81c9-ec5bd371111b)
  mal généré : `"type": ""` et autres objects qui se contiennent.
  API 18 get, no others;
  Data consultation;
  Bug: fully broken.
- [Stuart API](https://www.postman.com/stuart-1/workspace/stuart-api/api/5039c443-0386-4125-88c4-7c39314f36bd/definition/c901f0dd-368a-4dc4-871b-6d9059604af8/file/c901f0dd-368a-4dc4-871b-6d9059604af8?version=bf987cdf-8525-43b5-8cf7-eb8ed29891ea&ctx=documentation)
  strange `"format": "nullable"` translated to `"nullable": true`;
  API 8 get, 12 post, 1 delete, 1 put, 1 patch;
  Service API;
  Bug: 2 missing object type, non unique enum, unexpected format, inconsistent type (str examples for int/num)
- [Walmart API](https://www.postman.com/api-evangelist/workspace/walmart/api/c01b7fc8-6831-43ea-aaba-af9873ca342a/version/7db08e6e-05d6-46b2-87ad-b268d59569c7/definition/96fda077-a93f-49ec-ac92-208ada8abc5b/file/96fda077-a93f-49ec-ac92-208ada8abc5b)
  objets qui se contiennent, quelques types string et number.
  API 21 get, 12 post, 2 delete, 0 patch, 7 put;
  Service API;
  Bug: fully broken.
- [Oracle Cloud Infra](https://www.postman.com/oracledevs/workspace/oracle-cloud-infrastructure-rest-apis/api/d62a427a-f901-4dad-aa2a-3c5fa6b999d9/definition/d224415c-8f6b-4499-b7ec-44f65f814aa5/file/d224415c-8f6b-4499-b7ec-44f65f814aa5)
  API 12 get, 9 post, 5 delete, 0 patch, 4 put;
  Service API;
  Note: uses `discriminator`
  Bug: many missing type

## From api.gouv.fr

- [Base carbone](https://api.gouv.fr/documentation/api_base_carbone) (koumoul)
  API 13 get;
  Open Data;
  Bug: 1, undefined required property (key)
- [Aides financières de l'ADEME](https://api.gouv.fr/documentation/api_aides_financieres_ademe) (koumoul)
  API 14 get;
  Open Data;
  Bug: 1, undefined required property (key)
- [Simul aides renovation](https://api.gouv.fr/documentation/api_aides_renovation_energetique) (koumoul)
  API 13 get;
  Open Data;
- [La bonne alternance](https://api.gouv.fr/documentation/api-la-bonne-alternance)
  API 15 get, 9 post, 0 put, 1 patch, 0 delete;
  Service API;
  Bug: _many_ empty type (indeed)
- [Chorus Pro](https://api.gouv.fr/documentation/chorus-pro)
  API 0 get, 22 post (certains devraient être des get, patch);
  Service API;
  Bug: _0_
- [DPE logements](https://api.gouv.fr/documentation/api_dpe_logements) (koumoul)
  ressemble à Aides financières, généré automatiquement par un même outil ?
  [Portail open data](https://koumoul.com/)
  API 11 get;
  Open Data;
  Bug: 1, undefined required property (key)
- [Impot particulier](https://api.gouv.fr/documentation/impot-particulier)
  Data consutation;
  Bug: _0_
- [Particulier](https://particulier.api.gouv.fr/catalogue/cnaf_msa/quotient_familial_v2) en YAML.
  Attention : suppression manuelle de 2 `format: string`;
  API 12 get;
  Data Consultation;
  Bug: 16 minor type inconsistencys (null example for str)
- [Entreprise](https://entreprise.api.gouv.fr/open-api-without-deprecated-paths.yml)
  Attention : correction manuelle de 7 `type: date` (type string et format date)
  API 38 get;
  Data consultation;
  Bug: 1 minor type inconsistency, str example for int/number type
- [Enseignement Supérieur](?) OpenDataSoft.
  API 15 get;
  Open Data;
  Bug: 1, unexpected format `dateTime` (indeed)
