import 'package:url_launcher/url_launcher.dart';

void urlLauncher( String url)async{
  final Uri uri = Uri.parse(url);
  await launchUrl(uri,mode: LaunchMode.externalApplication);
}