import 'package:mason_logger/mason_logger.dart';

/// Prints the arch_gen header banner.
void printBanner(Logger logger) {
  const cyan = '\x1B[36m';
  const dim = '\x1B[2m';
  const reset = '\x1B[0m';
  logger.info('''
$cyan
   ▄▀█ █▀█ █▀▀ █░█ ▄▄ █▀▀ █▀▀ █▄░█
   █▀█ █▀▄ █▄▄ █▀█ ░░ █▄█ ██▄ █░▀█$reset
$dim   Flutter project scaffolder · clean · mvc$reset
''');
}
