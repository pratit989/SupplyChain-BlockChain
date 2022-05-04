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
    'n5y276zb': {
      'en': 'Select App Language:',
      'hi': '',
    },
    'o1idcaqv': {
      'en': 'English',
      'hi': '',
    },
    '4a4anxnk': {
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
    '3yco6ote': {
      'en': 'Select App Language:',
      'hi': '',
    },
    '5p6nc9jf': {
      'en': 'English',
      'hi': '',
    },
    'g4d6cj7m': {
      'en': 'Hindi',
      'hi': '',
    },
    'j0whw2hb': {
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
    'ngszs38q': {
      'en': 'Product Listing',
      'hi': '',
    },
    'wizck07w': {
      'en': 'Enter Product Name',
      'hi': '',
    },
    '17zlxjk8': {
      'en': 'Field is required',
      'hi': '',
    },
    '5hw6wast': {
      'en': 'Create New Product Blockchain',
      'hi': '',
    },
    'axnt2w8c': {
      'en': 'Home',
      'hi': '',
    },
  },
  // AddBlockPage
  {
    '6gj0upa3': {
      'en': 'Submit',
      'hi': '',
    },
    'b1ltgbmm': {
      'en': 'Product ID: ',
      'hi': '',
    },
    'uassfdy1': {
      'en': 'Key',
      'hi': '',
    },
    'gtn36tk0': {
      'en': 'Value',
      'hi': '',
    },
    'v6fmty9n': {
      'en': 'Field is required',
      'hi': '',
    },
    'e8po2he6': {
      'en': 'Field is required',
      'hi': '',
    },
    'dhwsyxm7': {
      'en': 'Add New Data Field',
      'hi': '',
    },
    'ywvtn5r3': {
      'en': 'Page Title',
      'hi': '',
    },
    '6b1pkms3': {
      'en': 'Home',
      'hi': '',
    },
  },
  // ManageProduct
  {
    'xhgoutxx': {
      'en': 'Add Block',
      'hi': '',
    },
    '5bguod0x': {
      'en': 'Validate SupplyChain',
      'hi': '',
    },
    'ko2biwyu': {
      'en': 'View SupplyChain Data',
      'hi': '',
    },
    'ijny0n91': {
      'en': 'Delete Product',
      'hi': '',
    },
    'skokt4ui': {
      'en': 'Manage Product',
      'hi': '',
    },
    'wvs0sw0t': {
      'en': 'Home',
      'hi': '',
    },
  },
  // BlockValidityCheck
  {
    'su8uiso0': {
      'en': 'Validity Check',
      'hi': '',
    },
    'kkg68fqn': {
      'en': 'Home',
      'hi': '',
    },
  },
  // BlockDataViewer
  {
    'g3zols6e': {
      'en': 'Data Viewer',
      'hi': '',
    },
    '2rq99yeb': {
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
