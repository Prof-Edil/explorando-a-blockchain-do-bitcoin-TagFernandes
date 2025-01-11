# Which tx in block 257,343 spends the coinbase output of block 256,128?

# Bloco de origem (coinbase)
BLOCK_ORIGIN=256128
# Bloco de destino onde queremos verificar as transações
BLOCK_DEST=257343

# Obtém o ID da transação coinbase do bloco de origem
COINBASE_TX=$(bitcoin-cli getblock $(bitcoin-cli getblockhash $BLOCK_ORIGIN) | jq -r '.tx[0]')


# Obtém todas as transações do bloco de destino
DEST_BLOCK_HASH=$(bitcoin-cli getblockhash $BLOCK_DEST)
TXS_IN_DEST_BLOCK=$(bitcoin-cli getblock $DEST_BLOCK_HASH | jq -r '.tx[]')

# Itera sobre as transações do bloco de destino para encontrar a que gasta a saída da coinbase
for TX in $TXS_IN_DEST_BLOCK; do
  INPUTS=$(bitcoin-cli getrawtransaction $TX true | jq -r '.vin[] | .txid')
  
  # Verifica se a transação de entrada corresponde à coinbase do bloco de origem
  if echo "$INPUTS" | grep -q "$COINBASE_TX"; then
    echo "$TX"
    exit 0
  fi
done
