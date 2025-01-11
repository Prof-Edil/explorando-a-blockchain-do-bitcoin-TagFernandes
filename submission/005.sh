# Create a 1-of-4 P2SH multisig address from the public keys in the four inputs of this tx:
#   `37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517`
TX=$(bitcoin-cli getrawtransaction "37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517" 1)

KEY_1=$(echo $TX | jq '.vin[0].txinwitness[1]')
KEY_2=$(echo $TX | jq '.vin[1].txinwitness[1]')
KEY_3=$(echo $TX | jq '.vin[2].txinwitness[1]')
KEY_4=$(echo $TX | jq '.vin[3].txinwitness[1]')

P2SH=$(bitcoin-cli createmultisig 1 "[$KEY_1, $KEY_2, $KEY_3, $KEY_4]" "legacy" | jq -r '.address')

echo $P2SH
