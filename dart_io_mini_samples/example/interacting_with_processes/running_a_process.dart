// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Use `Process.run()` to run a process. The results of the process are
/// returned asynchronously using a ProcessResult object.

import 'dart:io';

main() async {
  // List all files in the current directory in UNIX-like operating systems.
  var results = await Process.run('ls', ['-lha']);
  print(results.stdout);
}
