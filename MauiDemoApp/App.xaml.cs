#if IOS 
using UIKit;
#endif

namespace MauiDemoApp;

public partial class App : Application
{
	public App()
	{
		InitializeComponent();

#if IOS
        UIApplication.SharedApplication.SetStatusBarStyle(UIStatusBarStyle.LightContent, false);
        UIApplication.SharedApplication.SetStatusBarHidden(false, false);
#endif

        MainPage = new AppShell();
	}
}

