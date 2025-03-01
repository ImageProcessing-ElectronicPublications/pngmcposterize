`ORG.IPEP:`
![GitHub release (latest by date)](https://img.shields.io/github/v/release/ImageProcessing-ElectronicPublications/pngmcposterize)
![GitHub Release Date](https://img.shields.io/github/release-date/ImageProcessing-ElectronicPublications/pngmcposterize)
![GitHub repo size](https://img.shields.io/github/repo-size/ImageProcessing-ElectronicPublications/pngmcposterize)
![GitHub all releases](https://img.shields.io/github/downloads/ImageProcessing-ElectronicPublications/pngmcposterize/total)
![GitHub](https://img.shields.io/github/license/ImageProcessing-ElectronicPublications/pngmcposterize)  

# PNGmcPosterize
Lossy compressors for true-color PNGs

This fork was created to publish the latest (2.1) build for Windows as the original author didn't bother himself to do so.

## Median Cut PNG Posterizer

Reduces number of distinct color/alpha intensities in the image. Unlike typical posterization, which distributes levels evenly, this one tries to pick levels intelligently using varaince-based Median Cut and Voronoi iteration.

The goal of this tool is to make RGB/RGBA PNG images more compressible, assuming that lower number of unique byte values increses chance of finding repetition and improves efficiency of Huffman coding.

## Blurizer

With `-b` argument it reduces PNG file sizes by selectively blurring the image. It makes image more compressible by making it more predictable for PNG's diagonal average prediction filter.

## Usage
```sh
pngmcposterize [ -v ] [ -b ] [ -d ] [ -w ] [ -Q <quality> ] [ levels ] -- [ input.png ] [ output.png ]
```

* `-b` — Use blurring instead of posterization (recommended). Without this argument posterization is used.
* `-w` — Write compressed content to input file.
* `-Q num` — Picks minimum number of levels needed to achieve given quality. `num` is quality 0-100 (100 is best, similar to JPEG). Number of levels is optional if quality is specified.
* `levels` — Number of levels to use (2-255). Lower number gives worse quality, but smaller file.
* `-d` — Enables simple ordered dithering in posterization mode.
* `-v` — Verbose output. Prints mean square error (MSE) caused by posterization.

If input/output files are not specified then stdin/stdout is used respectively.
If -w is specified output file is not used.

Posterized images can be further compressed using [PNGOUT](http://www.jonof.id.au/kenutils) or similar. Try [ImageOptim](http://imageoptim.com).

## Building

Place your `include` and `lib` directories from libpng inside the root of this repo (if you don't have them installed somewhere already in your mingw-w64 instance). I tore them out of this [package](https://packages.msys2.org/package/mingw-w64-x86_64-libpng). Then run your make:

    make clean posterize

## GUI?

Integrated in [ImageAlpha.app](http://pngmini.com).

## Licenses

### Posterizer

© 2011-2014 Kornel Lesiński.

This program is free software: you can redistribute it and/or modify
it under the terms of the [GNU General Public License](http://www.gnu.org/copyleft/gpl.html)
as published by the Free Software Foundation, either version 3
of the License, or any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.


### `rwpng.c`

© 1997-2002 by Greg Roelofs.
© 2009-2014 by Kornel Lesiński.

All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
  this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
