# How many new outputs were created by block 123,456?
BLOCK_NUMBER=123456

BLOCK_HASH=$(bitcoin-cli getblockhash $BLOCK_NUMBER)

BLOCK_DATA=$(bitcoin-cli getblock $BLOCK_HASH 2)

# Usando jq para processar JSON e somar os vouts
TOTAL_OUTPUTS=$(echo "$BLOCK_DATA" | jq '[.tx[].vout | length] | add')

echo "$TOTAL_OUTPUTS"
