# DocumentAI : Process a document using a Form Parser processor with Dart

This repository contains a Dart script that demonstrates how to use Google Cloud's DocumentAI to process documents using a Form Parser processor.

## Prerequisites

1. Dart SDK installed ([Installation Guide](https://dart.dev/get-dart))
2. A Google Cloud Project with DocumentAI API enabled
3. A Service Account with permissions to access DocumentAI

## Setup

1. **Service Account Key**
    - Place your Service Account key JSON file in the root directory or update the `utils.getSAKey()` method to point to your Service Account key location.

## Running the Script

1. **Update Configuration**
    - Update the configuration parameters in `document_ai_parser.dart`:
        - `projectId`: Your Google Cloud Project ID
        - `location`: Location of your DocumentAI processor (e.g., `'us'`)
        - `processorId`: ID of your Form Parser processor
        - `fileName`: Path to the PDF file you want to process

2. **Execute the Script**
    ```bash
    dart lib/local_tester.dart
    ```

3. **Review the Output**
    - Review the printed results in the terminal.

## TODOs 

- [ ] Process a document using a Document OCR processor https://cloud.google.com/document-ai/docs/samples/documentai-process-ocr-document?hl=en
- [ ] Process a document using a Specialized processor https://cloud.google.com/document-ai/docs/samples/documentai-process-specialized-document?hl=en
- [ ] Cancel a long-running operation https://cloud.google.com/document-ai/docs/samples/documentai-cancel-operation?hl=en
- [ ] Change the default processor version https://cloud.google.com/document-ai/docs/samples/documentai-set-default-processor-version?hl=en
- [ ] Create a processor https://cloud.google.com/document-ai/docs/samples/documentai-create-processor?hl=en
- [ ] Delete a processor https://cloud.google.com/document-ai/docs/samples/documentai-delete-processor?hl=en
- [ ] Delete a processor version https://cloud.google.com/document-ai/docs/samples/documentai-delete-processor-version?hl=en 
- [ ] Deploy a processor version https://cloud.google.com/document-ai/docs/samples/documentai-deploy-processor-version?hl=en
- [ ] Disable a processor https://cloud.google.com/document-ai/docs/samples/documentai-disable-processor?hl=en
- [ ] Enable a processor https://cloud.google.com/document-ai/docs/samples/documentai-enable-processor?hl=en
- [ ] Evaluate a processor version https://cloud.google.com/document-ai/docs/samples/documentai-evaluate-processor-version?hl=en 
- [ ] Get a list of processors https://cloud.google.com/document-ai/docs/samples/documentai-list-processors?hl=en
- [ ] Get details about a long-running operation https://cloud.google.com/document-ai/docs/samples/documentai-get-operation?hl=en 
- [ ] Get evaluation details for a processor version https://cloud.google.com/document-ai/docs/samples/documentai-get-evaluation?hl=en
- [ ] List evaluations for a processor version https://cloud.google.com/document-ai/docs/samples/documentai-list-evaluations?hl=en
- [ ] List long-running operations https://cloud.google.com/document-ai/docs/samples/documentai-list-operations?hl=en
- [ ] List processor types https://cloud.google.com/document-ai/docs/samples/documentai-fetch-processor-types?hl=en
- [ ] Poll a long-running operation https://cloud.google.com/document-ai/docs/samples/documentai-poll-operation?hl=en
- [ ] Process a document using a Form Parser processor https://cloud.google.com/document-ai/docs/samples/documentai-process-form-document?hl=en
- [ ] Process a document using a Splitter/Classifier processor https://cloud.google.com/document-ai/docs/samples/documentai-process-splitter-document?hl=en
- [ ] Quickstart https://cloud.google.com/document-ai/docs/samples/documentai-quickstart?hl=en
- [ ] Request Human Review of a document https://cloud.google.com/document-ai/docs/samples/documentai-review-document?hl=en
- [ ] Send a batch process documents request https://cloud.google.com/document-ai/docs/samples/documentai-batch-process-document?hl=en
- [ ] Send an online processing request https://cloud.google.com/document-ai/docs/samples/documentai-process-document?hl=en
- [ ] Toolbox - Convert Document to hOCR https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-document-to-hocr?hl=en
- [ ] Toolbox - Convert Document to Vision API Response https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-document-to-vision?hl=en
- [ ] Toolbox - Convert external annotations to Document format https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-convert-external-annotations?hl=en
- [ ] Toolbox - Create document batches https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-create-batches?hl=en
- [ ] Toolbox - Export entities to BigQuery https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-entities-to-bigquery?hl=en
- [ ] Toolbox - Export images https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-export-images?hl=en
- [ ] Toolbox - Output table to Dataframe or CSV https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-table?hl=en
- [ ] Toolbox - Quickstart https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-quickstart?hl=en
- [ ] Toolbox - Split a PDF https://cloud.google.com/document-ai/docs/samples/documentai-toolbox-split-pdf?hl=en
- [ ] Train a processor version https://cloud.google.com/document-ai/docs/samples/documentai-train-processor-version?hl=en 
- [ ] Undeploy a processor version https://cloud.google.com/document-ai/docs/samples/documentai-undeploy-processor-version?hl=en
- [ ] View available processor versions  https://cloud.google.com/document-ai/docs/samples/documentai-list-processor-versions?hl=en
- [ ] View details about a processor https://cloud.google.com/document-ai/docs/samples/documentai-get-processor?hl=en
- [ ] View details about a processor version https://cloud.google.com/document-ai/docs/samples/documentai-get-processor-version?hl=en


## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
