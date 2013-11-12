# llama

llama converts a mysql database from latin1 to utf8 properly based on Sarim Khan's blog post [_Mysql Utf/latin Collation and Bangla Nightmare_](http://blog.sarim.me/2013/03/18/mysql-utf-slash-latin-collation-and-bangla-nightmare/)

## Installation
```
  git clone git://github.com/philippfranke/llama
  cd llama
  chmod a+x llama.sh
  ./llama.sh
```

## License

The MIT License (MIT)

Copyright (c) 2013 Philipp Franke <dev@philippfranke.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

## Todo
- converting multiple databases at once
- error handling
