using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;

public static class SessionHelper
{
    // Lưu trữ đối tượng dưới dạng JSON trong session
    public static void SetObjectAsJson(this ISession session, string key, object value)
    {
        session.SetString(key, JsonConvert.SerializeObject(value));
    }

    // Lấy đối tượng từ session, chuyển từ JSON thành object
    public static T GetObjectFromJson<T>(this ISession session, string key)
    {
        var value = session.GetString(key);
        return value == null ? default(T) : JsonConvert.DeserializeObject<T>(value);
    }
}
