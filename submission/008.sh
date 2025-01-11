# Which public key signed input 0 in this tx:
#   `e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163`
TRANSACAO_ID="e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163"
TRANSACAO_JSON=$(bitcoin-cli getrawtransaction "$TRANSACAO_ID" true)

CHAVE_PUBLICA=$(echo "$TRANSACAO_JSON" | jq -r '.vin[0].txinwitness[2]' | cut -c5-70)

echo $CHAVE_PUBLICA
