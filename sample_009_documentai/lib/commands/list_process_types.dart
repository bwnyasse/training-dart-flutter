import 'package:args/command_runner.dart';
import 'package:googleapis/documentai/v1.dart';
import 'package:sample_009_documentai/utils/utils.dart';

class ListProcessorTypes extends Command {
  @override
  final name = 'listProcessorTypes';
  @override
  final description = 'List available processor types';

  @override
  void run() async {
    final client = await AuthUtils.getAuthenticatedClient();
    try {
      final documentApi = DocumentApi(client);
      final response = await documentApi.projects.locations.processorTypes
          .list(getParentLocation());

      print('Available Processor Types:');
      for (GoogleCloudDocumentaiV1ProcessorType processorType
          in response.processorTypes!) {
        print(' - ${processorType.type}');
      }
    } catch (e) {
      print('Error occurred: $e');
    } finally {
      client.close();
    }
  }
}
