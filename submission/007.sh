# Only one single output remains unspent from block 123,321. What address was it sent to?
# Número do bloco
BLOCK_NUMBER=123321

API_URL="https://blockchain.info/block-height/${BLOCK_NUMBER}?format=json"
BLOCK_DATA=$(curl -s $API_URL)

# Extrai a última transação não gasta
UTXO=$(echo "$BLOCK_DATA" | jq -r '.blocks[0].tx[] | select(.out[].spent == false) | .out[] | select(.spent == false) | .addr' | head -n 1)

echo $UTXO
