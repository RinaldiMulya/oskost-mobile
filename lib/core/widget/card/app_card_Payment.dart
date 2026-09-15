import 'package:flutter/material.dart';

class AppCardPayment extends StatefulWidget {
  final String bulanTagihan;
  final String jumlahTagihan;
  final String jatuhTempo;
  final String status; // "BELUM BAYAR" / "LUNAS"
  final VoidCallback? onBayar;

  const AppCardPayment({
    Key? key,
    required this.bulanTagihan,
    required this.jumlahTagihan,
    required this.jatuhTempo,
    this.status = 'BELUM BAYAR',
    this.onBayar,
  }) : super(key: key);

  @override
  State<AppCardPayment> createState() => _AppCardPaymentState();
}

class _AppCardPaymentState extends State<AppCardPayment>
    with SingleTickerProviderStateMixin {
  // Siap dipakai untuk animasi pulsing badge / countdown kedepannya
  late final AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    // Nanti aktifkan kalau badge pulsing sudah dibutuhkan:
    // _pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose(); // penting! jangan lupa
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool belumBayar = widget.status == 'BELUM BAYAR';

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'TAGIHAN ANDA',
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 1.2,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: belumBayar
                      ? const Color(0xFFFDE8E8)
                      : const Color(0xFFE6F4EA),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: belumBayar
                          ? const Color(0xFFC62828)
                          : Colors.green,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.status,
                      style: TextStyle(
                        color: belumBayar
                            ? const Color(0xFFC62828)
                            : Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            widget.bulanTagihan,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'Jumlah Perlu Dibayar',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 4),
          Text(
            widget.jumlahTagihan,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.calendar_today,
                size: 18,
                color: Color(0xFFC62828),
              ),
              const SizedBox(width: 8),
              Text(
                'Jatuh Tempo: ${widget.jatuhTempo}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: widget.onBayar,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B5E34),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                children: const [
                  Icon(Icons.payments_outlined, color: Colors.white),
                  SizedBox(width: 12),
                  Text(
                    'Bayar Sekarang',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
