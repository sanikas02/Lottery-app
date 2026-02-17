# Lottery-app
A simple Ethereum smart contract that simulates a lottery system.   Players can enter by sending Ether, and the manager can pick a random winner who receives all the collected Ether.


# 🎲 Lottery Smart Contract

A simple Ethereum smart contract that simulates a lottery system.  
Players can enter by sending Ether, and the manager can pick a random winner who receives all the collected Ether.

---

## 📘 Features
- Players must send **more than 0.01 ETH** to enter.
- All player addresses are stored in a dynamic list.
- Only the **manager** (the account that deployed the contract) can pick the winner.
- The winner is chosen randomly and receives the entire balance of the contract.
- After picking a winner, the lottery resets for the next round.

---

## 🛠 How to Run in Remix

### 1. Compile
- Open [Remix IDE](https://remix.ethereum.org/).
- Create a new file `Lottery.sol` and paste the contract code.
- Go to the **Solidity Compiler** tab → select version `0.8.x` → click **Compile**.
- ✅ Green tick means success.

### 2. Deploy
- Go to the **Deploy & Run Transactions** tab.
- Environment → **Remix VM (London)**.
- Account → select the first account (manager).
- Value → leave empty.
- Click **Deploy**.

### 3. Enter Lottery (Players)
- Switch to another account in the **Account dropdown**.
- In the **Value field**, type `0.02` (must be >0.01 ETH).
- Click **enter()`.
- Repeat with 2–3 accounts to simulate multiple players.

### 4. Check Players
- Click **getPlayers()`.
- Remix will display the list of addresses that entered.

### 5. Pick Winner
- Switch back to the **manager account**.
- Click **pickWinner()`.
- The contract transfers all Ether to one randomly selected player.
- Call **getPlayers()** again → list will be empty (lottery reset).

---

## 📖 Explanation
- **Account dropdown** → lets you act as different blockchain users.
- **Value field** → Ether sent with the transaction (must be >0.01 ETH to enter).
- **Gas** → fee for executing the function (calculated automatically by Remix).
- **Call data** → technical message Remix sends to the blockchain when you click a function (handled automatically).

---

## 🎤 Demo Script
1. *“I deploy the contract as the manager.”*  
2. *“Players enter by sending more than 0.01 ETH. Here I’m sending 0.02 ETH.”*  
3. *“We can see all the players listed using getPlayers().”*  
4. *“Finally, the manager picks a winner, and the contract transfers all Ether to that account.”*

---

## 📌 Notes
- Do **not** send Ether when deploying (constructor is not payable).
- Errors like *“Minimum 0.01 ETH to enter”* or *“No players entered”* are expected — they show the contract rules are working.
