
// import 'package:macros/macros.dart';

// macro class Stateful implements FunctionTypesMacro {
//   final Identifier? widgetIdentifier;

//   const Stateful({
//     this.widgetIdentifier,
//   });

//   @override
//   Future<void> buildTypesForFunction(
//       FunctionDeclaration function, TypeBuilder builder) async {
//           if (function.positionalParameters.isEmpty ||
//         // TODO: A proper type check here.
//         (function.positionalParameters.first.type as NamedTypeAnnotation)
//                 .identifier
//                 .name !=
//             'BuildContext') {
//       throw ArgumentError(
//           'FunctionalWidget functions must have a BuildContext argument as the '
//           'first positional argument');
//     }

//     // Identifier がある場合はその値を使い、ない場合はクラス名の先頭の文字を大文字にしたものを使う
//     var widgetName = widgetIdentifier?.name ??
//         function.identifier.name
//             .replaceRange(0, 2, function.identifier.name[1].toUpperCase());
//     var positionalFieldParams = function.positionalParameters.skip(1);

//     // ignore: deprecated_member_use
//     var statefulWidget = await builder.resolveIdentifier(
//         Uri.parse('package:flutter/widgets.dart'), 'StatefulWidget');
//     // ignore: deprecated_member_use
//     var buildContext = await builder.resolveIdentifier(
//         Uri.parse('package:flutter/widgets.dart'), 'BuildContext');
//     // ignore: deprecated_member_use
//     var widget = await builder.resolveIdentifier(
//         Uri.parse('package:flutter/widgets.dart'), 'Widget');

//     builder.declareType(
//         widgetName,
//         DeclarationCode.fromParts([
//           'class $widgetName extends ', statefulWidget, ' {',
//           // Fields
//           for (var param
//               in positionalFieldParams.followedBy(function.namedParameters))
//             DeclarationCode.fromParts([
//               'final ',
//               param.type.code,
//               ' ',
//               param.identifier.name,
//               ';',
//             ]),
//           // Constructor
//           'const $widgetName(',
//           for (var param in positionalFieldParams)
//             'this.${param.identifier.name}, ',
//           '{',
//           for (var param in function.namedParameters)
//             '${param.isRequired ? 'required ' : ''}this.${param.identifier.name}, ',
//           'super.key,',
//           '});',

//           '@override ',
//           'State<', widgetName, '> createState() => _', widgetName, 'State();',
//           '}',
//           '',
//           'class _', widgetName, 'State extends State<', widgetName, '> {',
//           '@override ',
//           '$widget build($buildContext context) {',
//           for (var param in positionalFieldParams) '${param.identifier.name}, ',
//           for (var param in function.namedParameters)
//             '${param.identifier.name}: ${param.identifier.name}, ',
//           '  }',
//           '}',
//         ],),);
//   }
// }
