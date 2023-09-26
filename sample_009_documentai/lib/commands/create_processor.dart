import 'package:args/command_runner.dart';
import 'package:googleapis/documentai/v1.dart';
import 'package:sample_009_documentai/utils/utils.dart';

class CreateProcessor extends Command {
  @override
  final name = 'createProcessor';
  @override
  final description = 'Create a new processor';

  @override
  void run() async {
    final client = await AuthUtils.getAuthenticatedClient();
    try {
      final documentApi = DocumentApi(client);
      // Configuration parameters

      final processor = GoogleCloudDocumentaiV1Processor()
        ..displayName = 'Form Parser from cli'
        ..type = 'FORM_PARSER_PROCESSOR'; // e.g. 'FORM_PARSER'

      final response = await documentApi.projects.locations.processors.create(
        processor,
        getParentLocation(),
      );
      print('Processor created with name: ${response.name}');
    } catch (e) {
      print('Error occurred: $e');
    } finally {
      client.close();
    }
  }
}
