#!/bin/bash
set -e

echo "Setting up NPM package structure..."

# Clean up any existing npm-package directory
if [ -d "npm-package" ]; then
    chmod -R 755 npm-package 2>/dev/null || true
    rm -rf npm-package
fi

# Create npm package directory
mkdir -p npm-package/bin

# Copy package.json to npm-package
cp package.json npm-package/

# Find and copy the Linux x64 binary (this will be the main one for NPM)
find dist -name "go-greeter-user" -path "*/linux_x86_64/*" -exec cp {} npm-package/bin/ \; || echo "Linux x64 binary not found"

# Update version in package.json
cd npm-package
npm version ${TAG} --no-git-tag-version --allow-same-version

# Set npm token
echo "//registry.npmjs.org/:_authToken=${NPM_TOKEN}" > .npmrc

# List contents for debugging
echo "NPM package contents:"
find . -type f

# Publish to NPM
npm publish --access public

echo "NPM package published successfully!"
