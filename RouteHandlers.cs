namespace StringUtilitiesAPI;

internal static class RouteHandlers
{
    public static string Reverse(string text)
    {
        return new string(text.ToCharArray().Reverse().ToArray());
    }

    public static bool Palindrome(string text)
    {
        return text.SequenceEqual(text.Reverse());
    }
}
