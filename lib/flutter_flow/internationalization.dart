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
    'l5rtuoqj': {
      'en': 'Select App Language:',
      'hi': '',
    },
    'zngx1jp0': {
      'en': 'English',
      'hi': '',
    },
    '0sy2bisq': {
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
    '19frcmrh': {
      'en': 'Select App Language:',
      'hi': '',
    },
    '6el2cvmv': {
      'en': 'English',
      'hi': '',
    },
    '1joggs77': {
      'en': 'Hindi',
      'hi': '',
    },
    '3389csfy': {
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
    'vrox0dhy': {
      'en': 'Product Listing',
      'hi': '',
    },
    'ogcynk5w': {
      'en': 'Enter Product Name',
      'hi': '',
    },
    'b485x4gq': {
      'en': 'Field is required',
      'hi': '',
    },
    'q9cbnejh': {
      'en': 'Create New Product Blockchain',
      'hi': '',
    },
    'kcoq61j2': {
      'en': 'Home',
      'hi': '',
    },
  },
  // AddBlockPage
  {
    'vnw93e28': {
      'en': 'Submit',
      'hi': '',
    },
    'yku2rcp2': {
      'en': 'Product ID: ',
      'hi': '',
    },
    'l857i0yg': {
      'en': 'Key',
      'hi': '',
    },
    'k7alawqy': {
      'en': 'Value',
      'hi': '',
    },
    'ipbh9gdr': {
      'en': 'Field is required',
      'hi': '',
    },
    '80mlxv37': {
      'en': 'Field is required',
      'hi': '',
    },
    'ozx5hn4v': {
      'en': 'Add New Data Field',
      'hi': '',
    },
    'vae0amla': {
      'en': 'Page Title',
      'hi': '',
    },
    'f1v2ufp8': {
      'en': 'Home',
      'hi': '',
    },
  },
  // ManageProduct
  {
    '8koav4m7': {
      'en': 'Add Block',
      'hi': '',
    },
    'd6w7wate': {
      'en': 'Validate SupplyChain',
      'hi': '',
    },
    'y792dagq': {
      'en': 'View SupplyChain Data',
      'hi': '',
    },
    'wbh2hsls': {
      'en': 'Delete Product',
      'hi': '',
    },
    '72rykr3d': {
      'en': 'Manage Product',
      'hi': '',
    },
    'jsp2thvt': {
      'en': 'Home',
      'hi': '',
    },
  },
  // BlockValidityCheck
  {
    'bg8fpy1r': {
      'en': 'Validity Check',
      'hi': '',
    },
    'qkfylhrg': {
      'en': 'Home',
      'hi': '',
    },
  },
  // BlockDataViewer
  {
    'x10bkofp': {
      'en': 'Data Viewer',
      'hi': '',
    },
    'kyhyq8tf': {
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
