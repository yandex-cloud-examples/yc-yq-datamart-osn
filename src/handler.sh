#!/bin/bash
export YC_TOKEN=$(yc iam create-token)
aws --endpoint-url=https://storage.yandexcloud.net/ s3 rm s3://osn-bucket/osn-mart --recursive
curl -s -d @create-query.sql \
  -H "Authorization: Bearer $(echo $YC_TOKEN)" \
  -H "accept: application/json" \
  -H "Content-Type: application/json" \
  "https://api.yandex-query.cloud.yandex.net/api/fq/v1/queries?project=$(echo $YC_FOLDER)"




