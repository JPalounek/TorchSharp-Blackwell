# ⚠️ UNOFFICIAL EXPERIMENTAL PACKAGES ⚠️

# TorchSharp with CUDA 12.8 Support for NVIDIA RTX5080 (Blackwell Architecture)

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

This experimental fork adds support for NVIDIA's RTX5080 GPUs with Blackwell architecture using CUDA 12.8 and LibTorch 2.7.0.

## New Features

- **CUDA 12.8 Support**: Added packages for LibTorch 2.7.0 with CUDA 12.8 libraries
- **RTX5080 (Blackwell) Support**: Optimized for NVIDIA's latest GPU architecture  
- **Linux Support**: Currently available for Linux platforms (Windows support planned)
- **Version 0.105.1**: Latest stable release with CUDA 12.8 integration

## Installation

### From NuGet (Experimental Packages)

**For TorchSharp with RTX 5080 support:**
```bash
dotnet add package TorchSharp-blackwell-linux
```

**For LibTorch native libraries only:**
```bash
dotnet add package libtorch-blackwell-linux-x64
```

⚠️ **Package Structure**: Due to NuGet's 250MB size limit, the packages are distributed across multiple fragments that are automatically downloaded and stitched together.

### Building from Source

To build the experimental CUDA 12.8 packages locally:

1. Clone this repository
2. Run the deployment script: `./deploy.sh`
3. Download packages: `./download_packages.sh` 
4. Publish to NuGet: `./publish_packages.sh` (optional)

**Build Process:**
- Creates 19 NuGet packages (all under 250MB each)
- Includes automatic fragmentation for large files
- Total download size: ~10GB across all packages

## System Requirements

- Ubuntu 22.04.5 LTS or compatible Linux distribution
- CUDA 12.8 drivers installed
- **NVIDIA RTX5080 GPU** (Blackwell architecture) or newer
- **CUDA 12.8 drivers** (560.28+ recommended)
- **.NET 6.0 or newer**
- **Linux x64** (Ubuntu 20.04+, CentOS 8+, etc.)
- **Minimum 15GB free space** for package installation

## ⚠️ Critical Warnings

- **🚨 EXPERIMENTAL**: Packages may be unstable or cause system issues
- **❌ NO OFFICIAL SUPPORT**: No warranty, support, or guarantees provided
- **🔬 RESEARCH ONLY**: Not suitable for production environments  
- **🎯 RTX 5080 SPECIFIC**: Optimized specifically for Blackwell architecture
- **⚡ BLEEDING EDGE**: Uses latest CUDA 12.8 - may have compatibility issues
- **💾 LARGE DOWNLOAD**: Total 10GB+ across all package fragments

## Package Structure

**19 Total Packages** (all under 250MB NuGet limit):

### Main Packages
- `TorchSharp-blackwell-linux` - .NET wrapper with RTX 5080 support
- `libtorch-blackwell-linux-x64` - Head package (dependency resolver)

### Fragment Packages (Auto-Downloaded)
- **Part 1**: `libtorch-blackwell-linux-x64-part1` - Basic CUDA libraries
- **Part 2**: `libtorch-blackwell-linux-x64-part2-primary` - CPU libraries  
- **Part 3**: `libtorch-blackwell-linux-x64-part3-primary` + 4 fragments - CUDA linear algebra (803MB total)
- **Part 4**: `libtorch-blackwell-linux-x64-part4-primary` + 3 fragments - CUDA BLAS (745MB total)
- **Part 5**: `libtorch-blackwell-linux-x64-part5-primary` + 1 fragment - Main CUDA runtime (2.3GB total)
- **Parts 6-8**: `libtorch-blackwell-linux-x64-part6/7/8-primary` - Additional CUDA libraries

### Fragmentation Strategy
- **Large files split into 200MB chunks** to meet NuGet 250MB limit
- **Automatic reassembly** during package installation
- **No manual intervention required** - NuGet handles stitching

**Note**: The LibTorch binaries are sourced from the official PyTorch 2.7.0 Linux C++ distribution with CUDA 12.8 support, ensuring full compatibility and performance optimization for RTX 5080 GPUs.

---

[![Gitter](https://badges.gitter.im/dotnet/TorchSharp.svg)](https://gitter.im/dotnet/TorchSharp?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)
<br/>
[![Build Status](https://dotnet.visualstudio.com/TorchSharp/_apis/build/status/dotnet.TorchSharp?branchName=main)](https://dotnet.visualstudio.com/TorchSharp/_build/latest?definitionId=174&branchName=main)
<br/>
[![TorchSharp](https://img.shields.io/nuget/vpre/TorchSharp.svg?cacheSeconds=3600&label=TorchSharp%20nuget)](https://www.nuget.org/packages/TorchSharp)<br/>
[![TorchAudio](https://img.shields.io/nuget/vpre/TorchAudio.svg?cacheSeconds=3600&label=TorchAudio%20nuget)](https://www.nuget.org/packages/TorchAudio)<br/>
[![TorchVision](https://img.shields.io/nuget/vpre/TorchVision.svg?cacheSeconds=3600&label=TorchVision%20nuget)](https://www.nuget.org/packages/TorchVision)<br/>
[![TorchSharp-cpu](https://img.shields.io/nuget/vpre/TorchSharp-cpu.svg?cacheSeconds=3600&label=TorchSharp-cpu%20nuget)](https://www.nuget.org/packages/TorchSharp-cpu)
[![TorchSharp-cuda-windows](https://img.shields.io/nuget/vpre/TorchSharp-cuda-windows.svg?cacheSeconds=3600&label=TorchSharp-cuda-windows%20nuget)](https://www.nuget.org/packages/TorchSharp-cuda-windows)
[![TorchSharp-cuda-linux](https://img.shields.io/nuget/vpre/TorchSharp-cuda-linux.svg?cacheSeconds=3600&label=TorchSharp-cuda-linux%20nuget)](https://www.nuget.org/packages/TorchSharp-cuda-linux)<br/>
<br/>
Please check the [Release Notes](RELEASENOTES.md) file for news on what's been updated in each new release.


__TorchSharp no longer supports MacOS on Intel hardware.__

With libtorch release 2.4.0, Intel HW support was deprecated for libtorch. This means that the last version of TorchSharp to work on Intel Macintosh hardware is 0.102.8. Starting with 0.103.0, only Macs based on Apple Silicon are supported.

__TorchSharp examples has their own home!__

Head over to the [TorchSharp Examples Repo](https://github.com/dotnet/TorchSharpExamples) for convenient access to existing and upcoming examples.

__IMPORTANT NOTES:__

When targeting __.NET FX__ on Windows, the project configuration must be set to 'x64' rather than 'Any CPU' for anything that depends on TorchSharp.

As we build up to a v1.0 release, we will continue to make breaking changes, but only when we consider it necessary for usability. Similarity to the PyTorch experience is a primary design tenet, and we will continue on that path.

# TorchSharp

TorchSharp is a .NET library that provides access to the library that powers PyTorch. It is part of the .NET Foundation.

The focus is to bind the API surfaced by LibTorch with a particular focus on tensors. The design intent is to stay as close as possible to the Pytorch experience, while still taking advantage of the benefits of the .NET static type system where it makes sense. For example: method overloading is relied on when Pytorch defines multiple valid types for a particular parameter.

The technology is a "wrapper library": no more, no less. [DiffSharp](https://github.com/DiffSharp/DiffSharp/) uses this
repository extensively and has been a major factor in iterating support.

Things that you can try:

```csharp
using TorchSharp;
using static TorchSharp.torch.nn;

var lin1 = Linear(1000, 100);
var lin2 = Linear(100, 10);
var seq = Sequential(("lin1", lin1), ("relu1", ReLU()), ("drop1", Dropout(0.1)), ("lin2", lin2));

using var x = torch.randn(64, 1000);
using var y = torch.randn(64, 10);

var optimizer = torch.optim.Adam(seq.parameters());

for (int i = 0; i < 10; i++) {
    using var eval = seq.forward(x);
    using var output = functional.mse_loss(eval, y, Reduction.Sum);

    optimizer.zero_grad();

    output.backward();

    optimizer.step();
}
```

## A Few Things to Know

While the intent has been to stay close to the Pytorch experience, there are some peculiarities to take note of:

1. We have disregarded .NET naming conventions in favor of Python where it impacts the experience. We know this will feel wrong to some, but after a lot of deliberation, we decided to follow the lead of the SciSharp community and embrace naming similarity with Python over .NET tradition. We believe this will make it easier to take Python-based examples and snippets and apply them in .NET.

2. In order to make a constructor call look more the Pytorch code, each class has a factory method with the same name. Because we cannot have a method and a class with the same name in a scope, we moved the class declarations to a nested scope 'Modules.'

    For example:

    ```csharp

    Module conv1 = Conv1d(...);

    ```
    creates an instance of `Modules.Conv1d`, which has 'torch.Module' as its base class.

3. C# uses ':' when passing a named parameter, while F# and Python uses '=', and Pytorch functions have enough parameters to encourage passing them by name. This means that you cannot simply copy a lot of code into C#.

4. There are a number of APIs where Pytorch encodes what are effectively enum types as strings. We have chosen to use proper .NET enumeration types in most cases.

5. The type `torch.device` is `torch.Device` in TorchSharp. We felt that using all-lowercase for a class type was one step too far. The device object constructors, which is what you use most of the time, are still called `device()`


# Memory management

See [docfx/articles/memory.md](docfx/articles/memory.md).

# Download

TorchSharp is distributed via the NuGet gallery: [https://www.nuget.org/packages/TorchSharp/](https://www.nuget.org/packages/TorchSharp/)

We recommend using one of the 'bundled' packages, which will pull in both TorchSharp and the right backends:

- [TorchSharp-cpu](https://www.nuget.org/packages/TorchSharp-cpu) (CPU, Linux/Windows/OSX)
- [TorchSharp-cuda-windows](https://www.nuget.org/packages/TorchSharp-cuda-windows) (CPU/CUDA 12.1, Windows)
- [TorchSharp-cuda-linux](https://www.nuget.org/packages/TorchSharp-cuda-linux) (CPU/CUDA 12.1, Linux)
- [TorchSharp-cuda-12.8-linux](#building-from-source) (CPU/CUDA 12.8, Linux) - For RTX5080 GPUs (build from source)

Otherwise, you also need one of the LibTorch backend packages: https://www.nuget.org/packages?q=libtorch, specifically one of

* `libtorch-cpu-linux-x64` (CPU, Linux)

* `libtorch-cpu-win-x64` (CPU, Windows)

* `libtorch-cpu-osx-arm64` (CPU, OSX)

* `libtorch-cpu` (CPU, references all three, larger download but simpler)

* `libtorch-cuda-12.1-linux-x64` (CPU/CUDA 12.1, Linux)

  > NOTE: Due to the presence of very large native binaries, using the `libtorch-cuda-12.1-linux-x64` package requires
  > .NET 6, e.g. .NET SDK version `6.0.100-preview.5.21302.13` or greater.

* `libtorch-cuda-12.1-win-x64` (CPU/CUDA 12.1, Windows)

* `libtorch-cuda-12.8-linux-x64` (CPU/CUDA 12.8, Linux) - For RTX5080 GPUs with Blackwell architecture (build from source)

  > NOTE: Due to the presence of very large native binaries (~6GB), using the `libtorch-cuda-12.8-linux-x64` package requires
  > .NET 6 or greater. This package is Linux-only and specifically optimized for NVIDIA's RTX5080 GPUs.

Alternatively you can access the LibTorch native binaries via direct reference to existing local native
binaries of LibTorch installed through other means (for example, by installing [PyTorch](https://pytorch.org/) using a Python package manager). You will have to add an explicit load of the relevant native library, for example:

```csharp
    using System.Runtime.InteropServices;
    NativeLibrary.Load("/home/gunes/anaconda3/lib/python3.8/site-packages/torch/lib/libtorch.so")
```

**NOTE:** Some have reported that in order to use TorchSharp on Windows, the C++ redistributable needs to be installed. This will be the case where VS is installed, but it maybe necessary to install this version of the C++ redist on machines where TorchSharp is deployed:

```
Microsoft Visual C++ 2015-2022 ( 14.36.32532 )
```

# Code of Conduct
This project has adopted the code of conduct defined by the Contributor Covenant to clarify expected behavior in our community.
For more information see the [.NET Foundation Code of Conduct](https://dotnetfoundation.org/code-of-conduct).

# Developing and Contributing

See [DEVGUIDE.md](DEVGUIDE.md) and [CONTRIBUTING.md](CONTRIBUTING.md).

<a href="https://github.com/dotnet/TorchSharp/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=dotnet/TorchSharp" />
</a>

# Uses

[DiffSharp](https://github.com/DiffSharp/DiffSharp/) also uses this
repository extensively and has been a major factor in iterating support.