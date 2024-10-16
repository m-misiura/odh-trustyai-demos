# send a single inference request to the model

```
MODEL_ENDPOINT=$(oc get isvc demo-loan-nn-onnx-alpha -o jsonpath='{.status.url}')

# Get the authentication token
SA_TOKEN=$(oc create token user-one)

# Use the extracted endpoint and token in the curl command
curl -kv \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" \
  -d '{
    "inputs": [
      {
        "name": "customer_data_input",
        "shape": [1, 11],
        "datatype": "FP64",
        "data": [
          [
            0.0, 202500.0, 1.0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.0, 8861.0, 889.0
          ]
        ]
      }
    ]
  }' \
  ${MODEL_ENDPOINT}/v2/models/demo-loan-nn-onnx-alpha/infer
```

