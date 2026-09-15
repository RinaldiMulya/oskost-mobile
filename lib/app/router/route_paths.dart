// ponytail: MVP paths only; add /admin/* when Web 2.0 admin needed, version via /api/v1
abstract class RoutePaths {
  static const login = '/loginOskost'; // keep existing path for compat
  static const loginAlias = '/login';
  static const forgotPassword = '/forgot-password';
  static const forceReset = '/force-reset';
  static const home = '/home';
  static const invoices = '/invoices';
  static String invoiceDetail(String id) => '/invoices/$id';
  static String invoicePay(String id) => '/invoices/$id/pay';
  static const reports = '/reports';
  static const reportNew = '/reports/new';
  static String reportDetail(String id) => '/reports/$id';
  static const profile = '/profile';
  static const changePassword = '/profile/change-password';
  static const notifications = '/notifications';
  static const paymentFinish = '/payment-finish';
}
