// ponytail: validator minimal untuk MVP; tambah i18n / async check saat butuh
String? validateIdentity(String? v) {
  if (v == null || v.trim().isEmpty) return 'Identitas wajib diisi';
  final s = v.trim();
  if (s.contains('@')) {
    final emailOk = RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(s);
    if (!emailOk) return 'Format email tidak valid';
  } else {
    final digits = s.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.length < 10) return 'Nomor WA minimal 10 digit';
    if (!RegExp(r'^(0|62|\+62)8[1-9][0-9]{6,10}$').hasMatch(s.replaceAll(RegExp(r'[\s-]'), ''))) {
      return 'Format nomor WA tidak valid';
    }
  }
  return null;
}

String? validatePassword(String? v) {
  if (v == null || v.isEmpty) return 'Kata sandi wajib diisi';
  if (v.length < 6) return 'Minimal 6 karakter';
  return null;
}
