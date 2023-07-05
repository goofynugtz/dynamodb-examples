aws dynamodb scan --table-name user --endpoint-url http://localhost:8000

aws dynamodb list-tables --endpoint-url http://localhost:8000

aws dynamodb delete-table --table-name user --endpoint-url http://localhost:8000

aws dynamodb create-table \
    --table-name user \
    --attribute-definitions \
        AttributeName=Title,AttributeType=S \
        AttributeName=Author,AttributeType=S \
    --key-schema \
        AttributeName=Author,KeyType=HASH \
        AttributeName=Title,KeyType=RANGE \
    --provisioned-throughput \
        ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --endpoint-url http://localhost:8000

aws dynamodb create-table \
    --table-name user \
    --attribute-definitions \
        AttributeName=_id,AttributeType=S \
    --key-schema \
        AttributeName=_id,KeyType=HASH \
    --provisioned-throughput \
        ReadCapacityUnits=5,WriteCapacityUnits=5 \
    --endpoint-url http://localhost:8000

aws dynamodb create-table --table-name user --attribute-definitions AttributeName=_id,AttributeType=S --key-schema AttributeName=_id,KeyType=HASH --billing-mode PAY_PER_REQUEST

aws dynamodb create-table \
  --table-name user \
  --attribute-definitions \
    AttributeName=_id,AttributeType=S \
  --key-schema \
    AttributeName=_id,KeyType=HASH \
  --global-secondary-indexes \
    '[
      {
        "IndexName": "email-index",
        "KeySchema": [
          { "AttributeName": "email", "KeyType": "HASH" }
        ],
        "Projection": {
          "ProjectionType": "ALL"
        }
      }
    ]' \
  --billing-mode PAY_PER_REQUEST \
  --provisioned-throughput \
    ReadCapacityUnits=5,WriteCapacityUnits=5 \
