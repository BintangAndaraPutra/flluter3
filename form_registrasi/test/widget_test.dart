import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_registrasi/main.dart';

void main() {
  testWidgets('menampilkan form registrasi', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Form Registrasi'), findsOneWidget);
    expect(find.text('Nama Lengkap'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Nomor Telepon'), findsOneWidget);
    expect(find.text('Daftar'), findsOneWidget);
  });

  testWidgets('menampilkan validasi saat form kosong dikirim', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.ensureVisible(find.text('Daftar'));
    await tester.tap(find.text('Daftar'));
    await tester.pumpAndSettle();

    expect(find.text('Nama tidak boleh kosong'), findsOneWidget);
    expect(find.text('Email tidak boleh kosong'), findsOneWidget);
    expect(find.text('Nomor Telepon wajib diisi'), findsOneWidget);
    expect(
      find.text('Wajib menyetujui syarat & ketentuan sebelum mendaftar'),
      findsOneWidget,
    );
    expect(tester.getTopLeft(find.text('Buat Akun Baru')).dy, lessThan(200));
  });

  testWidgets('memperbarui indikator kekuatan password', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(
      find.byKey(const ValueKey('password-field')),
      'Abcdefg1!',
    );
    await tester.pump();

    expect(find.text('Kekuatan Password: Kuat'), findsOneWidget);
  });
}
