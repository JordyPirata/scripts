#!/bin/bash

# Check if the wordlist exists
WORDLIST="eff_large_wordlist.txt"
if [ ! -f "$WORDLIST" ]; then
    echo "Downloading EFF Diceware wordlist..."
    curl -s https://www.eff.org/files/2016/07/18/eff_large_wordlist.txt -o "$WORDLIST"
fi

# Function to generate a word using 5 dice rolls (base 6)
get_word() {
    roll=""
    for _ in {1..5}; do
        roll="${roll}$((1 + RANDOM % 6))"
    done
    grep "^$roll" "$WORDLIST" | cut -f2
}

# Generate a phrase of 6 words
passphrase=$(for i in {1..6}; do get_word; done | paste -sd' ')

# Calculate the hash SHA-256
hash=$(printf "$passphrase" | sha256sum | awk '{print $1}')

# Encode in Base32 (requires xxd and base32)
base32=$(echo "$hash" | xxd -r -p | base32)

# Show results
echo "🎲 Diceware passphrase:"
echo "$passphrase"
echo
echo "🔐 SHA-256 hash:"
echo "$hash"
echo
echo "🔢 Base32 (for easy verbal transmission):"
echo "$base32"
echo

# Ask if the user wants to save to a .env file
read -p "Do you want to save the hash and base32 to a .env file? [y/N]: " save_env
if [[ "$save_env" =~ ^[Yy]$ ]]; then
    echo "TOKEN_HASH=$hash" >> .env
    echo "TOKEN_BASE32=$base32" >> .env
    echo "Values saved to .env file."
fi