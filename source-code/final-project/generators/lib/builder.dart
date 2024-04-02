import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/serialisation_generator.dart';
import 'src/clone_generator.dart';

Builder generateHelperMethods(BuilderOptions options) => SharedPartBuilder(
    [SerialisationGenerator(), CloneGenerator()], 'helper_methods');
