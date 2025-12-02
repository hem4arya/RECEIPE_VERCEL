const fs = require("fs");
const path = require("path");
const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

console.log("\n✨  Recipe Finder Setup Wizard  ✨\n");

const envPath = path.join(__dirname, "..", ".env");

function askQuestion(query) {
  return new Promise((resolve) => rl.question(query, resolve));
}

async function main() {
  if (fs.existsSync(envPath)) {
    console.log("✅  .env file already exists. Skipping setup.");
    rl.close();
    return;
  }

  console.log("ℹ️   No .env file found. Let's create one.");

  // For this static site, we might not strictly need env vars, but we'll add a placeholder
  // to demonstrate the protocol.
  const port =
    (await askQuestion("👉  Enter Port to run on (default: 3000): ")) || "3000";

  const envContent = `PORT=${port}\n`;

  fs.writeFileSync(envPath, envContent);
  console.log(`\n✅  .env file created with PORT=${port}`);
  console.log("🎉  Setup Complete!");
  rl.close();
}

main();
