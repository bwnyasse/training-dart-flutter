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

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
