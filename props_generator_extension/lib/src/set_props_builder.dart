import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:props_generator_annotation/props_generator_annotation.dart';

import 'helpers.dart';

class SetPropsBuilder extends GeneratorForAnnotation<SetProps> {
  @override
  String generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    final buffer = StringBuffer();
    List<FieldElement> list = List.empty(growable: true);
    if (element is ClassElement) {
      element.fields.forEach((elementTwo) {
        if (!isGetter(elementTwo)) {
          list.add(elementTwo);
        }
      });

      buffer.writeln('extension \$${element.name} on ${element.name} {');
      buffer.writeln('    void setProps(int index, String value) {');
      buffer.writeln('        switch(index) {');

      for (var i = 0; i < list.length; i++) {
        final element = list[i];

        buffer.writeln('          case $i:');
        buffer.writeln('            ${element.name} = ${isInt(element) ? 'int' : 'double'}.parse(value);');
        buffer.writeln('            return;');
      }
      buffer.writeln('          default:');
      buffer.writeln('        }');
      buffer.writeln('    }');
      buffer.writeln('}');
    }

    return buffer.toString();
  }
}
