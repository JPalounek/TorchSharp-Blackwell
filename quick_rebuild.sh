#!/bin/bash

# Quick rebuild with fixed package names
echo "🔧 Deploying fixed package names and rebuilding..."

# Deploy current fixes
./deploy.sh --server root@192.168.1.207

# Rebuild on server
ssh root@192.168.1.207 << 'EOF'
cd /root/torchsharp-build

echo "🧹 Cleaning previous build..."
rm -rf bin/packages/Release/*cuda*.nupkg

echo "🔨 Building with fixed names..."
./build.sh

echo "📦 New packages:"
ls -la bin/packages/Release/*cuda*.nupkg 2>/dev/null | head -20
EOF

echo "✅ Rebuild complete. Download with: ./download_packages.sh"