abstract class Api {
  get({
    String url,
    Map<String, String> headers,
  });
  post({
    String url,
    Map<String, String> headers,
    Map<String, String> body,
  });
  put({
    String url,
    Map<String, String> headers,
    Map<String, String> body,
  });
  delete({
    String url,
    Map<String, String> headers,
  });
}
