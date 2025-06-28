# prove_threshold_policy

This Noir project implements a zero-knowledge circuit that proves whether a secret input `x` (called `secret_share`) satisfies a fixed policy:

recovery_score = 2 * secret_share + public_offset == 17

```yaml

The circuit ensures that a prover can demonstrate compliance with the threshold **without revealing** the private value `secret_share`.


## 🧠 Use Case

This circuit is useful for:

- 🔐 Social recovery in wallets
- 🎓 Anonymous eligibility checks
- 🛡️ Zero-knowledge access control
- ✅ Proving policy compliance without exposing sensitive data


## 📦 Circuit Logic

```rust
fn main(secret_share: Field, public_offset: pub Field) {
    let recovery_score = secret_share * 2 + public_offset;
    let recovery_threshold = 17;
    assert(recovery_score == recovery_threshold);
```
```
## Project Structure

An example repo to verify Noir circuits (with bb backend) using a Solidity verifier.

- `/circuits` - contains the Noir circuits.
- `/contract` - Foundry project with a Solidity verifier and a Test contract that reads proof from a file and verifies it.
- `/js` - JS code to generate proof and save as a file.


Tested with Noir 1.0.0-beta.6 and bb 0.84.0
## Circuit Logic

The Noir circuit checks if `x * 2 + y == expected`, where:
- `x` is a private input
- `y` and `expected` are public inputs

## Installation / Setup
```ssh
# Foundry
git submodule update

# Build circuits, generate verifier contract
(cd circuits && ./build.sh)

# Install JS dependencies
(cd js && yarn)

```  

## zk Proof generation in JS


```ssh
# Use bb.js to generate proof and save to a file
(cd js && yarn generate-proof)

# Run foundry test to read generated proof and verify
(cd contract && forge test --optimize --optimizer-runs 5000 --gas-report -vvv)

```

## zkProof generation with bb cli

```ssh
cd circuits

# Generate witness
nargo execute

# Generate proof
bb prove -b ./target/prove_threshold_policy.json -w target/prove_threshold_policy.gz -o ./target --oracle_hash keccak

# Run foundry test to read generated proof and verify
cd ..
(cd contract && forge test --optimize --optimizer-runs 5000 --gas-report -vvv)
```

### 🔁 Dual Workflow Support (CLI and JS)

The project supports two approaches for generating proofs:

- **JavaScript-based workflow** using `bb.js`
- **CLI-based workflow** using `nargo` and `bb` directly

### 🛠 Building the Solidity Verifier
Use the `build.sh` script to compile the circuit and generate the Solidity verifier:
```bash
./build.sh
```
This will:
- Compile the Noir circuit
- Generate the verification key (`vk`)
- Export the Solidity verifier to `contract/Verifier.sol`

