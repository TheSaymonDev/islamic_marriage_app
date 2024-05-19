class ApiResponse<T> {
  final bool success;
  final T? data;
  final int? statusCode;
  final T? message;

  ApiResponse.success({required this.data})
      : success = true,
        statusCode = null,
        message = null;

  ApiResponse.error({required this.statusCode, required this.message})
      : success = false,
        data = null;
}