import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'documents_state.dart';

part 'documents_cubit.freezed.dart';

enum DocumentType { privacyPolicy, about }

class DocumentsCubit extends Cubit<DocumentsState> {
  DocumentsCubit() : super(const DocumentsState.initial());

  void openDocument(
    DocumentType type,
  ) {
    Uri? uri;

    switch (type) {
      case DocumentType.privacyPolicy:
        uri = Uri.parse('https://www.termsfeed.com/live/03808556-29ac-470e-a054-f0ec74468cbc');
        break;
      case DocumentType.about:
        uri = Uri.parse('https://book4sport.com');
        break;
      default:
        uri = Uri.parse('https://book4sport.com');
        break;
    }

    launchUrl(uri);
  }
  void openContestRules(String url) {
    launchUrl(Uri.parse(url));
  }
}
