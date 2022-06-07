import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import './src/set_props_builder.dart';
export './src/set_prop_extension.dart';

Builder setPropsBuilder(BuilderOptions options) => SharedPartBuilder([SetPropsBuilder()], 'info');
