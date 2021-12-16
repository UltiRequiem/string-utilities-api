using StringUtilitiesAPI;

var app = WebApplication.Create(args);

app.MapGet("/reverse/{text}", RouteHandlers.Reverse);

app.MapGet("/palindrome/{text}", RouteHandlers.Palindrome);

app.MapGet("/lower/{text}", (string text) => text.ToLower());
app.MapGet("/upper/{text}", (string text) => text.ToUpper());

app.Run();
