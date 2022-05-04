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
    '23r8tsg1': {
      'en': 'Select App Language:',
      'hi': '',
    },
    'zwsytv57': {
      'en': 'English',
      'hi': '',
    },
    'xnqfk3jt': {
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
    'kk9kjxf4': {
      'en': 'Select App Language:',
      'hi': '',
    },
    '7fz7cnli': {
      'en': 'English',
      'hi': '',
    },
    'x24zaly7': {
      'en': 'Hindi',
      'hi': '',
    },
    'yppoke7o': {
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
    'l8lcnt2l': {
      'en': 'Product Listing',
      'hi': '',
    },
    'yvelrbej': {
      'en': 'Enter Product Name',
      'hi': '',
    },
    '4fkt3vpc': {
      'en': 'Create New Product Blockchain',
      'hi': '',
    },
    'hthoykyn': {
      'en': 'Field is required',
      'hi': '',
    },
    '3arw0dix': {
      'en': 'Home',
      'hi': '',
    },
  },
  // AddBlockPage
  {
    'dx3l0c8j': {
      'en': 'Submit',
      'hi': '',
    },
    '5ky6tx5x': {
      'en': 'Product ID: ',
      'hi': '',
    },
    'pthzjx3e': {
      'en': 'Key',
      'hi': '',
    },
    'ej32etnl': {
      'en': 'Value',
      'hi': '',
    },
    'cdrp9skl': {
      'en': 'Field is required',
      'hi': '',
    },
    'y8okqapp': {
      'en': 'Field is required',
      'hi': '',
    },
    '2q4g0tlv': {
      'en': 'Add New Data Field',
      'hi': '',
    },
    'jnwcvsf7': {
      'en': 'Page Title',
      'hi': '',
    },
    '20it0cck': {
      'en': 'Home',
      'hi': '',
    },
  },
  // ManageProduct
  {
    'j5481wve': {
      'en': 'Enter UID',
      'hi': '',
    },
    'bbgjfik0': {
      'en': 'Add Entity',
      'hi': '',
    },
    '0t4lfqvo': {
      'en': 'Add Block',
      'hi': '',
    },
    'cqs5cjl6': {
      'en': 'Validate SupplyChain',
      'hi': '',
    },
    'jxrhxtf7': {
      'en': 'View SupplyChain Data',
      'hi': '',
    },
    'qvksgvw1': {
      'en': 'Delete Product',
      'hi': '',
    },
    'bck114m5': {
      'en': 'Manage Product',
      'hi': '',
    },
    'y49vkfon': {
      'en': 'Home',
      'hi': '',
    },
  },
  // BlockValidityCheck
  {
    '6kfb5pn2': {
      'en': 'Validity Check',
      'hi': '',
    },
    '4s17zrkj': {
      'en': 'Home',
      'hi': '',
    },
  },
  // BlockDataViewer
  {
    'tuaq6s9q': {
      'en': 'Data Viewer',
      'hi': '',
    },
    'p3ys0tyg': {
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
