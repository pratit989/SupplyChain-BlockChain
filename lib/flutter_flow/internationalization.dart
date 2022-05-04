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
    'cm8sbc7l': {
      'en': 'Select App Language:',
      'hi': '',
    },
    'fv7v7ssz': {
      'en': 'English',
      'hi': '',
    },
    '0jxl6vzy': {
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
    'crjmxgrf': {
      'en': 'OR',
      'hi': 'या',
    },
    'ejz0py8u': {
      'en': 'Sign in with Apple',
      'hi': 'ऐप्पल के साथ साइन इन करें',
    },
    'it0o6fj5': {
      'en': 'Select App Language:',
      'hi': '',
    },
    'bkpc75vb': {
      'en': 'English',
      'hi': '',
    },
    'mye7hcj5': {
      'en': 'Hindi',
      'hi': '',
    },
    'zduqvsw6': {
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
    'f9z1rvms': {
      'en': 'Product Listing',
      'hi': '',
    },
    '95qfa7oe': {
      'en': 'Create New Product Blockchain',
      'hi': '',
    },
    'ev7vidp3': {
      'en': 'Home',
      'hi': '',
    },
  },
  // AddBlockPage
  {
    'e1imdj1e': {
      'en': 'Submit',
      'hi': '',
    },
    'ogwtpal4': {
      'en': 'Product ID: ',
      'hi': '',
    },
    '7awne1iq': {
      'en': 'Key',
      'hi': '',
    },
    'z8z5frhm': {
      'en': 'Value',
      'hi': '',
    },
    'vrgbzvf6': {
      'en': 'Field is required',
      'hi': '',
    },
    '3o9iutxb': {
      'en': 'Field is required',
      'hi': '',
    },
    '2qv0oeoa': {
      'en': 'Add New Data Field',
      'hi': '',
    },
    'jflwzvbc': {
      'en': 'Add Block Data',
      'hi': '',
    },
    'gm7b5lld': {
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
