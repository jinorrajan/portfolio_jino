// ignore_for_file: unused_local_variable, avoid_web_libraries_in_flutter

import 'dart:html' as html; // Import for web downloads

class DownloadController {
  void downloadResume() {

    const pdfUrl = 'assets/Jino -Flutter.pdf'; 
    html.AnchorElement anchorElement = html.AnchorElement(href: pdfUrl)
      ..setAttribute('download', 'JINO_R_Resume.pdf') // Suggested filename for download
      ..click();
  }
}
