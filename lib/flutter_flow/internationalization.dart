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
    'pmcsz631': {
      'en': 'Select App Language:',
      'hi': '',
    },
    'dnqcbgve': {
      'en': 'English',
      'hi': '',
    },
    '2li7jpel': {
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
    'ooxwjhkn': {
      'en': 'Select App Language:',
      'hi': '',
    },
    '8vhjjfpo': {
      'en': 'English',
      'hi': '',
    },
    '3jkj41jj': {
      'en': 'Hindi',
      'hi': '',
    },
    'udjv4m27': {
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
    'dqoc327n': {
      'en': 'Product Listing',
      'hi': '',
    },
    '34ceu565': {
      'en': 'Enter Product Name',
      'hi': '',
    },
    'rflzlsur': {
      'en': 'Create New Product Blockchain',
      'hi': '',
    },
    'xubue3wz': {
      'en': 'Field is required',
      'hi': '',
    },
    'z6m5k28i': {
      'en': 'Home',
      'hi': '',
    },
  },
  // AddBlockPage
  {
    'mrjpx9m5': {
      'en': 'Submit',
      'hi': '',
    },
    'mynah6g3': {
      'en': 'Product ID: ',
      'hi': '',
    },
    'npp1jzr2': {
      'en': 'Key',
      'hi': '',
    },
    '8cwlmf6v': {
      'en': 'Value',
      'hi': '',
    },
    '5csnqarf': {
      'en': 'Field is required',
      'hi': '',
    },
    'unbkwhhu': {
      'en': 'Field is required',
      'hi': '',
    },
    'iathuzoq': {
      'en': 'Add New Data Field',
      'hi': '',
    },
    'iq9oi5jf': {
      'en': 'Page Title',
      'hi': '',
    },
    't4va6bl3': {
      'en': 'Home',
      'hi': '',
    },
  },
  // ManageProduct
  {
    '0qonh2wa': {
      'en': 'Enter UID',
      'hi': '',
    },
    '0bqqjoa6': {
      'en': 'Add Entity',
      'hi': '',
    },
    'frf3w64q': {
      'en': 'Add Block',
      'hi': '',
    },
    'ekpjx914': {
      'en': 'Validate SupplyChain',
      'hi': '',
    },
    '9t4dmlxz': {
      'en': 'View SupplyChain Data',
      'hi': '',
    },
    '99dt5xdy': {
      'en': 'Delete Product',
      'hi': '',
    },
    '7f4f2rfq': {
      'en': 'Manage Product',
      'hi': '',
    },
    '7v48av7u': {
      'en': 'Home',
      'hi': '',
    },
  },
  // BlockValidityCheck
  {
    'h1u4aptj': {
      'en': 'Validity Check',
      'hi': '',
    },
    '1m2rn83a': {
      'en': 'Home',
      'hi': '',
    },
  },
  // BlockDataViewer
  {
    '60uwng1u': {
      'en': 'Data Viewer',
      'hi': '',
    },
    '7m35lwxt': {
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
