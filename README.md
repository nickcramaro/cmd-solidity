# cmd-solidity
project for practicing solidity

## cmds
```
solc = require('solc')
source = `source code here`
compiled = solc.compile(source)
abi = JSON.parse(compiled.contracts[':ContractName'].interface)

Web3 = require('web3')
web3 =  new Web3(new Web3.providers.HttpProvider('http://localhost:7545'))
contract = new web3.eth.Contract(abi)

web3.eth.getAccounts().then((result) => accounts = result)

acct1 = accounts[0]

bytecode = compiled.contracts[':ContractName'].bytecode

contract.deploy({data: bytecode, arguments: [Arguements]}).send({from: acct1, gas: 500000}).then((result) => {instance = result})

instance.methods.confirmPayment().call({from: acc1, value: 10000000000}).then(result => console.log(result))

instance.methods.greet().call({from: acct1}).then(result => console.log(result))
```