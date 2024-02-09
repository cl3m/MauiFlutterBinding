using System;
using Android.OS;
using Java.Interop;
using Microsoft.Maui.Controls.PlatformConfiguration;
using Microsoft.Maui.Handlers;
using Binding = Com.Maui.Binding.Binding;
using MauiDemoApp.Platforms.Android;
using Java.Net;
using static Android.Icu.Text.CaseMap;
using Android.Hardware;

namespace MauiDemoApp
{
    public class FlutterView : View
    {
    }

    public partial class FlutterViewHandler : ViewHandler<FlutterView, Android.Views.View>
    {
        public static IPropertyMapper<FlutterView, FlutterViewHandler> PropertyMapper = new PropertyMapper<FlutterView, FlutterViewHandler>(ViewHandler.ViewMapper)
        {            
        };


        public FlutterViewHandler() : base(PropertyMapper)
        {
        }

        public FlutterViewHandler(IPropertyMapper mapper, CommandMapper commandMapper = null)
            : base(mapper, commandMapper) { }

        protected override Android.Views.View CreatePlatformView()
        {
            var view = (new Binding()).GetFlutterView(MainActivity.instance);
            return view;
        }

        protected override void ConnectHandler(Android.Views.View platformView)
        {
            base.ConnectHandler(platformView);
        }

        protected override void DisconnectHandler(Android.Views.View platformView)
        {
            platformView.Dispose();
            base.DisconnectHandler(platformView);
        }
    }
}
