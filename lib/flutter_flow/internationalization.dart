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
    'aj0y0udm': {
      'en': 'Other',
      'hi': 'प्रमाणकर्ता',
    },
    '1rjqr1vv': {
      'en': 'Select App Language:',
      'hi': '',
    },
    '3fiqngey': {
      'en': 'English',
      'hi': '',
    },
    'ir49p71k': {
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
    'vgc5hj36': {
      'en': 'Select App Language:',
      'hi': '',
    },
    '0dqhn9w0': {
      'en': 'English',
      'hi': '',
    },
    '84nsglx5': {
      'en': 'Hindi',
      'hi': '',
    },
    'xqmh0cf5': {
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
    'a1r0vw6e': {
      'en': 'Product Listing',
      'hi': '',
    },
    'dotx7vxn': {
      'en': 'Enter Product Name',
      'hi': '',
    },
    'efsj6ed5': {
      'en': 'Create New Product Blockchain',
      'hi': '',
    },
    'ld18qew4': {
      'en': 'Field is required',
      'hi': '',
    },
    '6xgtjplv': {
      'en': 'Home',
      'hi': '',
    },
  },
  // AddBlockPage
  {
    '92achgdb': {
      'en': 'Submit',
      'hi': '',
    },
    'fbxbmvx4': {
      'en': 'Product ID: ',
      'hi': '',
    },
    '0y98kvrt': {
      'en': 'Key',
      'hi': '',
    },
    'hmh9khf1': {
      'en': 'Value',
      'hi': '',
    },
    '4vdzthl4': {
      'en': 'Field is required',
      'hi': '',
    },
    'jtnu33zw': {
      'en': 'Field is required',
      'hi': '',
    },
    'vzcgqvno': {
      'en': 'Add New Data Field',
      'hi': '',
    },
    '76667ol3': {
      'en': 'Page Title',
      'hi': '',
    },
    'exu6brz3': {
      'en': 'Home',
      'hi': '',
    },
  },
  // ManageProduct
  {
    's1s1gyje': {
      'en': 'Enter UID',
      'hi': '',
    },
    '60r1a70v': {
      'en': 'Add Entity',
      'hi': '',
    },
    'wc05gl96': {
      'en': 'Add Block',
      'hi': '',
    },
    'j7y6qrde': {
      'en': 'Validate SupplyChain',
      'hi': '',
    },
    'd3hgeazn': {
      'en': 'View SupplyChain Data',
      'hi': '',
    },
    '77q3h8yy': {
      'en': 'Delete Product',
      'hi': '',
    },
    '7ciz3eqc': {
      'en': 'Manage Product',
      'hi': '',
    },
    '9hew4lbz': {
      'en': 'Home',
      'hi': '',
    },
  },
  // BlockValidityCheck
  {
    'cz265h6r': {
      'en': 'Validity Check',
      'hi': '',
    },
    'o22cz579': {
      'en': 'Home',
      'hi': '',
    },
  },
  // BlockDataViewer
  {
    'y9h9s01w': {
      'en': 'Data Viewer',
      'hi': '',
    },
    'luafacs9': {
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
