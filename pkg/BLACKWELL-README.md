# ⚠️ UNOFFICIAL EXPERIMENTAL PACKAGES ⚠️

# TorchSharp Blackwell (RTX 5080) Support Packages

## 🚨 **EXPERIMENTAL - USE AT YOUR OWN RISK** 🚨

**These are unofficial, community-maintained experimental packages for early RTX 5080 Blackwell GPU testing.**

❌ **NOT officially supported by:**
- Microsoft/.NET Foundation
- PyTorch/Meta
- NVIDIA

✅ **Intended for:**
- Early adopters and researchers
- Development and testing only
- Community experimentation with RTX 5080

## 🚀 Quick Start

### For TorchSharp Users
```bash
dotnet add package TorchSharp-blackwell-linux
```

### For LibTorch Users  
```bash
dotnet add package libtorch-blackwell-linux-x64
```

## 📋 What's Included

- **PyTorch 2.7.0** native libraries
- **CUDA 12.8** runtime optimized for Blackwell architecture
- **RTX 5080** GPU acceleration support
- **Linux x64** platform support
- **Automatic dependency resolution** for all package fragments

## 🎯 RTX 5080 Blackwell Features

- ✅ **Native CUDA 12.8 Support** - Full compatibility with latest CUDA runtime
- ✅ **Blackwell Architecture Optimization** - Leverages RTX 5080's advanced compute capabilities  
- ✅ **High Performance** - Optimized for next-generation AI workloads
- ✅ **TensorCore Support** - Enhanced mixed-precision training and inference
- ✅ **Memory Efficiency** - Better VRAM utilization for large models

## 🔧 System Requirements

- **OS**: Linux x64 (Ubuntu 20.04+, CentOS 8+, etc.)
- **GPU**: NVIDIA RTX 5080 or compatible Blackwell GPU
- **CUDA**: 12.8+ drivers installed
- **.NET**: 6.0+ or .NET Standard 2.0+
- **Memory**: 16GB+ RAM recommended for large models

## 📦 Package Structure

This is a segmented package system due to NuGet's 250MB limit:

- **Head Package**: `libtorch-blackwell-linux-x64` - Main package with dependencies
- **Fragment Packages**: Automatically downloaded as dependencies
  - `part1` through `part8` - Core libraries segmented for size limits
  - `fragment` packages - Large files split into smaller chunks

NuGet automatically handles downloading and stitching all fragments together.

## 💻 Usage Example

```csharp
using TorchSharp;
using static TorchSharp.torch;

// Verify CUDA 12.8 and RTX 5080 detection
Console.WriteLine($"CUDA Available: {cuda.is_available()}");
Console.WriteLine($"CUDA Version: {cuda.get_cuda_version()}");
Console.WriteLine($"Device Count: {cuda.device_count()}");

// Create tensor on RTX 5080
var device = CUDA; // Uses first available CUDA device (RTX 5080)
var tensor = randn(1000, 1000, device: device);
Console.WriteLine($"Tensor device: {tensor.device}");

// Example: Simple neural network on RTX 5080
using var model = nn.Sequential(
    nn.Linear(784, 256),
    nn.ReLU(),
    nn.Linear(256, 10),
    nn.Softmax(dim: 1)
).to(device);

var input = randn(32, 784, device: device);
var output = model.forward(input);
Console.WriteLine($"Output shape: {output.shape}");
```

## 🔍 Verification

Verify your RTX 5080 is working correctly:

```csharp
// Check GPU properties
var deviceProps = cuda.get_device_properties(0);
Console.WriteLine($"GPU Name: {deviceProps.name}");
Console.WriteLine($"Compute Capability: {deviceProps.major}.{deviceProps.minor}");
Console.WriteLine($"Total Memory: {deviceProps.total_memory / (1024*1024*1024)} GB");

// Benchmark RTX 5080 performance
var start = DateTime.Now;
var result = torch.mm(
    randn(4096, 4096, device: CUDA),
    randn(4096, 4096, device: CUDA)
);
cuda.synchronize();
var elapsed = DateTime.Now - start;
Console.WriteLine($"4K x 4K Matrix Multiply: {elapsed.TotalMilliseconds}ms");
```

## ⚠️ Critical Warnings

- **🚨 EXPERIMENTAL**: These packages may be unstable, incomplete, or cause system issues
- **❌ NO OFFICIAL SUPPORT**: No warranty, support, or guarantees provided
- **🔬 RESEARCH ONLY**: Not suitable for production environments
- **🎯 RTX 5080 SPECIFIC**: May not work with other GPUs
- **🐧 LINUX ONLY**: Windows support not available
- **⚡ BLEEDING EDGE**: Uses latest CUDA 12.8 which may have compatibility issues
- **📋 DRIVER REQUIREMENTS**: Requires very recent NVIDIA drivers (560.28+)
- **💾 LARGE DOWNLOAD**: Multi-gigabyte package fragments
- **🔧 TECHNICAL EXPERTISE**: Advanced GPU/CUDA knowledge recommended

## 🐛 Troubleshooting

### CUDA Not Detected
```bash
# Verify NVIDIA drivers
nvidia-smi

# Check CUDA installation  
nvcc --version

# Verify RTX 5080 detection
nvidia-ml-py3 # or nvidia-smi
```

### Package Dependencies
If you get dependency errors, install the head package which pulls all fragments:
```bash
dotnet add package libtorch-blackwell-linux-x64
```

### Memory Issues
RTX 5080 has substantial VRAM - adjust batch sizes accordingly:
```csharp
// Example: Increase batch size for RTX 5080
var batchSize = 128; // Instead of 32 for older GPUs
```

## 📚 Resources

- **TorchSharp Documentation**: https://github.com/dotnet/TorchSharp
- **PyTorch Official**: https://pytorch.org/
- **CUDA 12.8 Release Notes**: https://docs.nvidia.com/cuda/
- **RTX 5080 Specifications**: https://www.nvidia.com/rtx-5080/

## 🤝 Community & Support

- **Issues**: Report problems at the package source repository
- **Discussions**: Join .NET ML community discussions
- **Updates**: Watch for new RTX 5080 optimizations and CUDA updates

## 📄 License

This package redistributes PyTorch/LibTorch libraries under their respective licenses. See included `LICENSE-LIBTORCH.txt` for details.

**Package Maintainer**: Community maintained
**Package Type**: Unofficial RTX 5080 support package  
**Last Updated**: January 2025