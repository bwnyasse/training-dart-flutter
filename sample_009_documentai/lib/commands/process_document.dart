import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:googleapis/documentai/v1.dart';
import 'package:sample_009_documentai/utils/utils.dart' as utils;
import 'package:sample_009_documentai/utils/utils.dart';

class ProcessDocument extends Command {
  @override
  final name = 'processDocument';
  @override
  final description = 'Process a document using a specified processor';

  ProcessDocument() {
    argParser
      ..addOption('processorId', abbr: 'p', help: 'ID of the processor')
      ..addOption('fileName',
          abbr: 'f', help: 'File name for processing', defaultsTo: 'form.pdf');
  }

  @override
  void run() async {
    final client = await AuthUtils.getAuthenticatedClient();

    try {
      final documentApi = DocumentApi(client);
      // Configuration parameters
      final processorId = '447bfde754033efd';
      final fileName = 'form.pdf';

      final name = '${getParentLocation()}/processors/$processorId';
      final pdfContent = await File(fileName).readAsBytes();
      final document = GoogleCloudDocumentaiV1RawDocument()
        ..contentAsBytes = pdfContent
        ..mimeType = 'application/pdf';

      final request = GoogleCloudDocumentaiV1ProcessRequest()
        ..rawDocument = document
        ..skipHumanReview = true;

      final response = await documentApi.projects.locations.processors.process(
        request,
        name,
      );

      printResults(response);
    } catch (e) {
      print('Error occurred: $e');
    } finally {
      client.close();
    }
  }

  void printResults(GoogleCloudDocumentaiV1ProcessResponse response) {
    print('Document processing complete.');
    print('Review status: ${response.humanReviewStatus?.state ?? 'N/A'}\n');

    final documentPages = response.document?.pages ?? [];
    print("There are ${documentPages.length} page(s) in this document.\n");

    for (var page in documentPages) {
      print("**** Page ${page.pageNumber} ****\n");
      final formFields = page.formFields ?? [];
      print("Found ${formFields.length} form fields:\n");
      for (var formField in formFields) {
        final fieldName =
            formField.fieldName?.textAnchor?.content?.removeNewlines();
        final fieldValue =
            formField.fieldValue?.textAnchor?.content?.removeNewlines();
        print("    - $fieldName: $fieldValue");
      }
    }
  }
}
