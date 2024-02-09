using Com.Maui.Binding;

using System;
namespace MauiDemoApp.Platforms.Android
{
    public class StringResultImpl : Java.Lang.Object, Com.Maui.Binding.IStringCallback
    {
        public Action<string> callback = default!;

        public void OnResult(string? result)
        {
            callback(result!);
        }
    }
}