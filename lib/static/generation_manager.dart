import 'package:flutter/material.dart';
import 'package:maid/providers/character.dart';
import 'package:maid/providers/session.dart';
import 'package:maid/static/local_generation.dart';
import 'package:maid/providers/model.dart';
import 'package:maid/models/generation_options.dart';
import 'package:provider/provider.dart';

class GenerationManager {
  static void prompt(String input, BuildContext context) {
    context.read<Session>().busy = true;

    GenerationOptions options = GenerationOptions(
              model: context.read<Model>(),
              character: context.read<Character>(),
              session: context.read<Session>());
    
    LocalGeneration.prompt(input, options, context.read<Session>().stream);

  }

  static void stop() {
    LocalGeneration.stop();
  }

  static void cleanup() {
    LocalGeneration.dispose();
  }

  static ApiType checkApiRequirements(GenerationOptions context) {
    return context.apiType;
  }
}
