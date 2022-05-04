import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations);

  static List<String> languages() => ['en', 'hi'];

  String get languageCode => locale.languageCode;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.languageCode] ?? '';

  String getVariableText({
    String enText = '',
    String hiText = '',
  }) =>
      [enText, hiText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      FFLocalizations.languages().contains(locale.languageCode);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'tnbtg79b': {
      'en': 'Switch to Dark Mode',
      'hi': 'डार्क मोड में स्विच करें',
    },
    't8qzm07k': {
      'en': 'Switch to Light Mode',
      'hi': 'लाइट मोड में स्विच करें',
    },
    'kx0ph5i4': {
      'en': 'Welcome To Your Supply Chain BlockChain',
      'hi': 'आपकी आपूर्ति श्रृंखला ब्लॉकचेन में आपका स्वागत है',
    },
    'bh6d3xn6': {
      'en': 'Manufacturer',
      'hi': 'उत्पादक',
    },
    'ejtleto1': {
      'en': 'Vendor',
      'hi': 'वेंडर',
    },
    'aj0y0udm': {
      'en': 'Certifier',
      'hi': 'प्रमाणकर्ता',
    },
    '4rc6mb7t': {
      'en': 'Select App Language:',
      'hi': '',
    },
    'x2x9o0kn': {
      'en': 'English',
      'hi': '',
    },
    'rwzmvvt9': {
      'en': 'Hindi',
      'hi': '',
    },
    'hrgt6ijn': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Login
  {
    'u8txjrzt': {
      'en': 'Sign in with Google',
      'hi': 'Google के साथ साइन इन करें',
    },
    'ejz0py8u': {
      'en': 'Sign in with Apple',
      'hi': 'ऐप्पल के साथ साइन इन करें',
    },
    'i5eujkty': {
      'en': 'Select App Language:',
      'hi': '',
    },
    'zmbg8f6r': {
      'en': 'English',
      'hi': '',
    },
    'rsrdl7p0': {
      'en': 'Hindi',
      'hi': '',
    },
    'pwh4817q': {
      'en': 'Authenticate Yourself',
      'hi': '',
    },
    'ga3973k1': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // ProductListing
  {
    'qjneiwv9': {
      'en': 'Product Listing',
      'hi': '',
    },
    '7c7jnqb2': {
      'en': 'Enter Product Name',
      'hi': '',
    },
    '9zjxlo1b': {
      'en': 'Field is required',
      'hi': '',
    },
    '7kojnmxi': {
      'en': 'Create New Product Blockchain',
      'hi': '',
    },
    'fp658dd0': {
      'en': 'Home',
      'hi': '',
    },
  },
  // AddBlockPage
  {
    'n0ldzgrb': {
      'en': 'Submit',
      'hi': '',
    },
    '3uu658uv': {
      'en': 'Product ID: ',
      'hi': '',
    },
    '7ifbg04g': {
      'en': 'Key',
      'hi': '',
    },
    'w9govykx': {
      'en': 'Value',
      'hi': '',
    },
    'xqk6vfjn': {
      'en': 'Field is required',
      'hi': '',
    },
    'b9zfhcst': {
      'en': 'Field is required',
      'hi': '',
    },
    'ggvdwa9c': {
      'en': 'Add New Data Field',
      'hi': '',
    },
    'twzb47es': {
      'en': 'Page Title',
      'hi': '',
    },
    'f67pnxwt': {
      'en': 'Home',
      'hi': '',
    },
  },
  // Miscellaneous
  {
    '0za7qcky': {
      'en': '',
      'hi': '',
    },
    '9jxv7g6g': {
      'en': '',
      'hi': '',
    },
    'qdko8tzo': {
      'en': '',
      'hi': '',
    },
    'ceqocy55': {
      'en': '',
      'hi': '',
    },
    'd760wemt': {
      'en': '',
      'hi': '',
    },
    '3feyya03': {
      'en': '',
      'hi': '',
    },
    '09vt8wx8': {
      'en': '',
      'hi': '',
    },
    '3nyq9oi0': {
      'en': '',
      'hi': '',
    },
    'wxdqpl8o': {
      'en': '',
      'hi': '',
    },
    'm81wg5zf': {
      'en': '',
      'hi': '',
    },
    'hsh1z067': {
      'en': '',
      'hi': '',
    },
    'sxbqx7cb': {
      'en': '',
      'hi': '',
    },
    '7pakm2fm': {
      'en': '',
      'hi': '',
    },
    '0e76pufq': {
      'en': '',
      'hi': '',
    },
    'dsaloqvw': {
      'en': '',
      'hi': '',
    },
    '3c5xrbfs': {
      'en': '',
      'hi': '',
    },
    '6admm0pv': {
      'en': '',
      'hi': '',
    },
    '8donbtqa': {
      'en': '',
      'hi': '',
    },
    'yjrfmgh2': {
      'en': '',
      'hi': '',
    },
    'jlsaudtw': {
      'en': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
